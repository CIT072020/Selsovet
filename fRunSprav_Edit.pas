unit fRunSprav_Edit;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, funcPr, metaTask, ShellApi,mTempl,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask, ComCtrls, mPermit, fmChList, dbFunc, uProject, uTypes,
  DBCtrls, DBLookupEh, adsdata, adsfunc, adstable;

type
  TfmRunSprav_Edit = class(TForm)
    Panel1: TPanel;
    btOk: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource: TDataSource;
    ChFile: TOpenDialog;
    Panel2: TPanel;
    edKod: TDBEditEh;
    edNomer: TDBNumberEditEh;
    edName: TDBEditEh;
    edSybSystem: TDBComboBoxEh;
    edTypeObj: TDBComboBoxEh;
    edVisible: TDBComboBoxEh;
    edTypeReport: TDBComboBoxEh;
    edNameReport: TDBEditEh;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    edPrilog: TDBRichEdit;
    GroupBox2: TGroupBox;
    edKomm: TDBRichEdit;
    qSOATO: TAdsQuery;
    Label9: TLabel;
    edSOATO: TDBLookupComboboxEh;
    dsSOATO: TDataSource;
    Splitter1: TSplitter;
    gbUserPodr: TGroupBox;
    edDolgPodp1: TDBComboBoxEh;
    Label10: TLabel;
    Label13: TLabel;
    edDolgPodp3: TDBComboBoxEh;
    cbUserPodp: TDBCheckBoxEh;
    Label12: TLabel;
    edID: TDBEditEh;
    cbPodp2: TDBCheckBoxEh;
    cbPODP3: TDBCheckBoxEh;
    edMaxPodp: TDBNumberEditEh;
    Button1: TButton;
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DBCheckBoxEh3: TDBCheckBoxEh;
    Label14: TLabel;
    edShtamp: TDBComboBoxEh;
    Label11: TLabel;
    edDolgPodp2: TDBComboBoxEh;
    Label15: TLabel;
    edShtampType: TDBComboBoxEh;
    Label16: TLabel;
    edNameReportAll: TDBEditEh;
    cbOneRecord: TDBCheckBoxEh;
    procedure btOkClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NameReportEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edSOATOEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edMaxPodpChange(Sender: TObject);
    procedure cbPodp2Click(Sender: TObject);
    procedure cbPODP3Click(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure edNameReportEditButtons1Click(Sender: TObject;
      var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure edShtampChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FEdit:Boolean;
    Fds     : TDataSet;
    FdsUser : TDataSet;
    QueryExit:Boolean;
    Fsl1:TStringList;
    Fsl2:TStringList;
    procedure CreateList;
    function FindTemplate(sName:String) : TTemplate;
  end;

  function EditRecord(sl1,sl2:TStringList; lAdd:Boolean; ds,dsUser:TDataSet; Gruppa:Integer):Boolean;

implementation

uses {fRunSprav,}dBase,fMain;

{$R *.dfm}

function EditRecord(sl1,sl2:TStringList; lAdd:Boolean; ds,dsUser:TDataSet; Gruppa:Integer):Boolean;
var
  f:TfmRunSprav_Edit;
begin
  f:=TfmRunSprav_Edit.Create(nil);
  f.Fedit:=false;
  f.Fsl1:=sl1;
  f.Fsl2:=sl2;
  f.Fds:=ds;
  f.FdsUser:=dsUser;
  f.DataSource.DataSet:=ds;
  f.qSOATO.Open;
  if lAdd then begin
    f.DataSource.DataSet.Append;
  end else begin
    f.DataSource.DataSet.Edit;
  end;
  ds.FieldByName('GRUPPA').AsInteger:=Gruppa;  // !!!
  if ds.FieldByName('USER_PODP').IsNull then ds.FieldByName('USER_PODP').AsBoolean:=false;
  if ds.FieldByName('PODP_COUNT').IsNull then ds.FieldByName('PODP_COUNT').AsInteger:=1;
  if ds.FieldByName('PODP2').IsNull then ds.FieldByName('PODP2').AsBoolean:=false;
  if ds.FieldByName('PODP3').IsNull then ds.FieldByName('PODP3').AsBoolean:=false;
  if ds.FieldByName('DOLG_PODP1').IsNull then ds.FieldByName('DOLG_PODP1').AsString:='RUKV';
  if ds.FieldByName('DOLG_PODP2').IsNull then ds.FieldByName('DOLG_PODP2').AsString:='SEKR';
  if ds.FieldByName('DOLG_PODP3').IsNull then ds.FieldByName('DOLG_PODP3').AsString:='SPEC';
  if ds.FieldByName('SHTAMP_CHOICE').IsNull then ds.FieldByName('SHTAMP_CHOICE').AsInteger:=0;
{
  if f.FdsUser.FieldByName('ID').AsInteger=f.Fds.FieldByName('ID').AsInteger then begin
    if not f.FdsUser.FieldByName('DOLG_PODP1').IsNull then f.edDolgPodp1.Value:=f.FdsUser.FieldByName('DOLG_PODP1').Value;
    if not f.FdsUser.FieldByName('DOLG_PODP2').IsNull then f.edDolgPodp2.Value:=f.FdsUser.FieldByName('DOLG_PODP2').Value;
    if not f.FdsUser.FieldByName('DOLG_PODP3').IsNull then f.edDolgPodp3.Value:=f.FdsUser.FieldByName('DOLG_PODP3').Value;
    if f.FdsUser.FieldByName('PODP2').AsBoolean
      then f.edPodp2.ItemIndex:=1 else f.edPodp2.ItemIndex:=0;
    if f.FdsUser.FieldByName('PODP3').AsBoolean
      then f.edPodp3.ItemIndex:=1 else f.edPodp3.ItemIndex:=0;
  end else begin

  end;
}
  f.CreateList;
  f.QueryExit:=false;
  f.Fedit:=true;
  f.edDolgPodp2.Enabled:=f.cbPodp2.Checked;
  f.edDolgPodp3.Enabled:=f.cbPodp3.Checked;
  if f.ShowModal=mrOk then begin
    Result:=true;
  {
    if not (f.FdsUser.FieldByName('ID').AsInteger=f.Fds.FieldByName('ID').AsInteger) or  f.FdsUser.Eof then begin
      f.FdsUser.Append;
      f.FdsUser.FieldByName('ID').AsInteger:=f.Fds.FieldByName('ID').AsInteger;
    end else begin
      f.FdsUser.Edit;
    end;
    f.FdsUser.FieldByName('KOD').AsString:=f.Fds.FieldByName('KOD').AsString;
    f.FdsUser.FieldByName('ISVISIBLE').AsBoolean:=f.Fds.FieldByName('VISIBLE').AsBoolean;
    f.FdsUser.FieldByName('DOLG_PODP1').AsString:=f.edDolgPodp1.Value;
    f.FdsUser.FieldByName('DOLG_PODP2').AsString:=f.edDolgPodp2.Value;
    f.FdsUser.FieldByName('DOLG_PODP3').Asstring:=f.edDolgPodp3.Value;
    if f.edPodp2.ItemIndex=0
      then f.FdsUser.FieldByName('PODP2').AsBoolean:=false
      else f.FdsUser.FieldByName('PODP2').AsBoolean:=true;
    if f.edPodp3.ItemIndex=0
      then f.FdsUser.FieldByName('PODP3').AsBoolean:=false
      else f.FdsUser.FieldByName('PODP3').AsBoolean:=true;
    f.FdsUser.Post;
   }
  end else begin
    Result:=false;
  end;
  f.qSOATO.Close;
  FreeAndNil(f);
end;

procedure TfmRunSprav_Edit.btOkClick(Sender: TObject);
begin
  Fedit:=false;
  try
    PostDataSet(Fds);
    QueryExit:=false;
    ModalResult:=mrOk;
  except
    on E: Exception do begin
      PutError('Ошибка записи.'+#13#10+E.Message);
      Fedit:=true;
    end;
  end;
end;

procedure TfmRunSprav_Edit.BitBtn2Click(Sender: TObject);
begin
  Fds.Cancel;
  ModalResult:=mrCancel;
end;

procedure TfmRunSprav_Edit.CreateList;
begin
  edDolgPodp1.Items.Assign(Fsl1);
  edDolgPodp1.KeyItems.Assign(Fsl2);
  edDolgPodp2.Items.Assign(Fsl1);
  edDolgPodp2.KeyItems.Assign(Fsl2);
  edDolgPodp3.Items.Assign(Fsl1);
  edDolgPodp3.KeyItems.Assign(Fsl2);
end;

procedure TfmRunSprav_Edit.FormCreate(Sender: TObject);
var
  i:Integer;
begin
//-------------------------------------------------------------------
  edTypeObj.Items.Add('Журнал');
  edTypeObj.KeyItems.Add(IntToStr(0));

  edTypeObj.Items.Add('Лицевой счет');
  edTypeObj.KeyItems.Add(IntToStr(dmBase.TypeObj_Lich));

  edTypeObj.Items.Add('Адрес');
  edTypeObj.KeyItems.Add(IntToStr(dmBase.TypeObj_Adres));

  edTypeObj.Items.Add('Человек');
  edTypeObj.KeyItems.Add(IntToStr(dmBase.TypeObj_Nasel));
  edTypeObj.Items.Add('Захоронение');
  edTypeObj.KeyItems.Add(IntToStr(_TypeObj_AktZAH));
//-------------------------------------------------------------------
  edTypeReport.Items.Add('Word');
  edTypeReport.KeyItems.Add('DOC');
  edTypeReport.Items.Add('FastReport');
  edTypeReport.KeyItems.Add('FR');
  edTypeReport.Items.Add('Excel');
  edTypeReport.KeyItems.Add('XLS');
  for i:=0 to Role.Permit.Count-1 do begin
    edSybSystem.Items.Add(Role.Permit.GetName(i));
    edSybSystem.KeyItems.Add(IntToStr(Role.Permit.GetCode(i)));
  end;
end;

procedure TfmRunSprav_Edit.NameReportEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
 i,n:Integer;
 sl,slN:TStringList;
 s:String;
begin
  if edTypeReport.KeyItems[edTypeReport.ItemIndex]='FR' then begin
    if ChFile.Execute then begin
      s:=ExtractFileName(ChFile.FileName);
      edNameReport.Text:=s;
      i:=Pos('.',s);
      edName.Text:=Copy(s,1,i-1);
    end;
  end else begin
    sl:=TStringList.Create;
    slN:=TStringList.Create;
    for i:=0 to fmMain.TemplateInterface.Engine.TemplateList.Count-1 do begin
      s:=ANSIUpperCase(fmMain.TemplateInterface.Engine.TemplateList[i].FullName);
      if (Pos('FMLICHSCHET',s)>0) or (Pos('FMADRES',s)>0) or
         (Pos('FMMEN',s)>0) or (Pos('FMGURNOCHERED',s)>0) then begin
        sl.Add('['+fmMain.TemplateInterface.Engine.TemplateList[i].FullName+'] '+fmMain.TemplateInterface.Engine.TemplateList[i].Caption);
        slN.Add(IntToStr(i));
      end;
    end;
    if sl.Count>0 then begin
      i := ChoiceFromList(sl, 'Выберите шаблон');
      if i>-1 then begin
        edNameReport.Text:=fmMain.TemplateInterface.Engine.TemplateList[StrToInt(slN.Strings[i])].FullName;
        edKod.Text:=fmMain.TemplateInterface.Engine.TemplateList[StrToInt(slN.Strings[i])].Name;
        edName.Text:=fmMain.TemplateInterface.Engine.TemplateList[StrToInt(slN.Strings[i])].Caption;
        n:=Pos('_',edKod.Text);
        if n>0 then begin
          s:=Copy(edKod.Text,n+1,4);
          if IsAllDigit(s) then edSOATO.Text:=s;
        end;
      end;
    end;
    sl.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TfmRunSprav_Edit.edSOATOEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  edSOATO.Value:=null;
end;

//-------------------------------------------------------------------------------
procedure TfmRunSprav_Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  lErr:Boolean;
begin
  if QueryExit then begin
    if Problem(' Запись была изменена. Сохранить ? ') then begin
      lErr:=false;
      try
        PostDataSet(Fds);
      except
        on E: Exception do begin
          lErr:=true;
          PutError('Ошибка записи.'+#13#10+E.Message);
        end;
      end;
      if not lErr then begin
        Action:=caFree;
        ModalResult:=mrOK;
      end else begin
        Action:=caNone;
      end;
    end else begin
      Fds.Cancel;
      Action:=caFree;
      ModalResult:=mrCancel;
    end;
  end else begin
    Fds.Cancel;
    Action:=caFree;
  end;
end;

procedure TfmRunSprav_Edit.edMaxPodpChange(Sender: TObject);
begin
  if edMaxPodp.Value<3 then begin
    cbPodp3.Enabled:=false;
    if FEdit then cbPodp3.Checked:=false;
    edDolgPodp3.Enabled:=false;
  end else begin
    cbPodp3.Enabled:=true;
    if FEdit then cbPodp3.Checked:=true;
    edDolgPodp3.Enabled:=true;
  end;
  if edMaxPodp.Value<2 then begin
    cbPodp2.Enabled:=false;
    if FEdit then cbPodp2.Checked:=false;
    edDolgPodp2.Enabled:=false;
  end else begin
    cbPodp2.Enabled:=true;
    if FEdit then cbPodp2.Checked:=true;
    edDolgPodp2.Enabled:=true;
  end;
end;

procedure TfmRunSprav_Edit.cbPodp2Click(Sender: TObject);
begin
  edDolgPodp2.Enabled:=cbPodp2.Checked;
end;

procedure TfmRunSprav_Edit.cbPODP3Click(Sender: TObject);
begin
  edDolgPodp3.Enabled:=cbPodp3.Checked;
end;

procedure TfmRunSprav_Edit.DataSourceDataChange(Sender: TObject;  Field: TField);
begin
  if Field<>nil then begin
    QueryExit:=true;
  end;
end;

//-----------------------------------------------------------------------------------------
function TfmRunSprav_Edit.FindTemplate(sName:String) : TTemplate;
var
  i:Integer;
  s:string;
begin
  Result:=nil;
  for i:=0 to fmMain.TemplateInterface.Engine.TemplateList.Count-1 do begin
    s:=ANSIUpperCase(fmMain.TemplateInterface.Engine.TemplateList[i].FullName);
    if (s=ANSIUpperCase(edNameReport.Text)) then begin
      Result:=fmMain.TemplateInterface.Engine.TemplateList[i];
      break;
    end;
  end;
end;

procedure TfmRunSprav_Edit.edNameReportEditButtons1Click(Sender: TObject;  var Handled: Boolean);
var
  s:String;
  i:Integer;
  Template:TTemplate;
begin
  s:=edTypeReport.KeyItems[edTypeReport.ItemIndex];
  if s='FR' then begin

  end else if s='DOC' then begin
    Template:=FindTemplate(ANSIUpperCase(edNameReport.Text));
    if Template<>nil then begin
      s:=GlobalTask.PathTemplate+'\'+Template.TemplateFile;
      ShellExecute(Application.Handle, nil, PChar(s), nil, nil, SW_SHOWNORMAL);
    end;
  end;
end;

procedure TfmRunSprav_Edit.Button1Click(Sender: TObject);
var
  sl,slF:TStringList;
  i,j,nBegin,nEnd,n:Integer;
  Template:TTemplate;
  s:String;
begin
  s:=edTypeReport.KeyItems[edTypeReport.ItemIndex];
  if s='FR' then begin

  end else if s='DOC' then begin
    Template:=FindTemplate(ANSIUpperCase(edNameReport.Text));
    if Template<>nil then begin
      sl:=TStringList.Create;
      sl.LoadFromFile(GlobalTask.PathService+'template.pas');
      s:='FUNCTION '+ANSIUpperCase(Template.ScriptName)+'(';
      n:=Length(s);
      nBegin:=-1;
      nEnd:=-1;
      for i:=0 to sl.Count-1 do begin
        if (nBegin=-1) and (ANSIUpperCase(Copy(sl.Strings[i],1,n))=s) then begin
          nBegin:=i;
        end;
        if (nBegin>0) and (i>nBegin) then begin
          if ANSIUpperCase(Copy(sl.Strings[i],1,9))='FUNCTION ' then begin
            for j:=i downto 0 do begin
              if Pos('END;',ANSIUpperCase(sl.Strings[j]))>0 then begin
                nEnd:=j;
                break;
              end;
            end;
          end;
        end;
        if (nBegin>-1) and (nEnd>-1) then begin
          break;
        end;
      end;
      if (nBegin>0) and (nEnd>0) then begin
        slF:=TStringList.Create;
        for i:=nBegin to nEnd do begin
          slF.Add(sl.Strings[i])
        end;
        ShowMemo(slF,'функция скрипта','0;0;500;500');
        slF.Free;
      end;
      sl.Free;
    end;
  end;
end;
//----------------------------------------------------------------------------------
procedure TfmRunSprav_Edit.edShtampChange(Sender: TObject);
begin
  if edShtamp.ItemIndex>0 then begin
    edShtampType.Enabled:=true;
    if edShtamp.ItemIndex=SHTAMP_CH3 then begin             // м.б. без штампа
      edShtampType.Items.CommaText:='"без штампа","штамп","гербовый штамп"';
      edShtampType.KeyItems.CommaText:='0,1,2';
    end else if edShtamp.ItemIndex=SHTAMP_CH2 then begin    // штамп обязательно должен быть
      edShtampType.Items.CommaText:='"штамп","гербовый штамп"';
      edShtampType.KeyItems.CommaText:='1,2';
    end;
  end else begin
    edShtampType.Enabled:=false;
  end;
end;

end.
