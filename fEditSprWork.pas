unit fEditSprWork;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  fEditSpr, ActnList, ImgList, PrnDbgeh, Menus, Db, ComCtrls, ExtCtrls,
  OpisEdit, FuncPr, dbFunc, uTypes, fWarning,
  TB2Item, TB2Dock, TB2Toolbar, Grids, DBGridEh, SasaDBGrid, StdCtrls, MetaTask;

type
  TfmEditSprWork = class(TfmEditSpr)
    Panel1: TPanel;
    TBItemAddSMDO: TTBItem;
    TBItemSetSMDO: TTBItem;
    procedure TBItemAddSMDOClick(Sender: TObject);
    procedure TBItemSetSMDOClick(Sender: TObject);
  private
    { Private declarations }
    FRange : Integer;
  public
    { Public declarations }
//    procedure BeforeSaveSprWork( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure EditRecordSprWork( Grid:TSasaDbGrid; lAdd:Boolean; Ic:TIcon);
//    procedure DeleteRecordSprWork( Grid : TSasaDbGrid; var lDel : Boolean);
  end;

  procedure EditSprWork;

implementation

uses dBase, uProject, FuncEh, mPermit, fEditRecSprWork;

{$R *.DFM}

procedure EditSprWork;
var
  fmEdit : TfmEditSprWork;
  Param : TParamsEditSpr;
  n:Integer;
  st:TSostTable;
  Opis : TOpisEdit;
begin                                                         
  try
//    dmBase.SprWork.IndexName := 'PR_KEY';
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('EDIT_SPRWORK');
    st:=SaveSostTable(dmBase.SprWork, false, false);
    fmEdit:= TfmEditSprWork.Create(Application.MainForm);
    fmEdit.OpisEdit:=Opis;
    dmBase.SprWork.Filter:='';                
    fmEdit.DataSet := dmBase.SprWork;
    Param := TParamsEditSpr.Create;
    Param.OnBeforeSave:=nil; //fmEdit.BeforeSaveSprWork;
    Param.OnEditRecord:=fmEdit.EditRecordSprWork;
//    {$IF Defined(POST) or Defined(LAIS) }
      Param.OnBeforeDelete:=dmBase.DeleteRecordSprWork;
//    {$ELSE}
//      Param.OnBeforeDelete:=nil;
//    {$IFEND}
//    Param.OnEditRecord:=nil;
    fmEdit.ParamsEditSpr := Param;
    fmEdit.LoadFromIni( Globaltask.iniFile('SPR'),'FormSpr.SprWork');
    fmEdit.LoadParams;
    GlobalTask.CurrentOpisEdit.SetKeyForm(fmEdit, nil);
    {$IFDEF POST}
      try
        fmEdit.Grid.FieldColumns['IS_KORR'].Visible:=false;
//        fmEdit.Grid.FieldColumns['CORR_TYPE'].Visible:=false;
        fmEdit.Grid.FieldColumns['IS_CONTROL'].Visible:=false;
        fmEdit.Grid.FieldColumns['TER_SS'].Visible:=false;
        fmEdit.Grid.FieldColumns['IS_GILFOND'].Visible:=false;
      except
      end;
    {$ELSE}
      try
        fmEdit.Grid.FieldColumns['IS_KORR'].Visible:=true;
//        fmEdit.Grid.FieldColumns['CORR_TYPE'].Visible:=false;
        fmEdit.Grid.FieldColumns['IS_CONTROL'].Visible:=true;
        fmEdit.Grid.FieldColumns['TER_SS'].Visible:=true;
        fmEdit.Grid.FieldColumns['IS_GILFOND'].Visible:=true;
      except
      end;
    {$ENDIF}
{  Param:=TParamsEditSpr.Create;
  Param.OnEditRecord := EditRecordSprWork;
//  Param.OnBeforeDelete:=BeforeDeleteSprWork;
  Param.OnGetCellParams := SprWork_GridGetCellParams;
  Param.Col1 := 'SMDOCODE';
  Param.GetCellParams_Col1 := SprZAH_GridGetCellParams1;
  Globaltask.EditSpr('EDIT_SPRWORK', Param);  }

    n:=Role.EnableEditTable(dmBase.SprWork.TableName,0);
    if (n=-1) or (n=1)
      then fmEdit.EnableEdit:=true
      else fmEdit.EnableEdit:=false;
    try
      fmEdit.ShowModal;
    finally
      RestSostTable(dmBase.SprWork, st);
      fmEdit.Free;
    end;
  finally
//    dmBase.SprWork.CancelRange;
  end;
end;
//--------------------------------------------------------------------------------------------
//procedure TfmEditSprWork.DeleteRecordSprWork( Grid : TSasaDbGrid; var lDel : Boolean);
//var
//  s,ss,sID:String;
//  n,nCount:Integer;
//  lFind:Boolean;
//begin
//  sID:=Grid.DataSource.DataSet.FieldByName('ID').AsString;
//  OpenMessage('Проверка организации ...','');
//  {$IFDEF POST}
//  dmBase.WorkQuery.SQL.Text:=' select count(*) from DocMain where sign_org='+sID;
//  {$ELSE}
//  dmBase.WorkQuery.SQL.Text:=
//  ' select count(*) from DocMain where sign_org='+sID+
//  ' union all  '+
//  ' select count(*) from houseowners where typekod='+OWNER_ORG_STR+' and kod='+sID+
//  ' union all  '+
//  ' select count(*) from houseowners where date_fiks=''1899-12-30'' and kod='+sID+
// ' union all  '+
//  ' select count(*) from houseownershist where kod='+sID+
//  ' union all  '+
//  ' select count(*) from Население where work_spr='+sID+' and date_fiks=''1899-12-30'' ';
//  {$ENDIF}
//  try
//    dmBase.WorkQuery.Open;
//  finally
//    CloseMessage;
//  end;
//  s:='';
//  ss:='';
//  n:=1;
//  lFind:=false;
//  while not dmBase.WorkQuery.Eof do begin
//    nCount:=dmBase.WorkQuery.Fields[0].AsInteger;
//    if nCount>0 then begin
//      lFind:=true;
//      if ss='' then ss:='Организация присутствует:'+#13#10;
//      case n of
//        1: s:=s+'таблица вх.,исх.,адм.проц. (корреспондент) - '+IntToStr(nCount)+#13#10;
//        2: s:=s+'таблица собственников (полное) - '+IntToStr(nCount)+#13#10;
//        3: s:=s+'таблица собственников (текущее сост.) - '+IntToStr(nCount)+#13#10;
//        4: s:=s+'таблица истории собственников - '+IntToStr(nCount)+#13#10;
//        5: s:=s+'таблица населения (место работы) - '+IntToStr(nCount)+#13#10;
//      end;
//    end;
//    dmBase.WorkQuery.Next;
//    Inc(n,1);
//  end;
//  dmBase.WorkQuery.Close;
//  if lFind then begin
//    s := ss+s+'Если Вы хотите удалить организацию из базы,'#13#10+'введите слово ДА в поле ввода';
//    lDel:=OkWarning(s);
//  end;
//end;
//--------------------------------------------------------------------------------------------
procedure TfmEditSprWork.EditRecordSprWork( Grid:TSasaDbGrid; lAdd:Boolean; Ic:TIcon);
var
  f : TfmEditRecSprWork;
  nID : Integer;
  ds : TDataSet;
  strErr:String;
begin
  ds := Grid.DataSource.DataSet;
  if (ds.State = dsEdit) or (ds.State = dsInsert) then begin
    ds.Cancel;
  end;
  f := TfmEditRecSprWork.Create(Grid.Owner);
  f.FRun:=true;
  f.FAdd:=lAdd;
  f.dsOrg:=ds;
  try
    if lAdd then begin
      f.edName.Text:='';
      f.edFName.Text:='';
      f.edSMDO.Text:='';
      f.edCorrType.Value:=9;
    end else begin
      f.edName.Text := ds.FieldByName('NAME').AsString;
      f.edFName.Text := ds.FieldByName('FNAME').AsString;
      f.edEmail.Text := ds.FieldByName('EMAIL').AsString;
      f.edFax.Text := ds.FieldByName('FAX').AsString;
      f.edTel.Text := ds.FieldByName('TELEFON').AsString;
      f.edAdres.Text := ds.FieldByName('ADRES').AsString;
      f.edSMDO.Text := ds.FieldByName('SMDOCODE').AsString;
      f.edRukov.Text := ds.FieldByName('DIRECTOR').AsString;
      f.edAbonent.Text := ds.FieldByName('ABONENTBOX').AsString;
      f.edPostIndex.Text := ds.FieldByName('POSTINDEX').AsString;
      f.edSOATO.Text := ds.FieldByName('SOATO').AsString;
      f.edNomer.Value := ds.FieldByName('NOMER').Value;
      f.edCorrType.Value := ds.FieldByName('CORR_TYPE').Value;
      {$IFDEF POST}
        f.cbKorr.Checked:=true;
        f.cbTerr.Checked:=true;
        f.cbControl.Checked:=true;
        f.cbGilfond.Checked:=true;
        f.gbCheck.Visible:=false;
      {$ELSE}
        f.cbTerr.Checked:=ds.FieldByName('TER_SS').AsBoolean;
        f.cbKorr.Checked:=ds.FieldByName('IS_KORR').AsBoolean;
        f.cbControl.Checked:=ds.FieldByName('IS_CONTROL').AsBoolean;
        f.cbGilfond.Checked:=ds.FieldByName('IS_GILFOND').AsBoolean;
        f.cbGosud.Checked:=ds.FieldByName('IS_GOSUD').AsBoolean;
      {$ENDIF}
    end;
    {$IFDEF POST}
      f.gbCheck.Visible:=false;
    {$ELSE}
      f.gbCheck.Visible:=true;
    {$ENDIF}
    f.FRun:=false;
    if (f.ShowModal = mrOk) then begin
      // сформировать новый ID
      if lAdd then begin
        nID:=dmBase.GetNewID(dmBase.TypeObj_Organ);
        ds.Append;
        ds.FieldByName('ID').AsInteger:=nID;
      end else begin
        ds.Edit;
      end;
      ds.FieldByName('NAME').AsString:=f.edName.Text;
      ds.FieldByName('FNAME').AsString:=f.edFName.Text;
      ds.FieldByName('EMAIL').AsString:=f.edEmail.Text;
      ds.FieldByName('FAX').AsString:=f.edFax.Text;
      ds.FieldByName('TELEFON').AsString:=f.edTel.Text;
      ds.FieldByName('ADRES').AsString:=f.edAdres.Text;
      ds.FieldByName('SMDOCODE').AsString:=f.edSMDO.Text;
      ds.FieldByName('DIRECTOR').AsString:=f.edRukov.Text;
      ds.FieldByName('ABONENTBOX').AsString:=f.edAbonent.Text;
      ds.FieldByName('POSTINDEX').AsString:=f.edPostIndex.Text;
      ds.FieldByName('SOATO').AsString:=f.edSOATO.Text;
      ds.FieldByName('NOMER').Value:=f.edNomer.Value;
      if (f.edCorrType.Value=null) or (VarToStr(f.edCorrType.Value)='')
        then ds.FieldByName('CORR_TYPE').AsString:=''
        else ds.FieldByName('CORR_TYPE').Value:=f.edCorrType.Value;
      {$IFDEF POST}
        ds.FieldByName('TER_SS').AsBoolean:=true;
        ds.FieldByName('IS_KORR').AsBoolean:=true;
        ds.FieldByName('IS_CONTROL').AsBoolean:=true;
        ds.FieldByName('IS_GILFOND').AsBoolean:=true;
      {$ELSE}
        ds.FieldByName('TER_SS').AsBoolean:=f.cbTerr.Checked;
        ds.FieldByName('IS_KORR').AsBoolean:=f.cbKorr.Checked;
        ds.FieldByName('IS_CONTROL').AsBoolean:=f.cbControl.Checked;
        ds.FieldByName('IS_GILFOND').AsBoolean:=f.cbGilfond.Checked;
        ds.FieldByName('IS_GOSUD').AsBoolean:=f.cbGosud.Checked;
      {$ENDIF}
      try
        ds.Post;
      except
        on E:Exception do begin
          strErr := E.Message;
          PutError('ОШИБКА: '+strErr,self);
          ds.Cancel;
        end;
      end;
    end;
  finally
    f.Free;
  end;
end;
//---------------------------------------------------------------------------------------------
//procedure TfmEditSprWork.BeforeSaveSprWork( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
//begin
//
//end;
//---------------------------------------------------------------------------------------------
procedure TfmEditSprWork.TBItemAddSMDOClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ds:TDataSet;
  sSMDO,s,ss,sBookmark:String;
  nID:Integer;
begin
  ds:=Grid.DataSource.DataSet;
  SetLength(arrRec,1);
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSMDO_NAME');
  if Opis<>nil then begin
    v:=null;
    if Opis.ChoiceFromSprEx(grid, v, arrRec, nil) and (v<>null) then begin
      if v <> null then begin
        sSMDO:=GetValueFieldEx(arrRec, 'SMDOCODE', '');
        ds.DisableControls;
        try
          sBookmark:=ds.BookMark;
          if ds.Locate('SMDOCODE', sSMDO, [loCaseInsensitive]) then begin
            PutError('Выбранная организация уже существует в справочнике.');
          end else begin
            ds.BookMark:=sBookmark;
            nID := dmBase.GetNewID(dmBase.TypeObj_Organ);
            if nID>-1 then begin
              ds.Append;
              ds.FieldByName('ID').AsInteger:=nID;
              ds.FieldByName('SMDOCODE').AsString:=sSMDO;
              ds.FieldByName('IS_KORR').AsBoolean:=true;
              ds.FieldByName('FNAME').AsString:=GetValueFieldEx(arrRec, 'NAME', '');
              ds.FieldByName('NAME').AsString:=GetValueFieldEx(arrRec, 'shortname', '');
              ds.FieldByName('TELEFON').AsString:=GetValueFieldEx(arrRec, 'phone', '');
              ds.FieldByName('EMAIL').AsString:=GetValueFieldEx(arrRec, 'email', '');
              ds.FieldByName('FAX').AsString:=GetValueFieldEx(arrRec, 'fax', '');
              ds.FieldByName('ABONENTBOX').AsString:=GetValueFieldEx(arrRec, 'abonentbox', '');
              ds.FieldByName('POSTINDEX').AsString:=GetValueFieldEx(arrRec, 'postindex', '');
              ds.FieldByName('SOATO').AsString:=GetValueFieldEx(arrRec, 'soato', '');
              ds.FieldByName('ADRES').AsString:=GetValueFieldEx(arrRec, 'street', '');
              s:=GetValueFieldEx(arrRec, 'home', '');
              if s<>'' then s:=', д.'+s;
              ss:=GetValueFieldEx(arrRec, 'corpus', '');
              if ss<>'' then s:=s+', корп.'+ss;
              if s<>'' then  ds.FieldByName('ADRES').AsString:=ds.FieldByName('ADRES').AsString+s;
              ds.Post;
            end;
          end;
        finally
          ds.EnableControls;
        end;
      end;
    end;
  end;
end;
//---------------------------------------------------------------------------------------------
procedure TfmEditSprWork.TBItemSetSMDOClick(Sender: TObject);
var
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  ds:TDataSet;
begin
  ds:=Grid.DataSource.DataSet;
  if not (ds.Eof and ds.Bof) then begin
    SetLength(arrRec,1);
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_SPRSMDO_NAME');
    if Opis<>nil then begin
      v:=null;
      if Opis.ChoiceFromSprEx(grid, v, arrRec, nil) and (v<>null) then begin
        if v <> null then begin
          EditDataSet(ds);
          ds.FieldByName('SMDOCODE').AsString:=GetValueFieldEx(arrRec, 'SMDOCODE', '');
          PostDataSet(ds);
        end;
      end;
    end;
  end;
end;

end.
