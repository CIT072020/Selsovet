unit fLgotOchered;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask, uTypes,
  DBLookupEh, dMen, fMen, DB, MetaTask, dbFunc, uProject, dBase, FuncPr, OpisEdit, ComCtrls,
  kbmMemTable, Grids, DBGridEh, TB2Item, TB2Dock, TB2Toolbar;

type
  TfmLgotOchered = class(TfmSimpleDialog)
    Panel2: TPanel;
    Label1: TLabel;
    Label82: TLabel;
    edDecDateReal: TDBDateTimeEditEh;
    edDecTime: TDBDateTimeEditEh;
    dsDokument: TDataSource;
    edTypeOchered: TDBComboBoxEh;
    pc: TPageControl;
    tsDok: TTabSheet;
    tsPrim: TTabSheet;
    edPrim: TDBEditEh;
    Panel3: TPanel;
    edDoks: TDBEditEh;
    btAddMen: TBitBtn;
    tsResh: TTabSheet;
    dsOcheredResh: TDataSource;
    GridResh: TDBGridEh;
    btEdit: TBitBtn;
    btDelMen: TBitBtn;
    lbNomer: TLabel;
    edNomer: TDBNumberEditEh;
    cbSimple: TDBCheckBoxEh;
    Label2: TLabel;
    edDecDate: TDBDateTimeEditEh;
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemSave: TTBItem;
    TBItemCancel: TTBItem;
    TBItemText: TTBItem;
    TBItemVipis: TTBItem;
    TBItemArxiv: TTBItem;
    TBItemLast: TTBItem;
    procedure edPostOEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edIskOsnEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure edTypeOcheredChange(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure btAddMenClick(Sender: TObject);
    procedure edPostOsnEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edIskOsnEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure btEditClick(Sender: TObject);
    procedure btDelMenClick(Sender: TObject);
    procedure dsOcheredReshDataChange(Sender: TObject; Field: TField);
    procedure GridReshColumns3GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormCreate(Sender: TObject);
    procedure GridReshGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure edNomerEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure dsDokumentDataChange(Sender: TObject; Field: TField);
    procedure edDecDateRealUpdateData(Sender: TObject;
      var Handled: Boolean);
    procedure TBItemSaveClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure GridReshDblClick(Sender: TObject);
  private
    arrOch : array of Integer;
    lCheck : Boolean;
  public
    FAdd:Boolean;
    FIDOch:Integer;
    dmMen : TdmMen;
    FormMen : TfmMen;
    constructor Create( Owner : TComponent ); override;
    procedure UpdateActions; override;
  end;

  function EditLgotOchered( lAppend : Boolean; d : TdmMen; f : TfmMen ) : Boolean;

implementation

uses fMain,fShablon,fOcheredOper;

{$R *.dfm}

function EditLgotOchered( lAppend : Boolean; d : TdmMen; f : TfmMen ) : Boolean;
var
  fmLgotOchered: TfmLgotOchered;
  l, lIskl : Boolean;
  s,sFilter:String;
  nNewNomer, nOchered_id, n:Integer;
  st:TSostTable;
  curRec:TCurrentRecord;
begin
  Result:=true;
  sFilter:=d.tbOcheredResh.Filter;
  nOchered_id:=d.tbOcheredLgotOCHERED_ID.AsInteger;
  if lAppend then n:=999 else n:=nOchered_id;

  // отфильтруем решения только для отдельной очереди
  // и проставим для поля NEW=false
  d.tbOcheredResh.Filter:='ochered_id='+IntToStr(n);
  d.tbOcheredResh.Filtered:=true;

  d.tbOcheredResh.EnableVersioning:=true;
  d.tbOcheredResh.VersioningMode:=mtvmAllSinceCheckPoint;
  d.tbOcheredResh.StartTransaction;
  {
  d.tbOcheredLgot.EnableVersioning:=true;
  d.tbOcheredLgot.VersioningMode:=mtvmAllSinceCheckPoint;
  d.tbOcheredLgot.StartTransaction;
  }
  {
  while not d.tbOcheredResh.Eof do begin
    d.tbOcheredResh.Edit;
    d.tbOcheredReshNEW.AsBoolean:=false;   //
    d.tbOcheredResh.Post;
    d.tbOcheredResh.Next;
  end;
  d.tbOcheredResh.First;
  }
  fmLgotOchered:=TfmLgotOchered.Create(nil);
  fmLgotOchered.FormMen:=f;
  fmLgotOchered.FIDOch:=n;

  with fmLgotOchered do begin
    cbSimple.Enabled:=((n=OCH_TYPE_SOCIAL) or (n=OCH_TYPE_MNOGO));
    if (n=OCH_TYPE_SOCIAL) or (n=OCH_TYPE_MNOGO) then begin
      edDecDate.Color:=clWindow;
      edDecDate.ReadOnly:=false;
    end else begin
      edDecDate.Color:=clInfoBk;
      edDecDate.ReadOnly:=true;
    end;
    lCheck:=false;
  end;

  GlobalTask.CurrentOpisEdit.SetKeyForm(fmLgotOchered,nil);
  fmLgotOchered.dmMen := d;
  fmLgotOchered.FAdd:=lAppend;
  fmLgotOchered.dsDokument.DataSet:=d.tbOcheredLgot;

  try
    d.tbOcheredLgot.CheckBrowseMode;
    if lAppend then begin
      //--------- соберем отдельные очереди ---------
      l:=dbDisableControls(d.tbOcheredLgot);
      d.tbOcheredLgot.First;
      while not d.tbOcheredLgot.Eof do begin
        SetLength(fmLgotOchered.arrOch, Length(fmLgotOchered.arrOch)+1);
        fmLgotOchered.arrOch[Length(fmLgotOchered.arrOch)-1] := d.tbOcheredLgotOCHERED_ID.AsInteger;
        d.tbOcheredLgot.Next;
      end;
      d.tbOcheredLgot.First;
      dbEnableControls(d.tbOcheredLgot,l);
      //---------------------------------------------
      fmLgotOchered.edTypeOchered.Enabled:=true;
      d.tbOcheredLgot.Append;
      d.tbOcheredLgotOTKAZ.AsBoolean:=false;
      d.tbOcheredLgotVNEOCH.AsBoolean:=false;
//      d.tbOcheredLgot.Post;
      fmLgotOchered.ActiveControl:=fmLgotOchered.edTypeOchered;
    end else begin
      fmLgotOchered.edTypeOchered.Enabled:=false;
      GetCurrentRecord(d.tbOcheredLgot,'',curRec);
      d.tbOcheredLgot.Edit;
    end;
    fmLgotOchered.lCheck:=true;

    fmLgotOchered.edDecDateReal.OnUpdateData:=fmLgotOchered.edDecDateRealUpdateData;  // !!!

    if fmLgotOchered.ShowModal = mrOk then begin
      fmLgotOchered.lCheck:=false;
      d.tbOcheredLgot.CheckBrowseMode;
      d.tbOcheredLgot.Edit;

      if lAppend then begin
        d.tbOcheredLgotID_INTERNAL.AsInteger := d.mtDokumentID_INTERNAL.AsInteger;
        {
        //-------- сформируем новый номер ----------------
        st := SaveSostTable(dmBase.tbOchered,false,false);
        dmBase.tbOchered.IndexName:='NOMER_KEY';
        dmBase.tbOchered.SetRange([d.tbOcheredLgotOCHERED_ID.AsInteger],[d.tbOcheredLgotOCHERED_ID.AsInteger]);
        dmBase.tbOchered.Last;
        s:=Trim(dmBase.tbOchered.FieldByName('NOMER_OCH').AsString);
        if (s='') or (s='0') then nNewNomer:=1 else nNewNomer:=StrToInt(s)+1;
        RestSostTable(dmBase.tbOchered,st);
        //------------------------------------------------
        d.tbOcheredLgotNOMER_OCH.AsInteger := nNewNomer;
        }
      end;
      d.tbOcheredResh.CheckBrowseMode;
      d.tbOcheredResh.Commit;

      d.tbOcheredResh.First;
      WriteDateField(d.tbOcheredLgotLAST_RESH_DATE, d.tbOcheredReshDATER);
      d.tbOcheredLgotLAST_RESH_NOMER.AsString:=d.tbOcheredReshNOMER.AsString;
      d.tbOcheredLgotLAST_RESH_OSNOV_TEXT.AsString:=d.tbOcheredReshOSNOV_TEXT.AsString;
      d.tbOcheredLgotLAST_RESH_TIP.AsString:=d.tbOcheredReshTIP.AsString;

      lIskl:=false;
      // если самое последнее (первая строка) решение: решение о снятии  с отдельной очереди или отказ от регистрации
      if not d.tbOcheredResh.Eof then begin
        if (d.tbOcheredReshTIP.AsInteger=OCH_RESH_SN) or d.tbOcheredReshOTKAZ.AsBoolean then begin
          lIskl:=true;
        end;
      end;

      d.tbOcheredLgotISKL.AsBoolean:=lIskl;   // записать ISKL

      d.tbOcheredLgot.Post;
//      d.tbOcheredLgot.Commit;

      l:=dbDisableControls(d.tbOcheredResh);
      d.tbOcheredResh.First;
      d.tbOcheredResh.Filter:='';
      d.tbOcheredResh.Filtered:=false;
      while not d.tbOcheredResh.Eof do begin
        if d.tbOcheredReshOCHERED_ID.AsInteger=fmLgotOchered.FIDOch then begin
          d.tbOcheredResh.Edit;
          d.tbOcheredReshOCHERED_ID.AsInteger:=d.tbOcheredLgotOCHERED_ID.AsInteger;
          d.tbOcheredResh.Post;
        end;
        d.tbOcheredResh.Next;
      end;
      dbEnableControls(d.tbOcheredResh,l);

      d.OchReshMod:=true;
    end else begin             
      fmLgotOchered.lCheck:=false;
      Result:=false;

      d.tbOcheredLgot.CheckBrowseMode;
      if lAppend
        then d.tbOcheredLgot.Delete
        else WriteCurrentRecord(d.tbOcheredLgot,curRec);
      d.tbOcheredResh.Rollback;

      {
      d.tbOcheredResh.First;
      d.tbOcheredResh.CheckBrowseMode;
      while d.tbOcheredResh.Locate('NEW',true,[]) do d.tbOcheredResh.Delete;
      }
    end;
  finally
    fmLgotOchered.Free;
    d.tbOcheredResh.Filter:=sFilter;
    if sFilter<>''
      then d.tbOcheredResh.Filtered:=true;

    d.tbOcheredResh.EnableVersioning:=false;
    d.tbOcheredResh.VersioningMode:=mtvm1SinceCheckPoint;

    {
    d.tbOcheredLgot.EnableVersioning:=false;
    d.tbOcheredLgot.VersioningMode:=mtvm1SinceCheckPoint;
    }
  end;
end;

constructor TfmLgotOchered.Create(Owner: TComponent);
begin
  inherited;
  fmMain.ImageList.GetBitmap(118,btEdit.Glyph);
  fmMain.ImageList.GetBitmap(119,btAddMen.Glyph);
  fmMain.ImageList.GetBitmap(120,btDelMen.Glyph);
end;

procedure TfmLgotOchered.UpdateActions;
begin
  inherited;
//  if (VarToStr(edTypeOchered.Value)<>'') and (VarToStr(edDecDate.Value)<>'')
//    then btOk.Enabled:=true
//    else btOk.Enabled:=false;
  if (VarToStr(edTypeOchered.Value)<>'') and (VarToStr(edDecDate.Value)<>'')
    then TBItemSave.Enabled:=true
    else TBItemSave.Enabled:=false;
end;

// clear
procedure TfmLgotOchered.edPostOEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
//  dMen.tbOcheredLgotREG_OSNOV.AsString:='';
//  dMen.tbOcheredLgotREG_OSNOV_TEXT.AsString:='';
end;

procedure TfmLgotOchered.edIskOsnEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
//  dMen.tbOcheredLgotISK_OSNOV.AsString:='';
//  dMen.tbOcheredLgotISK_OSNOV_TEXT.AsString:='';
end;

procedure TfmLgotOchered.edTypeOcheredChange(Sender: TObject);
var
  i : Integer;
begin                                                
  if lCheck and (edTypeOchered.Text<>'') then begin
    cbSimple.Enabled:=((edTypeOchered.Value=OCH_TYPE_SOCIAL) or (edTypeOchered.Value=OCH_TYPE_MNOGO));
    if (edTypeOchered.Value=OCH_TYPE_SOCIAL) or (edTypeOchered.Value=OCH_TYPE_MNOGO) then begin
      edDecDate.Color:=clWindow;
      edDecDate.ReadOnly:=false;
    end else begin
      edDecDate.Color:=clInfoBk;
      edDecDate.ReadOnly:=true;
    end;
    for i:=0 to Length(arrOch)-1 do begin
      if arrOch[i]=edTypeOchered.Value then begin
        PutError('Выбранная отдельная очередь уже существует.');
        edTypeOchered.Value:='';
      end;
    end;
    if (edTypeOchered.Text<>'') then begin
      if (edDecDateReal.Value<>null) and edDecDate.ReadOnly and (edDecDate.Value=null)
        then edDecDate.Value:=edDecDateReal.Value;
    end;
  end;
end;

procedure TfmLgotOchered.pcChange(Sender: TObject);
begin
  case pc.ActivePageIndex of
    0 : begin    // решения
          btAddMen.Enabled:=true;
          btDelMen.Enabled:=true;
          btEdit.Enabled:=true;
        end;
    1 : begin   // документы
          btAddMen.Enabled:=true;
          btDelMen.Enabled:=false;
          btEdit.Enabled:=false;
        end;
    2 : begin   // примечание
          btAddMen.Enabled:=false;
          btDelMen.Enabled:=false;
          btEdit.Enabled:=false;
        end;
  end;
end;

procedure TfmLgotOchered.GridReshDblClick(Sender: TObject);
begin
  btEditClick(nil);
end;

procedure TfmLgotOchered.btAddMenClick(Sender: TObject);
var
  s,s1,s2:String;
  n:Integer;
begin
  //---- решения --------------------
  if pc.ActivePageIndex=0 then begin
    EditOchResh(dmMen, true, FIDOch, nil, dsDokument.DataSet);
  //---- документы --------------------
  end else if pc.ActivePageIndex=1 then begin
    s:=ChoiceFromShablon(SHABLON_OCH,'');
    n:=edDoks.SelStart;
    edDoks.SelStart:=0;
    edDoks.SelLength:=0;
    s1:=Copy(edDoks.Text,1,n);
    s2:=Copy(edDoks.Text,n+1,Length(edDoks.Text));
    edDoks.Text := s1+s+s2;
    edDoks.SelStart:=Length(s1+s);
  end;
end;

procedure TfmLgotOchered.btEditClick(Sender: TObject);
begin
  //---- решения --------------------
  if pc.ActivePageIndex=0 then begin
    EditOchResh(dmMen, false, FIDOch, nil, dsDokument.DataSet);
  end;
end;

procedure TfmLgotOchered.btDelMenClick(Sender: TObject);
begin
  if pc.ActivePageIndex=0 then begin
    dsOcheredResh.DataSet.CheckBrowseMode;
    if dsOcheredResh.DataSet.RecordCount>0 then begin
      if Problem('Удалить решение ?',mtConfirmation,self) then begin
        dsOcheredResh.DataSet.Delete;
        dmMen.OchReshMod:=true;
      end;
    end;
  end;
end;

procedure TfmLgotOchered.edPostOsnEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Handled := true;
  SetLength(arrRec,1);
  v := null;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRPOSTOCH');
  if Opis <> nil then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
//        dMen.tbOcheredLgot.CheckBrowseMode;
//        dMen.tbOcheredLgot.Edit;
//        EditDataSet(dMen.tbOcheredLgot);
//        dMen.tbOcheredLgotREG_OSNOV.AsInteger:=v;
//        dMen.tbOcheredLgotREG_OSNOV_TEXT.AsString:=GetValueField(arrRec, 'NAME');
      end;
    end;
  end;
end;

procedure TfmLgotOchered.edIskOsnEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
begin
  Handled := true;
  SetLength(arrRec,1);
  v := null;
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSNOCH');
  if Opis <> nil then begin
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
//        EditDataSet(dMen.tbOcheredLgot);
//        dMen.tbOcheredLgotISK_OSNOV.AsInteger:=v;
//        dMen.tbOcheredLgotISK_OSNOV_TEXT.AsString:=GetValueField(arrRec, 'NAME');
      end;
    end;
  end;
end;

procedure TfmLgotOchered.dsOcheredReshDataChange(Sender: TObject; Field: TField);
begin
  if (Field<>nil) then begin
    FormMen.QueryExit := true;
  end;
end;

procedure TfmLgotOchered.GridReshColumns3GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s,ss:String;
begin
  s:=GetNameOsnOch(dmMen.tbOcheredReshOSNOV.AsString,dmMen.tbOcheredReshOSNOV_TEXT.AsString,dmMen.tbOcheredResh.FieldByName('TIP').AsInteger,OCH_OSN_KRAT);
  ss:=GetNameOsnOch(dmMen.tbOcheredReshOSNOV2.AsString,dmMen.tbOcheredReshOSNOV_TEXT2.AsString,dmMen.tbOcheredResh.FieldByName('TIP').AsInteger,OCH_OSN_KRAT);
  if ss<>''
    then Params.Text:='1. '+s+chr(13)+'2. '+ss
    else Params.Text:=s;
end;

procedure TfmLgotOchered.FormCreate(Sender: TObject);
begin
  SetFlatEhComp(Self,GlobalFlat);
end;

procedure TfmLgotOchered.GridReshGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dmMen.tbOcheredReshOTKAZ.AsBoolean or (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_SN) then begin
    AFont.Color:=clRed;
  end else if (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_RAZD) or (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_UNION) or
              (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_PERE) then begin
    AFont.Color:=clBlue;
  end;
  if dmMen.tbOcheredReshPLAN.AsBoolean  then begin
    Background:=clInfoBk;
  end;
end;

procedure TfmLgotOchered.edNomerEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  n:Integer;
//  lOk,l1,l2:Boolean;
  cur:TCursor;
begin
//  lOk:=false;
  if (edTypeOchered.ItemIndex=-1) then exit;
  if dmMen.mtDokumentDEC_DATE.IsNull then begin
    exit;
  end;
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    n:=dmBase.GetRealNomerOchEx(dmMen.mtDokumentID_BASE.AsInteger, edTypeOchered.Value, dmMen.mtDokumentID.AsInteger,
           dmMen.tbOcheredLgotDEC_DATE.AsDateTime, dmMen.tbOcheredLgotDEC_TIME.AsDateTime,1,dmMen.tbOcheredLgotOLD_NOMER.AsInteger);

    if n>0 then begin
      EditDataSet(edNomer.Field.DataSet);
      edNomer.Text:=IntToStr(n);
    end;
  finally
    Screen.Cursor:=cur;
  end;
{

  if (edTypeOchered.ItemIndex>-1) and (dmMen.mtDokumentID.AsInteger>0) then begin
    n:=dmBase.GetRealNomerOch(dmMen.mtDokumentID_BASE.AsInteger, edTypeOchered.Value, dmMen.mtDokumentID.AsInteger);
    if n>0 then begin
      EditDataSet(edNomer.Field.DataSet);
      edNomer.Text:=IntToStr(n);
    end;
//    edNomer.Text:=intToStr(dmBase.NewNomerOchered(StrToInt(edTypeOchered.KeyItems[edTypeOchered.ItemIndex])));
  end;
  }
end;

procedure TfmLgotOchered.dsDokumentDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {
  if Field<>nil then begin
    if (Field.FieldName='DEC_DATE_REAL') then begin
      if edDecDate.ReadOnly then begin
        edDecDate.Value:=Field.Value;
      end else begin
        if (edDecDate.Value=null) and not Field.IsNull
          then edDecDate.Value:=Field.Value;
      end;
    end;
  end;
  }
end;

procedure TfmLgotOchered.edDecDateRealUpdateData(Sender: TObject; var Handled: Boolean);
begin
  if edDecDate.ReadOnly then begin
    if edDecDateReal.Value=null
      then edDecDate.Value:=null
      else edDecDate.Value:=edDecDateReal.Value;
  end;
end;

procedure TfmLgotOchered.TBItemSaveClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmLgotOchered.TBItemCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
