unit fEditSprOff;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Variants,
  fEditSpr, ActnList, ImgList, PrnDbgeh, Menus, Db, ComCtrls, ExtCtrls,
  OpisEdit, FuncPr, dbFunc, uTypes, fWarning, uProjectAll,
  TB2Item, TB2Dock, TB2Toolbar, Grids, DBGridEh, SasaDBGrid, StdCtrls, MetaTask;

type
  TfmEditSprOff = class(TfmEditSpr)
    Panel1: TPanel;
  private
    { Private declarations }
    FRange : Integer;
  public
    { Public declarations }
//    procedure BeforeSaveSprWork( Grid : TSasaDbGrid; lAdd : Boolean; Ic : TIcon);
    procedure EditRecordSprOff( Grid:TSasaDbGrid; lAdd:Boolean; Ic:TIcon);
    procedure DeleteRecordSprOff( Grid:TSasaDbGrid; var lDel : Boolean);
    procedure ChangeCodeSprOff(sOldID, sOldName, sNewID, sNewName: String; var sError:String);
    function NewORDER:Integer;

  end;

  procedure EditSprDocOfficial;

implementation

uses dBase, uProject, FuncEh, mPermit, fEditRecSprOff;

{$R *.DFM}

procedure EditSprDocOfficial;
var
  fmEdit : TfmEditSprOff;
  Param : TParamsEditSpr;
  n:Integer;
  st:TSostTable;
  Opis : TOpisEdit;
begin
  try
//    dmBase.SprWork.IndexName := 'PR_KEY';
    Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('EDIT_SPRDOCOFFICIAL');
    {$IFDEF OBR_GRAG}
      Opis.ChangeCode:=true;   // !!!
    {$ELSE}
      Opis.ChangeCode:=false;   // !!!
    {$ENDIF}

    st:=SaveSostTable(dmBase.SprDocOfficial, false, false);
    fmEdit:=TfmEditSprOff.Create(Application.MainForm);
    fmEdit.FRun:=true;
    fmEdit.OpisEdit:=Opis;
    dmBase.SprDocOfficial.Filter:='';
    fmEdit.DataSet := dmBase.SprDocOfficial;


    Param:=TParamsEditSpr.Create;
//    FIOF   - реально исползуется только в почте СМДО  fSMDODoc -> btAddMen -> fEditSpec.EditSpec() -> ChoicrSpec3

//  ZAGS=POST,POST_B,FIO,FIO_B,FIOF,NAME,IS_ACTUAL,TELEFON,TEL_MOB
//  OPEKA=POST,POST_B,FIO,FIO_B,FIOF,NAME,IS_ACTUAL,TELEFON,TEL_MOB
//  LAIS,POST,GKH,OCHERED=POST,FIO,FIOF,NAME,IS_ACTUAL,TELEFON,TEL_MOB,IS_CHIEF,IS_SPEC и другие
//  ZAH=???

    {$IF Defined(ZAGS) or Defined(OPEKA) }
      Param.VisibleColumns:='FIO,FIO_B,POST,POST_B,NAME,TELEFON,TEL_MOB,IS_CHIEF,IS_ACTUAL,IS_SPEC,N_ORDER';  // ID,N_ORDER, FIO_B,POST_B
    {$ELSE}
      {$IFDEF SMDO}
        Param.VisibleColumns:='FIO,POST,NAME,FIOF,TELEFON,TEL_MOB,IS_CHIEF,IS_ACTUAL,IS_SPEC,N_ORDER';  // ID,N_ORDER, FIO_B,POST_B
      {$ELSE}
        Param.VisibleColumns:='FIO,POST,NAME,TELEFON,TEL_MOB,IS_CHIEF,IS_ACTUAL,IS_SPEC,N_ORDER';  // ID,N_ORDER, FIO_B,POST_B
      {$ENDIF}
    {$IFEND}
    Param.OnBeforeSave:=nil; //fmEdit.BeforeSaveSprWork;
    Param.OnEditRecord:=fmEdit.EditRecordSprOff;
    Param.OnBeforeDelete:=fmEdit.DeleteRecordSprOff;
    Param.OnChangeCode:=fmEdit.ChangeCodeSprOff;

    fmEdit.ParamsEditSpr := Param;
    fmEdit.LoadFromIni( Globaltask.iniFile('SPR'),'FormSpr.SprDocOfficial');
    fmEdit.LoadParams;
    GlobalTask.CurrentOpisEdit.SetKeyForm(fmEdit, nil);

//      fmEdit.Grid.FieldColumns['FIO_B'].Visible:=true;
//      fmEdit.Grid.FieldColumns['POST_B'].Visible:=true;

    n:=Role.EnableEditTable(dmBase.SprDocOfficial.TableName,0);
    if (n=-1) or (n=1)
      then fmEdit.EnableEdit:=true
      else fmEdit.EnableEdit:=false;
    try
      fmEdit.FRun:=false;
      fmEdit.ShowModal;
    finally
      RestSostTable(dmBase.SprDocOfficial, st);
      fmEdit.Free;
    end;
  finally

  end;
end;
//--------------------------------------------------------------------------------------------
function TfmEditSprOff.NewORDER:Integer;
begin
  dmBase.WorkQuery.SQL.Text:='SELECT MAX(N_ORDER) FROM SprDocOfficial';
  try
    dmBase.WorkQuery.Open;
    Result:=dmBase.WorkQuery.Fields[0].AsInteger+1;
    dmBase.WorkQuery.Close;
  except
    Result:=dmBase.SprDocOfficial.RecordCount+1;
  end;
end;
//--------------------------------------------------------------------------------------------
procedure TfmEditSprOff.ChangeCodeSprOff(sOldID, sOldName, sNewID, sNewName: String; var sError:String);
begin
  sError:='';
  OpenMessage('Изменение значения ...','');
  dmBase.WorkQuery.SQL.Text:='UPDATE DocMain SET RES_MAN='+sNewID+' WHERE RES_MAN='+sOldID+';'#13#10+
    'UPDATE DocMain SET EXEC_MAN='+sNewID+' WHERE EXEC_MAN='+sOldID+';'#13#10+
    'UPDATE DocMain SET CHECK_MAN='+sNewID+' WHERE CHECK_MAN='+sOldID+';'#13#10+
    'UPDATE DocMain SET VISIT_MAN='+sNewID+' WHERE VISIT_MAN='+sOldID+';';
  try   
    try
      dmBase.WorkQuery.ExecSQL;
      GlobalTask.WriteToLogFile('Справочник должностных лиц, перекодировка в базе: '+sOldName+'('+sOldID+')->'+sNewName+'('+sNewID+')');
    except
      on E:Exception do begin
        sError:=E.Message;
      end;
    end;
  finally
    CloseMessage;
  end;
end;

procedure TfmEditSprOff.DeleteRecordSprOff( Grid : TSasaDbGrid; var lDel : Boolean);
{$IFDEF OBR_GRAG}
var
  s,sID,sName:String;
{$ENDIF}
begin
  lDel:=true;
  {$IFDEF OBR_GRAG}
  //SprDocOfficial.ID  >>  RES_MAN, EXEC_MAN, CHECK_MAN, VISIT_MAN
    sID:=Grid.DataSource.DataSet.FieldByName('ID').AsString;
    sName:=Grid.DataSource.DataSet.FieldByName('FIO').AsString;
    OpenMessage('Проверка '+sName+' ...','');
    s:='select count(*) from DocMain where RES_MAN=:ID or EXEC_MAN=:ID or  CHECK_MAN=:ID or VISIT_MAN=:ID';
    dmBase.WorkQuery.SQL.Text:=StringReplace(s,':ID',sID,[rfReplaceAll, rfIgnoreCase]);
    try
      dmBase.WorkQuery.Open;
    finally
      CloseMessage;
    end;
    if dmBase.WorkQuery.Active then begin
      if dmBase.WorkQuery.Fields[0].AsInteger>0 then begin
        s:=sName+#13#10;
        s:=s+'присутствует в подсистеме "Учет документов"'#13#10;
        s:=s+'Если Вы хотите удалить человека из справочника,'#13#10+'введите слово ДА в поле ввода';
        lDel:=OkWarning(s);
        if lDel
          then GlobalTask.WriteToLogFile('Удаление из справочника должностных лиц: '+sID+', '+sName);
      end;
      dmBase.WorkQuery.Close;
    end else begin

    end;
  {$ENDIF}
end;
//--------------------------------------------------------------------------------------------
procedure TfmEditSprOff.EditRecordSprOff( Grid:TSasaDbGrid; lAdd:Boolean; Ic:TIcon);
var
  f : TfmEditRecSprOff;
  nID : Integer;
  ds : TDataSet;
  strErr:String;
begin
  ds := Grid.DataSource.DataSet;
  if (ds.State = dsEdit) or (ds.State = dsInsert) then begin
    ds.Cancel;
  end;
  f := TfmEditRecSprOff.Create(Grid.Owner);
  f.FRun:=true;
  f.FAdd:=lAdd;
//  f.dsOrg:=ds;
  try
    if lAdd then begin
      f.edName.Text:='';
      f.edFIO.Text:='';
      f.cbActual.Checked:=true;
      f.cbRukov.Checked:=false;
      f.cbSpec.Checked:=true;
    end else begin
      f.edFIOF.Text := ds.FieldByName('FIOF').AsString;
      f.edFIO.Text := ds.FieldByName('FIO').AsString;
      f.edFIOB.Text := ds.FieldByName('FIO_B').AsString;
      f.edName.Text := ds.FieldByName('NAME').AsString;
      f.edPost.Text := ds.FieldByName('POST').AsString;
      f.edPostB.Text := ds.FieldByName('POST_B').AsString;
      f.edTelefon.Text := ds.FieldByName('TELEFON').AsString;
      f.edTelMob.Text := ds.FieldByName('TEL_MOB').AsString;
      f.cbActual.Checked:=ds.FieldByName('IS_ACTUAL').AsBoolean;
      f.cbRukov.Checked:=ds.FieldByName('IS_CHIEF').AsBoolean;
      f.cbSpec.Checked:=ds.FieldByName('IS_SPEC').AsBoolean;
      f.edNomer.Value:=ds.FieldByName('N_ORDER').AsInteger;
    end;
    {$IF Defined(ZAGS) or Defined(OPEKA) }

    {$ELSE}
      SetVisibleControls([f.pnBel, f.edFIOB, f.edPostB], false);
    {$IFEND}

    {$IFNDEF SMDO}
      f.pnFIOF.Visible:=false;
    {$ENDIF}
    f.FRun:=false;
    if (f.ShowModal = mrOk) then begin
      if lAdd then begin
        ds.Append;
      end else begin
        ds.Edit;
      end;
      ds.FieldByName('NAME').AsString:=f.edName.Text;
      ds.FieldByName('FIO').AsString:=f.edFIO.Text;
      ds.FieldByName('FIOF').AsString:=f.edFIOF.Text;
      ds.FieldByName('FIO_B').AsString:=f.edFIOB.Text;
      ds.FieldByName('POST').AsString:=f.edPost.Text;
      ds.FieldByName('POST_B').AsString:=f.edPostB.Text;
      ds.FieldByName('TELEFON').AsString:=f.edTelefon.Text;
      ds.FieldByName('TEL_MOB').AsString:=f.edTelMob.Text;
      ds.FieldByName('IS_ACTUAL').AsBoolean:=f.cbActual.Checked;
      ds.FieldByName('IS_CHIEF').AsBoolean:=f.cbRukov.Checked;
      ds.FieldByName('IS_SPEC').AsBoolean:=f.cbSpec.Checked;
      ds.FieldByName('N_ORDER').Value:=f.edNomer.Value;
      if ds.FieldByName('N_ORDER').AsInteger=0
        then ds.FieldByName('N_ORDER').Value:=NewORDER;
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
end.
