unit fGurnOchered;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils, uTypes,
  fGurnal, Db, adsdata, adsfunc, adstable, Grids, DBGridEh, SasaDBGrid, fmChList, uProject, fInitField,
  TB2Item, TB2Dock, TB2Toolbar, StdCtrls, Mask, DBCtrlsEh, TB2ToolWindow, FuncPr, fParamQuest, mPermit,
  DbFunc, vchDBCtrls, PrnDbgeh, Menus, metatask, SasaIniFile, ImgList, Variants, OpisEdit, fWarning,
  ComCtrls, ExtCtrls;

type
  TfmGurnOchered = class(TfmGurnal)
    TBToolWindow1: TTBToolWindow;
    edSeek: TDBEditEh;
    TBItemEditLic: TTBItem;
    TBItemAdd: TTBItem;
    Label2: TLabel;
    cbTypeOchered: TComboBox;
    cbTypeISKL: TComboBox;
    Label3: TLabel;
    TBItemTypeMens: TTBItem;
    TBItemAddNewMen: TTBItem;
    edTypeSeek: TComboBox;
    TBItemLgot: TTBItem;
    TBItemPrizn: TTBItem;
    TBSubmenuSource: TTBSubmenuItem;
    TBItemClearSource: TTBItem;
    TBItemMySource: TTBItem;
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItemLgotClick(Sender: TObject);
    procedure DBTextGetText(Sender: TObject; var Text: String);
    procedure TBItemEditLicClick(Sender: TObject);
    procedure TBItemAddClick(Sender: TObject);
    procedure cbTypeOcheredChange(Sender: TObject);
    procedure cbTypeISKLChange(Sender: TObject);
    procedure TBItemTypeMensClick(Sender: TObject);
    procedure TBItemAddNewMenClick(Sender: TObject);
    procedure Fgu(Sender: TObject;   var Handled: Boolean);
    procedure edTypeSeekChange(Sender: TObject);
    procedure TBItemPriznClick(Sender: TObject);
    procedure edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edSeekEditButtonsBeginClick(Sender: TObject;  var Handled: Boolean);
    procedure TBSubmenuSourceClick(Sender: TObject);
    procedure TBItemClearSourceClick(Sender: TObject);
    procedure TBItemMySourceClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edSeekExit(Sender: TObject);
    procedure edSeekEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSeekChange(Sender: TObject);
  private
    { Private declarations }
  public
    TBItemPereof: TTBItem;
    TBItemRazdel: TTBItem;
    TBItemSetVozrast : TTbItem;

    FVisibleLgot:Boolean;
    FVisibleSobstv:Boolean;
    FVisibleListMens:Boolean;
    FAddOtnosh:Boolean;
    FAddDateR:Boolean;
    FAddPasp:Boolean;
    FAddBTI:Boolean;

    FVklMens  : Boolean;
    itVklMens : TTBItem;
    FTypeOchered : Integer;
    FTypeISKL    : Integer;
    FSeekNameMen:String;
    FSeekFamMen:String;
    FVozrast1:Integer;
    FVozrast2:Integer;
    procedure SetCurBase(Value : Integer); override;

    procedure SetTypeOchered(n:Integer);
    constructor Create(Owner : TComponent); override;
//    function LoadQuery : Boolean; override;
    function InitGurnal : Boolean; override;

    procedure LoadFromIni; override;
    procedure SaveToIni; override;
    function  InitFilter( var strErr : String ) : Boolean; override;
    procedure AddUpdateActions; override;
    function  GetNameVozrast:String;
    function  GetNameVozrast_:String;

    procedure GridColumnsSostavSem(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure GridColumnsSOBSTV(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsREGOSNOV(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsISKOSNOV(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure GridColumnsGetPaspVidan(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure Event_VklMens(Sender: TObject);

    procedure Event_SetLastReshIsp(Sender: TObject);
    procedure Event_DeleteIskMens(Sender: TObject);
    procedure Event_VozrastMens(Sender: TObject);
    procedure Event_ReindexOchered(Sender: TObject);
    procedure Event_RunRazdelOchered(Sender: TObject);
    procedure Event_RunPereofOchered(Sender: TObject);
    procedure Event_CreateResh(Sender: TObject);
    procedure Event_InitFields(Sender: TObject);
    procedure ReindexOchered(lFix:Boolean);

    procedure CheckPropertyGridColumns; override;

    procedure SetListParEditForm; override;
    procedure SetQueryParam(p : TParam); override;
    function GetPropertyDef(sName: String; var vVal:Variant): Boolean; override;

    function getAdditiveWhere : String; override;
    function  getDefaultAddWhere: String; override;
    procedure ClearSeek;

    function  CheckDelete(var strErr : string; var lQuest:Boolean; arr:TArrStrings=nil) : Boolean; override;
    procedure BeforeReport; override;

    function CheckValueFilter(nType:Integer;strFilter:String; var s1,s2:String):Boolean;
    function getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
    function getIDForFilter(nType:Integer;strFilter:String):String;
    function  getAdditiveFilter:String; override;
    function  setAdditiveFilter:Boolean; override;
    function GetHintSeek(n:Integer):String;
  end;

const
  TYPESEEK_FIO=0;
  TYPESEEK_FIO_SS=1;
  TYPESEEK_IN=2;
  TYPESEEK_IN_SS=3;
  TYPESEEK_DELO=4;
  TYPESEEK_LASTRESH=5;
  TYPESEEK_BTI=6;
  TYPESEEK_VOZR=7;
  TYPESEEK_PLAN=8;

var
  fmGurnOchered: TfmGurnOchered;

implementation

uses fMain, dBase, fLgotSeek,fChoiceNasel,fTypeMensOchered;

{$R *.DFM}

{ TfmGurnNasel }


constructor TfmGurnOchered.Create(Owner: TComponent);
var
  Opis : TOpisEdit;
  i : Integer;
begin
  TypeEditObj := dmBase.TypeObj_Nasel;
  inherited;
  FEnableAll:=true;
  StBar.Visible:=true;
  TBItemRazdel:=nil;
  TBItemPereof:=nil;
  FVozrast1:=0;
  FVozrast2:=17;
  TBItemGrantSprav.Visible:=true;
  Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEOCHERED_FULL');
  for i:=0 to Opis.Items.Count-1 do begin
    cbTypeOchered.Items.Add(Opis.Items[i]);
  end;
  FTypeOchered:=0;
  FTypeISKL:=0;
  cbTypeOchered.ItemIndex:=0;
  cbTypeISKL.ItemIndex:=0;
  {$IFDEF OCHERED}
    QuestDel := '  Вы хотите удалить человека из БАЗЫ ?  ';
    TBItemEditLic.Visible:=false;
    TBItemAdd.Visible:=false;
    TBItemAddNewMen.Visible:=FEnableWrite;
    TBSubmenuSource.Visible:=FVisibleBASE;
  {$ELSE}
    QuestDel := '  Удалить человека из очереди ?  ';
    TBItemAddNewMen.Visible:=false;
    TBSubmenuSource.Visible:=false;
  {$ENDIF}

end;

function TfmGurnOchered.InitFilter(var strErr: String): Boolean;
begin
  FSubType := 'Очередь на жилье';
  Result := inherited InitFilter(strErr);
end;

procedure TfmGurnOchered.SaveToIni;
var
  ini : TSasaIniFile;
begin
  inherited SaveToIni;
  ini := GlobalTask.iniFile('LOCAL');
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_SOBSTV',FVisibleSobstv);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_LGOT_MEN',FVisibleLgot);
  ini.WriteBool(KodGurnal+'.Add','VISIBLE_LIST_MENS',FVisibleListMens);
  ini.WriteBool(KodGurnal+'.Add','ADD_BTI_MENS',FAddBTI);
  ini.WriteBool(KodGurnal+'.Add','ADD_OTNOSH_MENS',FAddOtnosh);
  ini.WriteBool(KodGurnal+'.Add','ADD_DATER_MENS',FAddDateR);
  ini.WriteBool(KodGurnal+'.Add','ADD_PASP_MENS',FAddPasp);
  ini.WriteInteger(KodGurnal+'.Add','TYPE_ISKL',FTypeISKL);
  ini.WriteInteger(KodGurnal+'.Add','TYPE_OCHERED',FTypeOchered);
  ini.WriteInteger(KodGurnal+'.Add','VOZRAST1',FVozrast1);
  ini.WriteInteger(KodGurnal+'.Add','VOZRAST2',FVozrast2);
end;

procedure TfmGurnOchered.LoadFromIni;
var
  i : Integer;
  ini : TSasainiFile;
  c:TColumnEh;
begin
  inherited LoadFromIni;
  ini := GlobalTask.iniFile('LOCAL');
  FVisibleLgot:=ini.ReadBool(KodGurnal+'.Add','VISIBLE_LGOT_MEN',false);
  FVisibleSobstv:=ini.ReadBool(KodGurnal+'.Add','VISIBLE_SOBSTV',false);

  FVisibleListMens:=ini.ReadBool(KodGurnal+'.Add','VISIBLE_LIST_MENS',false);
  FAddOtnosh := ini.ReadBool(KodGurnal+'.Add','ADD_OTNOSH_MENS',false);
  FAddBTI := ini.ReadBool(KodGurnal+'.Add','ADD_BTI_MENS',false);
  FAddDateR  := ini.ReadBool(KodGurnal+'.Add','ADD_DATER_MENS',false);
  FAddPasp   := ini.ReadBool(KodGurnal+'.Add','ADD_PASP_MENS',false);
  FVozrast1  := ini.ReadInteger(KodGurnal+'.Add','VOZRAST1',0);
  FVozrast2  := ini.ReadInteger(KodGurnal+'.Add','VOZRAST2',17);
  TBItemSetVozrast.Caption:=GetNameVozrast;
  edTypeSeek.Items.Strings[TYPESEEK_VOZR]:='Количество в составе ('+GetNameVozrast_+')';
  edTypeSeek.Update;

  FVklMens := false; // ini.ReadBool(KodGurnal+'.Add','VKLMENS',true);
  itVklMens.Checked := FVklMens;

  Grid.FieldColumns['LGOT'].Visible:=FVisibleLgot;
  Grid.FieldColumns['SOSTAV_SEM'].Visible:=FVisibleListMens;
  Grid.FieldColumns['SOBSTV'].Visible:=FVisibleSobstv;
  try
  c := Grid.FieldColumns['SOATO_RN'];
  if (c<>nil) then begin
    c.Visible:=dmBase.OblBase;
  end;
  except
  end;

  for i:=0 to Grid.Columns.Count-1 do begin
    if Grid.Columns[i].FieldName='SOSTAV_SEM' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsSostavSem;
    end else if Grid.Columns[i].FieldName='SOBSTV' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsSOBSTV;
    end else if Grid.Columns[i].FieldName='REG_OSNOV_TEXT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsREGOSNOV;
    end else if Grid.Columns[i].FieldName='ISK_OSNOV_TEXT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsISKOSNOV;
    end;
  end;
  Grid.FieldColumns['NOMER_OCH'].Visible:=GlobalTask.ParamAsBoolean('OCH_NOMER');
  Grid.FieldColumns['REG_NOMER'].Visible:=GlobalTask.ParamAsBoolean('OCH_REGNOMER');

end;

//------------------------------------------------------------------------
function TfmGurnOchered.InitGurnal: Boolean;
var
  it  : TTbItem;
  ini : TSasainiFile;
  sep : TTbSeparatorItem;
  pt:TPermitType;
  lAdd:Boolean;
//  c : TColumnEh;
begin
  Result:=inherited InitGurnal;
  if not Result then exit;
  Result:=true;
  ini := GlobalTask.iniFile('LOCAL');
  FVklMens := false;
  FTypeISKL:=ini.ReadInteger(KodGurnal+'.Add','TYPE_ISKL',0);
  if FTypeISKL>0 then cbTypeISKL.ItemIndex:=FTypeISKL;
  SetTypeOchered(ini.ReadInteger(KodGurnal+'.Add','TYPE_OCHERED',0));
  if FTypeOchered>0 then cbTypeOchered.ItemIndex:=FTypeOchered;

  FSeekAsQuery:=true;   // !!!
//  FSeekAsQuery:=false;

  CreateAdditiveWhere(getAdditiveWhere);

  // если не областная база и доступна загрузка включим мою базу
  {$IFDEF OCHERED}
  if EnableLoadOch and not dmBase.OblBASE then begin
    SetCurBase(0);
    FSysFltCaption:=' ( '+MyKNAME+' ) ';
  end;
  {$ENDIF}
  itVklMens := TTbItem.Create(TBSubSysFlt);
  itVklMens.AutoCheck := true;
  itVklMens.Checked:=true;
  itVklMens.Caption:='Исключить умерших и убывших';
  itVklMens.OnClick:=Event_VklMens;
  TBSubSysFlt.Add(itVklMens);

//  TBSubItemRun.Visible:=true;   !!!

//  if TBSubItemRun.Count>0 then begin
//    sep := TTbSeparatorItem.Create(TBSubItemRun);
//    TBSubItemRun.Add(sep);
//  end;

  {$IFDEF OCHERED}
    TBItemDelDok.Caption:='Удалить человека из базы';
  {$ENDIF}

  if Role.CheckSubSystem(SS_OCHERED)=ptFull
    then lAdd:=true
    else lAdd:=false;

  if lAdd then begin
    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Сформировать решение';
    it.OnClick:=Event_CreateResh;
    TBSubItemRun.Add(it);

    sep := TTbSeparatorItem.Create(TBSubItemRun);
    TBSubItemRun.Add(sep);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Перенумеровать очередь';
    it.OnClick:=Event_ReindexOchered;
    TBSubItemRun.Add(it);

    sep := TTbSeparatorItem.Create(TBSubItemRun);
    TBSubItemRun.Add(sep);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Ввести последнее решение исполкома';
    it.OnClick:=Event_SetLastReshIsp;
    it.Visible:=false;
    TBSubItemRun.Add(it);

    it := TTbItem.Create(TBSubItemRun);
    it.Caption:='Удалить исключенных людей из очереди';
    it.OnClick:=Event_DeleteIskMens;
    TBSubItemRun.Add(it);

    {$IFDEF OCHERED}
    if (Role.Status=rsAdmin) then begin
      it := TTbItem.Create(TBSubItemRun);
      it.Caption:='Изменить значение реквизита в базе';
      it.OnClick:=Event_InitFields;
      TBSubItemRun.Add(it);
    end;
    {$ELSE}
    if (Role.Status=rsAdmin) and (DateFiks=dmBase.GetDateCurrentSost) then begin
      it := TTbItem.Create(TBSubItemRun);
      it.Caption:='Изменить значение реквизита в базе';
      it.OnClick:=Event_InitFields;
      TBSubItemRun.Add(it);
    end;
    {$ENDIF}
  end;

  TBItemSetVozrast:=TTbItem.Create(TBSubItemRun);
  TBItemSetVozrast.Caption:=GetNameVozrast;
  TBItemSetVozrast.OnClick:=Event_VozrastMens;
  TBSubItemRun.Add(TBItemSetVozrast);
  TBSubItemRun.Visible:=true;

  TBItemSum.Visible:=true;

  TBItemMySource.Caption:=Globaltask.ParamAsString('KNAME');

end;

//-------------------------------------------------------------------------
procedure TfmGurnOchered.CheckPropertyGridColumns;
var
  c : TColumnEh;
begin
  inherited;
  try
    c := Grid.FieldColumns['ID_BASE'];
    if c<>nil then begin
      c.Visible:=FVisibleBASE;
      c.OnGetCellParams := GridColumnsGetID_BASE;
    end;
    c := Grid.FieldColumns['DATE_SROK_DN'];
    if c<>nil then begin
      {$IFNDEF OCHERED}
         c.Visible:=false;
      {$ENDIF}
    end;
  except
  end;
end;

//-------- переоформить очередь на другого человека ------------------
procedure TfmGurnOchered.Event_RunPereofOchered(Sender: TObject);
var
  i,n,nID,nNewID : Integer;
  s,ss : String;
  sl : TStringList;
  slID : TStringList;
  slBookmark : TStringList;
  ds:TDataSet;
  Opis:TOpisEdit;
  lOk:Boolean;
begin
  if FTypeOchered<>0 then begin
    ShowMessage('Режим доступен только для общей очереди.');
    exit;
  end;
  nID := Query.FieldByName('ID').AsInteger;
  sl:=TStringList.Create;
  slID:=TStringList.Create;
  slBookmark:=TStringList.Create;
  dmBase.tbSostavSem.IndexName := 'PR_KEY';
  dmBase.tbSostavSem.SetRange([nID],[nID]);
  while not dmBase.tbSostavSem.Eof do begin
    if dmBase.tbSostavSem.FieldByName('FAMILIA').AsString<>'' then begin
      s:='';
      if dmBase.tbSostavSem.FieldByName('OTNOSH').AsString<>'' then begin
        s:=ANSILowerCase(dmBase.SeekValueTable2(dmBase.SprOtnosh,'ID',dmBase.tbSostavSem.FieldByName('OTNOSH').AsString,'NAME'))+' ';
      end;
      s:=s+Trim(dmBase.tbSostavSem.FieldByName('FAMILIA').AsString)+' '+
           Trim(dmBase.tbSostavSem.FieldByName('NAME').AsString)+' '+
           Trim(dmBase.tbSostavSem.FieldByName('OTCH').AsString);
      ss:='';
      if not dmBase.tbSostavSem.FieldByName('DATER').IsNull then begin
        ss:=' '+FormatDateTime('dd.mm.yyy',dmBase.tbSostavSem.FieldByName('DATER').AsDateTime);
      end;
      sl.Add(s+ss);
      slID.Add(dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsString);
      slBookmark.Add(dmBase.tbSostavSem.Bookmark);
    end;
    dmBase.tbSostavSem.Next;
  end;
  dmBase.tbSostavSem.CancelRange;
  lOk:=false;
//  nNewID:=0;
  if sl.Count=0 then begin
    PutError('В составе семьи нет ни одного человека.');
  end else begin
    i:= ChoiceFromList(sl,'Выберите человека');
    if i>-1 then begin
      nNewID := StrToInt(slID.Strings[i]);      // ID нового хозяина очереди
      ds:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nID));  // старый хозяин очереди
      if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,nID]),[]) then begin
        ds.Edit;
        ds.FieldByName('OCHERED').AsBoolean:=false;  // старый хозяин теперь не стоит в очереди
        ds.Post;
        for n:=0 to slBookmark.Count-1 do begin
          dmBase.tbSostavSem.Bookmark:=slBookmark[n];
          dmBase.tbSostavSem.Edit;
          dmBase.tbSostavSem.FieldByName('ID').AsInteger:=nNewID;  // новый хозяин очереди
          dmBase.tbSostavSem.FieldByName('OTNOSH').AsString:='';
          if dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger=nNewID then begin   // если нашли нового хозяина в списке состава семьи
            dmBase.tbSostavSem.FieldByName('FAMILIA').AsString:=ds.FieldByName('FAMILIA').AsString;
            dmBase.tbSostavSem.FieldByName('NAME').AsString:=ds.FieldByName('NAME').AsString;
            dmBase.tbSostavSem.FieldByName('OTCH').AsString:=ds.FieldByName('OTCH').AsString;
            dmBase.tbSostavSem.FieldByName('POL').AsString:=ds.FieldByName('POL').AsString;
            dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger:=nID;  // старый хозяин очереди становиться в состав семьи
            if not ds.FieldByName('DATER').IsNull then dmBase.tbSostavSem.FieldByName('DATER').AsDateTime:=ds.FieldByName('DATER').AsDateTime;
          end;
          dmBase.tbSostavSem.Post;
        end;
        // поменяем хозяина очереди
        dmBase.tbOchered.Edit;
        dmBase.tbOchered.FieldByName('ID').AsInteger:=nNewID;
        dmBase.tbOchered.Post;
        // поменяем хозяина очереди в дополнительных очередях если он там есть
        Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_TYPEOCHERED');
        for n:=0 to Opis.KeyList.Count-1 do begin
          if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([Opis.KeyList.Strings[n],nID]),[]) then begin
            dmBase.tbOchered.Edit;
            dmBase.tbOchered.FieldByName('ID').AsInteger:=nNewID;
            dmBase.tbOchered.Post;
          end;
        end;

        ds:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nNewID));
        ds.Edit;
        ds.FieldByName('OCHERED').AsBoolean:=true;   // теперь новый в очереди
        ds.Post;
        lOk:=true;
      end;
    end;
  end;
  sl.Free;
  slID.Free;
  slBookmark.Free;
  if lOk then begin
    Refresh(false);
    Application.ProcessMessages;
    SetListParEditForm;
    try
      if fmMain.EditDokument(dmBase.tbMens, TypeEditObj,'ID', FListPar,false, KodGurnal) then begin

      end;
    finally
      FListPar.Clear;
    end;
    Refresh(false);
  end;
end;

//---------- разделить очередь ---------------------------------
procedure TfmGurnOchered.Event_RunRazdelOchered(Sender: TObject);
var
  i,nID,nNewID : Integer;
  s,ss : String;
  sl : TStringList;
  slID : TStringList;
  slBookmark : TStringList;
  ds:TDataSet;
  arrRec:TCurrentRecord;
begin
  if FTypeOchered<>0 then begin
    ShowMessage('Режим доступен только для общей очереди.');
    exit;
  end;
  nID := Query.FieldByName('ID').AsInteger;
  sl:=TStringList.Create;
  slID:=TStringList.Create;
  slBookmark:=TStringList.Create;
  dmBase.tbSostavSem.IndexName := 'PR_KEY';
  dmBase.tbSostavSem.SetRange([nID],[nID]);
  while not dmBase.tbSostavSem.Eof do begin
    if dmBase.tbSostavSem.FieldByName('FAMILIA').AsString<>'' then begin
      s:='';
      if dmBase.tbSostavSem.FieldByName('OTNOSH').AsString<>'' then begin
        s:=ANSILowerCase(dmBase.SeekValueTable2(dmBase.SprOtnosh,'ID',dmBase.tbSostavSem.FieldByName('OTNOSH').AsString,'NAME'))+' ';
      end;
      s:=s+Trim(dmBase.tbSostavSem.FieldByName('FAMILIA').AsString)+' '+
           Trim(dmBase.tbSostavSem.FieldByName('NAME').AsString)+' '+
           Trim(dmBase.tbSostavSem.FieldByName('OTCH').AsString);
      ss:='';
      if not dmBase.tbSostavSem.FieldByName('DATER').IsNull then begin
        ss:=' '+FormatDateTime('dd.mm.yyy',dmBase.tbSostavSem.FieldByName('DATER').AsDateTime);
      end;
      sl.Add(s+ss);
      slID.Add(dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsString);
      slBookmark.Add(dmBase.tbSostavSem.Bookmark);
    end;
    dmBase.tbSostavSem.Next;
  end;
  dmBase.tbSostavSem.CancelRange;
  if sl.Count=0 then begin
    PutError('В составе семьи нет ни одного человека.');
  end else begin
    i:= ChoiceFromList(sl,'Выберите человека');
    if i>-1 then begin
      nNewID := StrToInt(slID.Strings[i]);      // ID нового хозяина очереди
      if dmBase.tbOchered.Locate('OCHERED_ID;ID',VarArrayOf([0,nID]),[]) then begin
        // удалим из состава семьи
        dmBase.tbSostavSem.Bookmark:=slBookmark[i];
        dmBase.tbSostavSem.Delete;
        // умеьшим на 1 количественный состав семьи
        dmBase.tbOchered.Edit;
        dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger:=dmBase.tbOchered.FieldByName('KOLVO_SOSTAV').AsInteger-1;
        dmBase.tbOchered.Post;
        // создадим для нового такую же очередь
        GetCurrentRecord(dmBase.tbOchered,'',arrRec);
        SetValueField(arrRec,'ID',nNewID);
        SetValueField(arrRec,'KOLVO_SOSTAV',1);
        AddCurrentRecord(dmBase.tbOchered,arrRec);
        // установим, что он теперь в очереди
        ds:=dmBase.GetMen(dmBase.GetDateCurrentSost,IntToStr(nNewID));
        ds.Edit;
        ds.FieldByName('OCHERED').AsBoolean:=true;   // теперь новый в очереди
        ds.Post;
      end;
    end;
  end;
  sl.Free;
  slID.Free;
  slBookmark.Free;
  if nID > 0 then begin
    Refresh(false);
  end;
end;

procedure TfmGurnOchered.Event_ReindexOchered(Sender: TObject);
begin
  ReindexOchered(false);
end;

procedure TfmGurnOchered.ReindexOchered(lFix:Boolean);
var
  s : String;
  n : Integer;
  st : TSostTable;
begin
  s := '';
  s := s + 'ВНИМАНИЕ!'#13; // + Chr(13)+
  s := s + 'Если Вы уверены в необходимости проведения ПЕРЕНУМЕРАЦИИ,'+#13;
  s := s + 'для очереди: '+ANSIUpperCase(cbTypeOchered.Items[cbTypeOchered.ItemIndex])+','+#13;
  s := s + 'введите слово ДА в поле ввода.'#13;
  s := s + 'Исключенные из очереди не будут нумероваться.'#13;
  if OkWarning(s) then begin
//  if Problem(' Перенумеровать очередь ? ') then begin
    OpenMessage('Перенумерация ...','',0);
    SaveSostTable(dmBase.tbOchered,true,true);
    try
      dmBase.AdsConnection.Execute('UPDATE Ochered SET old_nomer=nomer_och where id_base=0 and ochered_id='+IntToStr(FTypeOchered));
      with dmBase.tbOchered do begin
        IndexName := 'RENUMBER_KEY';     // OCHERED_ID;SIMPLE;DEC_DATE;DEC_TIME;OLD_NOMER       !!! SIMPLE !!!  если внеочередное, то SIMPLE=0
        SetRange([FTypeOchered],[FTypeOchered]);
        Filter:='id_base=0';
        Filtered:=true;
        First;
        n:=1;
        while not Eof do begin
          Edit;
          if (FTypeOchered=0) and (FieldByName('ONLY').AsBoolean=true) then begin
            // для исключения из перенумерации людей стоящих только в отдельной очереди
            FieldByName('NOMER_OCH').AsString:='';
          end else begin
            if FieldByName('ISKL').AsBoolean then begin
              FieldByName('NOMER_OCH').AsString:='';
            end else begin
              if lFix then begin
                FieldByName('OLD_NOMER').AsInteger:=n;
              end;
              FieldByName('NOMER_OCH').AsInteger:=n;
              Inc(n);
            end;
          end;
          Post;
          Next;
        end;
        CancelRange;
        Filter:='';
      end;
    finally
      RestSostTable(dmBase.tbOchered,st);
      CloseMessage();
    end;
    Refresh;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.Event_DeleteIskMens(Sender: TObject);
var
  f  : TfmParamQuest;
  dDate1, dDate2 : TDateTime;
  n : Integer;
  st,st1 : TSostTable;
  slDel:TStringList;
begin
  if FTypeOchered<>0 then begin
    PutError('Удаление возможно только для общей очереди.',self);
    exit;
  end;
//  if EnableLoadOch then begin      // можно загружать других очередников
//    if (CurBase<>0)  then begin
//      PutError('Удаление возможно только для собственных очередников.',self);
//      exit;
//    end;
//  end;
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Удалить исключенных';
//  f.StepY:=17;
//  f.Flat:=false;
//  f.AddParamEx(1  , 'Налог'               , 'NALOG','TYPE=LOOKUP~DESC=LOOKUP_NALOGI~WIDTH=250');
//  f.AddParamEx(n      , 'За какой год'    , 'YEAR'    ,'TYPE=LIST~DESC=KEY_YEARS');
  f.AddParamEx(Now    , 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(Now    , 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
//  f.AddParamEx('EMPTY', 'Срок оплаты'     , 'SROK'    ,'TYPE=DATE');
//  f.AddParamEx(GlobalTask.ParamAsFloat('STAVKA_ZEM'), 'Ставка земельного налога' , 'STAVKA','FORMAT=###');
//  f.AddParamEx(0, 'Сумма', '4','FORMAT=### ### ### ###.##');
//  f.AddParamEx(2, 'List', '4','TYPE=LIST~DESC=KEY_TYPE_OBJ~WIDTH=100');
//  f.AddParamEx(6, 'Spr', '5','TYPE=SPR~DESC=LOOKUP_EDIZM~WIDTH=50~DOPSHOW=NAME');
//  f.AddParamEx(8, 'LookUp', '11','TYPE=LOOKUP~DESC=LOOKUP_EDIZM~WIDTH=350');
  f.AddButtons('Выполнить~Отказ',0);
  n  := f.ShowQuest;
  dDate1:= f.GetValue('DATE1','D');
  dDate2:= f.GetValue('DATE2','D');
  f.Free;
  if n = 1 then begin
    OpenMessage('Удаление исключенных ...','',10);
    st:=SaveSostTable(dmBase.tbOchered,true,true);
    st1:=SaveSostTable(dmBase.tbOcheredResh,true,true);
    dmBase.tbOcheredResh.IndexName:='AUTO_KEY';
    slDel:=TStringList.Create;
    with dmBase.tbOchered do begin
      IndexName:='PR_KEY';
      SetRange([FTypeOchered],[FTypeOchered]);
      Filter:='id_base=0';
      Filtered:=true;
      First;
      while not Eof do begin
        if FieldByName('ISKL').AsBoolean and (FieldByName('ID_SN_RESH').AsInteger>0) then begin
          if dmBase.tbOcheredResh.FindKey([FieldByName('ID_SN_RESH').AsInteger]) then begin
            if not dmBase.tbOcheredResh.FieldByName('DATER').IsNull and
               ( (dmBase.tbOcheredResh.FieldByName('DATER').AsDateTime>=dDate1) and
                 (dmBase.tbOcheredResh.FieldByName('DATER').AsDateTime<=dDate2) ) then begin
              slDel.Add(FieldByName('ID').AsString);
            end;
          end;
        end;
        Next;
      end;
      Filter:='';
      CancelRange;
      if slDel.Count>0  then begin
        for n:=0 to slDel.Count-1 do begin
          {$IFDEF OCHERED}
          // для программы "очередники" необходимо полностью удалять человека
            dmBase.DeleteMen( STOD(CURRENT_SOST,tdAds), slDel.Strings[n], true, false);
          {$ELSE}
            dmBase.DeleteOch( dmBase.GetDateCurrentSost, slDel.Strings[n]);
          {$ENDIF}
        end;
      end;
    end;
    slDel.Free;
    RestSostTable(dmBase.tbOchered,st);
    RestSostTable(dmBase.tbOcheredResh,st1);
    CloseMessage;
    Refresh;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.Event_CreateResh(Sender: TObject);
begin
  RunTemplate('OCHERED.CreateReshOch');
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.Event_InitFields(Sender: TObject);
var
  lFilter : Boolean;
begin
  if TBItemClrFlt.Enabled or Query.Filtered then begin
    lFilter := true;
  end else begin
    lFilter := false;
  end;
  if RunInitRekvisit(Self, Query, dmBase.tbMens, 'DATE_FIKS;ID', lFilter, 'OCHERED') then Refresh(true);
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.Event_SetLastReshIsp(Sender: TObject);
begin
//      Filter:='id_base=0';

//
end;

//----------------------------------------------------------------------------------
procedure TfmGurnOchered.edTypeSeekChange(Sender: TObject);
begin
  FRun:=true;
  try
    edSeek.Hint:=GetHintSeek(edTypeSeek.ItemIndex);
    edSeek.Text:='';
    if FSeekAsQuery_Active then begin
      setAdditiveFilter;
    end;
    ActiveControl:=edSeek;
  finally
    FRun:=false;
  end;
end;

procedure TfmGurnOchered.edSeekChange(Sender: TObject);
begin
  if (Trim(edSeek.Text)='') and not FRun then begin
    SetAdditiveFilter;
    ActiveControl:=edSeek;
  end;    
end;

procedure TfmGurnOchered.edSeekEnter(Sender: TObject);
begin
  if (edTypeSeek.ItemIndex=TYPESEEK_IN) or (edTypeSeek.ItemIndex=TYPESEEK_BTI) or (edTypeSeek.ItemIndex=TYPESEEK_VOZR) then begin
    ActivateENGKeyboard;
  end else begin
    ActivateRUSKeyboard;
  end;
end;
procedure TfmGurnOchered.edSeekExit(Sender: TObject);
begin
  ActivateRUSKeyboard;
end;

//----------------------------------------------------------------------------------
procedure TfmGurnOchered.ClearSeek;
begin
  FRun:=true;
  edSeek.Text:='';
  FRun:=false;
  setAdditiveFilter;
end;
//----------------------------------------------------------------------------------
procedure TfmGurnOchered.Fgu(Sender: TObject;  var Handled: Boolean);
begin
  ClearSeek;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.Event_VklMens(Sender: TObject);
begin
  FVklMens := not FVklMens;
  CreateAdditiveWhere(getAdditiveWhere);
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.GridColumnsSostavSem(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ID,IDMember : Integer;
  st : TSostTable;
  lFindIDMen:Boolean;
  sSostav,s,ss,sDateR,sPasp:String;
  pasp:TPassport;
begin
  if FVisibleListMens and (Query.FieldByName('ID').AsString<>'') then begin
    ID:=Query.FieldByName('ID').AsInteger;
    dmBase.tbSostavSem.IndexName := 'PR_KEY';
    dmBase.tbSostavSem.SetRange([ID],[ID]);
    sSostav:='';
    while not dmBase.tbSostavSem.Eof do begin
      // если добавлять длядей, которые только для БТИ или человек не только для БТИ
      if FAddBTI or not dmBase.tbSostavSem.FieldByName('ISKL').AsBoolean then begin
        IDMember := dmBase.tbSostavSem.FieldByName('MEMBER_ID').AsInteger;
        lFindIDMen:=false;
        s:='';
        if FAddOtnosh then begin
          if dmBase.SprOtnosh.Locate('ID',dmBase.tbSostavSem.FieldByName('OTNOSH').AsInteger,[])
            then ss:=ANSILowerCase(dmBase.SprOtnosh.FieldByName('NAME').AsString)+' '
            else ss:='';
        end;
        sPasp:='';
        if IDMember>0 then begin
          st := SaveSostTable(dmBase.tbMens, true, false);
          if dmBase.tbMens.Locate('DATE_FIKS;ID', VarArrayOf([DateFiks,IDMember]), []) then begin
            lFindIDMen:=true;
            with dmBase.tbMens do begin
              s:=Trim(FieldByName('FAMILIA').AsString)+' '+Trim(FieldByName('NAME').AsString)+' '+Trim(FieldByName('OTCH').AsString);
              if FAddDateR then begin
                if FieldByName('DATER').IsNull
                  then sDateR:=''
                  else sDateR:=' '+FormatDateTime('dd.mm.yyyy', FieldByName('DATER').AsDateTime);
              end;
              if FAddPasp then begin
                if FieldByName('PASP_NOMER').AsString='' then begin
                  sPasp:=''
                end else begin
                  pasp:=dmBase.PasportMen(DateFiks,IntToStr(IDMember));
                  sPasp:=', '+dmBase.PasportToText(pasp,0);
                end;
              end;
            end;
          end;
          RestSostTable(dmBase.tbMens, st);
        end;
        //----- если человека не нашли, или его и не должно быть в базе населения ---
        if not lFindIDMen then begin
          if dmBase.tbSostavSem.FieldByName('FAMILIA').AsString=''
            then s:='---'
            else s:=Trim(dmBase.tbSostavSem.FieldByName('FAMILIA').AsString)+' '+Trim(dmBase.tbSostavSem.FieldByName('NAME').AsString)+' '+
                    Trim(dmBase.tbSostavSem.FieldByName('OTCH').AsString);
          if FAddDateR then begin
            if dmBase.tbSostavSem.FieldByName('DATER').IsNull
              then sDateR:=''
              else sDateR:=' '+FormatDateTime('dd.mm.yyyy', dmBase.tbSostavSem.FieldByName('DATER').AsDateTime);
          end;
        end;
        sSostav:=sSostav+ss+s+sDateR+sPasp+' '+#13#10;
        //---------------------------------------------------------------------------
      end;
      dmBase.tbSostavSem.Next;
    end;
    if sSostav<>'' then sSostav:=Copy(sSostav,1,Length(sSostav)-2);
    dmBase.tbSostavSem.CancelRange;
    Params.Text := sSostav;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.GridColumnsGetPaspVidan(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('ID').AsString<>'' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'PASP_VIDAN', ftMemo);
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('DOLG_SPR').AsString='' then begin
    Params.Text := Query.FieldByName('DOLG_NAME').AsString;
  end else begin
    if dmBase.SprDolg.Locate('ID', Query.FieldByName('DOLG_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprDolg.FieldByName('NAME').AsString;
    end
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('WORK_SPR').AsString='' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'WORK_NAME', ftMemo);
  end else begin
    if dmBase.SprWork.Locate('ID', Query.FieldByName('WORK_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprWork.FieldByName('NAME').AsString;
    end
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  SetColorRowGridMen(AFont,Background,Query);
{
  if Query.Active then begin
    inherited;
    if not Query.FieldByName('CANDELETE').IsNull and Query.FieldByName('CANDELETE').AsBoolean then begin
      AFont.Color := Grid.Color1; //  clRed;
    end else begin
      if not Query.FieldByName('PROPIS').IsNull and (Query.FieldByName('PROPIS').AsBoolean=false) then begin
        AFont.Color := $00319D31; //Grid.Color1; // clMaroon; //clGreen; //Grid.NewRowColor;
      end else if not Query.FieldByName('PRESENT').IsNull and (Query.FieldByName('PRESENT').AsBoolean=false) then begin
        AFont.Color := clBlue; // Grid.Color2; ;
      end;
    end;
  end;
}  
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.TBItemLgotClick(Sender: TObject);
var
  strSeek : String;
  strSQL  : String;
begin
  strSeek := RunMensSeek(tsLgot, true, FID, '');
  if Length(strSeek)>0 then begin
    strSeek := FFilterJurnal.GetDefaultWhere+' and ' + strSeek;
    strSQL  := ChangeWhere( Query.SQL.Text, strSeek, false);
    FNewSQL := strSQL;
    Refresh;
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.TBItemPriznClick(Sender: TObject);
var
  strSeek : String;
  strSQL  : String;
begin
  strSeek := RunMensSeek(tsPrizn, true, FID, '');
  if Length(strSeek)>0 then begin
    strSeek := FFilterJurnal.GetDefaultWhere+' and ' + strSeek;
    strSQL  := ChangeWhere( Query.SQL.Text, strSeek, false);
    FNewSQL := strSQL;
    Refresh;
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.DBTextGetText(Sender: TObject; var Text: String);
begin
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.TBItemEditLicClick(Sender: TObject);
begin
  {$IFNDEF OCHERED}
  if fmMain.EditDokument(Query, dmBase.TypeObj_Lich,'LIC_ID',nil,true,KodGurnal) then begin
//    Refresh;
  end;
  {$ENDIF}
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.AddUpdateActions;
begin
  {$IFNDEF OCGERED}
  if Query.Eof and Query.Bof then begin
    TBItemEditLic.Enabled:=false;
  end else begin
    TBItemEditLic.Enabled:=true;
  end;
  {$ENDIF}
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.SetListParEditForm;
begin
  inherited;
  FListPar.Add('ENABLEOCHERED=1');
  FListPar.Add('ENABLEVUS=0');
  FListPar.Add('PAGEINDEX=tsOchered');
end;

//-----------------------------------------------------------------------------------------
// регистрация в очереди
procedure TfmGurnOchered.TBItemAddClick(Sender: TObject);
var
  v : Variant;
  arrRec : TCurrentRecord;
  old : TCursor;
  lOk,lSeek : Boolean;
  Params:TParamsChoiceMen;
begin
  Params:=TParamsChoiceMen.Create;
  {$IFDEF OCHERED}
    Params.lEnabledAddMen:=true;
  {$ELSE}
    Params.lEnabledAddMen:=false;
  {$ENDIF}
  if ChoiceMenEx( nil, '', 'Empty(OCHERED) or OCHERED=.F.', arrRec, Params) then begin
    old := Screen.Cursor;
    v := GetValueField(arrRec, 'ID');
    if v=0 then begin
//      TBItemAddNewMenClick(Sender);
    end else begin
      Screen.Cursor := crHourGlass;
      lOk:=dmBase.AddMenToOchered(v,lSeek);
      Screen.Cursor := old;
      if lOk then begin
        SetListParEditForm;
        try
          if fmMain.EditDokument(dmBase.tbMens, TypeEditObj,'ID', FListPar,false, KodGurnal) then begin

          end;
        finally
          FListPar.Clear;
        end;
        Refresh(false);
      end else begin
        if lSeek then begin
//          Query.Refresh;
//          Query.Locate('ID',v,[]);
        end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------
procedure TfmGurnOchered.TBItemAddNewMenClick(Sender: TObject);
begin
//  ExecOneReport('KartOchered', true, Query.FieldByName('ID').AsString, self);  // ID=52
  FListPar.Clear;
  FListPar.Add('MEN_NOTPROPIS=1');
  FListPar.Add('MEN_ADD=1');
  FListPar.Add('NEW_NOMER_OCH=1');     // при открытии формы атоматически сформировать новый номер очереди
  try
    if fmMain.EditDokument(Query, TypeEditObj,'ID', FListPar,true,KodGurnal) then begin
      Refresh(false);
    end;
  finally
    FListPar.Clear;
  end;
end;
//--------------------------------------------------------------------------
function TfmGurnOchered.GetPropertyDef(sName: String; var vVal:Variant): Boolean;
var
  s1,s2:String;
begin
  Result:=false;
  if sName='TYPEFILTER' then begin
    Result:=true;
    vVal:=-1;
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      vVal:=edTypeSeek.ItemIndex;
    end;
  end else if sName='VALUEFILTER' then begin
    Result:=true;
    vVal:='';
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      vVal:=edSeek.Text;
    end;
  end else if sName='VALUEFILTER1' then begin
    Result:=true;
    vVal:='';
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      if (edTypeSeek.ItemIndex=TYPESEEK_LASTRESH) then begin  // номер последнего решения
        CheckValueFilter(TYPESEEK_LASTRESH, edSeek.Text, s1,s2);
        vVal:=s1;
      end;
    end;
  end else if sName='VALUEFILTER2' then begin
    Result:=true;
    vVal:='';
    if FSeekAsQuery_Active and (edTypeSeek.ItemIndex>-1) then begin
      if (edTypeSeek.ItemIndex=TYPESEEK_LASTRESH) then begin  // номер последнего решения
        CheckValueFilter(TYPESEEK_LASTRESH, edSeek.Text, s1,s2);
        vVal:=s2;
      end;
    end;
  end;
end;

//----------------------------------------------------------------
function TfmGurnOchered.getDefaultAddWhere: String;
begin
  Result:=getAdditiveWhere;
end;
//-----------------------------------------------------------------------------------------
function TfmGurnOchered.getAdditiveWhere : String;
var
 s : String;
begin
  Result:='';
  {$IFNDEF OCHERED}
//    Result:='n.date_fiks='+DateToSQL(fmMain.DateFiks);
  {$ENDIF}
  if GetCurBase>-1 then begin
    if Result=''
      then Result:='oc.id_base='+InttoStr(GetCurBase)
      else Result:=Result+' and oc.id_base='+InttoStr(GetCurBase);
  end;
  if Result=''
    then Result:='oc.ochered_id='+IntToStr(FTypeOchered)
    else Result:=Result+' and oc.ochered_id='+IntToStr(FTypeOchered);
  case FTypeISKL of
    0 : s:='';
    1 : s:=' and (oc.iskl=false or oc.iskl is null)';
    2 : s:=' and oc.iskl=true';
  end;
  Result:=Result+s;
  if FSeekAsQuery and FSeekAsQuery_Active then begin
    Result:=Result+' and oc.id in (select id from '+GetNameTmpIdTable+')';
  end;
  Result:=Result+' and (oc.OCHERED_ID>0 or oc.ONLY=false)';

  if Result='' then begin
    Result:=FFilter_Punkt;
  end else begin
    if FFilter_Punkt<>'' then begin
      Result:=Result+' and '+FFilter_Punkt;
    end;
  end;

end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.SetQueryParam(p: TParam);
var
  l1,l2 : Boolean;
  b1:Integer;
begin
  l1:=false;
  l2:=false;
  if not SetQueryParamDef(p) then begin
    if UpperCase(p.Name)='TYPEOCHERED' then begin
//      p.DataType:=ftInteger;
//      p.ParamType:=ptInput;
      p.AsInteger:=FTypeOchered;
    end else if Copy(UpperCase(p.Name),1,4)='ISKL' then begin
      case FTypeISKL of
        0 : begin   // все       oc.ISKL=true or true=true
              l1:=true;
              l2:=true;
            end;
        1 : begin   // не искл.  oc.ISKL=false or true=false
              l1:=false;
              l2:=false;
            end;
        2 : begin   // искл.     oc.ISKL=true or true=false
              l1:=true;
              l2:=false;
            end;
      end;
      if Copy(p.Name,5,1)='1' then begin
        p.AsBoolean:=l1;
      end else begin
        p.AsBoolean:=l2;
      end;
    end else if Copy(UpperCase(p.Name),1,4)='BASE' then begin
      if GetCurBase=-1 then begin
        b1:=-1;
        l2:=true;
      end else begin
        b1:=GetCurBase;
        l2:=false;
      end;
      if Copy(p.Name,5,1)='1' then begin
        p.AsInteger:=b1;
      end else begin
        p.AsBoolean:=l2;
      end;
    end else if UpperCase(p.Name)='ADD_ID' then begin
      if FSeekAsQuery then begin
        p.AsBoolean:=not FSeekAsQuery_Active;
      end else begin
        p.AsBoolean:=true;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.cbTypeOcheredChange(Sender: TObject);
var
  s:String;
begin
  SetTypeOchered(cbTypeOchered.ItemIndex);
  s:=CreateAdditiveWhere(getAdditiveWhere);
  if s<>'' then begin
    FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
  end;
  FullRefresh;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.cbTypeISKLChange(Sender: TObject);
var
  s:String;
begin
  FTypeISKL:=cbTypeISKL.ItemIndex;
  s:=CreateAdditiveWhere(getAdditiveWhere);
  if s<>'' then begin
    FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
  end;
  FullRefresh;
end;
//------------------------------------------------------------------------
procedure TfmGurnOchered.TBItemClearSourceClick(Sender: TObject);
var
  s:String;
begin
  SetCurBase(-1);
  FSysFltCaption:='';
  SetCaptionGurnal;
  s:=CreateAdditiveWhere(getAdditiveWhere);
  if s<>'' then begin
    FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
  end;
  FullRefresh;
end;
//------------------------------------------------------------------------
procedure TfmGurnOchered.TBItemMySourceClick(Sender: TObject);
var
  s:String;
begin
  SetCurBase(0);
  FSysFltCaption:=' ( '+MyKNAME+' ) ';
  SetCaptionGurnal;
  s:=CreateAdditiveWhere(getAdditiveWhere);
  if s<>'' then begin
    FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
  end;
  FullRefresh;
end;
//--------------------------------------------------------------------------
procedure TfmGurnOchered.TBSubmenuSourceClick(Sender: TObject);
var
  sName,s:String;
  nbase:Integer;
begin
  nBase:=GetCurBase;
  sName:=ChoiceBase(nBase);
  if sName<>'' then begin
    FSysFltCaption:=' ( '+sName+' ) ';
    if nBase=GlobalTask.ParamAsInteger('ID') then begin
      setCurBase(0);
    end else begin
      setCurBase(nBase);
    end;
    if getCurBase>-1 then begin
      s:=CreateAdditiveWhere(getAdditiveWhere);
      if s<>'' then begin
        FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
      end;
      SetCaptionGurnal;
      FullRefresh;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.GridColumnsISKOSNOV(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Query.FieldByName('ISK_OSNOV').AsString<>'' then begin
      if dmBase.SprSnOch.Locate('ID', Query.FieldByName('ISK_OSNOV').AsInteger,[]) then begin
        Params.Text:=dmBase.SprSnOch.FieldByName('NAME').AsString;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.GridColumnsREGOSNOV(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s1,s2:String;
begin
  if not EditMode then begin
    s1:=GetNameOsnOch(Query.FieldByName('REG_OSNOV').AsString, Query.FieldByName('REG_OSNOV_TEXT').AsString,
                      Query.FieldByName('TYPE_RESH').AsInteger,OCH_OSN_KRAT);
    s2:=GetNameOsnOch(Query.FieldByName('REG_OSNOV2').AsString, Query.FieldByName('REG_OSNOV_TEXT2').AsString,
                      Query.FieldByName('TYPE_RESH').AsInteger,OCH_OSN_KRAT);
    if s2<>'' then begin
      if s1=''
        then s1:=s2
        else s1:=s1+', '+s2;
    end;
    Params.Text:=s1;
  end;
end;

procedure TfmGurnOchered.GridColumnsSOBSTV(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
//var
//  s1,s2:String;
begin
  if not EditMode then begin

    Params.Text:='';
  end;
end;

//-----------------------------------------------------------------------------------------
function TfmGurnOchered.CheckDelete(var strErr : string; var lQuest:Boolean; arr:TArrStrings) : Boolean;
begin
  lQuest:=true;
  if (Query.FieldByName('OCHERED_ID').AsInteger<>0) and (Query.FieldByName('ONLY').AsBoolean=false) then begin
    strErr:='Удалять можно только из общей очереди.';
    Result:=false;
  end else begin
    strErr:='';
    Result:=true;
  end;
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.BeforeReport;
begin
  inherited BeforeReport;
  GlobalTask.SetLastValueAsInteger('TYPE_OCHERED', FTypeOchered);
  GlobalTask.SetLastValueAsInteger('TYPE_ISKL', FTypeISKL);
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.TBItemTypeMensClick(Sender: TObject);
var
  f : TfmTypeMensOchered;
begin
  f := TfmTypeMensOchered.Create(nil);
  f.cbLgot.Checked:=FVisibleLgot;
  f.cbSobstv.Checked:=FVisibleSobstv;
  f.cbListMens.Checked:=FVisibleListMens;
  f.cbOtnosh.Checked:=FAddOtnosh;
  f.cbDateR.Checked:=FAddDateR;
  f.cbPasp.Checked:=FAddPasp;
  f.cbAddBTI.Checked:=FAddBTI;
  if f.ShowModal=mrOk then begin
    FVisibleListMens:=f.cbListMens.Checked;
    FVisibleLgot:=f.cbLgot.Checked;
    FVisibleSobstv:=f.cbSobstv.Checked;
    FAddOtnosh:=f.cbOtnosh.Checked;
    FAddDateR:=f.cbDateR.Checked;
    FAddPasp:=f.cbPasp.Checked;
    FAddBTI:=f.cbAddBTI.Checked;
    Grid.FieldColumns['SOSTAV_SEM'].Visible:=FVisibleListMens;
    Grid.FieldColumns['LGOT'].Visible:=FVisibleLgot;
    Grid.FieldColumns['SOBSTV'].Visible:=FVisibleSobstv;
  end;
  f.Free;

end;

procedure TfmGurnOchered.SetTypeOchered(n: Integer);
begin
  FTypeOchered:=n;
  if TBItemRazdel<>nil then begin
    TBItemRazdel.Enabled:=(FTypeOchered=0);
    TBItemPereof.Enabled:=(FTypeOchered=0);
  end;
end;

procedure TfmGurnOchered.edSeekKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (Key=VK_RETURN) and (Shift=[]) then begin
    SetAdditiveFilter;
  end else if (Key=VK_TAB) and (Shift=[]) then begin
    ActiveControl := Grid;
    Key:=0;
  end;
end;

procedure TfmGurnOchered.FormCreate(Sender: TObject);
var
  s:String;
begin
  inherited;
  s:=GlobalTask.ParamAsString('NAME_DELO');
  if s='' then s:='Номер дела';
  edTypeSeek.Items.Add(s);                         // 4  TYPESEEK_DELO
  edTypeSeek.Items.Add('Номер посл. реш. за год'); // 5  TYPESEEK_LASTRESH
  edTypeSeek.Items.Add('Собственность из БТИ');    // 6  TYPESEEK_BTI
  edTypeSeek.Items.Add('Количество в составе');    // 7  TYPESEEK_VOZR
  edTypeSeek.Items.Add('Есть проекты решений');    // 8  TYPESEEK_PLAN
end;
//--------------------------------------------------------------------------------------------
procedure TfmGurnOchered.edSeekEditButtonsBeginClick(Sender: TObject; var Handled: Boolean);
begin
  SetAdditiveFilter;
end;

//--------------------------------------------------------------------------------------------
function TfmGurnOchered.CheckValueFilter(nType:Integer;strFilter:String; var s1,s2:String):Boolean;
var
  n:Integer;
begin
  Result:=true;
  n:=Pos('?',strFilter);
  if n=0 then n:=Pos('*',strFilter);
  if n=0 then n:=Pos('+',strFilter);

  if n>0 then begin
    s1:=Copy(strFilter,1,n-1);
    try
      s2:=IntToStr(StrToInt(Copy(strFilter,n+1,Length(strFilter))));
    except
      s2:='';
      Result:=false;
    end;
  end else begin
    s1:=strFilter;
    s2:=IntToStr(YearOf(Now));
  end;
end;

//--------------------------------------------------------------------------------------------
function TfmGurnOchered.getIDForTmpTable(nType:Integer;strFilter:String):Boolean;
var
  slSQL:TStringList;
  sFam,sName,sOper,sOp,s1,s2,sNot:String;
  sMonth, sYear:String;
  n:Integer;
  function getWhere(sFam,sName:String):String;
  begin
    if sOper='*' then Result:='FAMILIA LIKE '+QStr(sFam+'%')
                 else Result:='FAMILIA='+QStr(sFam);

    if sName<>'' then begin
      if sOper='*' then Result:=Result+' and NAME LIKE '+QStr(sName+'%')
                   else Result:=Result+' and NAME='+QStr(sName);

    end;
  end;
begin
  Result:=false;
  OpenMessage('    Поиск ...     ','',10);
  sNot:='';
  try
    slSQL:=TStringList.Create;
    slSQL.Add('DELETE FROM &tmp&;');
    sOper:=Copy(strFilter,1,1);
//    if (sOper='=') or (sOper='<') or (sOper='>') or (sOper='*')
    if (sOper='=') or (sOper='*') or (sOper='<') or (sOper='>') or (sOper='-')
      then strFilter:=Copy(strFilter,2,Length(strFilter))
      else sOper:='*';

    n:=Pos(' ',strFilter);

    if n>0 then begin
      sFam:=Copy(strFilter,1,n-1);
      sName:=Copy(strFilter,n+1,30);
    end else begin
      sFam:=strFilter;
      sName:='';
    end;
    if (nType=TYPESEEK_FIO) or (nType=TYPESEEK_FIO_SS) then begin
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Население WHERE '+getWhere(sFam,sName)+';');
      if (nType=TYPESEEK_FIO_SS) then begin   // + состав семьи
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM SostavSem WHERE '+getWhere(sFam,sName)+';');
      end;
      if GlobalTask.ParamAsBoolean('SEEK_WITH_HIST') then begin
        if sOper='*' then s1:='VALUE LIKE '+QStr(sFam+'%')
                     else s1:='VALUE='+QStr(sFam);
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM HistoryZags WHERE '+
                  'typeobj='+IntToStr(_TypeObj_Nasel)+' and fieldname='+QStr('FAMILIA')+' and '+s1+';');
      end;
    end else if (nType=TYPESEEK_PLAN) then begin        // личный номер
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM OcheredResh WHERE plan=true and ochered_id='+IntToStr(FTypeOchered)+';');
    end else if (nType=TYPESEEK_IN) then begin        // личный номер
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Население WHERE LICH_NOMER='+QStr(strFilter)+';');
    end else if (nType=TYPESEEK_IN_SS) then begin        // личный номер + состав семьи
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Население WHERE LICH_NOMER='+QStr(strFilter)+';');
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM SostavSem WHERE LICH_NOMER='+QStr(strFilter)+';');
    end  else if (nType=TYPESEEK_DELO) then begin     // номер дела
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT ID FROM Ochered WHERE DELO='+QStr(strFilter)+';');
    end else if (nType=TYPESEEK_LASTRESH) then begin  // номер последнего решения
      CheckValueFilter(TYPESEEK_LASTRESH, strFilter, s1,s2);
      slSQL.Add('INSERT INTO &tmp& (ID) SELECT oc.ID FROM Ochered oc LEFT JOIN OcheredResh ocr ON oc.id_last_resh=ocr.auto_id WHERE ocr.NOMER='+QStr(s1)+' and Year(ocr.DATER)='+s2+';');
    end else if (nType=TYPESEEK_BTI) then begin       // есть собственность из БТИ
      if (sOper='-') then begin
        sNot:=' not ';
        s1:='';
      end else begin
        if IsAllDigitEx(Trim(strFilter),1) and (Trim(strFilter)<>'') then begin
          if (sOper='*') or (sOper='=') or (sOper='')
            then sOp:='='
            else sOp:=sOper;
          n:=Pos('.', strFilter);
          if n=0 then begin
            s1:=' where Year(dater)'+sOp+strFilter;
          end else begin
            sMonth:=Copy(strFilter,1,n-1);
            sYear:=Copy(strFilter,n+1,20);
            s1:=' where Year(dater)'+sOp+sYear+' and Month(dater)'+sOp+sMonth;
          end;
        end else begin
          s1:='';
        end;
      end;
      s2:=' insert into &tmp& (ID) SELECT ID FROM ochered where id '+sNot+'in ( '#13+
          '   select distinct id from ( '+
          '   select id from sostavsem where member_id in (select id from НаселениеСобств '+s1+' ) '#13+
          '     union all '#13+
          '   select id from ochered where id in (select id from НаселениеСобств '+s1+') ) aaa);';
      slSQL.Add(s2);
    end else if (nType=TYPESEEK_VOZR) then begin
      if sOper='*' then  sOper:='=';
      if IsAllDigitEx(strFilter,0) and (strFilter<>'') and (sOper<>'-') then begin
        if FVozrast2=FVozrast1 then begin
          s1:='GetVozrast(curdate(),dater)='+InttoStr(FVozrast1);
        end else if FVozrast1<=0 then begin
          s1:='GetVozrast(curdate(),dater)<='+InttoStr(FVozrast2);
        end else if (FVozrast2=0) and (FVozrast1>0) then begin
          s1:='GetVozrast(curdate(),dater)>='+InttoStr(FVozrast1);
        end else begin
          s1:='GetVozrast(curdate(),dater)>='+InttoStr(FVozrast1)+' and GetVozrast(curdate(),dater)<='+InttoStr(FVozrast2);
        end;
        slSQL.Add('INSERT INTO &tmp& (ID) SELECT id from sostavsem s'#13+
                  '  WHERE (iskl is null or iskl=false)'#13+
                  '  GROUP BY 1 '#13+
                  '  HAVING sum(IIF('+s1+',1,0))'+sOper+strFilter);
      end;
    end;

    TmpQuery.SQL.Text:=StringReplace( slSQL.Text, '&tmp&', GetNameTmpIdTable, [rfReplaceAll]);
    slSQL.Free;
    memowrite('last_tmp.sql',TmpQuery.SQL.Text);
    TmpQuery.ExecSQL;
    TmpQuery.SQL.Text:='SELECT COUNT(*) FROM '+GetNameTmpIdTable;
    TmpQuery.Open;
    if TmpQuery.Fields[0].AsInteger>0 then  begin
      Result:=true;
    end;
    TmpQuery.Close;
    CloseMessage;
//    TmpQuery.Sql.Text:='select count(*) from '+GetNameTmpIdTable;
//    TmpQuery.Open;
//    ShowMessage(TmpQuery.Fields[0].AsString);
//    TmpQuery.Close;
  except
    on E:Exception do begin
      CloseMessage;
      PutError('Ошибка поиска: '+#13+E.Message,self);
      Result:=false;
    end;
  end;
end;
//--------------------------------------------------------------------------------------------
function TfmGurnOchered.getIDForFilter(nType:Integer;strFilter:String):String;
var
  n:Integer;
  s,sID,sAdd:String;
  st:TSostTable;
begin
  Result:='';
  OpenMessage('Поиск ... ','',10);
  if Copy(strFilter,1,1)='='
    then sAdd:=''
    else sAdd:='*';
  try
    if nType=1 then begin
      n:=Pos(' ',strFilter);
      if n>0 then begin
//        s:='FAMILIA='+QStr(Copy(strFilter,1,n-1)+'*')+
//           'and NAME='+QStr(Copy(strFilter,n+1,20)+'*');
        s:='FAMILIA='+QStr(Copy(strFilter,1,n-1)+sAdd)+
           'and NAME='+QStr(Copy(strFilter,n+1,20)+sAdd);
      end else begin
        s:='FAMILIA='+QStr(strFilter+sAdd);
//        s:='FAMILIA='+QStr(strFilter+'*');
      end;
    end else if nType=2 then begin
      s:='LICH_NOMER='+QStr(strFilter);
    end;

    st:=SaveSostTable(dmBase.tbMens,true,false);
    dmBase.tbMens.Filter:=s;
    dmBase.tbMens.Filtered:=true;
    sID:=';';
    while not dmBase.tbMens.Eof do begin
      if dmbase.tbOchered.Locate('ID',dmBase.tbMens.FieldByName('ID').AsInteger,[]) then begin
        sID:=sID+dmBase.tbMens.FieldByName('ID').AsString+';';
      end;
      dmBase.tbMens.Next;
    end;
    dmBase.tbMens.Filtered:=false;
    RestSostTable(dmBase.tbMens,st);

    st:=SaveSostTable(dmBase.tbSostavSem,true,false);
    dmBase.tbSostavSem.Filter:=s;
    dmBase.tbSostavSem.Filtered:=true;
    while not dmBase.tbSostavSem.Eof do begin
      sID:=sID+dmBase.tbSostavSem.FieldByName('ID').AsString+';';
      dmBase.tbSostavSem.Next;
    end;
    dmBase.tbSostavSem.Filtered:=false;
    RestSostTable(dmBase.tbSostavSem,st);
  finally
    CloseMessage;
  end;
  if sID<>';' then begin
    Result:='At('';''+alltrim(str(id))+'';'', '+QStr(sID)+')>0';
  end else begin
    ShowMessageCont('Данные не найдены.',Self);
  end;
end;

//--------------------------------------------------------------------------------------------
function TfmGurnOchered.getAdditiveFilter:String;
var
  strFilter,sAdd,s : String;
  nLen,n : Integer;
//  st:TSostTable;
begin
  strFilter:=Trim(edSeek.Text);
  nLen:=Length(strFilter);
  if FSeekAsQuery then begin
    if nLen=0 then begin
      Result:='';
      FSeekAsQuery_Active:=false;
    end else begin
      Result:='';
      if getIDForTmpTable(edTypeSeek.ItemIndex,strFilter) then begin

      end;
      FSeekAsQuery_Active:=true;
    end;
    s:=CreateAdditiveWhere(getAdditiveWhere);
    if s<>'' then begin
      FNewSQL:=ChangeWhere( Query.SQL.Text, s, false);
    end;
  end else begin
    if nLen=0 then begin
      Result:='';
    end else begin
      if Copy(strFilter,1,1)='='
        then sAdd:=''
        else sAdd:='*';
      case edTypeSeek.ItemIndex of
        0: begin
             n:=Pos(' ',strFilter);
             if n>0 then begin
               Result:='FAMILIA='+QStr(Copy(strFilter,1,n-1)+sAdd)+
                         'and NAME='+QStr(Copy(strFilter,n+1,20)+sAdd);
             end else begin
               Result:='FAMILIA='+QStr(strFilter+sAdd);
             end;
           end;
  //      1: Result:='EVENT1';
        1: Result:=getIDForFilter(1,strFilter);
        2: Result:=getIDForFilter(2,strFilter);
        3: begin // поиск по номеру дела
  //        if IsAllDigit(strFilter) then begin
            Result:='DELO='+QStr(strFilter);
  //        end else begin
  //          Beep;
  //        end;
           end;
        4: begin // поиск по номеру решения
  //        if IsAllDigit(strFilter) then begin
            Result:='REG_RESH='+QStr(strFilter);
  //        end else begin
  //          Beep;
  //        end;
           end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------
function TfmGurnOchered.setAdditiveFilter: Boolean;
var
  strFilter : String;
//  n:Integer;
  l:Boolean;
  cur:TCursor;
begin
  result:=true;
  if FSeekAsQuery then begin
    getAdditiveFilter;
    FullRefresh(false);
  end else begin
    cur:=Screen.Cursor;
    Screen.Cursor:=crHourGlass;
    strFilter:=getAdditiveFilter;
    l:=dbDisableControls(Query);
    try
      if strFilter='' then begin
        Query.Filter := '';
        Query.Filtered := false;
        Query.OnFilterRecord:=nil;
      end else begin
        if strFilter='EVENT1' then begin
        {
          Query.Filter := '';
          strFilter:=Trim(edSeek.Text);
          n:=Pos(' ',strFilter);
          if n>0 then begin
            FSeekFamMen:=Copy(strFilter,1,n-1);
            FSeekNameMen:=Copy(strFilter,n+1,20);
          end else begin
            FSeekFamMen:=strFilter;
            FSeekNameMen:='';
          end;
          Query.OnFilterRecord:=QueryFilterRecord;
          Query.Filtered := true;
          }
        end else begin
          Query.Filter := strFilter;
          Query.OnFilterRecord:=nil;
          Query.Filtered := true;
        end;
      end;
    finally
      dbEnableControls(Query,l);
      Screen.Cursor:=cur;
    end;
  end;
  if not Query.Eof then begin
    ActiveControl := Grid;
  end;
end;

procedure TfmGurnOchered.SetCurBase(Value : Integer);
var
  l:Boolean;
begin
  inherited SetCurBase(Value);
  {$IFDEF OCHERED}
  GlobalTask.SetCurIdBase(Value);
  if EnableLoadOch then begin
    if dmBase.OblBASE then begin
      l:=false;
    end else begin
      if Value=0
        then l:=true
        else l:=false;
    end;
  end else begin
    l:=true;
  end;
  TBItemAddNewMen.Enabled:=l;
  TBItemDelDok.Enabled:=l;
  TBSubItemRun.Enabled:=l;
  {$ENDIF}
end;

procedure TfmGurnOchered.FormDestroy(Sender: TObject);
begin
  inherited;
  GlobalTask.SetCurIdBase(-1);
end;


procedure TfmGurnOchered.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
//var
//  hand:Boolean;
begin
  if (Shift=[ssCtrl]) then begin
    case Key of
      83: begin           // Ctrl-S
            ActiveControl:=edSeek;
            Key:=0;
          end;
      69: begin           // Ctrl-E
            ClearSeek;
            Key:=0;
          end;
    end;
  end;
  inherited;
end;
//-----------------------------------------------------------------------------------------
function TfmGurnOchered.GetNameVozrast_:String;
begin
  if FVozrast2=FVozrast1 then begin
    Result:='='+InttoStr(FVozrast1);
  end else if FVozrast1<=0 then begin
    Result:='<'+InttoStr(FVozrast2+1);
  end else if (FVozrast2=0) and (FVozrast1>0) then begin
    Result:='>'+InttoStr(FVozrast1-1);
  end else begin
    Result:=InttoStr(FVozrast1)+'-'+InttoStr(FVozrast2);
  end;
end;
//-----------------------------------------------------------------------------------------
function TfmGurnOchered.GetNameVozrast:String;
begin
  Result:='Возраст для поиска в составе семьи ('+GetNameVozrast_+')';
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnOchered.Event_VozrastMens(Sender: TObject);
var
  f:TfmParamQuest;
begin
  f:=TfmParamQuest.Create(Self);
  f.Caption:='Возраст';
  f.AddParamEx(FVozrast1, 'Начальный возраст' , 'V1' ,'TYPE=INT~MIN=0~MAX=100');
  f.AddParamEx(FVozrast2, 'Конечный возраст' , 'V2' ,'TYPE=INT~MIN=0~MAX=300');
  f.AddButtons('Установить~Отказ',0);
  if f.ShowQuest=1 then begin
    FVozrast1:=f.GetValue('V1', 'N');
    FVozrast2:=f.GetValue('V2', 'N');
    TBItemSetVozrast.Caption:=GetNameVozrast;
    if edTypeSeek.ItemIndex=TYPESEEK_VOZR then begin
      edTypeSeekChange(nil);
      edTypeSeek.ItemIndex:=0;
      Application.ProcessMessages;
//      edSeek.Hint:=GetHintSeek(TYPESEEK_VOZR);
    end;
    edTypeSeek.Items.Strings[TYPESEEK_VOZR]:='Количество в составе ('+GetNameVozrast_+')';
    edTypeSeek.Update;
  end;
  f.Free;
end;

function TfmGurnOchered.GetHintSeek(n:Integer): String;
begin
  case n of
    TYPESEEK_FIO      : Result:='Фамилия Имя очередника';
    TYPESEEK_FIO_SS   : Result:='Фамилия Имя очередника или члена из состава семьи';
    TYPESEEK_IN       : Result:='Идентификационный номер очередника';
    TYPESEEK_IN_SS    : Result:='Идентификационный номер очередника или члена из состава семьи';
    TYPESEEK_DELO     : Result:='Номер дела очередника';
    TYPESEEK_LASTRESH : Result:='Номер решения, через символ "?" или "*" можно год решения ( 456 или 456*2015 )';
    TYPESEEK_BTI      : Result:='* любая собственность; YYYY за конкретный год; MM.YYYY месяц,год; - ничего не загружено';
    TYPESEEK_VOZR     : Result:='Количество человек в составе семьи в возрасте: '+GetNameVozrast_+' (=,<,>)';
    TYPESEEK_PLAN     : Result:='Введите символ * и нажмите установить';
  else
    Result:='';
  end;
end;


end.


