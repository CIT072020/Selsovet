unit fOcheredOper;

interface

{$I Task.inc}              

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db, dBase, fMain,
  FuncPr, fmChList, fChoiceNasel, dbFunc, MetaTask, OpisEdit, dMen, uProject, uProjectAll, uTypes,
  Dialogs, fSimpleDialog, DBCtrlsEh, StdCtrls, Mask, Buttons, ExtCtrls,mTempl,kbmMemTable,
  DBCtrls, HunSpellDBMemo, TB2Item, TB2Dock, TB2Toolbar, vchDBCtrls;

type
  TfmOcheredOper = class(TfmSimpleDialog)
    DataSource: TDataSource;
    Panel2: TPanel;
    Label83: TLabel;
    Label85: TLabel;
    Label102: TLabel;
    Label1: TLabel;
    lbFIO: TLabel;
    edResh: TDBEditEh;
    edDate: TDBDateTimeEditEh;
    edFIO: TDBEditEh;
    edOsnov: TDBEditEh;
    edOsnov2: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    cbOtkaz: TDBCheckBoxEh;
    Label4: TLabel;
    edAddInfo: TDBMemo;
    gbResh: TGroupBox;
    lbDateSila: TLabel;
    edDateSila: TDBDateTimeEditEh;
    edTextResh: THunSpellDBMemo;
    gbVipis: TGroupBox;
    edTextVipis: THunSpellDBMemo;
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemSave: TTBItem;
    TBItemCancel: TTBItem;
    TBItemText: TTBItem;
    TBItemVipis: TTBItem;
    lbResh: TLabel;
    edOper: TComboBox;
    TBItemArxiv: TTBItem;
    edOper1: TDBComboBoxEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    TBItemLast: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure edFIOEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edOsnovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edOsnovEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure edOsnov2EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edOsnov2EditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure TBItemSaveClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure TBItemTextClick(Sender: TObject);
    procedure TBItemVipisClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure edOperChange(Sender: TObject);
    procedure edDateUpdateData(Sender: TObject; var Handled: Boolean);
    procedure TBItemLastClick(Sender: TObject);
  private
    { Private declarations }
  public
//    tbSostavSem:TDataSet;
    IDCurMen:Integer;
    IDMen:Integer;
    FOneText:Boolean;
    FRun:Boolean;
    FIDOchered:Integer;
    FQueryExit:Boolean;
    dmMen : TdmMen;
    arrRec : TCurrentRecord;
    function getTypeResh:Integer;
    procedure setItemIndex(n:Integer);
    function getTypeSpr:Boolean;
    procedure CheckControl;
    procedure GetTextLabel(n:Integer);
    procedure UpdateActions; override;
  end;

  function EditOchResh(dmMen : TdmMen; lAdd:Boolean; nIDOch:Integer; Owner:TComponent; dsCurOch:TDataSet):Boolean;


implementation

uses dDokument;


{$R *.dfm}

function EditOchResh(dmMen : TdmMen; lAdd:Boolean; nIDOch:Integer; Owner:TComponent; dsCurOch:TDataSet):Boolean;
var
  fmOcheredOper: TfmOcheredOper;
  sBookmark:String;
  l,lOk:Boolean;
  nAutoID:Integer;
begin
  Result:=false;
  fmOcheredOper:=TfmOcheredOper.Create(Owner);
  fmOcheredOper.dmMen:=dmMen;
  fmOcheredOper.DataSource.DataSet:=dmMen.tbOcheredResh;
  fmOcheredOper.TBItemArxiv.Checked:=false;
  fmOcheredOper.TBItemArxiv.Visible:=Globaltask.ParamAsBoolean('OCH_EN_ARXIV');
  fmOcheredOper.IDMen:=0;
  fmOcheredOper.IDCurMen:=dmmen.mtDokumentID.AsInteger;
  fmOcheredOper.FIDOchered:=nIDOch;
  if nIDOch>0 then begin
    fmOcheredOper.TBItemLast.Visible:=true;
  end;
  if GlobalTask.ParamAsBoolean('OCH_ONE_VIPIS')
    then fmOcheredOper.FOneText:=true
    else fmOcheredOper.FOneText:=false;

  if fmOcheredOper.FOneText
    then fmOcheredOper.gbResh.Visible:=false;

//  sBookMark:=dmMen.tbOcheredResh.Bookmark;
  nAutoID:=dmMen.tbOcheredReshAUTO_ID.AsInteger;
//  AUTO_ID !!!
  {
  dmMen.tbOcheredResh.Filter:='id_ochered=0';
  dmMen.tbOcheredResh.Filtered:=true;
  GetCurrentRecord(dmMen.tbOcheredResh, '', fmOcheredOper.arrRec);
  dmMen.tbOcheredResh.Filter:='id_ochered='+IntToStr(nIDOch);
  dmMen.tbOcheredResh.Filtered:=true;
  dmMen.tbOcheredResh.Bookmark:=sBookMark;
  }
  dmMen.tbOcheredResh.EnableVersioning:=true;
  dmMen.tbOcheredResh.VersioningMode:=mtvmAllSinceCheckPoint;
  dmMen.tbOcheredResh.StartTransaction;
  try
//  l:=dbDisableControls(dmMen.tbOcheredResh);
  if lAdd then begin
    dmMen.tbOcheredResh.Append;
    dmMen.tbOcheredReshID_INTERNAL.AsInteger:=dmMen.mtDokumentID_INTERNAL.AsInteger;
    dmMen.tbOcheredReshOCHERED_ID.AsInteger:=nIDOch;
    dmMen.tbOcheredReshAUTO_ID.AsInteger:=0;
//    dmMen.tbOcheredReshNomer.AsString:='';
    dmMen.tbOcheredReshOTKAZ.AsBoolean:=false;
    dmMen.tbOcheredReshID1.AsInteger:=0;
    dmMen.tbOcheredReshID2.AsInteger:=0;
    dmMen.tbOcheredReshTIP.AsInteger:=OCH_RESH_POST;
    fmOcheredOper.setItemIndex(dmMen.tbOcheredReshTIP.AsInteger);
  end else begin
    fmOcheredOper.IDMen:=dmMen.tbOcheredReshID2.AsInteger;
    fmOcheredOper.setItemIndex(dmMen.tbOcheredReshTIP.AsInteger);
    if fmOcheredOper.IDMen>0 then begin
      fmOcheredOper.edFIO.Text:=dmBase.FIOMen(dmBase.GetDateCurrentSost, IntToStr(fmOcheredOper.IDMen), ' ');
    end;
    dmMen.tbOcheredResh.Edit;
  end;

  SetHunSpell(fmOcheredOper.edTextVipis);
  SetHunSpell(fmOcheredOper.edTextResh);

  fmOcheredOper.CheckControl;
  fmOcheredOper.edOperChange(nil);
//  dbEnableControls(dmMen.tbOcheredResh,l);

  fmOcheredOper.FRun:=false;
  fmOcheredOper.FQueryExit:=true;

  if fmOcheredOper.TBItemArxiv.Visible then begin
    if fmOcheredOper.edDate.Value=null
      then fmOcheredOper.TBItemArxiv.Enabled:=true
      else fmOcheredOper.TBItemArxiv.Enabled:=false;
  end;

  if fmOcheredOper.ShowModal=mrOk then begin
    lOk:=true;
  end else begin
    lOk:=false;
  end;
//  l:=dbDisableControls(dmMen.tbOcheredResh);
  fmOcheredOper.FRun:=true;
  if lOk then begin
    dmMen.tbOcheredResh.CheckBrowseMode;
    EditDataSet(dmMen.tbOcheredResh);
    dmMen.tbOcheredReshTIP.AsInteger:=fmOcheredOper.getTypeResh;
    // запишем DATE_SORT
    if fmOcheredOper.TBItemArxiv.Enabled and fmOcheredOper.TBItemArxiv.Checked then begin
      dmMen.tbOcheredReshDATE_SORT.Value:=null;
    end else begin
      if dmMen.tbOcheredReshDATER.IsNull   // !!!
        then dmMen.tbOcheredReshDATE_SORT.AsDateTime:=STOD('9999-12-31',tdAds)
        else dmMen.tbOcheredReshDATE_SORT.AsDateTime:=dmMen.tbOcheredReshDATER.AsDateTime;
    end;
    dmMen.tbOcheredReshADDINFO.AsString:=Replace_CRLF(fmOcheredOper.edAddInfo.Text,true); // dmMen.tbOcheredReshADDINFO.AsString,true);
    if fmOcheredOper.FOneText then begin  // один текст для выписки и решения
      dmMen.tbOcheredReshTEXTRESH.AsString:='';
    end else begin
      dmMen.tbOcheredReshTEXTRESH.AsString:=Replace_CRLF(fmOcheredOper.edTextResh.Text,true);// dmMen.tbOcheredReshTEXTRESH.AsString,true);
    end;
    dmMen.tbOcheredReshTEXTVIPIS.AsString:=Replace_CRLF(fmOcheredOper.edTextVipis.Text,true); // dmMen.tbOcheredReshTEXTVIPIS.AsString,true);
    dmMen.tbOcheredReshID2.AsInteger:=fmOcheredOper.IDMen;
    dmMen.tbOcheredResh.Post;

    if dsCurOch.FieldByName('DEC_DATE').IsNull and ReshIsPostanovka(dmMen.tbOcheredReshTIP.AsInteger) then begin
//      ((dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_POST) or (dmMen.tbOcheredReshTIP.AsInteger=OCH_RESH_VOST)) then begin
      EditDataSet(dsCurOch);
      if dmMen.tbOcheredReshDATE_SILA.IsNull then begin
        if not dmMen.tbOcheredReshDATER.IsNull then begin
          dsCurOch.FieldByName('DEC_DATE').AsDateTime:=dmMen.tbOcheredReshDATER.AsDateTime;
        end;
      end else begin
        dsCurOch.FieldByName('DEC_DATE').AsDateTime:=dmMen.tbOcheredReshDATE_SILA.AsDateTime;
      end;
    end;

    PostDataSet(dmMen.tbOcheredResh);
    dmMen.OchReshMod:=true;
    dmMen.tbOcheredResh.Commit;
    Result:=true;
    if lAdd then dmMen.tbOcheredResh.First;
    //-- если отдельная очередь, то проверить исключен человек из нее или нет ---
{
    sBookMark:=dmMen.tbOcheredResh;
    l:=dbDisableControls(dmMen.tbOcheredResh);


    dmMen.tbOcheredResh:=sBookMark;
    dbEnableControls(dmMen.tbOcheredResh,l);
}
    //--------------------------------------------------------------------------
  end else begin
    dmMen.tbOcheredResh.Rollback;
    if nAutoID<>dmMen.tbOcheredReshAUTO_ID.AsInteger
      then dmMen.tbOcheredResh.Locate('AUTO_ID', nAutoID, []);

//    dmMen.tbOcheredResh.Bookmark:=sBookmark;

//    dmMen.tbOcheredResh.Cancel;
  end;

  finally

    dmMen.tbOcheredResh.EnableVersioning:=false;
    dmMen.tbOcheredResh.VersioningMode:=mtvm1SinceCheckPoint;

    fmOcheredOper.Free;
//    dbEnableControls(dmMen.tbOcheredResh,l);

  end;

end;


{ TfmOcheredOper }
procedure TfmOcheredOper.UpdateActions;
begin
  inherited;
end;

procedure TfmOcheredOper.FormCreate(Sender: TObject);
begin
  inherited;
  FRun:=true;
  IDMen:=0;
  IDCurMen:=0;
  GlobalTask.CurrentOpisEdit.GetListOpis('KEY_TYPE_RESH', edOper1.Items, edOper1.KeyItems);
  edOper.Items.Assign(edOper1.Items);
//  edOsnov.EditButtons[1].Glyph:=ImBtClear.Picture.Bitmap;
end;

procedure TfmOcheredOper.edFIOEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sl,slID,slBookmark:TStringList;
  s,ss,sBookMark:String;
  i,n:Integer;
  arrRec : TCurrentRecord;
  par:TParamsChoiceMen;
  function CheckMen:Boolean;
  begin      
    Result:=true;
    if (n=OCH_RESH_PERE) then begin  // переоформление
      dmBase.WorkQuery.SQL.Text:='select count(*) from Ochered where id='+slID.Strings[i];
      dmBase.WorkQuery.Open;
      if dmBase.WorkQuery.Fields[0].AsInteger>0 then begin
        PutError(sl.Strings[i]+' присутствует в базе очередников');
        Result:=false;
      end;
    end;
  end;
begin
  n:=getTypeResh;
  if n>0 then begin
    if (n=OCH_RESH_RAZD) or (n=OCH_RESH_PERE) then begin  // переоформление или разделение
      sl:=TStringList.Create;
      slID:=TStringList.Create;
      slBookmark:=TStringList.Create;
      sBookMark:=dmMen.tbSostavSem.Bookmark;
      dmMen.tbSostavSem.First;
      while not dmMen.tbSostavSem.Eof do begin
        if (dmMen.tbSostavSemFAMILIA.AsString<>'') and (dmMen.tbSostavSemISKL.AsBoolean=false) then begin
          s:='';
          if dmMen.tbSostavSemOTNOSH.AsString<>'' then begin
            s:=ANSILowerCase(dmBase.SeekValueTable2(dmBase.SprOtnosh,'ID',dmMen.tbSostavSemOTNOSH.AsString,'NAME'))+' ';
          end;
          s:=s+Trim(dmMen.tbSostavSemFAMILIA.AsString)+' '+Trim(dmMen.tbSostavSemNAME.AsString)+' '+Trim(dmMen.tbSostavSemOTCH.AsString);
          ss:='';
          if not dmMen.tbSostavSemDATER.IsNull then begin
            ss:=' '+FormatDateTime('dd.mm.yyy',dmMen.tbSostavSemDATER.AsDateTime);
          end;
          sl.Add(s+ss);
          slID.Add(dmMen.tbSostavSemMEMBER_ID.AsString);
          slBookmark.Add(dmMen.tbSostavSem.Bookmark);
        end;
        dmMen.tbSostavSem.Next;
      end;
      dmMen.tbSostavSem.BookMark:=sBookMark;
      if sl.Count=0 then begin
        PutError('В составе семьи нет ни одного человека.');
      end else begin
        i:=ChoiceFromList(sl,'Выберите человека');
        if i>-1 then begin
          if CheckMen then begin
            IDMen:=StrToInt(slID.Strings[i]);      // ID нового хозяина очереди или с кем будет разделена очередь
            EditDataSet(dmMen.tbOcheredResh);
            dmMen.tbOcheredReshID2.AsInteger:=IDMen;
            edFIO.Text:=sl.Strings[i];
          end;
        end;
      end;
    end else if (n=OCH_RESH_UNION) then begin  // объединение
      par:=TParamsChoiceMen.Create;
      par.sSQL:='SELECT o.ID, n.Familia,n.Name,n.Otch,n.LICH_NOMER,n.DATER,o.DELO,o.DEC_DATE, n.NEW_ID, n.CANDELETE, n.PRESENT, n.PROPIS, n.DATE_SROK_DN, n.SPEC_UCH FROM Ochered o '+
            {$IFDEF OCHERED}
                ' LEFT JOIN Население n on n.id=o.id'+
            {$ELSE}
                ' LEFT JOIN Население n on n.id=o.id and n.date_fiks='+QStr(CURRENT_SOST)+
            {$ENDIF}
                ' WHERE ochered_id=0 and o.id<>'+IntTostr(IDCurMen)+' and o.iskl=false ORDER BY Familia';
      par.sSect:='ChMenOch';
      if ChoiceMenEx( edFIO, '', '', arrRec, par) then begin
//      if ChoiceMen( edFIO, '', 'OCHERED=true and ID<>'+IntTostr(IDCurMen)+' and iskl=false', arrRec) then begin
        IDMen := GetValueField(arrRec, 'ID');
        EditDataSet(dmMen.tbOcheredResh);
        dmMen.tbOcheredReshID2.AsInteger:=IDMen;
        edFIO.Text:=GetValueFieldEx(arrRec, 'FAMILIA','')+' '+GetValueFieldEx(arrRec, 'NAME','')+' '+GetValueFieldEx(arrRec, 'OTCH','');
      end;
    end;
  end;
end;
//--------------------------------------------------------------
function TfmOcheredOper.getTypeResh:Integer;
begin
  Result:=0;
  if edOper.ItemIndex>-1 then begin
    Result:=StrToInt(edOper1.KeyItems[edOper.ItemIndex]);
  end;
end;
//--------------------------------------------------------------
procedure TfmOcheredOper.setItemIndex(n:Integer);
begin
  n:=edOper1.KeyItems.IndexOf(IntToStr(n));
  if n=-1 then n:=0;
  edOper.ItemIndex:=n;
end;
//--------------------------------------------------------------
function TfmOcheredOper.getTypeSpr:Boolean;
var
  n:Integer;
begin
  Result:=true;
  n:=getTypeResh;
  if n>0 then begin
    if (n=OCH_RESH_SN) or cbOtkaz.Checked then begin
      Result:=false;
    end;
  end;
end;
//--------------------------------------------------------------
procedure TfmOcheredOper.edOperChange(Sender: TObject);
var
  n:Integer;
begin
  if not FRun then begin
    IDMen:=0;
    edFIO.Text:='';
    EditDataSet(dmMen.tbOcheredResh);
    dmMen.tbOcheredReshID2.AsInteger:=0;
  end;

  n:=getTypeResh;
  GetTextLabel(n);
  if n>0 then begin
    if not FRun then begin
      EditDataSet(dmMen.tbOcheredResh);
      dmMen.tbOcheredReshTIP.AsInteger:=n;
    end;
    if (n=OCH_RESH_UNION) or (n=OCH_RESH_PERE) or (n=OCH_RESH_RAZD) then begin
      lbFIO.Enabled:=true;
      edFIO.Enabled:=true;
    end else begin
      lbFIO.Enabled:=false;
      edFIO.Enabled:=false;
    end;
    if (n=OCH_RESH_SN) then begin
      edDateSila.Enabled:=false;
      lbDateSila.Enabled:=false;
    end else begin
      edDateSila.Enabled:=true;
      lbDateSila.Enabled:=true;
    end;
    if (n=OCH_RESH_POST) or (n=OCH_RESH_VOST) then begin
      cbOtkaz.Enabled:=true;
    end else begin
      EditDataSet(dmMen.tbOcheredResh);
      dmMen.tbOcheredReshOTKAZ.AsBoolean:=false;
      cbOtkaz.Enabled:=false;
    end;
  end;
end;
//--------------------------------------------------------------------------
procedure TfmOcheredOper.edOsnovEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(dmMen.tbOcheredResh);
  dmMen.ChoiceSprOch(getTypeSpr,'OSNOV','OSNOV_TEXT');
  Handled := true;
  CheckControl;
end;
//--------------------------------------------------------------------------
procedure TfmOcheredOper.edOsnovEditButtons1Click(Sender: TObject;  var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(dmMen.tbOcheredResh);
  dmMen.tbOcheredReshOSNOV.AsString:='';
  dmMen.tbOcheredReshOSNOV_TEXT.AsString:='';
  CheckControl;
end;
//------------------------------------------------------------------------------------------
procedure TfmOcheredOper.edOsnov2EditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  EditDataSet(dmMen.tbOcheredResh);
  dmMen.ChoiceSprOch(getTypeSpr,'OSNOV2','OSNOV_TEXT2');
  Handled := true;
  CheckControl;
end;

procedure TfmOcheredOper.edOsnov2EditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  EditDataSet(dmMen.tbOcheredResh);
  dmMen.tbOcheredReshOSNOV2.AsString:='';
  dmMen.tbOcheredReshOSNOV_TEXT2.AsString:='';
  CheckControl;
end;
//--------------------------------------------------------------------------
procedure TfmOcheredOper.CheckControl;
var
  lText,lSave:Boolean;
begin
  if dmMen.tbOcheredReshOSNOV.IsNull or  (dmMen.tbOcheredReshOSNOV.AsInteger=0) then begin
    if edOsnov.Font.Style <> [] then begin
      edOsnov.Font.Style := [];
    end;
  end else begin
    if edOsnov.Font.Style <> [fsBold] then begin
      edOsnov.Font.Style := [fsBold];
    end;
  end;
  if dmMen.tbOcheredReshOSNOV2.IsNull or (dmMen.tbOcheredReshOSNOV2.AsInteger=0) then begin
    if edOsnov2.Font.Style <> [] then begin
      edOsnov2.Font.Style := [];
    end;
  end else begin
    if edOsnov2.Font.Style <> [fsBold] then begin
      edOsnov2.Font.Style := [fsBold];
    end;
  end;
end;
//-----------------------------------------------------
procedure TfmOcheredOper.TBItemSaveClick(Sender: TObject);
var
  n:Integer;
  lText,lSave:Boolean;
  strErr,s:String;
//  v:Variant;
  procedure AddErr(s:String);
  begin
    if strErr='' then strErr:=s
                 else strErr:=strErr+#13+s;
  end;
begin
  strErr:='';
  if (edResh.Text='') then begin
    AddErr('Заполните номер решения.');
  end;
  lText:=true;
//  v:=edDate.Value;
//  edDate.Value:=null;
//  edDate.Value:=v;
  if FOneText then begin
    if (Trim(edTextVipis.Text)='') then lText:=false;
  end else begin
    if (Trim(edTextVipis.Text)='') or (Trim(edTextResh.Text)='') then lText:=false;
  end;
  n:=getTypeResh;
  if n>0 then begin
    if ((n=OCH_RESH_RAZD) or (n=OCH_RESH_PERE) or (n=OCH_RESH_UNION)) then begin
      if (IDMen=0) then begin
        AddErr('Выберите человека.');
      end;
      if not lText then begin  // переоформление, разделение, объединение
        if FOneText
           then AddErr('Заполните текст решения.')
           else AddErr('Заполните тексты решений.');
      end;
    end;
    if (n=OCH_RESH_ADDMEN) or (n=OCH_RESH_ISKMEN) then begin
//      if (IDMen=0) then begin
//        AddErr('Выберите человека.');
//      end;
      if not lText then begin  // включение, исключение члена семьи
        if FOneText
           then AddErr('Заполните текст решения.')
           else AddErr('Заполните тексты решений.');
      end;
    end;
  end else begin
    AddErr('Выберите тип решения.');
  end;
  if strErr='' then begin
    ModalResult:=mrOk;
  end else begin
    PutError(strErr);
  end;
end;
//-----------------------------------------------------
procedure TfmOcheredOper.TBItemCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;
//-----------------------------------------------------
procedure TfmOcheredOper.TBItemTextClick(Sender: TObject);
var
  lRun,lOk,lText:Boolean;
  v:Variant;
  n:Integer;
  strErr:String;
  procedure AddErr(s:String);
  begin
    if strErr='' then strErr:=s
                 else strErr:=strErr+#13+s;
  end;
begin
  strErr:='';
//  dmmen.tbOcheredResh.CheckBrowseMode;
//  EditDataSet(dmmen.tbOcheredResh);
  n:=getTypeResh;
  if n=0 then begin
    AddErr('Выберите тип решения.');
  end;
  if ((n=OCH_RESH_RAZD) or (n=OCH_RESH_PERE) or (n=OCH_RESH_UNION)) and (IDMen=0) then begin
    AddErr('Выберите человека.');
  end;
  if strErr='' then begin
    lText:=true;
    if FOneText then begin
      if (edTextVipis.Text='') then lText:=false;
    end else begin
      if (edTextVipis.Text='') and (edTextResh.Text='') then lText:=false;
    end;
    lOk:=true;
    if lText then begin
      if not Problem('Текст решения уже сформирован. Переформировать ?')  then lOk:=false;
    end;
    if lOk then begin
      if FOneText then begin  // один текст для выписки и решения
        EditDataSet(DataSource.DataSet);
        edTextResh.Field.Value:='';
      end else begin
        v:=null;
        RunFuncScript('Och_CreateTextResh',[false],v,lrun);
        if v<>null then begin
          EditDataSet(DataSource.DataSet);
          edTextResh.Field.AsString:=VarToStr(v);
        end;
      end;

      v:=null;
      RunFuncScript('Och_CreateTextVipis',[false],v,lrun);
      if v<>null then begin
        EditDataSet(DataSource.DataSet);
        edTextVipis.Field.AsString:=VarToStr(v);
      end;
    end;
  end else begin
    PutError(strErr);
  end;
end;
//------------------------------------------------------
procedure TfmOcheredOper.TBItemVipisClick(Sender: TObject);
var
 Template:TTemplate;
begin
  DataSource.DataSet.CheckBrowseMode;
  Template:=fmMain.TemplateInterface.GetTemplate('fmMen_OTD_OCH.ReshenAll2');
  if Template=nil then begin
    PutError('Не найден Word-шаблон.');
  end else begin
    fmMain.OnTemplateMenuClick(Template);
  end;
end;
//------------------------------------------------------
procedure TfmOcheredOper.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field<>nil then begin
    FQueryExit:=true;
  end;
end;           

procedure TfmOcheredOper.GetTextLabel(n:Integer);
var
  v:Variant;
  lRun:Boolean;
  Text:String;
begin
  if n=0 then begin
    Text:='';
  end else begin
    v:=null;
    lRun:=false;
    RunFuncScript('Och_GetStrResh',[n,cbOtkaz.Checked,dmMen.GetFIO],v,lRun);
    if v<>null then begin
      Text:='РЕШИЛИ: '+VarToStr(v);
    end;
  end;
  lbResh.Caption:=Text;
end;

procedure TfmOcheredOper.edDateUpdateData(Sender: TObject;  var Handled: Boolean);
begin
  if TBItemArxiv.Visible then begin
    if edDate.Value=null
      then TBItemArxiv.Enabled:=true
      else TBItemArxiv.Enabled:=false;
  end;
end;

procedure TfmOcheredOper.TBItemLastClick(Sender: TObject);
var
  sBookMark:String;
  l,lOk:Boolean;
  arrRec:TCurrentRecord;
  d:TDateTime;
begin
  if FIDOchered>0 then begin
    PostDataSet(dmMen.tbOcheredResh);
    l:=dbDisableControls(dmMen.tbOcheredResh);
    sBookMark:=dmMen.tbOcheredResh.Bookmark;
    dmMen.tbOcheredResh.Filter:='ochered_id=0';
    dmMen.tbOcheredResh.Filtered:=true;
    dmMen.tbOcheredResh.First;
    if dmMen.tbOcheredResh.Eof then begin
      PutError('Нет решения для загрузки',self);
      lOk:=false;
    end else begin
      GetCurrentRecord(dmMen.tbOcheredResh, '', arrRec);
      lOk:=true;
    end;
    dmMen.tbOcheredResh.Filter:='ochered_id='+IntToStr(FIDOchered);
    dmMen.tbOcheredResh.Filtered:=true;
    dmMen.tbOcheredResh.Bookmark:=sBookMark;
    dbEnableControls(dmMen.tbOcheredResh,l);
    EditDataSet(dmMen.tbOcheredResh);
    if lOk then begin
      dmMen.tbOcheredReshNOMER.AsString:=GetValueFieldEx(arrRec,'NOMER','');
      d:=GetValueFieldEx(arrRec,'DATER',0);
      if d>0 then dmMen.tbOcheredReshDATER.AsDateTime:=d;
      d:=GetValueFieldEx(arrRec,'DATE_SILA',0);
      if d>0 then dmMen.tbOcheredReshDATE_SILA.AsDateTime:=d;
      dmMen.tbOcheredReshOSNOV.AsString:=GetValueFieldEx(arrRec,'OSNOV','');
      dmMen.tbOcheredReshOSNOV_TEXT.AsString:=GetValueFieldEx(arrRec,'OSNOV_TEXT','');
      dmMen.tbOcheredReshOSNOV2.AsString:=GetValueFieldEx(arrRec,'OSNOV2','');
      dmMen.tbOcheredReshOSNOV_TEXT2.AsString:=GetValueFieldEx(arrRec,'OSNOV_TEXT2','');
      dmMen.tbOcheredReshADDINFO.AsString:=GetValueFieldEx(arrRec,'ADDINFO','');
//      dmMen.tbOcheredReshTEXTRESH.AsString:=GetValueFieldEx(arrRec,'TEXTRESH','');
//      dmMen.tbOcheredReshTEXTVIPIS.AsString:=GetValueFieldEx(arrRec,'TEXTVIPIS','');
    end;
  end;
end;

end.
