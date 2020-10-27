unit fGetGISUNR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MetaTask,OpisEdit,Variants, uTypes,
  StdCtrls, Buttons, ExtCtrls, SasaDbGrid, DbCtrlsEh, DbGridEh, DBLookupEh, dBase, uGISUN, uCheckKod, uProject,
  Db, Math, FuncPr, FuncEh, ToolCtrlsEh, AddEvents, fEditMemo, vchDBCtrls, fSimpleD, Mask;

type

  TTypeColumnEh = ( tcString, tcNumber, tcBoolean, tcDate, tcPickList, tcSpr, tcMemo, tcLookup);

  TIN=record
    Caption:String;
    fldDok:TField;
    fldIN:TField;
  end;
  TArrIN=array of TIN;

  TCurValue=record
  end;

  TfmGetGISUNR = class(TForm)
    pn: TPanel;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    PanelDateR: TPanel;
    DataSource: TDataSource;
    edDate: TDBDateTimeEditEh;
    lbDate: TLabel;
    PanelPol: TPanel;
    lbPol: TLabel;
    edPol: TDBComboBoxEh;
    pnIN: TPanel;
    pnIN1: TPanel;
    edIN1: TDBEditEh;
    edPasp1: TDBComboBoxEh;
    lbDok1: TLabel;
    lbIN1: TLabel;
    lbINChild: TLabel;
    edINChild: TDBEditEh;
    pnIN2: TPanel;
    lbDok2: TLabel;
    lbIN2: TLabel;
    edIN2: TDBEditEh;
    edPasp2: TDBComboBoxEh;
    lbCheck: TLabel;
    edCheckINChild: TDBComboBoxEh;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPasp1Change(Sender: TObject);
    procedure edIN1UpdateData(Sender: TObject; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edCheckINChildChange(Sender: TObject);
  private
    FRun:Boolean;
    FGrid : TSasaDbGrid;
    FAkt  : TfmSimpleD;
    FAdd  : Boolean;
    FFlat : Boolean;
    FStepY: Integer;
    FClearKey : Boolean;
    FOpisDok:TOpisEdit;
    function EditModal:Boolean;
    procedure OnEditMemo( Sender : TObject; var Handled: Boolean);
    procedure DBTextGetText(Sender: TObject; var Text: String);
    function GetDokType(ed:TDbComboBoxEh):Integer;
    function CheckOk:Boolean;
  public
    procedure UpdateActions; override;
  end;

  function GetInfoGISUNR(Akt: TfmSimpleD) : Boolean;

implementation

//uses OpisEdit;

{$R *.DFM}
type

  TCurRec=record
     sPol:String;
     dDateR:TDateTime;
     sIN:String;
     nPasp1:Integer;
     nPasp2:Integer;
     nPasp3:Integer;
     nPasp4:Integer;
     sIN1:String;
     sIN2:String;
     sIN3:String;
     sIN4:String;
  end;

function GetInfoGISUNR(Akt: TfmSimpleD) : Boolean;
var
  f : TfmGetGISUNR;
  i:Integer;
  kb:LongWord;
  cr:TCurRec;
  lQuery:Boolean;
begin
  try
    Akt.Dokument.CheckBrowseMode;
  except
    Result:=true;
    exit;
  end;
  // если в параметрах отключен контроль перед запросом
  if not Gisun.IsCheckQuery then begin
    Result:=true;
    exit;
  end;
  Result:=false;
  lQuery:=false;
  //------- рождение --------------------------
  if Akt.TypeObj=dmbase.TypeObj_ZRogd then begin
    if Akt.Dokument.FieldByName('VOSSTAN').AsBoolean then begin
      cr.sPol:=Akt.dokument.fieldByName('POL').AsString;
      if Akt.dokument.FieldByName('DATER').IsNull  then cr.dDateR:=0 else cr.dDateR:=Akt.Dokument.FieldByName('DATER').AsDateTime;
    end else begin
      cr.sPol:=Akt.dokument.fieldByName('POL').AsString;
      if Akt.dokument.FieldByName('DATER').IsNull  then cr.dDateR:=0 else cr.dDateR:=Akt.Dokument.FieldByName('DATER').AsDateTime;
      cr.sIN1:=Trim(Akt.Dokument.FieldByName('ON_IDENTIF').AsString);
      cr.nPasp1:=Akt.Dokument.FieldByName('ON_DOK_TYPE').AsInteger;
      cr.sIN2:=Trim(Akt.Dokument.FieldByName('ONA_IDENTIF').AsString);
      cr.nPasp2:=Akt.Dokument.FieldByName('ONA_DOK_TYPE').AsInteger;
    end;
    {
    if (cr.dDateR=0) or (cr.sPol='') or (IsRequireIN(cr.nPasp1) and (Length(cr.sIN1)<LEN_IN)) or (IsRequireIN(cr.nPasp2) and (Length(cr.sIN2)<LEN_IN))then begin
      lQuery:=true;
    end;
    }
    lQuery:=true;
  end else begin  // установление отцовства
    cr.sIN:=Trim(Akt.Dokument.FieldByName('IDENTIF').AsString);
    cr.sIN1:=Trim(Akt.Dokument.FieldByName('ON_IDENTIF').AsString);
    cr.nPasp1:=Akt.Dokument.FieldByName('ON_DOK_TYPE').AsInteger;
    cr.sIN2:=Trim(Akt.Dokument.FieldByName('ONA_IDENTIF').AsString);
    cr.nPasp2:=Akt.Dokument.FieldByName('ONA_DOK_TYPE').AsInteger;
    if (Length(cr.sIN)<LEN_IN) or (IsRequireIN(cr.nPasp1) and (Length(cr.sIN1)<LEN_IN)) or (IsRequireIN(cr.nPasp2) and (Length(cr.sIN2)<LEN_IN))then begin
      lQuery:=true;
    end;
  end;

  if lQuery then begin

    f := TfmGetGISUNR.Create(Akt);

    kb:=GetTypeKeyBoard;
    if Akt.FCheckKeyboard
      then ActivateENGKeyboard;

    f.FFlat := GlobalFlat;
    f.FStepY:= GlobalStepY;
    f.FAkt := Akt;
    try
      Result:=f.EditModal;
    finally
      FreeAndNil(f);
    end;
    if Akt.FCheckKeyboard and (kb>0) then
      ActivateKeyboardLayout(kb,KLF_ACTIVATE);
  end else begin
    Result:=true;
  end;

end;
//-----------------------------------------------------------------------
function TfmGetGISUNR.EditModal: Boolean;
var
  n:Integer;
  sNew,s:String;
begin
  FOpisDok:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_UDOST');
  edPasp1.KeyItems.Assign( FOpisDok.KeyList );
  edPasp1.Items.Assign( FOpisDok.Items );

  n:=edPasp1.KeyItems.IndexOf('888');   // просто документ
  if n>-1 then begin
    edPasp1.KeyItems.Delete(n);
    edPasp1.Items.Delete(n);
  end;
  n:=edPasp1.KeyItems.IndexOf('889');   // просто паспорт (старые актовые записи)
  if n>-1 then begin
    edPasp1.KeyItems.Delete(n);
    edPasp1.Items.Delete(n);
  end;
  FRun:=true;
  edPasp2.KeyItems.Assign( edPasp1.KeyItems );
  edPasp2.Items.Assign( edPasp1.Items );

  if FAkt.TypeObj=dmbase.TypeObj_ZRogd then begin
    edPasp1.KeyItems.Add('000');
    edPasp1.Items.Add('за€вление матери');
  end;

  pnIN1.Visible:=true;
  pnIN2.Visible:=true;
    //------- рождение --------------------------
  if FAkt.TypeObj=dmbase.TypeObj_ZRogd then begin
    if FAkt.Dokument.FieldByName('VOSSTAN').AsBoolean then begin
      lbDok1.Caption:=lbDok1.Caption+' '+lbIN1.Caption;
      lbDok2.Caption:=lbDok2.Caption+' '+lbIN2.Caption;
      edIN1.Left:=edINChild.Left;
      edIN2.Left:=edINChild.Left;
      lbIN1.Visible:=false;
      lbIN2.Visible:=false;
      edPasp1.Visible:=false;
      edPasp2.Visible:=false;      
      ActiveControl:=edPol;
      if FAkt.dokument.fieldByName('IDENTIF').AsString='' then begin
        if (FAkt.Dokument.fieldByName('CHERN').AsInteger=1) or FAkt.Dokument.fieldByName('CHERN').IsNull
          then edCheckINChild.Itemindex:=0
          else edCheckINChild.Itemindex:=1;
      end else begin
        edCheckINChild.Itemindex:=1;
      end;
      pnIN.Visible:=false;
      edPol.Value:=FAkt.dokument.fieldByName('POL').AsString;
      if not FAkt.dokument.fieldByName('DATER').IsNull
        then edDate.Value:=FAkt.dokument.fieldByName('DATER').AsDateTime;
      edCheckINChildChange(nil);
    end else begin       
      ActiveControl:=edPol;
      if FAkt.dokument.fieldByName('GIVOROGD').AsBoolean then begin
        if FAkt.dokument.fieldByName('IDENTIF').AsString='' then begin
          if (FAkt.Dokument.fieldByName('CHERN').AsInteger=1) or FAkt.Dokument.fieldByName('CHERN').IsNull
            then edCheckINChild.Itemindex:=0
            else edCheckINChild.Itemindex:=1;
        end else begin
          edCheckINChild.Itemindex:=1;         
        end;
      end else begin
        edCheckINChild.Itemindex:=1;
        PanelDateR.Enabled:=false;
        PanelPol.Enabled:=false;
        lbCheck.Enabled:=false;
        edCheckINChild.Enabled:=false;
    //    edPol.Enabled:=false;
    //    lbPol.Enabled:=false;
      end;
      pnIN.Visible:=false;
      edPol.Value:=FAkt.dokument.fieldByName('POL').AsString;
      if not FAkt.dokument.fieldByName('DATER').IsNull
        then edDate.Value:=FAkt.dokument.fieldByName('DATER').AsDateTime;
      edCheckINChildChange(nil);
    end;
  end else if  FAkt.TypeObj=dmbase.TypeObj_ZUstOtc then begin
    ActiveControl:=edIN1;
    PanelDateR.Visible:=false;

    PanelPol.Height:=PanelDateR.Height;
    PanelPol.Visible:=true;
    edPol.Enabled:=false;
    lbCheck.Caption:='«апрос только родителей';
    if FAkt.Dokument.fieldByName('CHILD').AsBoolean
      then edCheckINChild.Itemindex:=1
      else edCheckINChild.Itemindex:=0;

    edINChild.Value:=Trim(FAkt.dokument.fieldByName('IDENTIF').AsString);
  end else if  FAkt.TypeObj=dmbase.TypeObj_ZUstMat then begin
    ActiveControl:=edIN1;
    PanelDateR.Visible:=false;
    PanelPol.Visible:=false;
//    if FAkt.Dokument.fieldByName('CHILD').AsBoolean
//      then edCheckINChild.Itemindex:=1
//      else edCheckINChild.Itemindex:=0;
    edINChild.Value:=Trim(FAkt.dokument.fieldByName('IDENTIF').AsString);
  end;

  // восстановл. з/а о рождении
  if (FAkt.TypeObj=dmbase.TypeObj_ZRogd) and FAkt.Dokument.FieldByName('VOSSTAN').AsBoolean then begin
    edIN1.Text:=FAkt.dokument.fieldByName('ON_IDENTIF').AsString;
    edIN1.Enabled:=true;
    lbIN1.Enabled:=edIN1.Enabled;
    edIN2.Text:=FAkt.dokument.fieldByName('ONA_IDENTIF').AsString;
    edIN2.Enabled:=true;
    lbIN2.Enabled:=edIN2.Enabled;
    if (edIN2.Text='') and edIN2.Enabled  then ActiveControl:=edIN2;
    if (edIN1.Text='') and edIN1.Enabled  then ActiveControl:=edIN1;
  end else begin
    edPasp1.Value:=FAkt.dokument.fieldByName('ON_DOK_TYPE').AsString;
    if FAkt.TypeObj=dmbase.TypeObj_ZRogd then begin
      if (FAkt.Dokument.fieldByName('SVED').AsString='3') or (FAkt.dokument.fieldByName('ON_DOK_TYPE').AsString='') then begin
        edPasp1.Value:='000';
      end;
    end;
    if (edPasp1.Value=null) or (VarToStr(edPasp1.Value)='') then begin
      edIN1.Text:='';
      edIN1.Enabled:=false;
    end else begin
      edIN1.Text:=FAkt.dokument.fieldByName('ON_IDENTIF').AsString;
      edIN1.Enabled:=IsRequireIN(GetDokType(edPasp1));
      lbIN1.Enabled:=edIN1.Enabled;
    end;
    edPasp2.Value:=FAkt.dokument.fieldByName('ONA_DOK_TYPE').AsString;
    if (edPasp2.Value=null) or (VarToStr(edPasp2.Value)='') then begin
      edIN2.Text:='';
      edIN2.Enabled:=false;
    end else begin
      edIN2.Text:=FAkt.dokument.fieldByName('ONA_IDENTIF').AsString;
      edIN2.Enabled:=IsRequireIN(GetDokType(edPasp2));
      lbIN2.Enabled:=edIN2.Enabled;
    end;
    if (edIN2.Text='') and edIN2.Enabled  then ActiveControl:=edIN2;
    if (edIN1.Text='') and edIN1.Enabled  then ActiveControl:=edIN1;
    if FAkt.TypeObj<>dmbase.TypeObj_ZRogd then begin
      if (edINChild.Text='') then ActiveControl:=edINChild;
    end;
  end;

  ClientHeight:=pn.Height+pnIN2.Top+pnIN2.Height+5;

  FRun:=false;

  if ShowModal=mrOk then begin
    FRun:=true;
    Result:=true;
    FAkt.dokument.Edit;
    try
      if FAkt.TypeObj=dmbase.TypeObj_ZRogd then begin
        if edCheckINChild.ItemIndex=0 then begin
          FAkt.Dokument.fieldByName('POL').AsString:=edPol.Value;
          if edDate.Value<>null
            then FAkt.Dokument.fieldByName('DATER').AsDateTime:=edDate.Value;
          FAkt.Dokument.fieldByName('CHERN').AsInteger:=1;
        end else begin
          FAkt.Dokument.fieldByName('CHERN').AsInteger:=0;
        end;
      end else if FAkt.TypeObj=dmbase.TypeObj_ZUstOtc then begin
        if edCheckINChild.ItemIndex=0 then begin   //  запрашивать только данные по родител€м
          FAkt.Dokument.fieldByName('CHILD').AsBoolean:=false;
          FAkt.Dokument.fieldByName('IDENTIF').AsString:='';
        end else begin
          FAkt.Dokument.fieldByName('CHILD').AsBoolean:=true;
          FAkt.Dokument.fieldByName('IDENTIF').AsString:=Trim(edINChild.Value);
        end;
      end else if FAkt.TypeObj=dmbase.TypeObj_ZUstMat then begin
        FAkt.Dokument.fieldByName('IDENTIF').AsString:=Trim(edINChild.Value);
      end;
      // восстан. з/а о рождении
      if (FAkt.TypeObj=dmbase.TypeObj_ZRogd) and FAkt.Dokument.FieldByName('VOSSTAN').AsBoolean then begin
        FAkt.dokument.fieldByName('ON_IDENTIF').AsString:=Trim(edIN1.Value);
        FAkt.dokument.fieldByName('ONA_IDENTIF').AsString:=Trim(edIN2.Value);
        FAkt.dokument.Post;
      end else begin
        s:=VarToStr(edPasp1.Value);
        if s='000' then begin
          FAkt.dokument.fieldByName('ON_GRAG').AsString:='';
          FAkt.dokument.fieldByName('ON_DOK_TYPE').AsString:='';
          FAkt.dokument.fieldByName('SVED').AsString:='3';
        end else begin
          FAkt.dokument.fieldByName('ON_DOK_TYPE').AsString:=s;
          if SetGragFromTypeDok(FAkt.dokument.fieldByName('ON_GRAG').AsString, s, sNew) then begin
            FAkt.dokument.fieldByName('ON_GRAG').AsString:=sNew;
          end;
        end;
        if edIN1.Enabled and edIN1.Visible
          then FAkt.dokument.fieldByName('ON_IDENTIF').AsString:=Trim(edIN1.Value)
          else FAkt.dokument.fieldByName('ON_IDENTIF').AsString:='';
        FAkt.dokument.fieldByName('ONA_DOK_TYPE').AsString:=VarToStr(edPasp2.Value);
        if SetGragFromTypeDok(FAkt.dokument.fieldByName('ONA_GRAG').AsString, FAkt.dokument.fieldByName('ONA_DOK_TYPE').AsString, sNew) then begin
          FAkt.dokument.fieldByName('ONA_GRAG').AsString:=sNew;
        end;
        if edIN2.Enabled and edIN2.Visible
          then FAkt.dokument.fieldByName('ONA_IDENTIF').AsString:=Trim(edIN2.Value)
          else FAkt.dokument.fieldByName('ONA_IDENTIF').AsString:='';
        FAkt.dokument.Post;
      end;

    except
      on E: Exception do begin
        Result := false;
        FAkt.dokument.Cancel;
        PutError(E.Message);
      end;
    end;
  end else begin
    Result:=false;
  end;
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.btCancelClick(Sender: TObject);
begin
//  FGrid.DataSource.DataSet.Cancel;
  ModalResult:=mrCancel;
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.btOkClick(Sender: TObject);
var
  lOk:Boolean;
begin
  lOk:=true;
  if FAkt.TypeObj=dmbase.TypeObj_ZRogd then begin
    if (GetDokType(edPasp1)=PASP_IN) and (GetDokType(edPasp2)=PASP_IN) then begin
      if Problem('ѕредъ€влены два паспорта иностраноого гражданина. «апросить »Ќ дл€ ребенка ?',mtConfirmation,self)
        then lOk:=true
        else lOk:=false;
    end;
  end;  
  if lOk
    then ModalResult:=mrOk;
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Event_FormKeyDown(Self, FClearKey, Sender, Key, Shift);
  if Key<>0 then begin
    if (Key = VK_F2) and (Shift=[]) then begin
      if CheckOk then btOkClick(nil);
    end;
  end;
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FClearKey then begin
    Key:=#0;
  end;
  FClearKey:=false;
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.OnEditMemo(Sender: TObject; var Handled: Boolean);
begin
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.DBTextGetText(Sender: TObject; var Text: String);
var
  Opis : TOpisEdit;
  ds   : TDataSet;
  ss   : String;
begin
  if TObject(TComponent(Sender).Tag) is TOpisEdit then begin
    Opis := TOpisEdit(TComponent(Sender).Tag);
    if Opis.DataSet<>nil then begin
      ds := TvchDBText(Sender).DataSource.DataSet;
      ss := TvchDBText(Sender).DataField;
      if ds.FieldByName(ss).IsNull or (ds.FieldByName(ss).AsString='') then begin
        Text := '';
      end else begin
        if Opis.FieldForNaim<>'' then begin
          if Opis.DataSet.Locate(Opis.ResultField,ds.FieldByName(ss).AsString,[]) then begin
            Text := Opis.DataSet.FieldByName(Opis.FieldForNaim).AsString;
          end else begin
            Text := '';
          end;
        end else begin
          Text := ''
        end;
      end;
    end;
  end;
end;

procedure TfmGetGISUNR.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action:=caFree;
  try
//    if (FGrid.DataSource.DataSet.State=dsInsert)	or
//       (FGrid.DataSource.DataSet.State=dsEdit) then  FGrid.DataSource.DataSet.Cancel;
  except
  end;
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.edPasp1Change(Sender: TObject);
var
  ed  : TDbComboBoxEh;
  ed_ : TDbEditEh;
  n:Integer;
  s:String;
  lb:TLabel;
begin
  ed := TDbComboBoxEh(Sender);
  s:=Right(ed.Name,1);
  if s='1' then begin
    ed_:=edIN1;
    lb:=lbIN1;
  end else if s='2' then begin
    ed_:=edIN2;
    lb:=lbIN2;
  end;
  ed_.Text:='';
  ed_.Enabled:=IsRequireIN(GetDokType(ed));
  lb.Enabled:=ed_.Enabled;
//  ed_.Visible:=ed_.Enabled;
//  lb.Visible:=ed_.Enabled;
end;

procedure TfmGetGISUNR.edIN1UpdateData(Sender: TObject;  var Handled: Boolean);
var
  ed : TDbEditEh;
  s : String;
begin
  if not FRun then begin
    ed := TDbEditEh(Sender);
    s  := ed.Text;
    if Trim(s)<>'' then begin
      if CheckRUS(s) then ed.Text:=s;
      if GlobalTask.ParamAsBoolean('KONT_IDENTIF') then begin
        ed.Text := CheckLichNom(true, ed.Text);
        s:=GetErrorCheck;
        if s<>'' then begin
  //        PutError(s);
          raise ELichNomerInvalid.Create(s);
        end;
      end;
    end;
  end;
end;                                 
//----------------------------------------------------------------
procedure TfmGetGISUNR.UpdateActions;
begin
  inherited;
  btOk.Enabled:=CheckOk;
end;
//----------------------------------------------------------------
function TfmGetGISUNR.GetDokType(ed:TDbComboBoxEh):Integer;
begin
  if (ed.Value=null) or (VarToStr(ed.Value)='') then begin
    Result:=0;
  end else if VarToStr(ed.Value)='000' then begin  // за€вление матери
    Result:=PASP_ZMAT;
  end else begin
    Result:=ed.Value;
  end;
end;
//----------------------------------------------------------------
function TfmGetGISUNR.CheckOk:Boolean;
var
  lON,lONA,lChild:Boolean;
begin
  Result:=true;

  if (FAkt.TypeObj=dmbase.TypeObj_ZRogd) and FAkt.Dokument.FieldByName('VOSSTAN').AsBoolean then begin
    lChild:=true;
    lOn:=(Trim(edIN1.Text)<>'');
    if lOn and (Length(Trim(edIN1.Text))<LEN_IN) then begin
      Result:=false;
    end;
    lOna:=(Trim(edIN2.Text)<>'');
    if Result and lOna and (Length(Trim(edIN2.Text))<LEN_IN) then begin
      Result:=false;
    end;
  end else begin
    lON:=IsRequireIN( GetDokType(edPasp1) );
    lONA:=IsRequireIN( GetDokType(edPasp2) );
    lChild:=true;
    if lON and (Length(Trim(edIN1.Text))<LEN_IN) then begin
      Result:=false;
    end;
    if Result and lONA and (Length(Trim(edIN2.Text))<LEN_IN) then begin
      Result:=false;
    end;
  end;

  if FAkt.TypeObj=_TypeObj_ZRogd then begin
    if edCheckINChild.ItemIndex=0 then begin  // если запрашивать »Ќ
      if Result and (edPol.ItemIndex<0) or (edDate.Value=null) then begin
        Result:=false;
      end;
    end else begin
      lChild:=false;
    end;
  end else if FAkt.TypeObj=_TypeObj_ZUstOtc then begin
    if edCheckINChild.Itemindex=1
      then lChild:=true
      else lChild:=false;
    if Result and (edCheckINChild.Itemindex=1) and (Length(Trim(edINChild.Text))<LEN_IN) then begin
      Result:=false;
    end;
  end else if FAkt.TypeObj=_TypeObj_ZUstMat then begin
    if Result and (Length(Trim(edINChild.Text))<LEN_IN) then begin
      Result:=false;
    end;
  end;
  if Result and not lON and not lONA and not lChild then begin  // ничего не требуетс€ запрашивать
    Result:=false;
  end;
end;
//----------------------------------------------------------------
procedure TfmGetGISUNR.FormCreate(Sender: TObject);
var
  lPB:Boolean;
begin
  lPB:=true;
  edINChild.EditMask:=GetEditMaskIN(true);
  edIN1.EditMask:=GetEditMaskIN(lPB);
  edIN2.EditMask:=GetEditMaskIN(lPB);
end;

procedure TfmGetGISUNR.edCheckINChildChange(Sender: TObject);
begin
  if FAkt.TypeObj=dmbase.TypeObj_ZRogd then begin
    if edCheckINChild.Itemindex=1 then begin
      lbPol.Enabled:=false;
      edPol.Enabled:=false;
      lbDate.Enabled:=false;
      edDate.Enabled:=false;
    end else begin
      lbPol.Enabled:=true;
      edPol.Enabled:=true;
      lbDate.Enabled:=true;
      edDate.Enabled:=true;
    end;
  end else if FAkt.TypeObj=_TypeObj_ZUstOtc then begin
    if edCheckINChild.Itemindex=0 then begin  //  запрашивать данные только по родител€м
      edINChild.Enabled:=false;
      lbINChild.Enabled:=false;
    end else begin
      edINChild.Enabled:=true;
      lbINChild.Enabled:=true;
    end;
  end else if FAkt.TypeObj=_TypeObj_ZUstMat then begin

  end;
end;

end.
