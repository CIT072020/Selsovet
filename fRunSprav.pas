unit fRunSprav;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, dBase, FuncPr, dbFunc,
  Dialogs, DB, adsdata, adsfunc, adstable, DbGrids, Grids, DBGridEh, StdCtrls, MetaTask, mTempl,
  Buttons, ExtCtrls, ComCtrls, DBCtrls, SasaUtils, SasaIniFile, mPermit, uProject, DBGridEhFindDlgs,
  TB2Item, TB2Dock, TB2Toolbar, Menus, ImgList;

type

  TParamGrantSprav=class(TObject)
    KodReport   : Variant;
    All : Boolean;
    TypeEditObj : Integer;
    KodGurnal    : String;
    EnableEdit   : Boolean;
    Caption      : String;
    VUS : Boolean;
    Ochered : Boolean;
    constructor Create;
    destructor Destroy; override;
  end;

  TfmRunSprav = class(TForm)
    pnAdmin: TPanel;
    DataSource: TDataSource;
    tbRunSprav: TAdsTable;
    btAddMen: TBitBtn;
    btEdit: TBitBtn;
    btDelMen: TBitBtn;
    Panel2: TPanel;
    pnOpis: TPanel;
    Sp1: TSplitter;
    GroupBox1: TGroupBox;
    edKomm: TDBRichEdit;
    gbPrilog: TGroupBox;
    edPrilog: TDBRichEdit;
    Sp2: TSplitter;
    Grid: TDBGridEh;
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemExec: TTBItem;
    TBItemExit: TTBItem;
    TBItemExecAndExit: TTBItem;
    TBItemFind: TTBItem;
    tbRunSpravUser: TAdsTable;
    pm: TPopupMenu;
    N1: TMenuItem;
    TBItemProp: TTBItem;
    tbRunSpravID: TAutoIncField;
    tbRunSpravKOD: TAdsStringField;
    tbRunSpravGRUPPA: TIntegerField;
    tbRunSpravNOMER: TIntegerField;
    tbRunSpravNAME: TAdsStringField;
    tbRunSpravPRILOG: TMemoField;
    tbRunSpravKOMM: TMemoField;
    tbRunSpravTYPEREPORT: TAdsStringField;
    tbRunSpravNAMEREPORT: TAdsStringField;
    tbRunSpravTYPEOBJ: TIntegerField;
    tbRunSpravSUBSYSTEM: TIntegerField;
    tbRunSpravOPEN_KART: TBooleanField;
    tbRunSpravVISIBLE: TBooleanField;
    tbRunSpravLAST_MEN: TIntegerField;
    tbRunSpravSOATO_RN: TAdsStringField;
    tbRunSpravUSER_PODP: TBooleanField;
    tbRunSpravPODP_COUNT: TSmallintField;
    tbRunSpravDOLG_PODP1: TAdsStringField;
    tbRunSpravPODP2: TBooleanField;
    tbRunSpravDOLG_PODP2: TAdsStringField;
    tbRunSpravPODP3: TBooleanField;
    tbRunSpravDOLG_PODP3: TAdsStringField;
    tbRunSpravUSER_PODP1: TIntegerField;
    tbRunSpravLAIS: TBooleanField;
    tbRunSpravGKH: TBooleanField;
    tbRunSpravOCHERED: TBooleanField;
    tbRunSpravSHTAMP_CHOICE: TSmallintField;
    tbRunSpravSHTAMP_CUR: TSmallintField;
    TBItemRunGroup: TTBItem;
    tbRunSpravONE_RECORD: TBooleanField;
    tbRunSpravNAMEREPORT_ALL: TAdsStringField;
    ImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btAddMenClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btDelMenClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TBItemExecClick(Sender: TObject);
    procedure TBItemExecAndExitClick(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure TBItemFindClick(Sender: TObject);
    procedure GridColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure GridColumns3GetCellParams(Sender: TObject; EditMode: Boolean;   Params: TColCellParamsEh);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure TBItemPropClick(Sender: TObject);
    procedure GridColumns5GetCellParams(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
    procedure tbRunSpravUSER_PODP1GetText(Sender: TField; var Text: String;   DisplayText: Boolean);
    procedure GridCellClick(Column: TColumnEh);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TBItemRunGroupClick(Sender: TObject);
    procedure tbRunSpravAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sl1:TStringList;
    sl2:TStringList;
    FAll:Boolean;
    FEnabledAll:Boolean;
    FForm:TForm;
    FGruppa:Integer;
    FRegimEditUserProp : boolean;   // режим корректировки свойств
    FEnabledEdit:Boolean;
    FEnabledVUS:Boolean;
    FEnabledOchered:Boolean;
    FSoato1:String;
    FSoato2:String;
    FIdMen:String;
    FPar:TParamGrantSprav;
    function Run:Boolean;
    function Open:Boolean;
    procedure SetEnableEdit(l:Boolean);
    procedure FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure Close;
  end;

  function ExecSprav(strIDMen:String; par:TParamGrantSprav; Gruppa:Integer; f:TForm; lEnabledAll:Boolean):Boolean;

implementation

uses fMain,
     {$IFDEF ZAGS} fRunSprav_EditZ, {$ELSE} fRunSprav_Edit, {$ENDIF}
     fSimpleD, fRunSprav_UserPropt, fGurnal;

var
  lCheck:Boolean;

{$R *.dfm}

//-----------------------------------------------------------------
function ExecSprav(strIDMen:String;par:TParamGrantSprav; Gruppa:Integer; f:TForm; lEnabledAll:Boolean):Boolean;
var
  fmRunSprav: TfmRunSprav;
begin
  Result:=false;
  if strIDMen='' then exit;
  fmRunSprav:=TfmRunSprav.Create(nil);
  fmRunSprav.FForm:=f;
  fmRunSprav.FPar:=par;
  fmRunSprav.FGruppa:=Gruppa;

  fmRunSprav.FEnabledAll:=lEnabledAll;
  fmRunSprav.TBItemRunGroup.Visible:=lEnabledAll;

  fmRunSprav.FIdMen:=strIDMen;
  fmRunSprav.FSoato1:=Copy(GlobalTask.ParamAsString('KOD'),1,4);
  fmRunSprav.FSoato2:=Copy(GlobalTask.ParamAsString('KOD'),1,1)+'000';

  fmRunSprav.FEnabledVUS:=true;
  fmRunSprav.FEnabledOchered:=true;
  if par.Caption<>''
    then fmRunSprav.Caption:=par.Caption;

  if (Role.Status = rsAdmin) then begin  // для доступности свойств
    fmRunSprav.pm.AutoPopup:=true;
    fmRunSprav.TBItemProp.Visible:=true;
  end else begin
    fmRunSprav.TBItemProp.Visible:=false;
    if (Role.CheckSubSystem(SS_VUS)=ptDeniedAccess) then begin
      fmRunSprav.FEnabledVUS:=false;
    end;
    if (Role.CheckSubSystem(SS_OCHERED)=ptDeniedAccess) then begin
      fmRunSprav.FEnabledOchered:=false;
    end;
  end;

  fmRunSprav.Open;

  fmRunSprav.SetEnableEdit(par.EnableEdit);
  fmRunSprav.DataSource.DataSet.OnFilterRecord:=fmRunSprav.FilterRecord;
  fmRunSprav.DataSource.DataSet.Filtered:=true;

//  fmRunSprav.SetEnabled(false);

  fmRunSprav.FAll:=false;

  if fmRunSprav.ShowModal=mrOk then begin
    Result:=fmRunSprav.Run;
  end;
  if par<>nil then FreeAndNil(par);

  fmRunSprav.Close;
  fmRunSprav.Free;
end;

{ TfmRunSprav }

procedure TfmRunSprav.FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept:=false;
  if FRegimEditUserProp then begin
    Accept:=not DataSet.FieldByName('USER_PODP').isNull and DataSet.FieldByName('USER_PODP').AsBoolean;
  end else begin
    if FEnabledEdit then begin
      Accept:=true;
    end else begin
      if DataSet.FieldByName('VISIBLE').AsBoolean and
         ( (DataSet.FieldByName('SOATO_RN').AsString='') or (DataSet.FieldByName('SOATO_RN').AsString=FSoato1) or
           (DataSet.FieldByName('SOATO_RN').AsString=FSoato2) )
      then begin
        Accept:=true;
      end;
      {$IFDEF OCHERED}
        Accept:=DataSet.FieldByName('OCHERED').AsBoolean;
      {$ELSE}
        if Accept then begin
          if (DataSet.FieldByName('SUBSYSTEM').AsInteger=SS_VUS) and not (FPar.VUS and FEnabledVUS) then begin
            Accept:=false;
          end;
        end;
        if Accept then begin
          if (DataSet.FieldByName('SUBSYSTEM').AsInteger=SS_OCHERED) and not (FPar.OCHERED and FEnabledOCHERED) then begin
            Accept:=false;
          end;
        end;
        if Accept then begin
          {$IFDEF GKH}
            Accept:=DataSet.FieldByName('GKH').AsBoolean;
          {$ELSE}
            Accept:=DataSet.FieldByName('LAIS').AsBoolean;
          {$ENDIF}
        end;
      {$ENDIF}
    end;
  end;
end;

procedure TfmRunSprav.SetEnableEdit(l: Boolean);
var
  i:Integer;
//  s1,s2:String;
begin
  FEnabledEdit:=l;
  pnAdmin.Visible:=l;
//  btAddMen.Visible:=l;
//  btEdit.Visible:=l;
//  btDelMen.Visible:=l;
  if l then begin
    Grid.ReadOnly:=true;
    Grid.AutoFitColWidths:=false;
  end else begin
    {
    s1:=Copy(GlobalTask.ParamAsString('KOD'),1,4);
    s2:=Copy(GlobalTask.ParamAsString('KOD'),1,1)+'000';
    tbRunSprav.Filter:='visible=.t. and (Empty(soato_rn) or soato_rn='+QStr(s1)+' or soato_rn='+QStr(s2)+')';
    if (Role.CheckSubSystem(SS_VUS)<>ptDeniedAccess) then begin
      tbRunSprav.Filter:=tbRunSprav.Filter+' and subsystem<>'+IntToStr(SS_VUS);
    end;
    if (Role.CheckSubSystem(SS_OCHERED)<>ptDeniedAccess) then begin
      tbRunSprav.Filter:=tbRunSprav.Filter+' and subsystem<>'+IntToStr(SS_OCHERED);
    end;
    }
    DataSource.DataSet.OnFilterRecord:=FilterRecord;
    DataSource.DataSet.Filtered:=true;
    for i:=0 to Grid.Columns.Count-1 do begin
      if Grid.Columns[i].FieldName='NAME' then begin
//        Grid.Columns[i].Width:=Self.ClientWidth-80-Grid.FieldColumns['TYPEREPORT'].Width-Grid.FieldColumns['USER_PODP1'].Width-
//                               Grid.FieldColumns['TYPEOBJ'].Width;
        Grid.Columns[i].Visible:=true;
      end else if (Grid.Columns[i].FieldName='TYPEOBJ') or (Grid.Columns[i].FieldName='TYPEREPORT') or (Grid.Columns[i].FieldName='USER_PODP1') then begin
        Grid.Columns[i].Visible:=true;
      end else begin
        Grid.Columns[i].Visible:=false;
      end;
    end;
    Grid.Options:=Grid.Options-[dgTitles];
    Grid.AutoFitColWidths:=true;
  end;
end;

function TfmRunSprav.Run: Boolean;
var
  slPar : TStringList;
  Template : TTemplate;
  f : TfmGurnal;
  ds : TDataSet;
  lSet,l : Boolean;
  s:String;
begin
  with DataSource.DataSet do begin
    Result:=false;
    lSet:=false;
    ds:=nil;                      
    l:=false;
    if (FieldByName('TYPEOBJ').AsInteger=0) then begin   // форму открывать не надо
      if FieldByName('TYPEREPORT').AsString='DOC' then begin
        Template:=fmMain.TemplateInterface.GetTemplate(FieldByName('NAMEREPORT').AsString);
        if Template=nil then begin
          PutError('Не найден Word-шаблон.');
        end else begin
          fmMain.OnTemplateMenuClick(Template);
          Result:=true;
        end;
      end;
    end else begin
      slPar:=TStringList.Create;
      slPar.Add('NAME_REPORT='+FieldByName('NAMEREPORT').AsString);
      slPar.Add('NAME_REPORT_ALL='+FieldByName('NAMEREPORT_ALL').AsString);
      slPar.Add('TYPE_REPORT='+FieldByName('TYPEREPORT').AsString);
      slPar.Add('ID_REPORT='+FieldByName('ID').AsString);
      slPar.Add('KOD_REPORT='+FieldByName('KOD').AsString);
      slPar.Add('CAPTION_REPORT='+FieldByName('NAME').AsString);
      if FAll and FEnabledAll then begin
        if (FForm<>nil) and (FForm is TfmGurnal) then begin
          f:=TfmGurnal(FForm);
          ds:=f.Grid.DataSource.DataSet;
          s:=ds.Bookmark;
          l:=dbDisableControls(ds);
          lSet:=f.BookmarkToFilter('ID');
          slPar.Add('DATASET='+IntToStr(Integer(ds)));
          slPar.Add('ALL=1');
        end;
      end;   
      try
        Result:=fmMain.RunReport(FieldByName('TYPEOBJ').AsInteger,slPar,FIDMen);
      finally
        if ds<>nil then begin
          if lSet then begin
            ds.Filtered:=false;
            ds.Filter:='';
          end;
          ds.Bookmark:=s;
          dbEnableControls(ds,l);
        end;
        FreeAndNil(slPar);
      end;
    end;
  end;
end;

//------------------------------------------------
function TfmRunSprav.Open: Boolean;
begin
  Result:=true;
  try
    tbRunSprav.Open;
//    if FGruppa>0 then begin
      tbRunSprav.IndexName:='GRUPPA_KEY';
      tbRunSprav.SetRange([FGruppa],[FGruppa]);
//    end;
    tbRunSpravUser.Open;
  except
    on E: Exception do begin
      PutError('Ошибка открытия описания справок.'+#13#10+E.Message);
      Result := false;
    end;
  end;
end;
//------------------------------------------------
procedure TfmRunSprav.Close;
begin
  tbRunSprav.Close;
  tbRunSpravUser.Close;
end;

const
  PropForm = ',Left,Top,Width,Height,WindowState,';

//------------------------------------------------
procedure TfmRunSprav.FormCreate(Sender: TObject);
var
  ini : TSasaIniFile;
  sSim,s:String;
begin
  sl1:=TStringList.Create;
  sl2:=TStringList.Create;

  sSim:='';
  // подписи для справок из справочника дорлжностных лиц
  if GlobalTask.ParamAsBoolean('PODP_FROM_SPR') then begin
    ReadSprDolg(sl1,sl2, true);
    sSim:=' * ';
  end;
           
  s:=DolgRukov;
  if s<>'' then begin
    sl1.Add(sSim+s);
    sl2.Add('RUKV');
  end;
  {$IFNDEF ZAH}
  s:=DolgSecretar;
  if s<>'' then begin
    sl1.Add(sSim+s);
    sl2.Add('SEKR');
  end;
  s:=DolgGlBux;
  if s<>'' then begin
    sl1.Add(sSim+s);
    sl2.Add('BUXG');
  end;
  {$ENDIF}
  s:=DolgSpec;
  if s<>'' then begin
    sl1.Add(sSim+s);
    sl2.Add('SPEC');
  end;

  FRegimEditUserProp:=false;
  fmMain.ImageList.GetBitmap(118,btEdit.Glyph);
  fmMain.ImageList.GetBitmap(119,btAddMen.Glyph);
  fmMain.ImageList.GetBitmap(120,btDelMen.Glyph);
  ini := GlobalTask.iniFile('FORM');
  CompFromIni(Self,ini,Self.Name,PropForm);
  CompFromIni(pnOpis, ini, Name+'.pnOpis', ',Height,');
  CompFromIni(gbPrilog, ini, Name+'.gbPrilog', ',Width,');
  {$IFDEF ZAH}
    Grid.FieldColumns['TYPEOBJ'].Visible:=false;
  {$ENDIF}

end;

//------------------------------------------------
procedure TfmRunSprav.FormDestroy(Sender: TObject);
var
  ini : TSasaIniFile;
begin
  ini := GlobalTask.iniFile('FORM');
  CompToIni(Self, ini, Name, ',Left,Top,Width,Height,WindowState,');
  CompToIni(pnOpis, ini, Name+'.pnOpis', ',Height,');
  CompToIni(gbPrilog, ini, Name+'.gbPrilog', ',Width,');
  sl1.Free;
  sl2.Free;
end;

//------------------------------------------------
procedure TfmRunSprav.btAddMenClick(Sender: TObject);
begin
  if EditRecord(sl1,sl2,true,tbRunSprav,tbRunSpravUser,FGruppa) then begin
    Grid.Refresh;
  end;
end;

//------------------------------------------------
procedure TfmRunSprav.btEditClick(Sender: TObject);
var
  lUser:Boolean;
begin
  EditRecord(sl1,sl2,false,tbRunSprav,tbRunSpravUser,FGruppa);
  Grid.Refresh;
end;

//------------------------------------------------
procedure TfmRunSprav.btDelMenClick(Sender: TObject);
begin
  if Problem('Удалить запись ?') then begin
    if tbRunSpravUser.FieldByName('ID').AsInteger=tbRunSprav.FieldByName('ID').AsInteger then begin
      tbRunSpravUser.Delete;
    end;
    tbRunSprav.Delete;
  end;
end;

procedure TfmRunSprav.TBItemExecClick(Sender: TObject);
begin
  Run;
end;

procedure TfmRunSprav.TBItemExecAndExitClick(Sender: TObject);
begin
  Modalresult:=mrOk;
end;

procedure TfmRunSprav.TBItemRunGroupClick(Sender: TObject);
begin
  if FEnabledAll then begin
    FAll:=true;
    Modalresult:=mrOk;
  end;
end;

procedure TfmRunSprav.GridDblClick(Sender: TObject);
begin
  if FEnabledEdit then begin
    btEditClick(nil);
  end else begin
    Modalresult:=mrOk;
  end;
end;

procedure TfmRunSprav.TBItemExitClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmRunSprav.TBItemFindClick(Sender: TObject);
begin
  ExecuteDBGridEhFindDialog(Grid, '', 'NAME', nil, true);
end;

procedure TfmRunSprav.GridColumns2GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  nType:Integer;
begin
  if not EditMode then begin
    nType:=DataSource.DataSet.FieldByName('TYPEOBJ').AsInteger;
    if nType=dmBase.TypeObj_Lich then begin
      Params.ImageIndex := 60;
    end else if nType=dmBase.TypeObj_Adres then begin
      Params.ImageIndex := 46;
    end else if nType=dmBase.TypeObj_Nasel then begin
      Params.ImageIndex := 44;
    end else begin
      Params.ImageIndex:=-1;
    end;
  end;
end;

procedure TfmRunSprav.GridColumns3GetCellParams(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
var
  sType:String;
begin
  if not EditMode then begin
    sType:=DataSource.DataSet.FieldByName('TYPEREPORT').AsString;
    if sType='DOC' then begin
      Params.ImageIndex := 95;
    end else if sType='FR' then begin
      Params.ImageIndex := 134;
    end else begin
      Params.ImageIndex:=-1;
    end;
  end;
end;

procedure TfmRunSprav.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_F2) then begin
   btEditClick(nil);
   Key:=0;
 end;
 if (Key=VK_INSERT) then begin
   btAddMenClick(nil);
   Key:=0;
 end;
end;

procedure TfmRunSprav.GridGetCellParams(Sender: TObject; Column: TColumnEh;  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if not FRegimEditUserProp then begin
    if DataSource.DataSet.FieldByName('VISIBLE').AsBoolean=false then begin
      Background:=clInfoBk;
    end;
  end;
  if FEnabledAll then begin
    if DataSource.DataSet.FieldByName('ONE_RECORD').AsBoolean=false then begin
      AFont.Style:=AFont.Style+[fsBold]; //  Color:=clBlue;
    end;
  end;  
end;

procedure TfmRunSprav.N1Click(Sender: TObject);
var
  st:TSostTable;
begin
  FRegimEditUserProp:=not FRegimEditUserProp;
  tbRunSprav.DisableControls;
  tbRunSprav.Filtered:=false;
  tbRunSprav.First;
  //---контроль пользовательских настроек --------------
  if lCheck then begin
    st:=SaveSostTable(tbRunSpravUser,true,false);
    tbRunSpravUser.First;
    while not tbRunSpravUser.Eof do begin
      if tbRunSprav.Locate('ID', tbRunSpravUser.FieldByName('ID').AsInteger, []) then begin
        if tbRunSprav.FieldByName('USER_PODP').AsBoolean=true then begin
          tbRunSpravUser.Edit;
          tbRunSpravUser.FieldByName('KOD').AsString:=tbRunSprav.FieldByName('KOD').AsString;
          tbRunSpravUser.Post;
          tbRunSpravUser.Next;
        end else begin
          tbRunSpravUser.Delete;
        end;
      end else begin
        tbRunSpravUser.Delete;
      end;
    end;
    RestSostTable(tbRunSpravUser,st);
    lCheck:=false;
  end;
  tbRunSprav.EnableControls;
  tbRunSprav.Filtered:=true;
  tbRunSprav.First;
  //----------------------------------------------------
  if tbRunSprav.Eof and FRegimEditUserProp then begin
     PutError('Не документов доступных для корретировки.');
     FRegimEditUserProp:=false;
     tbRunSprav.Refresh;
     tbRunSprav.First;
  end;
//  TBItemProp.Visible:=FRegimEditUserProp;
end;

procedure TfmRunSprav.TBItemPropClick(Sender: TObject);
begin
  if tbRunSpravUSER_PODP.AsBoolean=true
    then EditPropRecord(sl1,sl2,tbRunSprav,tbRunSpravUser);
end;

procedure TfmRunSprav.GridColumns5GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if DataSource.DataSet.FieldByName('USER_PODP').AsBoolean then begin
      Params.ImageIndex := 28;
    end else begin
      Params.ImageIndex:=-1;
    end;
  end;
end;

procedure TfmRunSprav.tbRunSpravUSER_PODP1GetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
 if tbRunSpravUSER_PODP.AsBoolean=true
   then text:='1'
   else text:='0';
end;

procedure TfmRunSprav.GridCellClick(Column: TColumnEh);
begin
//
end;

procedure TfmRunSprav.GridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//
end;

procedure TfmRunSprav.tbRunSpravAfterScroll(DataSet: TDataSet);
begin
  TBItemRunGroup.Enabled:=not tbRunSpravONE_RECORD.AsBoolean;
  TBItemProp.Enabled:=tbRunSpravUSER_PODP.AsBoolean;
end;

{ TParamGrantSprav }

constructor TParamGrantSprav.Create;
begin
  KodReport:='';
  All:=false;
end;

destructor TParamGrantSprav.Destroy;
begin
  //
  inherited;
end;

initialization
  lCheck:=true;
end.
