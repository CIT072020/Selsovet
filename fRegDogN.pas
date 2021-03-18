unit fRegDogN;

interface

{$I Task.inc}
{$include ver.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  {$IFDEF LEVEL6} Variants, {$ENDIF}
  fSimpleD, Db, kbmMemTable, ComCtrls, TB2Item, TB2Dock, TB2Toolbar, uTypes,
  ExtCtrls, StdCtrls, DBLookupEh, DBCtrlsEh, Mask, FuncPr, dbFunc, dMen, ifpii_dbfunc,
  OpisEdit, MetaTask, Grids, DBGridEh, Buttons, vchDBCtrls, FR_DSet, uCheckKod, uProject,uProjectAll,fmChList,
  FR_DBSet, ToolCtrlsEh, ImgList, fMenShort, kbmMemCSVStreamFormat,
  ZipForge;

type
  TfmRegDogN = class(TfmSimpleD)
    DokumentDATEZ: TDateField;
    DokumentNANIM_DateR: TDateField;
    DokumentADRES_ID: TIntegerField;
    DokumentSOBST_ADRES: TMemoField;
    DokumentNANIM_IDENTIF: TStringField;
    DokumentSPEC: TStringField;
    DokumentSOBST_FIO: TStringField;
    pnInfo: TPanel;
    pnPodval: TPanel;
    edDateCancel: TDBDateTimeEditEh;
    Label47: TLabel;
    edDateR2: TDBDateTimeEditEh;
    DokumentNOMER: TStringField;
    DokumentNANIM_ID: TIntegerField;
    DokumentNANIM_TEL: TStringField;
    DokumentNANIM_FIO: TStringField;
    DokumentSOBST_ID: TIntegerField;
    DokumentSOBST_TEL: TStringField;
    DokumentSOBST_IDENTIF: TStringField;
    DokumentDATER1: TDateField;
    DokumentDATER2: TDateField;
    DokumentDATE_CANCEL: TDateField;
    DokumentOSNOV_CANCEL: TIntegerField;
    DokumentIMNS: TIntegerField;
    DokumentPRIM: TStringField;
    DokumentADD_FIELDS: TMemoField;
    gbNanim: TGroupBox;
    edNanim: TDBEditEh;
    edNanimTel: TDBEditEh;
    Label2: TLabel;
    pnMain: TPanel;
    Label15: TLabel;
    TextAdres: TvchDBText;
    Label38: TLabel;
    btAdres: TBitBtn;
    edDateZ: TDBDateTimeEditEh;
    edNomer: TDBEditEh;
    lbNomer: TLabel;
    gbSobst: TGroupBox;
    lbSobst: TLabel;
    Label4: TLabel;
    edSobst: TDBEditEh;
    edSobstTel: TDBEditEh;
    edIMNS: TDBComboBoxEh;
    edOsnovCancel: TDBComboBoxEh;
    Label6: TLabel;
    edDateR1: TDBDateTimeEditEh;
    lbDolgSpec: TvchDBText;
    edSpec: TDBEditEh;
    lbIDENTIF: TLabel;
    ENG_edISobstIN: TDBEditEh;
    lbAdres: TLabel;
    edSobstAdres: TDBEditEh;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edPrim: TDBEditEh;
    Label11: TLabel;
    btClearAdres: TBitBtn;
    lbSobstUNP: TLabel;
    edSobstUNP: TDBEditEh;
    DokumentTYPEOBJ: TIntegerField;
    DokumentSOBST_UNP: TStringField;
    DokumentTYPEHOUSE: TIntegerField;
    DokumentNANIM_TYPE: TIntegerField;
    cbNanim: TComboBox;
    cbUnlim: TDBCheckBoxEh;
    DokumentUNLIM: TBooleanField;
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure TextAdresGetText(Sender: TObject; var Text: String);
    procedure btAdresClick(Sender: TObject);
//    procedure edNanimINUpdateData(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edSpecEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edNanimEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edSobstEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edIMNSEditButtons0Click(Sender: TObject;   var Handled: Boolean);
    procedure edOsnovCancelEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure btClearAdresClick(Sender: TObject);
    procedure edSobstEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure cbNanimChange(Sender: TObject);
    procedure edNanimEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
//    FBitRB : TBitMap;
  public
    { Public declarations }
    FFIONanim:String;
    FFIOSobst:String;
    FCurLic : Integer;
    FFromMen:Boolean;
    function WriteDok : Boolean; override;
    function ReadDok(nID : Integer) : Boolean; override;
    function NewDok( lAppend : Boolean ) : Boolean; override;
    function GetVid : String; override;
    procedure SetSobst;

//    function GetNameReport : String; override;
    procedure UpdateActions; override;
    function BeforeEdit: Boolean; override;
    constructor Create(Owner : TComponent); override;
    function CreateSubMenuRun: Boolean; override;
    function getTelefon(sTelM:String; sTel:String):String;
    function SetNewNomerDok(lSetDate:Boolean):Integer; override;
    procedure CheckControlNanim;
    procedure CheckControlSobst;

  end;

  function EditRegDogN( var nID : Integer; slPar:TStringList) : Boolean;


implementation

uses dBase, fChoiceAdres, fMain, fChoiceNasel, fShablon;

{$R *.DFM}

var
  nSetTypeObj:Integer;

function EditRegDogN( var nID : Integer; slPar:TStringList) : Boolean;
var
  fmRegDogN: TfmRegDogN;
begin
//  result := true;
  nSetTypeObj:=StrToIntDef(ValueFromParams(slPar, 'TYPEOBJ', InttoStr(_TypeObj_RegDogN)), _TypeObj_RegDogN);
  fmRegDogN:=TfmRegDogN.Create(nil);
  fmRegDogN.AssignPar(slPar);
  try                                   
    fmRegDogN.IsReadDokument:=true;
    if nID=-1 then begin
      fmRegDogN.NewDok(true);
      fmRegDogN.SetIDZags;
      fmRegDogN.CheckEnabledNameOrgan(true);
    end else begin
      fmRegDogN.ReadDok( nID );
      fmRegDogN.TBItemZAGS.Visible:=false;
      fmRegDogN.CheckEnabledNameOrgan(false);
    end;
    fmRegDogN.IsReadDokument:=false;
    Result:=fmRegDogN.EditModal;
    nID:=fmRegDogN.DokumentID.AsInteger;
  finally
    fmRegDogN.Free;
    fmRegDogN:=nil;
  end;
end;

constructor TfmRegDogN.Create(Owner: TComponent);
//var
//  bt  : TEditButtonEh;
begin
  inherited;
//  pc.ActivePageIndex:=0;
  FFIOSobst:='';
  FFIONanim:='';
  FQuestAsNew:=false;
  FPageControl := nil; //pc;
  FFromMen:=False;
  FCurLic:=0;
  FMainTable:=dmBase.tbRegDogN;
  FAutoNum:=true;
  TypeObj:=nSetTypeObj; // !!! см. выше
  if TypeObj=_Typeobj_RegDogN2 then begin
    lbIDENTIF.Visible:=false;
    ENG_edISobstIN.Visible:=false;
    lbSobstUNP.Left:=lbIDENTIF.Left;
    edSobstUNP.Left:=ENG_edISobstIN.Left;
    lbSobst.Caption:='Организация';
    edSobst.EditButtons[0].Glyph:=edNanim.EditButtons[1].Glyph;  // организация
  end else begin
    edSobst.EditButtons[0].Glyph:=edNanim.EditButtons[0].Glyph;  // человек
  end;
  FUpdatingObj:=GetUpdatingObj(TypeObj);
//  edFamilia.OnUpdateData:=FIOUpdateData;
//  fmMain.ImageList.GetBitmap(IL_CH_MEN, edSobst.EditButtons[0].Glyph);
//  fmMain.ImageList.GetBitmap(IL_CH_MEN, edNanim.EditButtons[0].Glyph);
  btClearAdres.Glyph:=ImBtClear.Picture.Bitmap;
  edSobst.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;
  edNanim.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;

//  fmMain.ImageList.GetBitmap(IL_EDIT,btEditSem.Glyph);
//  fmMain.ImageList.GetBitmap(IL_ADD_MEN,btAddSem.Glyph);
//  fmMain.ImageList.GetBitmap(IL_DEL_MEN,btDelSem.Glyph);
  TBItemHistCorr.Visible:=FUpdatingObj;
end;

function TfmRegDogN.GetVid: String;
begin
  Result := 'RegDogN';
end;

procedure TfmRegDogN.CheckControlNanim;
begin
  if DokumentNANIM_ID.AsInteger>0 then begin
    edNanim.Font.Style:=[fsBold];
  end else begin
    edNanim.Font.Style:=[];
  end;
  {
  case DokumentNANIM_TYPE.AsInteger of
    OWNER_ORG  : lbNanim.Caption:='Организация';
    OWNER_NASEL: lbNanim.Caption:='Фамилия Имя Отчество';
  else
    lbNanim.Caption:='ФИО / Организация';
  end;
  }
end;

procedure TfmRegDogN.CheckControlSobst;
begin
  if DokumentSOBST_ID.AsInteger>0 then begin
    edSobst.Font.Style:=[fsBold];
  end else begin
    edSobst.Font.Style:=[];
  end;
end;

function TfmRegDogN.NewDok( lAppend : Boolean ): Boolean;
begin
  Dokument.EmptyTable;
  Dokument.Append;
  DokumentID.AsInteger:=-1;
//  DokumentPOL.AsString:='М';
//  DokumentTYPEREG.AsInteger:=1;
  inherited NewDok(lAppend);
  DokumentTYPEOBJ.AsInteger:=TypeObj;
  DokumentUNLIM.AsBoolean:=false;
  DokumentNANIM_TYPE.AsInteger:=1;
  DokumentTYPEHOUSE.AsInteger:=0;
  DokumentADRES_ID.AsInteger:=0;
  DokumentNANIM_ID.AsInteger:=0;
  DokumentSOBST_ID.AsInteger:=0;
  DokumentDATEZ.AsDateTime:=dmBase.getCurDate;
  DokumentIMNS.AsString:=Globaltask.getLastValueAsString('LAST_IMNS');
  DokumentSPEC_D.AsString:=Globaltask.getLastValueAsString('REGISTR_DOLG');
  DokumentSPEC.AsString:=Globaltask.getLastValueAsString('REGISTR_SPEC');
  if (DokumentSPEC_D.AsString='')  then begin
    DokumentSPEC_D.AsString:=DolgSpec;
    DokumentSPEC.AsString:=FIOSpec;
  end;
  QueryExit:=false;
  Result := true;
end;
//---------------------------------------------------------------------------------
function TfmRegDogN.SetNewNomerDok(lSetDate:Boolean):Integer;
var
  dDateZ:TDateTime;
  nNomer:Integer;
  old:String;
begin
  Result:=0;
  if FAutoNum and (FMainTable<>nil) then begin
    old:=FMainTable.IndexName;
    FMainTable.IndexName := 'KEY_VIEW';     // typeobj,datez,nomer DESC
    FMainTable.SetRange([TypeObj],[TypeObj]);
    FMainTable.First;
//   nYear:=YearOf(dmBase.GetCurDate);
    nNomer:=FMainTable.FieldByName('NOMER').AsInteger;
//     dDateZ:=DokumentDATEZ.AsDateTime;
//     dDateZ:=FMainTable.FieldByName('DATEZ').AsDateTime;
//     if (YearOf(dDateZ)<>nYear)  then begin
//       s:='';
//     end;
//        if s <> '' then begin
    try
      DokumentNOMER.AsInteger:=nNomer+1;
      Result:=nNomer+1;
    except

    end;
    FMainTable.IndexName:=old;
  end;
end;

function TfmRegDogN.ReadDok(nID: Integer): Boolean;
var
  i : Integer;
  fld : TField;
  strField : String;
begin
  NewDok(false);
  Result := true;
  if not FMainTable.Locate('ID', nID, []) then begin
    Result := false;
    exit;
  end;
  //------- читаем карточку -----------
  Dokument.Edit;
  for i:=0 to FMainTable.FieldCount-1 do begin
    strField := FMainTable.Fields[i].FieldName;
    fld := Dokument.FindField(strField);
    if fld <> nil then begin
      fld.Value := FMainTable.Fields[i].Value;
    end;
  end;
  if DokumentUNLIM.IsNull
    then DokumentUNLIM.AsBoolean:=false;
  if DokumentNANIM_TYPE.AsInteger=0
    then DokumentNANIM_TYPE.AsInteger:=OWNER_NASEL;
  if DokumentNANIM_TYPE.AsInteger=OWNER_ORG
    then cbNanim.ItemIndex:=1
    else cbNanim.ItemIndex:=0;
  Dokument.Post;
  if DokumentID.AsInteger > 0 then begin

  end;
  CheckControlNanim;
  CheckControlSobst;
end;

//---------------------------------------------------------------
function TfmRegDogN.WriteDok: Boolean;
var
  i, nID : Integer;
  fld : TField;
  strField, strErr : String;
  vKeyValues : Variant;
  sList,strRec:string;
  sBook1,sBook2:String;
  procedure AddErr(s:String);
  begin strErr:=strErr+s+chr(13)+chr(10); end;
begin
  AdditiveBeforeWriteDok;
  PostDataSet(Dokument);
  Result := true;
  //--------------- проверка на ошибки ввода -------------
  strErr := '';
  if (DokumentADRES_ID.AsString='') or (DokumentADRES_ID.AsInteger=0) then AddErr(' Заполните адрес домовладения.');
  if DokumentDATEZ.AsString='' then  AddErr(' Заполните дату регистрации. ');
  if DokumentNOMER.AsString='' then  AddErr(' Заполните номер. ');
  if strErr='' then begin
    with dmBase.WorkQuery do begin
      SQL.Text:=Format('SELECT ID FROM RegDogN WHERE typeobj=%d and nomer=%d and datez=%s',
            [DokumentTYPEOBJ.AsInteger, DokumentNOMER.AsInteger, DateToSQL(DokumentDATEZ.AsDateTime)]);
//      WriteToDebug([SQL.Text]);
      Open;
      while not Eof do begin
        if Fields[0].AsInteger<>DokumentID.AsInteger
          then strErr:='Запись с введенным номером и датой существует.';
        Next;
      end;
      Close;
    end;  
  end;
  if strErr<>'' then begin
    PutError(strErr, Self);
    Result:=false;
    exit;
  end;
  //-------------------------------------------------------
  if DokumentID.AsInteger=-1 then begin
    FMainTable.Append;
    FMainTable.FieldByName('TYPEOBJ').AsInteger:=DokumentTYPEOBJ.AsInteger;
    FMainTable.FieldByName('NOMER').AsString:=DokumentNOMER.AsString;
    FMainTable.FieldByName('DATEZ').Value:=DokumentDATEZ.Value;
    FMainTable.Post;
    nID:=FMainTable.FieldByName('ID').AsInteger;
  end else begin
    nID := DokumentID.AsInteger;
    if not FMainTable.Locate('ID', nID, []) then begin
      Result := false;
    end;
  end;
  if Result then  begin
    if FAddNewDok and (DokumentIMNS.AsInteger>0)
      then Globaltask.SetLastValueAsString('LAST_IMNS',DokumentIMNS.AsString);
    EditDataSet(Dokument);
    DokumentID.AsInteger:=nID;
    if (FFIOSobst<>'') and (FFIOSobst<>ANSIUpperCase(DelCharsR(DokumentSOBST_FIO.AsString,' ')))
      then DokumentSOBST_ID.AsInteger:=0;
    if (FFIONanim<>'') and (FFIONanim<>ANSIUpperCase(DelCharsR(DokumentNANIM_FIO.AsString, ' ')))
      then DokumentNANIM_ID.AsInteger:=0;
    Dokument.Post;
    FMainTable.Edit;
    for i:=1 to FMainTable.FieldCount-1 do begin
      strField := FMainTable.Fields[i].FieldName;
      fld := Dokument.FindField(strField);
      if fld <> nil then begin
        FMainTable.Fields[i].Value := fld.Value;
      end;
    end;
    {
    if DokumentADRES_ID.AsString<>''
      then FMainTable.FieldByName('ADRES_NAME').AsString:=dmBase.AdresFromID( dmBase.GetDateCurrentSost, DokumentADRES_ID.AsString)
      else FMainTable.FieldByName('ADRES_NAME').AsString:='';
    }
{
    if (not DokumentDATE_SROK.IsNull) or (DokumentSROK.AsString<>'') then begin
      dmBase.DeclareRegistr.FieldByName('TYPEREG').AsInteger:=MESTO_PREB;
    end else begin
      dmBase.DeclareRegistr.FieldByName('TYPEREG').AsInteger:=MESTO_GIT;
    end;
}
    FMainTable.Post;

    AdditiveWriteDok;

    Globaltask.SetLastValueAsString('REGISTR_DOLG',DokumentSPEC_D.AsString);
    Globaltask.SetLastValueAsString('REGISTR_SPEC',DokumentSPEC.AsString);

    if Result then QueryExit:=false;
  end;
end;

procedure TfmRegDogN.UpdateActions;
begin
end;

procedure TfmRegDogN.dsDokumentDataChange(Sender: TObject;  Field: TField);
begin
  inherited;
  if Field <> nil then begin
  end;
end;

procedure TfmRegDogN.TextAdresGetText(Sender: TObject; var Text: String);
//var
//  vKeyValues : Variant;
begin
  if DokumentADRES_ID.AsString<>'' then begin
    Text := dmBase.AdresFromID( dmBase.GetDateCurrentSost, DokumentADRES_ID.AsString );
    {
    if DokumentLICH_ID.AsString<>'' then begin
      vKeyValues := dmBase.CreateSeek( dmBase.GetDateCurrentSost, DokumentLICH_ID.AsInteger);
      if dmBase.tbLich.Locate('DATE_FIKS;ID', vKeyValues, []) then begin
        Text := 'Лиц.счет '+Trim(dmBase.tbLich.FieldByName('NOMER').AsString)+' : '+Text;
      end;
    end;
    }
  end;
end;
//--------------------------------------------------------
procedure TfmRegDogN.SetSobst;
var
  n,i,nID:Integer;
  List : TStringList;
  ds:TDataSet;
  s,sPrim:String;
  adr:TAdres;
  pt:TPoint;
begin
  if DokumentSOBST_FIO.AsString<>''  // если собственник введен ничего не делаем
    then exit;

  List:=TStringList.Create;
  with dmBase.WorkQuery do begin
    SQL.Text:='SELECT * FROM HouseOwners WHERE date_fiks='+QStr(CURRENT_SOST)+' and id='+DokumentADRES_ID.AsString;
    Open;
    if TypeObj=_TypeObj_RegDogN then begin  //-----------------
      while not Eof do begin
        if (FieldByName('TYPEKOD').AsInteger=OWNER_NASEL) and FieldByName('DATEP').IsNull then begin
          List.AddObject(dmBase.FIOMen(dmbase.GetDateCurrentSost, FieldByName('KOD').AsString), Pointer(FieldByName('KOD').AsInteger) );
        end;
        Next;                   
      end;
    end else begin                          //-----------------
      while not Eof do begin
        if (FieldByName('TYPEKOD').AsInteger=OWNER_ORG) and FieldByName('DATEP').IsNull then begin
          if dmBase.SprWork.Locate('ID',FieldByName('KOD').AsInteger,[]) then begin
            List.AddObject(getOneStr(dmBase.SprWork.FieldByName('NAME').AsString, dmBase.SprWork.FieldByName('FNAME').AsString),
                           Pointer(FieldByName('KOD').AsInteger) );
          end;
        end;
        Next;
      end;
    end;                                    //-----------------
    Close;
  end;
  n:=-1;
  sPrim:='';
  if List.Count=1 then begin
    n:=0;
  end else if List.Count>1 then begin
//    pt.X:=TextAdres.Left;
//    pt.y:=TextAdres.Top;
    pt:=TextAdres.ClientToScreen(Point(0,0));
    n:=ChoiceFromListInPos(List,'Выберите собственника', pt.x, pt.y+30);
    for i:=0 to List.Count-1 do begin
//        if n<>i then begin
      sPrim:=sPrim+List.Strings[i]+', ';
//        end;
    end;
    sPrim:=Copy(sPrim,1,Length(sPrim)-2);
  end;
  if (n>-1) then begin
    EditDataSet(Dokument);
    DokumentSOBST_ID.AsInteger:=Integer(List.Objects[n]);
    DokumentSOBST_FIO.AsString:=List.Strings[n];
    FFIOSobst:=ANSIUpperCase(DelCharsR(DokumentSOBST_FIO.AsString,' '));
    if TypeObj=_TypeObj_RegDogN then begin  //-----------------
      ds:=dmBase.GetMen(dmbase.GetDateCurrentSost, DokumentSOBST_ID.AsString);
      if ds<>nil then begin
        DokumentSOBST_TEL.AsString:=GetTelefon(ds.FieldByName('TELEFON_M').AsString,ds.FieldByName('TELEFON').AsString);
        DokumentSOBST_IDENTIF.AsString:=ds.FieldByName('LICH_NOMER').AsString;
        DokumentSOBST_UNP.AsString:=ds.FieldByName('UNP').AsString;
        adr:=dmBase.AdresMen(dmBase.GetDateCurrentSost, DokumentSOBST_ID.AsString, s, false, true);
        DokumentSOBST_ADRES.AsString:=adr.AdresPropis;
      end;  
    end else begin
      with dmBase.SprWork do begin
        if Locate('ID',DokumentSOBST_ID.AsInteger,[]) then begin
          DokumentSOBST_TEL.AsString:=FieldByName('TELEFON').AsString;
          DokumentSOBST_UNP.AsString:=FieldByName('UNP').AsString;
          DokumentSOBST_IDENTIF.AsString:='';
          DokumentSOBST_ADRES.AsString:=FieldByName('ADRES').AsString;
        end;
      end;
    end;
    CheckControlSobst;
    if sPrim<>'' then begin
      DokumentPRIM.AsString:='Собственники: '+sPrim+#13#10+DokumentPRIM.AsString;
    end;
  end;
  List.Free;
end;

procedure TfmRegDogN.btAdresClick(Sender: TObject);
begin
  if fmChoiceAdres= nil
    then fmChoiceAdres:=TfmChoiceAdres.Create(nil);
  fmChoiceAdres.DateFiks:=dmBase.GetDateCurrentSost;
  fmChoiceAdres.ChoiceLich:=false;
  if fmChoiceAdres.ShowModal = mrOk then begin
    EditDataSet(Dokument);
    DokumentADRES_ID.AsInteger:=fmChoiceAdres.IDAdres;
    SetSobst;
    PostDataSet(Dokument);
  end;
end;

procedure TfmRegDogN.btClearAdresClick(Sender: TObject);
begin
  if (DokumentADRES_ID.AsInteger>0) and Problem('Очистить адрес домовладения ?', mtConfirmation, self) then begin
    EditDataSet(Dokument);
    DokumentADRES_ID.AsInteger:=0;
    PostDataSet(Dokument);
  end;
end;

function TfmRegDogN.BeforeEdit: Boolean;
begin
  Result := inherited BeforeEdit;
// в методе Create отключена проверка FCheckLookupField:=false
end;
{
procedure TfmRegDogN.edPasp_OrganEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
 s:String;
begin
 s:=ChoiceFromShablon(SHABLON_ROVD,Trim(edPasp_Organ.Text));
 if s<>'' then begin
   edPasp_Organ.Text:=s;
 end;
end;
}

procedure TfmRegDogN.edIMNSEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  nKod:Integer;
  Opis:TOpisEdit;
  l:Boolean;
begin
  nKod:=ChoiceFromShablonEx(nil, SHABLON_IMNS, true, ''); //VarToStr(edIMNS.Value));
  l:=dbDisableControls(Dokument);
  try
    if ModifyShablon then begin  // fShablon.pas
      CheckKeyListOpis('KEY_IMNS');   // uProject.pas
      LoadComboboxFromOpis( edIMNS, 'KEY_IMNS');
    end;
    if nKod>0 then begin
      EditDataSet(Dokument);
      DokumentIMNS.AsInteger:=nKod;
      QueryExit:=true;
    end;
  finally
    dbEnableControls(Dokument,l);
  end;
end;

procedure TfmRegDogN.edOsnovCancelEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  nKod:Integer;
  Opis:TOpisEdit;
  l:Boolean;
begin
  nKod:=ChoiceFromShablonEx(nil, SHABLON_CANCEL_DOG, true, ''); //VarToStr(edOsnovCancel.Value));
  l:=dbDisableControls(Dokument);
  try
    if ModifyShablon then begin  // fShablon.pas
      CheckKeyListOpis('KEY_OSN_CAN_DOG');   // uProject.pas
      LoadComboboxFromOpis( edOsnovCancel, 'KEY_OSN_CAN_DOG');
    end;
    if nKod>0 then begin
      EditDataSet(Dokument);
      DokumentOSNOV_CANCEL.AsInteger:=nKod;
      QueryExit:=true;
    end;
  finally
    dbEnableControls(Dokument,l);
  end;
end;

{
procedure TfmRegDogN.edNanimINUpdateData(Sender: TObject;  var Handled: Boolean);
var
  s:String;
begin
  if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
    if (edNanimIN.Field.AsInteger=PASP_GR_RB)  then begin
      NanimIN.text := CheckLichNom(true, NanimIN.Text);
      s:=GetErrorCheck;
      if s<>'' then begin
        PutError(s);
      end;
    end;
  end;
end;
}
procedure TfmRegDogN.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF USE_FR3}
//    CreatefrxDBdataSet(self,tbSem,'Sem','Семья');
  {$ENDIF}
end;

procedure TfmRegDogN.edSpecEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
//  Opis : TOpisEdit;
//  arrRec:TCurrentRecord;
//  v:Variant;
  sFIO,sDolg,sDolg_B,sFIO_B:String;
begin
//  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_PERSONAL');
//  if Opis<>nil then begin
//    v:=null;
//    SetLength(arrRec,1);
    if ChoiceSpec2(sDolg,sDolg_B,sFIO,sFIO_B, edSpec, false) then begin
//    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      EditDataSet(Dokument);
      DokumentSPEC.AsString:=sFIO;
      DokumentSPEC_D.AsString:=sDolg;
      PostDataSet(Dokument);
    end;
//  end;
end;
//------------------------------------------------------------------------------------------
function TfmRegDogN.CreateSubMenuRun: Boolean;
//var
// sep : TTbSeparatorItem;
begin
  inherited CreateSubmenuRun;
  Result:=true;
  {
  itCheckA4:=TTbItem.Create(TBSubmenuRun);
  itCheckA4.Caption:='Печатная форма в формате А4';
  itCheckA4.OnClick:=Event_CheckA4;
  TBSubmenuRun.Add(itCheckA4);
  }
end;

function TfmRegDogN.getTelefon(sTelM:String; sTel:String):String;
begin
  Result:=Trim(sTelM);
  if Result=''
    then Result:=sTel;
end;

procedure TfmRegDogN.edSobstEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  n,nID : Integer;
  adr : TAdres;
  old : TCursor;
  s,sSeek,sName : String;
  ds:TDataSet;
  List : TStringList;
  pt:TPoint;
  lOk:Boolean;
  Opis:TOPisEdit;
begin
  sSeek:=Trim(edSobst.Text);
  if (sSeek='') or (Pos(' ',sSeek)>0)
    then sSeek:='';
  lOk:=false;
  if TypeObj=_TypeObj_RegDogN then begin
    if ChoiceMen( TControl(Sender), sSeek, '', arrRec) then begin
      lOk:=true;
      EditDataSet(Dokument);
      nID:=GetValueField(arrRec, 'ID');
      DokumentSOBST_ID.AsInteger:=nID;
      DokumentSOBST_FIO.AsString:=GetValueFields(arrRec, 'FAMILIA;NAME;OTCH');
      FFIOSobst:=ANSIUpperCase(DelCharsR(DokumentSOBST_FIO.AsString,' '));
      DokumentSOBST_TEL.AsString:=GetTelefon(GetValueFieldEx(arrRec, 'TELEFON_M', ''), GetValueFieldEx(arrRec, 'TELEFON', ''));
      DokumentSOBST_IDENTIF.AsString:=GetValueFieldEx(arrRec, 'LICH_NOMER', '');
      DokumentSOBST_UNP.AsString:=GetValueFieldEx(arrRec, 'UNP', '');
      adr:=dmBase.AdresMen(dmBase.GetDateCurrentSost, inttostr(nID), s, false, true);
      DokumentSOBST_ADRES.AsString:=adr.AdresPropis;
      CheckControlSobst;
    end;
  end else begin
    Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');
    if Opis<>nil then begin
      v := null;
      SetLength(arrRec,1);
      if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
        EditDataSet(Dokument);
        nID:=GetValueField(arrRec, 'ID');
        DokumentSOBST_ID.AsInteger:=nID;
        DokumentSOBST_FIO.AsString:=GetValueFields(arrRec, 'NAME');
        if DokumentSOBST_FIO.AsString='' then DokumentSOBST_FIO.AsString:=GetValueFields(arrRec, 'FNAME');
        FFIOSobst:=ANSIUpperCase(DelCharsR(DokumentSOBST_FIO.AsString,' '));
        DokumentSOBST_TEL.AsString:=GetValueFieldEx(arrRec, 'TELEFON', '');
        DokumentSOBST_IDENTIF.AsString:='';
        DokumentSOBST_UNP.AsString:=GetValueFieldEx(arrRec, 'UNP', '');
        DokumentSOBST_ADRES.AsString:=GetValueFieldEx(arrRec, 'ADRES', '');
        PostDataSet(Dokument);
        CheckControlSobst;
      end;
    end;
  end;
//      if (adr.AdresID>0) and
//         ((DokumentADRES_ID.AsInteger=0) or
//         ((DokumentADRES_ID.AsInteger>0) and (DokumentADRES_ID.AsInteger<>adr.AdresID) and Problem('Изменить адрес домовладения ?',mtConfirmation,Self))) then begin
  if lOk then begin
    old:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    if DokumentADRES_ID.AsInteger=0 then begin  // если не выбран адрес
      n:=-1;
      List:=TStringList.Create;
      with dmBase.WorkQuery do begin
        SQL.Text:='SELECT * FROM HouseOwners WHERE date_fiks='+QStr(CURRENT_SOST)+' and kod='+DokumentSOBST_ID.AsString+' and typekod='+OWNER_NASEL_STR+' and datep is null';
        Open;
        while not Eof do begin
          List.AddObject(dmBase.AdresFromIDEx(dmBase.GetDateCurrentSost, FieldByName('ID').AsString,true,true), Pointer(FieldByName('ID').AsInteger) );
          Next;
        end;
        Close;
      end;
      if List.Count=1 then begin
        n:=0;
      end else if List.Count>1 then begin
        pt:=TextAdres.ClientToScreen(Point(0,0));
        n:=ChoiceFromListInPos(List,'Выберите адрес домовладения', pt.x, pt.y+30);
      end;
      if (n>-1) then begin
        DokumentADRES_ID.AsInteger:=Integer(List.Objects[n]);
      end;
      List.Free;
    end;
//      dmBase.SimpleAdresMen(inttostr(nID), '+SHOW');
    PostDataSet(Dokument);
    Screen.Cursor := old;
  end;
end;
//------------------------ ВЫБОР НАНИМАТЕЛЯ (ЧЕЛОВЕК) ----------------------------------
procedure TfmRegDogN.edNanimEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  v : Variant;
  arrRec : TCurrentRecord;
  nID : Integer;
  adr : TAdres;
  old : TCursor;
  sSeek,sName : String;
  ds:TDataSet;
  Opis: TOpisEdit;
begin
  sSeek:=Trim(edNanim.Text);
  if (sSeek='') or (Pos(' ',sSeek)>0)
    then sSeek:='';
  if DokumentNANIM_TYPE.AsInteger=OWNER_ORG then begin
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');
    if Opis<>nil then begin
      try
        v := null;
        SetLength(arrRec,1);
        if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
          EditDataSet(Dokument);
          nID:=GetValueField(arrRec, 'ID');
          DokumentNANIM_TYPE.AsInteger:=OWNER_ORG;
          DokumentNANIM_ID.AsInteger:=nID;
          DokumentNANIM_FIO.AsString:=GetValueFieldEx(arrRec, 'NAME','');
          if DokumentNANIM_FIO.AsString=''
            then DokumentNANIM_FIO.AsString:=GetValueFieldEx(arrRec, 'FNAME','');
          FFIONanim:=ANSIUpperCase(DelCharsR(DokumentNANIM_FIO.AsString,' '));
          DokumentNANIM_TEL.AsString:=GetValueFieldEx(arrRec, 'TELEFON','');
          if DokumentADRES_ID.AsInteger=0 then begin  // если не выбран адрес
            adr:=dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), sName);
            DokumentADRES_ID.AsInteger:=adr.AdresID;
          end;
          CheckControlNanim;
        end;
      finally
      end;
    end;
  end else begin
    if ChoiceMen( TControl(Sender), sSeek, '', arrRec) then begin
        old := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        EditDataSet(Dokument);
        nID:=GetValueField(arrRec, 'ID');
        DokumentNANIM_TYPE.AsInteger:=OWNER_NASEL;
        DokumentNANIM_ID.AsInteger:=nID;
        DokumentNANIM_FIO.AsString:=GetValueFields(arrRec, 'FAMILIA;NAME;OTCH');
        FFIONanim:=ANSIUpperCase(DelCharsR(DokumentNANIM_FIO.AsString,' '));
        DokumentNANIM_TEL.AsString:=GetTelefon(GetValueFieldEx(arrRec, 'TELEFON_M', ''), GetValueFieldEx(arrRec, 'TELEFON', ''));
        GetValueFieldEx2(arrRec, 'DATER', DokumentNANIM_DATER);
        {
        p := dmBase.GetRecPasport(nID, arrRec);
        if p.Nomer <> '' then begin
          DokumentPASP_UDOST.AsInteger := p.UdostKod;
          DokumentPASP_SERIA.AsString := p.Seria;
          DokumentPASP_NOMER.AsString := p.Nomer;
          DokumentPASP_VIDAN.AsString := p.Organ;
          DokumentLICH_NOMER.AsString := p.LichNomer;
          DokumentPASP_DATE.AsDateTime := p.Date;
        end;
        }
  //      if (adr.AdresID>0) and
  //         ((DokumentADRES_ID.AsInteger=0) or
  //         ((DokumentADRES_ID.AsInteger>0) and (DokumentADRES_ID.AsInteger<>adr.AdresID) and Problem('Изменить адрес домовладения ?',mtConfirmation,Self))) then begin
        if DokumentADRES_ID.AsInteger=0 then begin  // если не выбран адрес
          adr:=dmBase.AdresMen( dmBase.GetDateCurrentSost, IntToStr(nID), sName);
          DokumentADRES_ID.AsInteger:=adr.AdresID;
        end;
  //      DokumentLICH_ID.AsInteger  := adr.LicID;
        PostDataSet(Dokument);
        Screen.Cursor := old;
        CheckControlNanim;
    end;
  end;
end;
procedure TfmRegDogN.edSobstEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  EditDataSet(Dokument);
  DokumentSOBST_ID.AsInteger:=0;
  DokumentSOBST_FIO.AsString:='';
  DokumentSOBST_ADRES.AsString:='';
  DokumentSOBST_TEL.AsString:='';
  DokumentSOBST_IDENTIF.AsString:='';
  DokumentSOBST_UNP.AsString:='';
  PostDataSet(Dokument);
  CheckControlSobst;
end;

procedure TfmRegDogN.edNanimEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(Dokument);
  DokumentNANIM_ID.AsInteger:=0;
  DokumentNANIM_TEL.AsString:='';
  DokumentNANIM_FIO.AsString:='';
  DokumentNANIM_DateR.AsString:='';
  DokumentNANIM_IDENTIF.AsString:='';
  DokumentNANIM_TYPE.AsInteger:=OWNER_NASEL;
  cbNanim.ItemIndex:=0;
  PostDataSet(Dokument);
  CheckControlNanim;
end;

procedure TfmRegDogN.cbNanimChange(Sender: TObject);
begin
  EditDataSet(Dokument);
  if cbNanim.ItemIndex=1
    then DokumentNANIM_TYPE.AsInteger:=OWNER_ORG
    else DokumentNANIM_TYPE.AsInteger:=OWNER_NASEL;
  DokumentNANIM_ID.AsInteger:=0;
  DokumentNANIM_FIO.AsInteger:=0;
  DokumentNANIM_ID.AsInteger:=0;
  DokumentNANIM_TEL.AsString:='';
  DokumentNANIM_FIO.AsString:='';
  DokumentNANIM_DateR.AsString:='';
  DokumentNANIM_IDENTIF.AsString:='';
  CheckControlNanim;
end;


end.
