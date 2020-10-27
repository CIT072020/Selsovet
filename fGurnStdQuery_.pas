{
 неоходимо создать наследника от TfmGurnal
   означить св-ва:
    QuestDel    : String   запрос на удаление журнала
    TypeEditObj : Integer  тип корр. обекта из журнала или -1
                   ( dmBase.TypeObj_Lich,dmBase.TypeObj_Nasel,dmBase.TypeObj_Adres )
    TypeEditObj_Akt  !!!

    KodGurnal   : String   название секции в ini-файле журналов
    DateFiks    : TDateTime  на какую дату показывается журнал(книга)
    SybSystem   : подситема к которой принадлежит журнал

    CheckGodGurnal :  контролировать год журнала
    CurGodGurnal   :  текущий год журнала

}

unit fGurnStdQuery;

{$I Task.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DateUtils,
  Db, adsdata, adsfunc, adstable, Grids, DBGridEh, fSimpleD, fEditMemo, uPadegFIO,fWarning,fChoiceAdres,
  {$IFNDEF EHLIB3 } GridsEh, {$ENDIF} SasaDBGrid, TB2Dock,
  TB2Toolbar, TB2Item, GridSetUp, MetaTask, mPermit, SasaUtils, SasaIniFile,fMultiChoice, fParamQuest,
  fmStringSeek, dbFunc, fmChList, UserEvents, mFindInt, uFilter, PrnDbgeh,
  {$IFDEF EHLIB3 } dbGrids, {$ENDIF} fExpDs, mExport, mTempl, FuncPr, FuncEh, OpisEdit, DBGridEhImpExp, Menus,
  {$IFDEF VER150} Variants, {$ENDIF}
  {$IFDEF GISUN}  uGisun, {$ENDIF}
  ImgList, ComCtrls;

type

  TfmGurnalStdQuery = class(TForm)
    TBDock: TTBDock;
    TBToolbarMenu: TTBToolbar;
    Grid: TSasaDBGrid;
    DataSource: TDataSource;
    TBItemClose: TTBItem;
    TBItemSetUpGrid: TTBItem;
    TBItemRefresh: TTBItem;
    TBItemEdit: TTBItem;
    TBItemDelDok: TTBItem;
    TBItemPreView: TTBItem;
    TBItemPrint: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItemClrFlt: TTBItem;
    Query: TAdsQuery;
    TBSubItemRun: TTBSubmenuItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSubChoiceFlt: TTBSubmenuItem;
    TBItemFlt: TTBItem;
    TBItemPrintGrid: TTBItem;
    TBItemOrder: TTBItem;
    TBItemRepeatFilter: TTBItem;
    TBItemQuery: TTBItem;
    TBItemGrupOne: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItemExport: TTBItem;
    TBItemCount: TTBItem;
    TBItemPokaz: TTBItem;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    TmpQuery: TAdsQuery;
    TBSubSysFlt: TTBSubmenuItem;
    ImageListGisun: TImageList;
    TBSubmenuTmp: TTBSubmenuItem;
    TBItemSysFlt: TTBItem;
    ImageListISKL: TImageList;
    ImageParent: TImageList;
    TBItemGrantSprav: TTBItem;
    TBExcelReport: TTBSubmenuItem;
    ImageListFirst: TImageList;
    TBItemDesignReport: TTBItem;
    TBItemLastSvid: TTBItem;
    StBar: TStatusBar;
    TBItemAddDok: TTBItem;
    TBItemYear: TTBItem;
    TBItemDelayRegister: TTBItem;
    TBSubmenuPunkts: TTBSubmenuItem;
    TBItemClearPunkts: TTBItem;
    procedure TBItemCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBItemSetUpGridClick(Sender: TObject);
    procedure TBItemRefreshClick(Sender: TObject);
    procedure TBItemEditClick(Sender: TObject);
    procedure TBItemDelDokClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure TBItemPreViewClick(Sender: TObject);
    procedure TBItemPrintClick(Sender: TObject);
    procedure QueryAfterScroll(DataSet: TDataSet);
    procedure TBItemWhereClick(Sender: TObject);
    procedure TBItemClrFltClick(Sender: TObject);
    function  GridSeekZAGS(sZAGS:String):String;
    function ChoiceBASE(var nCurID:Integer):String;

    procedure GridTitleBtnClick(Sender: TObject; ACol: Integer;   Column: TColumnEh);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure TBItemSetFilterClick(Sender: TObject);
    procedure TBSubmenuItemFilterClick(Sender: TObject);
    procedure TBItemPrintGridClick(Sender: TObject);
    procedure TBItemOrderClick(Sender: TObject);
    procedure TBItemRepeatFilterClick(Sender: TObject);
    procedure TBItemQueryClick(Sender: TObject);
    procedure TBItemGrupOneClick(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure TBItemExportClick(Sender: TObject);
    procedure TBItemCountClick(Sender: TObject);
    procedure TBItemPokazClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure TBItemSysFltClick(Sender: TObject);
    procedure TBItemGrantSpravClick(Sender: TObject);
    procedure TBItemDesignReportClick(Sender: TObject);
    procedure TBItemLastSvidClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure TBItemAddDokClick(Sender: TObject);
    procedure TBItemYearClick(Sender: TObject);
    procedure TBItemDelayRegisterClick(Sender: TObject);
    procedure TBItemClearPunktsClick(Sender: TObject);
    procedure TBSubmenuPunktsClick(Sender: TObject);
  private
    FIdOrgan:Integer;      // GlobalTask.ParamAsInteger('ID')
    FErrorOpen : Boolean;
    FPokaz : TStringList;
    FKodGurnal: String;
    FSourceTable : String;
    FEvents : TUserEvents;
    FTypeEditObj: Integer;
    FFilterInterface: TFilterInterface;
    FOrderList : TFindList;
    FDefCountExport: Integer;  // для ORDER BY
    FCheckGodGurnal:Boolean;
    FCurGodGurnal:Integer;
    FCurBase:Integer;

    procedure SetKodGurnal(const Value: String);
    procedure CreateEvents( strNameSect : String);
//    procedure AfterConstruction;
    procedure SetTypeEditObj(const Value: Integer);
    procedure SetFilterInterface(const Value: TFilterInterface);
    procedure SetDefCountExport(const Value: Integer);
  public

    OpisRnGor : TOpisEdit;    // для районов города Брест  ЖКХ

    FGurnalZAGS:Boolean;      // журнал документов ЗАГС
    FIDZAGS:Integer;          // ID загса из параметров
    FLenSoato:Integer;
    formChoiceAdres:TfmChoiceAdres;
    //--- только для журналов с людьми  и алфав. книга -----
    FTypeVisibleMens:Integer;
    FRed:Boolean;
    FBlue:Boolean;
    FGreen1:Boolean;
    FGreen2:Boolean;
    FUnderline:Boolean;
    FOldCopyMen:Boolean;
    FRiap:Boolean;
    FFirstID:Boolean;      // =true для алфавитной книги
    FIgnoreCheck:Boolean;  // =true для реестра населения  ( игнорировать невозможность удаления )
    FFilter_Punkt:String;
    FValues_Punkt:String;
    FVisibleBASE : Boolean;
    //--------------------------------------
    FEnableWrite : Boolean;
    ExportColumns: TExportColumnList;
    FKeyValues2 : Variant;

    FMaincaption : String;
    FSysFltCaption : String;
    FFltCaption : String;
    FSeekAsQuery : Boolean;
    FSeekAsQuery_Active : Boolean;
    FFTSFields : String;
    FListPar  : TStringList;
    FNewSQL   : String;
    FRun:Boolean;
    FInterObj : Boolean;   // разные объекты в журнале
//    FWhere    : String;
    FID       : String;
    FSubType  : String;
    DateFiks   : TDateTime;
    iniGurnal  : TSasaIniFile;
    QuestDel   : String;   // запрос на удаление журнала

    property  DefCountExport : Integer read FDefCountExport write SetDefCountExport;
    property  TypeEditObj : Integer read FTypeEditObj write SetTypeEditObj;

    property  KodGurnal : String read FKodGurnal write SetKodGurnal;
    property  FilterInterface : TFilterInterface read FFilterInterface write SetFilterInterface;

    procedure SetCurBase(Value : Integer); virtual;
    function  GetCurBase:Integer;

    function  GetTypeEditObj : Integer;
    procedure CheckGurnalZAGS;
    function  GetStrSystemFilter(lWhere: Boolean): String;

    function  getYearWhere: String; virtual;
    function  getDefaultAddWhere : String; virtual;
    function  getAdditiveWhere   : String; virtual;
    function  getAdditiveFilter  : String; virtual; // д.б. реализовано в наследниках где есть  Query.Filter:=...
    function  setAdditiveFilter  : Boolean; virtual;

    procedure WriteToDebug(arr:array of Variant);

    procedure SetListParEditForm; virtual;
    procedure SetRole; virtual;
    procedure SaveToIni; virtual;
    procedure LoadFromIni; virtual;
    procedure CheckPropertyGridColumns; virtual;
    procedure CheckExport;
    function  CheckDelete(var strErr : string; var lQuest:Boolean) : Boolean; virtual;
    function  getID:String; virtual;

    procedure CreateSysFlt_GISUN;
    procedure Event_POLE_GRN_3(Sender: TObject);
    procedure Event_POLE_GRN_2(Sender: TObject);
    procedure Event_POLE_GRN_0(Sender: TObject);
    procedure Event_ClearPoleGRN(Sender: TObject);
//    function  ClassDokFromTypeObj:TFormDokument;
//    procedure DelayRegister;

    function  LoadQuery : Boolean; virtual;
    function  GetNameTmpIdTable:String;
    procedure SetQueryDateFiks( dDateFiks : TDateTime; lReopen : Boolean );
    procedure SetQueryParam(p : TParam); virtual;
    procedure Refresh(lFull : Boolean=false; ID:String='');
    procedure FullRefresh(lReopen:Boolean=false);
    procedure UpdateActions; override;
    procedure AddUpdateActions; virtual;
    procedure GridColumnsGetParents(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPoleGrn(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsPokaz(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure GridColumnsGetNamePunkt(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetRnGor(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetNameUL(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetMR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetPribUbil(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetSelRow(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDOKUMENT(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetSource(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsNumber(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetBool(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsISKL(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsCANDELETE_FIRST(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsFIRST(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetAdresOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetGES(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure GridColumnsGetID_BASE(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);

    procedure AfterConstruction; override;
    procedure BeforeReport; virtual;
    procedure AfterReport; virtual;
    procedure TestFilterSQL(Sender: TObject);
    procedure ClickSetFilter(SenderObj : TObject; Sender: TFindList);
    function  InitFilter( var strErr : String ) : Boolean; virtual;
    procedure InitOrderBy;
    function  GetBeginSQL : String;
//    function GetNameReport( strID : String) : String; virtual;
    function LoadTemplate( strKod : String) : Boolean;
    function LoadExcelReport(Menu:TTBSubmenuItem; strKod : String) : Boolean;
    function OnUserOper(Oper: TOperItem; FindField: TFindFieldItem; RelItem: TRelItem; FullFieldName, Value1, Value2, OperVal: string; var Expr: string): Boolean;

    function CreateAdditiveWhere(strAddSQL : String) : String;
    function GetCurrentWhere: String;

    procedure SetCaptionGurnal;
    procedure ClickPunkts;
    procedure ClearPunkts;
    procedure OnTemplateMenuClick(Sender: TObject);
    function  RunFuncScript(strFuncName: String; ArrPar : array of Variant; var vResult : Variant): Boolean;

{$IFDEF ZAGS}
    procedure CheckDecl_GurnalUZ(nTypeAkt:Integer; var arr:TarrStrings; tb:TDataSet);
    procedure LoadAkt_GurnalUZ(nTypeAkt:Integer);
    procedure EditAktFromGurnalUZ(nTypeAkt:Integer);
    procedure Renumber_GurnalUZ;
{$ENDIF}
    class function EnableOpen : Boolean; virtual;
    procedure CreateForAll;
    constructor Create(Owner : TComponent); override;
    constructor CreateChild;
    procedure CreateParams(var Params: TCreateParams); override;
    destructor Destroy; override;
  end;

  TOrderField = class(TObject)
  public
    Caption   : String;
    Alias     : String;
    FieldName : String;
    TypeField : TFindFieldKinds;
    CaseSensitive : Boolean;
  end;


//var
//  CurGurnal:TfmGurnalStdQuery;

implementation

uses fMain, dBase, dDokument, SelLibFr, fmQueryEx, fVisibleMensGurnal,
     fPrintGrid, fChoicePokaz, uProject, fCallBackQuery,fRunSprav,
     {$IFDEF GISUN}
     fZapisBrak, fZapisRogd, fZapisSmert, fZapisUstOtc,
       {$IFDEF ZAGS} fRastBrak,fZapisUstMat, fZapisChName, {$ENDIF}
     {$ENDIF}
     IniFiles, StrUtils;

{$R *.DFM}


function TfmGurnalStdQuery.RunFuncScript(strFuncName: String; ArrPar : array of Variant;
                   var vResult : Variant): Boolean;
begin
  Result:=false;
  if (GlobalTask.Script<>nil) and not FRun then begin
    FRun:=true;
    try
      Result := GlobalTask.Script.Run(strFuncName,ArrPar,vResult);
    finally
      FRun := false;
    end;
  end;
end;
//--------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.OnTemplateMenuClick(Sender: TObject);
var
   Template: TTemplate;
   sFunc:String;
   v:Variant;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
      if Template<>nil then begin
         sFunc:=Template.ScriptName+'_UserForm';
         v:=true;
         RunFuncScript(sFunc,[],v);
         if (v=true) then begin
           fmMain.TemplateInterface.SetSimpleTemplate(Template.FullName);
         end;
//         fmMain.TemplateInterface.SetTemplate(fmMain.TemplateInterface.TemplateDir+Template.TemplateFile,
//         fmMain.TemplateInterface.DefaultDatabaseName, fmMain.TemplateInterface.DefaultScript, Template)
      end;
   end;
end;
//-------------------------------------------------------------------------------
function TfmGurnalStdQuery.LoadTemplate( strKod : String) : Boolean;
var
  s : String;
  l1,l2,l3 : Boolean;
begin
  l1:=fmMain.TemplateInterface.BuildMenu(Self.Name, TBSubmenuTmp, false, OnTemplateMenuClick);
  // загрузим для области
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,1);
  l2:=fmMain.TemplateInterface.BuildMenu(Self.Name+s, TBSubmenuTmp, false, OnTemplateMenuClick);
  // загрузим для района
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,4);
  l3:=fmMain.TemplateInterface.BuildMenu(Self.Name+s, TBSubmenuTmp, false, OnTemplateMenuClick);

  if l1 or l2 or l3 then begin
    Result := true;
  end else begin
    Result := false;
  end;
end;

function TfmGurnalStdQuery.LoadExcelReport(Menu:TTBSubmenuItem; strKod: String): Boolean;
begin
  Result:=BuildExcelMenu(Menu,strKod,true);
end;

procedure TfmGurnalStdQuery.CreateEvents( strNameSect : String);
var
  s : String;
begin
  FEvents := TUserEvents.Create;
  FEvents.LoadEvents2(strNameSect, TBSubItemRun,true);
  s:='_'+Copy(GlobalTask.ParamAsString('KOD'),1,1);
  FEvents.LoadEvents2(strNameSect+s, TBSubItemRun,false);
  s:=Copy(GlobalTask.ParamAsString('KOD'),1,4);
  FEvents.LoadEvents2(strNameSect+s, TBSubItemRun,false);
//  FEvents := TUserEvents.Create;
//  FEvents.LoadEvents(strNameSect, TBSubItemRun);
  if not FEnableWrite then begin
    TBSubItemRun.Visible := false;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsPokaz(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);
var
  strNameOpis : String;
  te : TTypeEdit;
  Opis : TOpisEdit;
  j : Integer;
  v : Variant;
  cTip, strPokaz, strID : String;
begin
  // POKAZ_<Код показателя>   или   POKAZ_<Поле ID>#<Код показателя>
  strPokaz:=Copy(TDbGridColumnEh(Sender).FieldName,7,50);
  j := Pos('#', strPokaz);
  if j=0 then begin
    strID := 'ID';
  end else begin
    strID := Copy(strPokaz,1,j-1);
    strPokaz:=Copy(strPokaz,j+1,50);
  end;
  v := dmBase.ReadOneProp( DateFiks,
              Query.FieldByName(strID).AsInteger, strPokaz, ftUnknown);
  if v=null then begin
    Params.Text := '';
  end else begin
//    if dmBase.SprProperty.Locate( 'TYPEOBJ;KOD', VarArrayOf([TypeEditObj,strPokaz]), [] ) then begin
    if dmBase.SprProperty.Locate( 'KOD', strPokaz, [] ) then begin
      strNameOpis := Trim(dmBase.SprProperty.FieldByName('OpisEdit').AsString);
      if (dmBase.SprProperty.FieldByName('Tip').AsString<>'M') and
         (strNameOpis<>'') then begin
        te := GetTypeOpisFromName( strNameOpis );
        if te = teList then begin
          Opis := GlobalTask.CurrentOpisEdit.GetListOpisA(strNameOpis);
          Params.Text := Opis.Naim(v, false);
        end else if te = teSpr then begin
          Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA(strNameOpis);
          Params.Text := Opis.Naim(v, false);
        end;
      end else begin
        cTip := dmBase.SprProperty.FieldByName('Tip').AsString;
        if cTip = 'L' then begin
          if v=true then Params.Text:='Да' else Params.Text:='Нет';
        end else if cTip = 'D' then begin
          Params.Text := FormatDateTime('dd.mm.yyyy',VarToDateTime(v))
        end else if cTip = 'N' then begin
          if v=null
           then Params.Text:=''
           else Params.Text := FloatToStr(v);
        end else begin
          Params.Text := VarToStr(v);
        end;
      end;
    end else begin
      if v=null then v:='';
      Params.Text := VarToStr(v);
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetMR(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    Params.Text := dmBase.GetMestoMen(0,Query.FieldByName('ID').AsString, false, 0, nil);
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetSelRow(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  i:Integer;
begin
  if not EditMode then begin
    Params.Text:=' ';
    if Grid.Selection.Rows.Count > 0 then begin
      for i:=0 to Grid.Selection.Rows.Count-1 do begin
        if Query.Bookmark=Grid.Selection.Rows[i] then begin
          Params.Text:=IntToStr(i);
          break;
        end;
      end;
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetPribUbil(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ld : TLastDvig;
begin
  if not EditMode then begin
    ld := dmBase.LastDvigMen(Query.FieldByName('DATE_FIKS').AsDateTime,Query.FieldByName('ID').AsString );
    Params.Text := ld.komm ;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetAdres(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  fld  : TField;
 {$IFDEF OCHERED}
  fldB : TField;
  nBase:Integer;
 {$ENDIF}
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      fld := Query.FindField('DATE_FIKS');
      if (Trim(Params.Text)='0') then begin
        {$IFDEF OCHERED}
          fldB:=Query.FindField('ID_BASE');
          if fldB=nil then nBase:=0 else nBase:=fldB.AsInteger;
          if nBase>0 then begin
            if dmBase.tbMensAdd.Locate('ID',Query.FieldByName('ID').AsInteger,[])
              then Params.Text := dmBase.GetAdresAkt3(dmBase.tbMensAdd,';MR_OBL,MR_B_OBL;MR_RAION,MR_GOROD_RN;MR_GOROD,MR_B_GOROD;MR_ULICA,MR_*',1);
          end else begin
            Params.Text := Trim(dmBase.ReadOneProp(DateFiks, Query.FieldByName('ID').AsInteger,'ADRES_PROP',ftMemo));
            if (Params.Text='') then begin
              if dmBase.tbMensAdd.Locate('ID',Query.FieldByName('ID').AsInteger,[])
                then Params.Text := dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString;
            end;
          end;
        {$ELSE}
           Params.Text := Trim(dmBase.ReadOneProp(DateFiks, Query.FieldByName('ID').AsInteger,'ADRES_PROP',ftMemo));
           if (Params.Text='') then begin
             if dmBase.tbMensAdd.Locate('ID',Query.FieldByName('ID').AsInteger,[])
               then Params.Text := dmBase.tbMensAdd.FieldByName('TEXT_ADRES').AsString;
           end;
        {$ENDIF}
      end else begin
        if (Trim(Params.Text)='') or not IsAllDigit(Trim(Params.text)) then begin
//  ОШИБКА !!!    ShowMessage('"'+Query.FieldByName('ID').AsString+'"');
//          ShowMessage('"'+Query.FieldByName('ID').AsString+'"');
        end else begin
          if fld=nil
            then Params.Text := dmBase.AdresFromID(dmBase.GetDateCurrentSost, Params.Text)
            else Params.Text := dmBase.AdresFromID(Query.FieldByName('DATE_FIKS').AsDateTime, Params.Text);
        end;
      end;
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetNamePunkt(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if dmBase.LookupPunkt.Locate('ID', Query.FieldByName('PUNKT').AsInteger, []) then begin
        Params.Text := dmBase.LookupPunkt.FieldByName('NAME').AsString;
      end;
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetRnGor(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if OpisRnGor=nil then begin
       OpisRnGor:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
      end;
      if OpisRnGor<>nil then begin
        Params.Text := OpisRnGor.Naim(Params.Text);
      end;
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetNameUL(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := dmBase.getUL(Query.FieldByName('UL').AsInteger);
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetPoleGrn(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
{$IFDEF GISUN}
  if not EditMode then begin
    Params.ImageIndex:=Gisun.GetPoleGrn(Query.FieldByName('POLE_GRN'));
  end;
{$ENDIF}
end;

procedure TfmGurnalStdQuery.GridColumnsGetParents(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
//    Query.FieldByName('PA_ID').AsInteger;
//    Query.FieldByName('MA_ID').AsInteger;
    Params.ImageIndex:=0;
  end;
end;

//---------------------------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.GridColumnsDOKUMENT(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  s,ss : String;
  p :TPassport;
begin
  s:=TColumnEh(Sender).FieldName;
  if s='ON_DOKUMENT' then begin
    try
      with Query do begin
        // 'ON_INENTIF'
        p := dmBase.PasportFromValues(FieldByName('ON_DOK_TYPE').AsInteger,FieldByName('ON_DOK_SERIA').AsString,
                                      FieldByName('ON_DOK_NOMER').AsString,FieldByName('ON_DOKUMENT').AsString,'',
                                      FieldByName('ON_DOK_DATE').AsDateTime);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else if s='ONA_DOKUMENT' then begin
    try
      with Query do begin
        // 'ONA_INENTIF'
        p := dmBase.PasportFromValues(FieldByName('ONA_DOK_TYPE').AsInteger,FieldByName('ONA_DOK_SERIA').AsString,
                                      FieldByName('ONA_DOK_NOMER').AsString,FieldByName('ONA_DOKUMENT').AsString,'',
                                      FieldByName('ONA_DOK_DATE').Value);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else if s='DOKUMENT' then begin
    try
      with Query do begin
        // 'ON_INENTIF'
        p := dmBase.PasportFromValues(FieldByName('DOK_TYPE').AsInteger,FieldByName('DOK_SERIA').AsString,
                                      FieldByName('DOK_NOMER').AsString,FieldByName('DOKUMENT').AsString,'',
                                      FieldByName('DOK_DATE').Value);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else if s='TALON_DOK' then begin
    try
      with Query do begin
        // 'LICH_NOMER'
        p := dmBase.PasportFromValues(FieldByName('PASP_UDOST').AsInteger,FieldByName('PASP_SERIA').AsString,
                                      FieldByName('PASP_NOMER').AsString,FieldByName('PASP_VIDAN').AsString,'',
                                      FieldByName('PASP_DATE').Value);
      end;
      ss := dmBase.PasportToText(p,1);
      if ss<>'' then begin
        Params.Text := ss;
      end else begin
        Params.Text := StringReplace(Params.Text,Chr(10),'',[rfReplaceAll]);
        Params.Text := StringReplace(Params.Text,Chr(13),' ',[rfReplaceAll]);
      end;
    except
    end;
  end else begin

  end
end;

procedure TfmGurnalStdQuery.GridColumnsGetZAGS(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  fld : TField;
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      fld := Query.FindField('NAME_ZAGS');
      if (fld<>nil) and (fld.AsString<>'') then begin
        Params.Text := fld.AsString;
        if FIdZAGS=Query.FieldByName('ID_ZAGS').AsInteger    // ЗАГС мой и введено наименование
          then Params.Background:=clInfoBk;
      end else begin
        if dmBase.SprNames.Locate('ID', Params.Text, []) then begin
          Params.Text := dmBase.SprNames.FieldByName('NAME').AsString;
        end else begin
          if dmBase.SprZAGS.Locate('ID', Params.Text, []) then begin
            Params.Text := dmBase.SprZAGS.FieldByName('NAME').AsString;
          end else begin
            if dmBase.SprSoato.Locate('ID', Params.Text, []) then begin
              Params.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsGetSource(Sender: TObject;  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      if dmBase.SprNames.Locate('ID', Params.Text, []) then begin
        Params.Text := dmBase.SprNames.FieldByName('NAME').AsString;
      end else begin
        if dmBase.SprZAGS.Locate('ID', Params.Text, []) then begin
          Params.Text := dmBase.SprZAGS.FieldByName('NAME').AsString;
        end else begin
          if dmBase.SprSoato.Locate('ID', Params.Text, []) then begin
            Params.Text := dmBase.SprSoato.FieldByName('NAME').AsString;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsNumber(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
begin
  Params.Text := IntToStr(Query.RecNo);
end;

procedure TfmGurnalStdQuery.GridColumnsGetBool(Sender: TObject; EditMode: Boolean;
          Params: TColCellParamsEh);
begin
  if not EditMode then begin
    if Params.Text<>'' then begin
      Params.Text := Sender.ClassName;
    end;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsWorkName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  d : TDateTime;
  i : Integer;
begin
  if Query.FieldByName('WORK_SPR').AsString='' then begin
    d := Query.FieldByName('DATE_FIKS').AsDateTime;
    if FFirstID
      then i := Query.FieldByName('FIRST').AsInteger
      else i := Query.FieldByName('ID').AsInteger;
    Params.Text := dmBase.ReadOneProp(d, i, 'WORK_NAME', ftMemo);
  end else begin
    if dmBase.SprWork.Locate('ID', Query.FieldByName('WORK_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprWork.FieldByName('NAME').AsString;
    end
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsDolgName(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.FieldByName('DOLG_SPR').AsString='' then begin
    Params.Text := Query.FieldByName('DOLG_NAME').AsString;
  end else begin
    if dmBase.SprDolg.Locate('ID', Query.FieldByName('DOLG_SPR').AsInteger,[]) then begin
      Params.Text := dmBase.SprDolg.FieldByName('NAME').AsString;
    end
  end;
end;

procedure TfmGurnalStdQuery.TBItemCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGurnalStdQuery.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FErrorOpen and (iniGurnal<>nil) then SaveToIni;
{
  try
    TmpQuery.AdsCloseSQLStatement;
    TmpQuery.SQL.Text:='drop table '+GetNameTmpIdTable;
    TmpQuery.ExecSQL;
  except
  end;
}  
  CanClose:=true;
end;

procedure TfmGurnalStdQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
//  if Caption = Trade_Caption then GurnalTrade:=nil;
end;

procedure TfmGurnalStdQuery.TBItemSetUpGridClick(Sender: TObject);
begin
  SetUpGrid(Grid,'',true);
end;

procedure TfmGurnalStdQuery.SetRole;
begin
  if Role.SystemAdmin  then begin
    TBItemSetUpGrid.Visible:=true;
    TBItemDesignReport.Visible:=true;
  end else begin
    TBItemSetUpGrid.Visible:=false;
    TBItemDesignReport.Visible:=false;
  end;
//  if not FEnableWrite then begin
//    TBItemDelDok.Enabled := false;
//  end;

//  TBItemSetUpGrid.Visible:=Role.Enabled(toConfig);
//  TBItemWhere.Visible:=Role.Enabled(toConfig);
end;

procedure TfmGurnalStdQuery.SaveToIni;
var
  i,j : Integer;
  s : String;
begin
  if iniGurnal<>nil then begin
    iniGurnal.EraseSection('VISIBLE_POKAZ');
    for j:=0 to FPokaz.Count-1 do begin
      if Integer(FPokaz.Objects[j])=1 then begin
        iniGurnal.WriteString('VISIBLE_POKAZ',FPokaz.Names[j],'1');
      end;
    end;
    CompToIni(Self,GlobalTask.IniFile('GURNAL'),KodGurnal,GlobalTask.PropForm,true);
    if Role.Status = rsAdmin then begin
      Grid.SaveToIni( GlobalTask.iniFile('GURNAL'),KodGurnal+'.Grid',true);
    end else begin
      Grid.SaveLayoutToIni(GlobalTask.iniFile('GURNAL'),KodGurnal+'.Grid');
    end;
    s:='';
    if ExportColumns<>nil then begin
      for i:=0 to ExportColumns.Count-1 do begin
        if ExportColumns[i].Visible then begin
          s := s + IntToStr(i) + ',';
        end;
      end;
    end;
    iniGurnal.WriteString('ADD','EXPORTCOLUMNS',s);
    iniGurnal.UpdateFile;
  end;
  if (TypeEditObj = dmBase.TypeObj_Nasel) or (TypeEditObj = dmBase.TypeObj_Lich) then begin
    GlobalTask.SetLastValueAsInteger(KodGurnal+'_TYPEVISIBLEMENS',FTypeVisibleMens);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_RED',FRed);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_BLUE',FBlue);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_GREEN1',FGreen1);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_GREEN2',FGreen2);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_UNDERLINE',FUnderline);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_OLDCOPYMEN',FOldCopyMen);
    GlobalTask.SetLastValueAsBoolean(KodGurnal+'_RIAP',FRiap);
  end;
end;

//--------------------------------------------------------
procedure TfmGurnalStdQuery.LoadFromIni;
begin       
  CompFromIni(Self,GlobalTask.IniFile('GURNAL'),KodGurnal,GlobalTask.PropForm);
  if (Self.WindowState=wsNormal) then begin
    if (Self.Left<1) or (Self.Left>600) then Self.Left:=5;
    if (Self.Top<1) or (Self.Top>300) then Self.Top:=5;
    if (Self.Width<300) then Self.Width:=300;
    if (Self.Height<300) then Self.Height:=300;
  end;

  Grid.LoadFromIni( GlobalTask.iniFile('GURNAL'),KodGurnal+'.Grid');

  if not (dgAlwaysShowSelection in Grid.Options) then begin
    Grid.Options := Grid.Options + [dgAlwaysShowSelection]
  end;
  if not (dgColumnResize in Grid.Options) then begin
    Grid.Options := Grid.Options + [dgColumnResize]
  end;
  Grid.DrawMemoText:=true;

  CheckPropertyGridColumns;
  SetOptionsGrid(Grid, Self, true);
end;

//-------------------------------------------------------------
procedure TfmGurnalStdQuery.CheckPropertyGridColumns;
var
  i,j : Integer;
  sField,sPokaz:String;
begin

//      p := dmBase.PasportFromValues(tbDOK_TYPE.AsInteger, tbDOK_SERIA.AsString, tbDOK_NOMER.AsString,
//                           tbDOK_NAME.AsString, '', tbDOK_DATE.Value);
//      pasp:=dmBase.PasportMen(dateFiks,tbHouseOwnersHistKOD.AsString);
//      tbHouseOwnersHistPASSPORT.AsString:=dmBase.PasportToText(pasp,0);


  for i:=0 to Grid.Columns.Count-1 do begin
    sField:=UpperCase(Grid.Columns[i].FieldName);
    if (sField='ADRES_ID') or (sField='NEW_ADRES_ID') then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetAdres;  //!!!
    end else if sField='ID_BASE' then begin    //
      {$IFDEF GKH}
        if dmBase.IsMainBase and dmBase.IsDistributeBase then begin
          Grid.Columns[i].Visible:=true;
          Grid.Columns[i].OnGetCellParams := GridColumnsGetGES;
        end else begin
          Grid.Columns[i].Visible:=false;
        end;
      {$ELSE}
//        {$IFDEF OCHERED}
//          Grid.Columns[i].Visible:=FVisibleBASE;
//          Grid.Columns[i].OnGetCellParams := GridColumnsGetID_BASE;   устанавливается в fGurnOchered
//        {$ELSE}
          Grid.Columns[i].Visible:=false;
//        {$ENDIF}
      {$ENDIF}
    end else if sField='ADRES_OWNERS' then begin    // собственники
      Grid.Columns[i].OnGetCellParams := GridColumnsGetAdresOwners;
    end else if sField='PUNKT' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetNamePunkt;
    end else if sField='RNGOR' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetRnGor;
    end else if sField='WORK_SPR' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsWorkName;
    end else if sField='DOLG_SPR' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsDolgName;
    end else if sField='UL' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetNameUL;
    end else if sField='MEN_PRIB_UBIL' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetPribUbil;
    end else if (sField='MEN_MR') or (sField='MR_GOROD') then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetMR;
    end else if Grid.Columns[i].FieldName='N_ISKL' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsISKL;
      Grid.Columns[i].ImageList:=ImageListISKL;
    end else if Grid.Columns[i].FieldName='NFIRST' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsFIRST;
      Grid.Columns[i].ImageList:=ImageListFirst;
    end else if Grid.Columns[i].FieldName='CANDELETE_FIRST' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsCANDELETE_FIRST;
      Grid.Columns[i].ImageList:=ImageListISKL;
{    end else if sField='SEL_ROW' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsGetSelRow; }
    end else if sField='POLE_GRN' then begin
      {$IFDEF GISUN}
         Grid.Columns[i].Visible := IsActiveGISUN;
         if Grid.Columns[i].Visible then begin
           Grid.Columns[i].Title.Caption:='ГИС РН';
           Grid.Columns[i].ImageList:=ImageListGisun;
           Grid.Columns[i].OnGetCellParams := GridColumnsGetPoleGrn;
         end;
      {$ELSE}
         Grid.Columns[i].Visible := false;
      {$ENDIF}
    end else if sField='POLE_M_P' then begin   // поле для вывода картинки с мамой и папой
       Grid.Columns[i].ImageList:=ImageParent;
       Grid.Columns[i].OnGetCellParams := GridColumnsGetParents;
    end else if sField='ID_ZAGS' then begin
      {$IFDEF ZAGS}
        Grid.Columns[i].Visible := true;
        Grid.Columns[i].OnGetCellParams := GridColumnsGetZAGS;
        Grid.Columns[i].Title.Caption := 'Орган регистрации';
      {$ELSE}
        Grid.Columns[i].Visible := false;
      {$ENDIF}
    end else if sField='ID_SOURCE' then begin
      {$IFDEF ZAGS}
        if dmBase.GetTypeZags=ZAGS_OBL_ARXIV then begin
          Grid.Columns[i].Visible := true;
          Grid.Columns[i].Title.Caption := 'Откуда загружено';
          Grid.Columns[i].OnGetCellParams := GridColumnsGetSource;
        end else begin
          Grid.Columns[i].Visible := false;
        end;
      {$ELSE}
        Grid.Columns[i].Visible := false;
      {$ENDIF}
    end else if sField='REC_NUMBER' then begin
      Grid.Columns[i].OnGetCellParams := GridColumnsNumber;
    end else if Copy(sField,1,6)='POKAZ_' then begin
      sPokaz:=Copy(Grid.Columns[i].FieldName,7,50);
      try
        j:=FPokaz.IndexOfName(sPokaz);
        if j > -1 then begin
          if Integer(FPokaz.Objects[j])=1 then begin
            Grid.Columns[i].Title.Caption := FPokaz.ValueFromIndex[j];
            Grid.Columns[i].Visible := true;
            Grid.Columns[i].OnGetCellParams := GridColumnsPokaz;
            if Grid.Columns[i].Width<60 then Grid.Columns[i].Width:=60;
          end else begin
            Grid.Columns[i].Visible := false;
            Grid.Columns[i].OnGetCellParams := nil;
          end;
        end else begin
          Grid.Columns[i].Visible := false;
          Grid.Columns[i].OnGetCellParams := nil;
        end;
      except
        Grid.Columns[i].Visible := false;
        Grid.Columns[i].OnGetCellParams := nil;
      end;
    end else if Grid.Columns[i].Field.DataType=ftTime then begin
      Grid.Columns[i].DisplayFormat:='hh:mm';
    end;
  end;
  CheckExport;
end;

//----------------------------------------------------------------
procedure TfmGurnalStdQuery.CheckExport;
var
  i : Integer;
  s : String;
begin
  if ExportColumns=nil then begin
    s := iniGurnal.ReadString('ADD','EXPORTCOLUMNS','');
  end else begin
    s:='';
    for i:=0 to ExportColumns.Count-1 do begin
      if ExportColumns[i].Visible then begin
        s := s + IntToStr(i) + ',';
      end;
    end;
    ExportColumns.Free;
  end;
  ExportColumns := TExportColumnList.Create;
  FillColumnList2(Grid, ExportColumns);
  ExportColumns.HideAll;
  if s='' then begin
    for i:=0 to ExportColumns.Count-1 do begin
      if i < FDefCountExport then begin
        ExportColumns[i].Show;
      end else if i >= FDefCountExport then begin
        break;
      end;
    end;
  end else begin
    for i:=0 to ExportColumns.Count-1 do begin
      if Pos(IntToStr(i)+',',s)>0 then begin
        ExportColumns[i].Show;
      end;
    end;
  end;
end;

//----------------------------------------------------
procedure TfmGurnalStdQuery.CreateForAll;
var
  strErr : String;
  n:Integer;
begin
{
    TBItemDelayRegister.Visible:=true;
    TBItemDelayRegister.Visible:=false;
}
  SetGlobalFilterPunkt('');    // очистим фильтрацию по населенным пунктам
  formChoiceAdres:=nil;
  OpisRnGor:=nil;

  StBar.Visible:=false;

  FSeekAsQuery:=false;
  FSeekAsQuery_Active:=false;

  FIdOrgan:=GlobalTask.ParamAsInteger('ID');  // !!!

  if Role.SystemAdmin  then TBItemGrantSprav.Visible:=true;

  FVisibleBASE:=EnableLoadOch;;
  FCurBase:=-1;
  FGurnalZAGS:=false;   // журнал документов ЗАГС
  FFilter_Punkt:='';
  FValues_Punkt:='';
  FInterObj:=false;
  FFirstID:=false;  // =true для алфавитной книги
  FIgnoreCheck:=false; // =true для реестра населения
  FRun:=false;
  FPokaz := TStringList.Create;
  FListPar := TStringList.Create;
  FSubType := '';
  FFilterInterface := TFilterInterface.Create( fmMain.FltOpList, fmMain.FltSprList );
  dmBase.SetDefaultParam( Query );
  TBItemClrFlt.Enabled:=false;
  SetRole;
  FNewSQL:='';
  FEvents:=nil;
  iniGurnal:=nil;
  FDefCountExport := 3;
  FLenSoato:=getLenSoato;
  InitFilter(strErr);
  QuestDel := '  Удалить текущий документ ?  ';
  FMainCaption := Self.Caption;
  FFltCaption:='';
  FSysFltCaption:='';
  FKeyValues2 := VarArrayCreate( [0, 1], varOleStr );
  ExportColumns:=nil;
  FErrorOpen := false;

  n:=Role.EnableEditForm(Self.Name,'');
  if (n=0)
    then FEnableWrite:=false
    else FEnableWrite:=true;
  CheckToolBar(TBToolbarMenu,FEnableWrite);

  TBSubmenuTmp.Visible:=LoadTemplate(Self.Name);
  TBExcelReport.Visible:=LoadExcelReport(TBExcelReport, Self.Name);
  CheckGurnalZAGS;

//  CreateEvents(Self.Name);
end;

constructor TfmGurnalStdQuery.Create(Owner: TComponent);
begin
  inherited;
  CreateForAll;
end;

constructor TfmGurnalStdQuery.CreateChild;
begin
  inherited Create(nil);
  Visible := false;
  CreateForAll;
end;

destructor TfmGurnalStdQuery.Destroy;
begin
//  ShowMessage('Destroy  '+FKodGurnal);
//  if not FErrorOpen and (iniGurnal<>nil) then SaveToIni;
  if FEvents<>nil then begin
    FEvents.Free;
  end;
  FOrderList.Free;
  Query.Close;
  // при выходе из программы если есть открытые реестры,
  // вызывается destroy на главную форму, а затем на дочерние
  // fmMain=nil устанавливается в fmMain.FormDestroy
  if fmMain<>nil then
    fmMain.DeleteFromListGurnal(Self.Name);
  if not FErrorOpen and (iniGurnal<>nil) then iniGurnal.UpdateFile;
  if iniGurnal<>nil then iniGurnal.Free;
  FFilterInterface.Free;
  if FListPar<>nil
    then FreeAndNil(FListPar);
  if FPokaz<>nil        then FPokaz.Free;
  if ExportColumns<>nil then ExportColumns.Free;
  if formChoiceAdres<>nil then FreeAndNil(formChoiceAdres);
  inherited;
end;

procedure TfmGurnalStdQuery.SetKodGurnal(const Value: String);
var
  strID : String;
begin
  FKodGurnal := Value;
//  strID := GetNameReport(FKodGurnal);
  strID := FKodGurnal;
  if GlobalTask.CountReport(strID) = 0 then begin
    TBItemPreView.Visible := false;
    TBItemPrint.Visible   := false;
  end else begin
    TBItemPreView.Visible := true;
    TBItemPrint.Visible   := true;
  end;
end;

//--------------------------------------------------------------------
procedure TfmGurnalStdQuery.SetQueryDateFiks( dDateFiks : TDateTime; lReopen : Boolean );
var
  lDisable : Boolean;
  i : Integer;
  sBase:String;
begin
  lDisable := false;
  if not Query.ControlsDisabled then begin
    lDisable := true;
    Query.DisableControls;
  end;
  if Query.Active
    then Query.Close;
  Query.SQL.Text := StringReplace( Query.SQL.Text, '&datefiks&', QStr(DTOS(dDateFiks,tdAds)),[rfReplaceAll, rfIgnoreCase]);
  Query.SQL.Text := StringReplace( Query.SQL.Text, '&tmp&', GetNameTmpIdTable,[rfReplaceAll, rfIgnoreCase]);

  {$IFDEF OCHERED}
    Query.SQL.Text := StringReplace( Query.SQL.Text, '&set_datefiks&', '',[rfReplaceAll, rfIgnoreCase]);
  {$ELSE}
    Query.SQL.Text := StringReplace( Query.SQL.Text, '&set_datefiks&', 'n.date_fiks='+QStr(DTOS(dDateFiks,tdAds))+' and ',[rfReplaceAll, rfIgnoreCase]);
  {$ENDIF}
  if FCurBase=-1
    then sBase:=''
    else sBase:='id_base='+IntToStr(FCurBase)+' and ';
  Query.SQL.Text := StringReplace( Query.SQL.Text, '&id_base&', sBase,[rfReplaceAll, rfIgnoreCase]);
  for i:=0 to Query.ParamCount-1 do begin
    if AnsiCompareText(Query.Params[i].Name, 'DATEFIKS') = 0 then begin
      try
        Query.Params[i].AsDateTime := dDateFiks;
//        Query.Params[i].AsString := FormatDateTime('yyyy-mm-dd',dDateFiks);
      except
      end;
    end else begin
      SetQueryParam(Query.Params[i]);
    end;
  end;
  if lReopen  then Query.Open;
  if lDisable then Query.EnableControls;
end;

procedure TfmGurnalStdQuery.SetQueryParam(p : TParam);
begin
//
end;

//---------------------------------------------------
function TfmGurnalStdQuery.GetBeginSQL : String;
begin
  Result := 'SELECT * FROM [MMM] WHERE '+#13;
  if TypeEditObj = dmBase.TypeObj_Lich then begin
    Result := 'SELECT * FROM ЛицевыеСчета '+AliasLichSchet+#13+
              ' LEFT JOIN БазаДомов a on l.date_fiks=a.date_fiks and l.adres_id=a.id '+#13+
              ' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_Nasel then begin
    if UpperCase(KodGurnal)='FMGURNOCHERED' then begin
      Result := 'SELECT * FROM Ochered oc'+#13+
                ' LEFT JOIN Население n on n.id=oc.id '+#13+
                ' LEFT JOIN OcheredResh ocr on oc.id_last_resh=ocr.auto_id '+#13+
                ' LEFT JOIN БазаДомов a on n.date_fiks=''1899-12-30'' and n.adres_id=a.id '+#13+
                ' WHERE '+#13;
    end else begin
      Result := 'SELECT * FROM Население '+AliasMens+#13+
                ' LEFT JOIN БазаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id '+#13+
                ' LEFT JOIN НаселениеДоп d on n.id=d.id '+#13+
                ' LEFT JOIN VUS v on n.id=v.id '+#13+
                ' LEFT JOIN Ochered oc on oc.ochered_id=0 and n.id=oc.id '+#13+
                ' WHERE '+#13;
    end;
  end else if TypeEditObj = dmBase.TypeObj_Adres then begin
    Result := 'SELECT * FROM БазаДомов '+AliasAdres+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZBrak then begin
    Result := 'SELECT * FROM ЗаключениеБраков '+AliasZBrak+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_DBrak then begin
    Result := 'SELECT * FROM DeclareMarriage '+AliasDBrak+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_DRast then begin
    Result := 'SELECT * FROM DeclareTermMarriage '+AliasDRast+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_Passport then begin
    Result := 'SELECT * FROM Паспорт '+AliasPassport+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZRogd then begin
    Result := 'SELECT * FROM АктыРождений '+AliasZRogd+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZSmert then begin
    Result := 'SELECT * FROM АктыСмертей '+AliasZSmert+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZAdopt then begin
    Result := 'SELECT * FROM AktAdopt '+AliasZAdopt+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZRast then begin
    Result := 'SELECT * FROM AktTermMarriage '+AliasZRast+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_UZRogd then begin
    Result := 'SELECT * FROM GurnalRegistr '+AliasUZRogd+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZChName then begin
    Result := 'SELECT * FROM AktChangeName '+AliasZChName+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZUstOtc then begin
    Result := 'SELECT * FROM АктыУстОтцовства '+AliasZUstOtc+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZUstMat then begin
    Result := 'SELECT * FROM АктыУстМатеринства '+AliasZUstMat+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_TalonPrib then begin
    Result := 'SELECT * FROM ТалоныПрибытия '+AliasTalonPrib+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_TalonUbit then begin
    Result := 'SELECT * FROM ТалоныУбытия '+AliasTalonUbit+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_DeclareRegistr then begin
    Result := 'SELECT * FROM DeclareRegistr '+AliasDeclRegistr+' WHERE '+#13;
  end else if TypeEditObj = dmBase.TypeObj_ZAGS_AddDok then begin
    Result := 'SELECT * FROM AddDokZAGS '+AliasAddDokZAGS+' WHERE '+#13;
  end;
end;

//-----------------------------------------------------------
procedure TfmGurnalStdQuery.SetCaptionGurnal;
var
  s,ss : String;
begin
  s:=FMainCaption;
  if (FSysFltCaption<>'') and (FSysFltCaption<>'*')
    then s:=s+' '+FSysFltCaption+' ';
  if FFilter_Punkt<>'' then begin
    s:=s+' [НАС. ПУНКТЫ]';
  end;
  if (FFltCaption<>'') then begin
    if FFltCaption='*' then ss:=' установлен отбор'
                       else ss:=' установлен отбор: '+FFltCaption;
    s:=s+ss;
  end;
  Self.Caption:=s;
end;

//----------------------------------------------------
procedure TfmGurnalStdQuery.ClickSetFilter(SenderObj : TObject; Sender: TFindList);
var
  strSQL : String;
  strOrderBy : String;
begin
//  sender[0].Value1.NumVal
//  Showmessage(IntToStr(sender[0].Value1.NumVal));
//  ShowStrings(Sender.ParamCtrl,'');
  strSQL := FilterInterface.GetSQL( Sender );
  if Trim(Sender.Caption)='' then FFltCaption:='*'
                             else FFltCaption:=Sender.Caption;
  SetCaptionGurnal;
  strOrderby := FilterInterface.GetCurrentOrderBy;
  if strSQL <> '' then begin
    strSQL  := ChangeWhere(Query.SQL.Text, strSQL, false);
    if strOrderBy<>'' then begin
      strSQL  := ChangeOrderBy(strSQL, strOrderBy);
    end;
    FNewSQL := strSQL;
    Refresh(true);
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end;
end;

//--------------------------------------------------
procedure TfmGurnalStdQuery.TestFilterSQL(Sender: TObject);
var
  strSQL : String;
begin
  strSQL := GetBeginSQL;
  ExecuteFormQuery( dmBase.GetPropertyAds, dmBase.IniSysParams, false,
                    strSQL + FilterInterface.GetSQL(TFindList(Sender)));
end;

//-------------------------------------------------------------------------
function TfmGurnalStdQuery.InitFilter( var strErr : String ) : Boolean;
var
  strCaption : String;
  strDir     : String;
  strAl      : String;
  lVisible : Boolean;
begin
  Result := true;
  FilterInterface.AdminUser := Role.SystemAdmin;
  if not FilterInterface.AdminUser then begin
    FilterInterface.UserRights := [];
    // работа с дизайнером форм                            urDesigner
    // тестирование запроса                                urTestSQL
    // проверка ошибок инициализации интерфейса фильтра    urTestError
    // настройка дерева полей                              urFieldTree
    if Role.Status = rsAdmin then begin
      FilterInterface.UserRights := FilterInterface.UserRights + [urDesigner];
    end;
  end;
  FilterInterface.Where:='';
  FilterInterface.UseYear := true;
  FilterInterface.MainConnect := dmBase.AdsConnection.Name;
  if TypeEditObj = dmBase.TypeObj_Lich then begin
    strCaption := 'Лицевые счета';
    strDir := 'ЛицевыеCчета';
    strAl := AliasLichSchet;
    FilterInterface.MainTableName  := 'Лицевыесчета';
    FilterInterface.MainTableAlias := AliasLichSchet;
    FilterInterface.MainTableJoin  := ' LEFT JOIN БазаДомов a on l.date_fiks=a.date_fiks and l.adres_id=a.id ';
  end else if TypeEditObj = dmBase.TypeObj_Nasel then begin
    if FSubType <> '' then begin
      strCaption := FSubType;
      strDir := FSubType;
    end else begin
      strCaption := 'Население';
      strDir := 'Население';
    end;
    strAl := AliasMens;
    FilterInterface.MainTableName  := 'Население';
    FilterInterface.MainTableAlias := AliasMens;
    FilterInterface.MainTableJoin  := ' LEFT JOIN БазаДомов a on n.date_fiks=a.date_fiks and n.adres_id=a.id ';
  end else if TypeEditObj = dmBase.TypeObj_Adres then begin
    strCaption := 'Дома';
    strDir := 'Дома';
    strAl := AliasAdres;
    FilterInterface.MainTableName  := 'БазаДомов';
    FilterInterface.MainTableAlias := AliasAdres;
  end else if TypeEditObj = dmBase.TypeObj_ZBrak then begin
    strCaption := 'Заключение браков';
    strDir := 'ЗаключениеБраков';
    strAl := AliasZBrak;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'ЗаключениеБраков';
    FilterInterface.MainTableAlias := AliasZBrak;
  end else if TypeEditObj = dmBase.TypeObj_DBrak then begin
    strCaption := 'Заявления о заключении брака';
    strDir := 'DeclareMarriage';
    strAl := AliasDBrak;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareMarriage';
    FilterInterface.MainTableAlias := AliasDBrak;
  end else if TypeEditObj = dmBase.TypeObj_DRast then begin
    strCaption := 'Заявления о расторжении брака';
    strDir := 'DeclareTermMarriage';
    strAl := AliasDRast;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareTermMarriage';
    FilterInterface.MainTableAlias := AliasDRast;
  end else if TypeEditObj = dmBase.TypeObj_ZRogd then begin
    strCaption := 'Акты рождений';
    strDir := 'АктыРождений';
    strAl := AliasZRogd;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыРождений';
    FilterInterface.MainTableAlias := AliasZRogd;
  end else if TypeEditObj = dmBase.TypeObj_ZSmert then begin
    strCaption := 'Акты смерти';
    strDir := 'АктыСмертей';
    strAl := AliasZSmert;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыСмертей';
    FilterInterface.MainTableAlias := AliasZSmert;
  end else if TypeEditObj = dmBase.TypeObj_ZUstOtc then begin
    strCaption := 'Акты установления отцовства';
    strDir := 'АктыУстОтцовства';
    strAl := AliasZUStOtc;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыУстОтцовства';
    FilterInterface.MainTableAlias := AliasZUstOtc;
  end else if TypeEditObj = dmBase.TypeObj_ZUstMat then begin
    strCaption := 'Акты установления материнства';
    strDir := 'АктыУстМатеринства';
    strAl := AliasZUStMat;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'АктыУстМатеринства';
    FilterInterface.MainTableAlias := AliasZUstMat;
  end else if TypeEditObj = dmBase.TypeObj_ZAdopt then begin
    strCaption := 'Акты усыновления (удочерения)';
    strDir := 'АктыУсыновления';
    strAl := AliasZAdopt;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktAdopt';
    FilterInterface.MainTableAlias := AliasZAdopt;
  end else if TypeEditObj = dmBase.TypeObj_ZRast then begin
    strCaption := 'Расторжение браков';
    strDir := 'РасторжениеБраков';
    strAl := AliasZRast;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktTermMarriage';
    FilterInterface.MainTableAlias := AliasZRast;
  end else if TypeEditObj = dmBase.TypeObj_UZRogd then begin
    strCaption := 'Журнал учета заявлений о регистрации рождения';
    strDir := 'Журнал учета заявлений о регистрации рождения';
    strAl := AliasUZRogd;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'GurnalRegistr';
    FilterInterface.MainTableAlias := AliasUZRogd;
  end else if TypeEditObj = dmBase.TypeObj_ZChName then begin
    strCaption := 'Акты изменения имени';
    strDir := 'ИзменениеИмени';
    strAl := AliasZChName;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AktChangeName';
    FilterInterface.MainTableAlias := AliasZChName;
  end else if TypeEditObj = dmBase.TypeObj_Passport then begin
    strCaption := 'Заявление на паспорт';
    strDir := 'Паспорт';
    strAl := AliasPassport;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'Паспорт';
    FilterInterface.MainTableAlias := AliasPassport;
  end else if TypeEditObj = dmBase.TypeObj_TalonPrib then begin
    strCaption := 'Талоны прибытия';
    strDir := 'ТалоныПрибытия';
    strAl := AliasTalonPrib;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'ТалоныПрибытия';
    FilterInterface.MainTableAlias := AliasTalonPrib;
  end else if TypeEditObj = dmBase.TypeObj_TalonUbit then begin
    strCaption := 'Талоны убытия';
    strDir := 'ТалоныУбытия';
    strAl := AliasTalonUbit;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'ТалоныУбытия';
    FilterInterface.MainTableAlias := AliasTalonUbit;
  end else if TypeEditObj = dmBase.TypeObj_DeclareRegistr then begin
    strCaption := 'Заявления о регистрации';
    strDir := 'ЗаявленияРегисрации';
    strAl := AliasDeclRegistr;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'DeclareRegistr';
    FilterInterface.MainTableAlias := AliasDeclRegistr;
  end else if TypeEditObj = dmBase.TypeObj_ZAGS_AddDok then begin
    strCaption := 'Дополнительный документы';
    strDir := 'ДополнительныйДокументы';
    strAl := AliasAddDokZAGS;
    FilterInterface.UseYear := false;
    FilterInterface.MainTableName  := 'AddDokZAGS';
    FilterInterface.MainTableAlias := AliasAddDokZAGS;
  end;
  FilterInterface.RootCaption := strCaption;
  FilterInterface.Ini := GlobalTask.iniFile('CONF');
  FilterInterface.Section  :='fFind';
  FilterInterface.AutoSave := true;
  if fmMain.DateFiks <> dmBase.GetDateCurrentSost then begin
    FilterInterface.SearchRange := srYear;
    // чтобы в фильтре красиво подсвечивался год
    FilterInterface.SearchDate :=  IncMonth( fmMain.DateFiks, -12) ;
  end else begin
    FilterInterface.SearchRange := srCurrent;  //srAllYear, srYear
    FilterInterface.SearchDate :=  dmBase.GetDateCurrentSost;
  end;
  FilterInterface.DateTimeFormat :='yyyy-mm-dd';
  FilterInterface.BaseDir := NameFromExe('Filters\'+strDir);
  FilterInterface.DateFieldName := strAl + '.Date_Fiks';

  FilterInterface.DoFieldSort := true;

  CreateRelList( FilterInterface.RelList, TypeEditObj );
  if not FilterInterface.LoadFieldList( NameFileOpisFilter(TypeEditObj) ) then begin
    LoadFields(FilterInterface.FindFieldList, TypeEditObj );
    FilterInterface.SaveFieldList( NameFileOpisFilter(TypeEditObj) );
  end;

  if TypeEditObj = dmBase.TypeObj_Nasel then begin
    // если "ВУС" недоступен то отключим реквизиты отвечающие за ВУС
    lVisible := not (Role.CheckSubSystem(SS_VUS)=ptDeniedAccess);
    FFilterInterface.FindFieldList.SetVisible('ВУС', lVisible);
    if FFilterInterface.FindFieldList.ByPath('FLD_VUS')<>nil then begin
       FFilterInterface.FindFieldList.ByPath('FLD_VUS').Visible:=lVisible;
    end;
    // если "Очередь на жильё" недоступена то отключим реквизиты отвечающие за нее
    lVisible := not (Role.CheckSubSystem(SS_OCHERED)=ptDeniedAccess);
    FFilterInterface.FindFieldList.SetVisible('Очередь на жильё', lVisible);
    if FFilterInterface.FindFieldList.ByPath('FLD_OCHERED')<>nil then begin
       FFilterInterface.FindFieldList.ByPath('FLD_OCHERED').Visible:=lVisible;
    end;
  end;

  FilterInterface.OnTestSQL      :=TestFilterSQL;
  FilterInterface.OnFilterEvent  :=ClickSetFilter;
  FilterInterface.OnUserOperEvent:=OnUserOper;
  FilterInterface.BuildFilterMenu2(TBSubChoiceFlt,nil);
end;

// вставка для возможности поиска по выражению  "case fieldname is null or fieldname=0 then false else true end"
// см. также модуль uFilter функция LoadNasel()
function TfmGurnalStdQuery.OnUserOper(Oper: TOperItem; FindField: TFindFieldItem; RelItem: TRelItem; FullFieldName, Value1, Value2, OperVal: string; var Expr: string): Boolean;
begin
   Result:=False;
   if (FindField<>nil) and (Oper.Name='EQUAL_L') and
      ((FindField.RealName='LIC_ID') or (FindField.RealName='ADRES_ID')) then begin
     Expr:=Format('case when %0:s is null or %0:s=0 then false else true end=%1:s', [FullFieldName, Value1]);
     Result:=true;
   end;
end;

//------------------------------------------------------------------------
procedure TfmGurnalStdQuery.InitOrderBy;
begin
end;

//-------------------------------------------------------------------
// создать условие для фильтра, которое должно добавляться всегда
//-------------------------------------------------------------------
function TfmGurnalStdQuery.CreateAdditiveWhere(strAddSQL : String): String;
begin
  FilterInterface.Where := '';
  strAddSQL:=Trim(strAddSQL);
  if strAddSQL<>'' then begin
    if FilterInterface.Where=''
      then FilterInterface.Where:=strAddSQL
      else FilterInterface.Where:='('+FilterInterface.Where+') and '+strAddSQL;
    Result:=FilterInterface.Where;
  end else begin
    Result:='';
  end;
end;

//-------------------------------------------------------------------
//-------------------------------------------------------------------
function TfmGurnalStdQuery.GetCurrentWhere: String;
begin     
  if TBItemClrFlt.Enabled then begin  // если установлен отбор
    Result:=FilterInterface.GetCurrentSQL;
  end else begin                      // иначе where по умолчпнию
    Result:=CreateAdditiveWhere(getAdditiveWhere);
  end;
end;
//--------------------------------------------------------------------
function TfmGurnalStdQuery.GetNameTmpIdTable:String;
begin
  Result:='#tmp_'+KodGurnal;
end;
//--------------------------------------------------------------------
function TfmGurnalStdQuery.LoadQuery : Boolean;
var
//  strFields,strFrom,strWhere,strWhereAll,strWhereUser,
  strSect,strFilter,strFrom,s,ss,strPokaz : String;
  strKod,strTip,strP : String;
  i,j,m : Integer;
  sl : TStringList;
  arr : TArrStrings;
  lCS : Boolean;
  nCheckOrder:Integer;
  sTypeOrder:String;
begin
  Result:=true;
  FCheckGodGurnal:=false;
  FCurGodGurnal:=-1;
  FNewSQL:='';
  strKod := KodGurnal;
  FOrderList     := nil;
  if iniGurnal=nil then begin
    try
      iniGurnal := TSasaIniFile.Create(GlobalTask.PathService+KodGurnal+'.ini');
    except
      Result:=false;
      PutError(' Ошибка загрузки файла описания журналов. ',self);
    end;
  end;
  //---------------------------------------
  strSect := 'FIELDS_ORDERBY';
  sl := TStringList.Create;
  iniGurnal.ReadSectionValues(strSect,sl);
  for i:=0 to sl.Count-1 do begin
    s  := Trim(sl.Names[i]);
    ss := sl.Values[sl.Names[i]];
    j:=Pos('.',s);
    if j > 0 then begin
      StrToArr(ss,arr,',',false);   // 0-Caption 1-FieldType 2-CS
      if Length(arr)>2 then begin
        lCS := (ANSIUpperCase(Copy(arr[2],1,1))='T');
      end else begin
        PutError(' Ошибка чтения описания полей для ORDER BY ',self);
      end;
    end else begin
      StrToArr(ss,arr,',',false);   // 0-Caption 1-FieldType 2-CS
      if Length(arr)>2 then begin
        lCS := (ANSIUpperCase(Copy(arr[2],1,1))='T');
      end else begin
        PutError(' Ошибка чтения описания полей для ORDER BY ',self);
      end;
//      PutError(' Ошибка чтения описания полей для ORDER BY ');
    end;
  end;
  InitOrderBy;

  if (TypeEditObj = dmBase.TypeObj_Nasel) or (TypeEditObj = dmBase.TypeObj_Lich) then begin
    FTypeVisibleMens:=GlobalTask.GetLastValueAsInteger(KodGurnal+'_TYPEVISIBLEMENS');
    FRed:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_RED');
    FBlue:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_BLUE');
    FGreen1:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_GREEN1');
    FGreen2:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_GREEN2');
    FUnderline:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_UNDERLINE');
    FOldCopyMen:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_OLDCOPYMEN');
    FRiap:=GlobalTask.GetLastValueAsBoolean(KodGurnal+'_RIAP');
  end;

  //---------------------------------------
  strSect := 'QUERY';
  sl.Free;
//  FWhere := '';
  if Result then begin
    sl := TStringList.Create;
    Query.DatabaseName:=GlobalTask.MainDataBaseName;
    iniGurnal.ReadSectionValues(strSect,sl);
    for i:=0 to sl.Count-1 do begin
      if Copy(sl.Names[i],1,3)='SQL' then begin
        s := Trim(sl.ValueFromIndex[i]); // Trim(iniGurnal.ReadString(strSect,'SQL'+IntToStr(i),''));
        if s<>'' then begin
          if Copy(s,1,1)='"'   then s:=Copy(s,2,Length(s));
          if RightStr(s,1)='"' then s:=Copy(s,1,Length(s)-1);
          s:=Trim(s);
          {$IFDEF OCHERED}
            if dmBase.OblBase and  (UpperCase(KodGurnal)='FMGURNOCHERED') then begin
              if Pos('LEFT JOIN БАЗАДОМОВ', ANSIUpperCase(s))>0 then begin
                s:='';
              end;
            end;
          {$ENDIF}

          if s<>'' then begin
            Query.SQL.Add(s);
            j:=Pos('WHERE', ANSIUpperCase(s));
            if j > 0 then begin
              s:=Copy(s,j+5,Length(s));
//          FWhere := s;
            end;
            j:=Pos('ORDER BY', ANSIUpperCase(s));
            if j>0 then begin
              s:=Copy(s,j+8,Length(s));
            end;
          end;
        end;  
      end;
    end;
    sl.Free;
    strFrom := iniGurnal.ReadString(strSect,'TABLENAME','');
    nCheckOrder:=iniGurnal.ReadInteger(strSect,'CHECK_ORDER',0);

//    FCurGodGurnal:=2006;

    FCheckGodGurnal:=iniGurnal.ReadBool(strSect,'CHECK_GOD',false);  // !!!
    if FCheckGodGurnal then begin
      TBItemYear.Visible:=true;
    end else begin
      TBItemYear.Visible:=false;
    end;

    if (strFrom <> '') and (nCheckOrder>0) then begin
      if nCheckOrder=1 then begin
        sTypeOrder:=GlobalTask.ParamAsString('GURNAL_DATEIZM');
        if sTypeOrder='1' then begin
        {
        dmBase.WorkQuery.SQL.Text := 'select * from system.columns where name='+QStr('dateizm')+' and parent=' +QStr(strFrom);
        dmBase.WorkQuery.AdsConnection := dmBase.AdsConnection;
        dmBase.WorkQuery.Open;
        if not dmBase.WorkQuery.Eof then begin
        }
          // для показа по дате корретировки записи
          Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, 'dateizm desc');
  //      end;
  //      dmBase.WorkQuery.Close;
        end else if sTypeOrder='2' then begin   // дата записи номер записи
          Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, 'datez desc, nomer desc');
        end;
      end else if nCheckOrder=2 then begin
        if UpperCase(KodGurnal)='FMGURNOCHERED' then begin
          sTypeOrder:=GlobalTask.ParamAsString('OCHERED_ORDER');
          //0=номер в очереди
          //1=дата заявления
          //2=фамилия
          if (sTypeOrder='0') or (sTypeOrder='') then begin

          end else begin
            if sTypeOrder='1' then begin
              Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, '');
            end else if sTypeOrder='2' then begin
              Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, '');
            end else if sTypeOrder='3' then begin
              Query.SQL.Text := ChangeOrderBy(Query.SQL.Text, '');
            end;
          end;
        end;
      end;
    end;
    // поля для полнотекстового поиска
    FFTSFields:=iniGurnal.ReadString(strSect,'FTS_FIELDS','');

    strFilter  := iniGurnal.ReadString(strSect,'FILTER','');
    s := iniGurnal.ReadString(strSect,'ADDITIVE_WHERE','');
    CharDel(s,'"');

    CreateAdditiveWhere(getAdditiveWhere);

    FID := iniGurnal.ReadString(strSect,'ID','ID');

    iniGurnal.ReadSectionValues('ENABLE_POKAZ',FPokaz);
    if FPokaz.Count>0 then begin
      strPokaz:='';
      for j:=0 to FPokaz.Count-1 do begin
        FPokaz.Objects[j] := Pointer(0);
        m := Pos('#', FPokaz.Names[j]);
        if m=0 then begin
          s :=FPokaz.Names[j];
        end else begin
          s := Copy(FPokaz.Names[j],m+1,50);
        end;
//        if dmBase.SprProperty.Locate( 'TYPEOBJ;KOD', VarArrayOf([TypeEditObj,s]), [] ) then begin
        strP:='';
        if dmBase.SprProperty.Locate( 'KOD', s, [] ) then begin
          strTip := Trim(dmBase.SprProperty.FieldByName('Tip').AsString);
          if (dmBase.SprProperty.FieldByName('OpisEdit').AsString<>'') then begin
            strP := ','+QStr('')+' POKAZ_';
          end else if (strTip='I') or (strTip='N') then begin
            strP := ',0 POKAZ_';
          end else begin
            strP := ','+QStr('')+' POKAZ_';
          end;
        end;
        if strP<>''
          then strPokaz := strPokaz + strP + FPokaz.Names[j];
      end;
      Query.SQL.Text := StringReplace(Query.SQL.Text,'&POKAZ&',strPokaz,[rfReplaceAll]);
      sl := TStringList.Create;
      iniGurnal.ReadSectionValues('VISIBLE_POKAZ',sl);
      for i:=0 to sl.Count-1 do begin
        s  := Trim(sl.Names[i]);
        ss := sl.Values[sl.Names[i]];
        if ss='1' then begin   // показатель доступен
          for j:=0 to FPokaz.Count-1 do begin
            if FPokaz.Names[j]=s then begin
              FPokaz.Objects[j] := Pointer(1);
            end;
          end;
        end;
      end;
      sl.Free;
    end;
    {
    strFields  := iniGurnal.ReadString(strKod,'FIELDS','ID,TYPEDOK,DATED');
    strWhere   := iniGurnal.ReadString(strKod,'WHERE','');
    strWhereAll:= iniGurnal.ReadString(strKod,'WHERE_ALL','');
    strWhereUser:= iniGurnal.ReadString(strKod,'WHERE_'+GlobalTask.UserID,'');
    }

    FSourceTable := '';
    if strFrom<>'' then begin
      FSourceTable := strFrom;
    end;
  //  Query.ReadOnly :=true;

    try
      TmpQuery.SQL.Add('try DROP TABLE '+GetNameTmpIdTable+'; catch all end;');
      TmpQuery.SQL.Add('try CREATE TABLE '+GetNameTmpIdTable+' (ID Integer); catch all end;');
      TmpQuery.SQL.Add('DELETE FROM '+GetNameTmpIdTable+';');
      TmpQuery.ExecSQL;
    except
      on E:Exception do begin
        PutError('Ошибка создания временной таблицы: '+#13+E.Message,self);
      end;
    end;

    try
      CreateEvents(strKod);

      SetQueryDateFiks( DateFiks, true );  // выполняется Query.Open

      if strFilter<>'' then begin
        Query.Filter:=strFilter;
        Query.Filtered:=true;
      end;

    except
      on E:Exception do begin
        Result := false;
        FErrorOpen:=true;
        Screen.Cursor := crDefault;
        Query.Close;
        PutError(E.Message,self);
      end;
    end;
    SetCaptionGurnal;
  end;
end;
//------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.FullRefresh(lReopen:Boolean);
var
  strSQL : String;
  strOrderBy : String;
begin
  strSQL:='';
  if TBItemClrFlt.Enabled
    then strSQL:=FilterInterface.GetCurrentSQL;
  if lReopen or (strSQL<>'') then begin
    FFltCaption:='';
    SetCaptionGurnal;
    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    if strSQL<>''
      then strSQL:=ChangeWhere(Query.SQL.Text, strSQL , false);
    if strOrderBy<>'' then begin
      strSQL:=ChangeOrderBy(strSQL, strOrderBy);
    end;
    FNewSQL := strSQL;
    Refresh(true);
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end else begin
    Refresh(true);
  end;
end;
//------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.Refresh(lFull : Boolean; ID:String);
var
  old    : TCursor;
  oldSQL : String;
  lErr,lCancel,lSeekID  : Boolean;
  fld : TField;
  BookMark : TBookMarkStr;
  Row: Integer;
begin
  old := Screen.Cursor;
  Application.ProcessMessages;
  Query.DisableControls;
                           
  if (ID='') then begin
    lSeekID:=false;
    fld := Query.FindField('ID');
    ID  := '';
    if fld <> nil then begin
      ID := fld.AsString;
    end;
  end else begin
    lSeekID:=true;
  end;

//запомнить первую видиму строку
  Row:=Grid.Row;
  Query.MoveBy(-Pred(Row));
  Bookmark:=Query.Bookmark;

//  BookMark:=Query.Bookmark;

  if (FNewSQL='') and Query.CanModify and not lFull then begin
//  if (FNewSQL='') and not lFull then begin
    Query.Refresh;

    if Query.BookmarkValid(TBookmark(Bookmark)) then begin
      Query.Bookmark:=Bookmark;
      //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
      Query.MoveBy(Pred(Grid.VisibleRowCount));
      Query.MoveBy(Row-Grid.VisibleRowCount);
    end;

  end else begin
    Query.Close;
    oldSQL := Query.SQL.Text;
    if FNewSQL<>'' then Query.SQL.Text:=FNewSQL;
    SetQueryDateFiks( DateFiks, false );
    lErr    := false;
    lCancel := false;
//    Screen.Cursor := crHourGlass;
    try
      try
//        RegisterCallback(Query,1);
//        if Screen.Cursor = crHourGlass then ShowMessage('222222222');
        Query.Open;
//        lCancel := IsCloseCallback;
//        ClearCallback;
      except
        on E:Exception do begin
          lErr := true;
          PutError('Ошибка открытия: '+#13+E.Message,self);
        end;
      end;
      if lErr or lCancel then begin
        Query.SQL.Text := oldSQL;
        Query.Open;
      end;
      if not lFull or lSeekID then begin
        try

//----- было ------------------
//         Query.Bookmark := Bookmark;

//----- стало ------------------
          if Query.BookmarkValid(TBookmark(Bookmark)) then begin
            Query.Bookmark:=Bookmark;
            //теперь первая строка окажется посередине экрана поэтому надо ее поднять вверх и вернуться обратно
            Query.MoveBy(Pred(Grid.VisibleRowCount));
            Query.MoveBy(Row-Grid.VisibleRowCount);
          end;
//-------------------------------

          if (ID<>'') and (ID<>Query.FieldByName('ID').AsString) then begin
            if not Query.Locate('ID',ID,[]) then begin
              Query.First;
            end;
          end;
        except
        end;
      end;
    finally
      Screen.Cursor := old;
    end;
  end;
  Query.EnableControls;
 // Grid.Invalidate;
end;

procedure TfmGurnalStdQuery.TBItemRefreshClick(Sender: TObject);
begin
  FullRefresh;
end;                                                   

procedure TfmGurnalStdQuery.TBItemEditClick(Sender: TObject);
begin
  if not Query.FieldByName('ID').IsNull then begin
    SetListParEditForm;   // заполнить FListPar
    if fmMain.EditDokument(Query, GetTypeEditObj,'ID',FListPar,true, KodGurnal) then begin
      Refresh(false);
    end;
    FListPar.Clear;
  end;
end;

procedure TfmGurnalStdQuery.TBItemDelDokClick(Sender: TObject);
var
  arr : TArrStrings;
  strErr : String;
  sBookMark,s:String;
  lCheck,lQuest:Boolean;
begin
  if not Query.FieldByName('ID').IsNull then begin
  //  PrintTable.ShowReport;
    SetLength(arr,0);
    SelectionToArr(Grid,arr);
    strErr:='';
    if Length(arr)=0 then begin
      lQuest:=true;
      if CheckDelete(strErr,lQuest) then begin
        if not lQuest or Problem(QuestDel,mtConfirmation,self) then begin
          lCheck:=dbDisableControls(Query);
          s:=Query.Bookmark;
          sBookMark:='';

          Query.Next;
          if Query.Eof then begin
            Query.Prior;
            if not Query.Bof
              then sBookMark:=Query.Bookmark;
          end else begin
            sBookMark:=Query.Bookmark;
          end;
          Query.Bookmark:=s;
          if dmBase.DeleteDokument(Query, GetTypeEditObj, FIgnoreCheck) then begin
            if sBookMark<>'' then begin
              Query.Bookmark:=sBookMark;
            end;
            dbEnableControls(Query,lCheck);
            Refresh(false);
          end else begin
            dbEnableControls(Query,lCheck);
            strErr:=dmBase.LastErrorDelete;
          end;
        end;
      end;
      if strErr<>'' then PutError(strErr,self);
    end else begin

    end;
  end;
end;

function TfmGurnalStdQuery.CheckDelete(var strErr : string; var lQuest:Boolean) : Boolean;
var
  fld:TField;
  s:String;
begin
  strErr:='';
  Result:=true;
  {$IFDEF GISUN}
  fld:=Query.FindField('POLE_GRN');
  if (fld<>nil) then begin // and not Role.SystemAdmin then begin
    if (Gisun.GetPoleGrn(fld)=3) and (Query.FieldByName('DATEZ').AsDateTime>STOD('20130725',tdClipper) ) then begin
      s:='ВНИМАНИЕ!'#13+
         'Запись акта зарегистрирована в ГИС РН.'#13+
         'Об удалении сообщите в подразделение регистра.'#13+
         'Если Вы уверены в необходимости удаления,'#13+
         'введите слово ДА в поле ввода'#13;
      if OkWarning(s,self) then begin
        lQuest:=false;
      end else begin
        Result:=false;
      end;
//      strErr:='После взаимодействия с ГИС РН удаление записи акта запрещено.';
//      Result:=false;
    end;
  end;
  {$ENDIF}
end;

procedure TfmGurnalStdQuery.GridDblClick(Sender: TObject);
begin
  SetListParEditForm;   // заполнить FListPar
  if fmMain.EditDokument(Query, GetTypeEditObj,'ID',FListPar,true, KodGurnal) then begin
    Refresh(false);
  end;
  FListPar.Clear;
end;

procedure TfmGurnalStdQuery.TBItemPreViewClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PreViewReport(KodGurnal);
  AfterReport;
end;

procedure TfmGurnalStdQuery.TBItemPrintClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.PrintReport(KodGurnal);
  AfterReport;
end;

procedure TfmGurnalStdQuery.TBItemDesignReportClick(Sender: TObject);
begin
  BeforeReport;
  GlobalTask.DesignTailReport(KodGurnal);
  AfterReport;
end;

procedure TfmGurnalStdQuery.TBItemWhereClick(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------
function TfmGurnalStdQuery.GridSeekZAGS(sZAGS:String):String;
var
  fld : TField;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  i:Integer;
begin
  Result:='';
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG');
  if Opis<>nil then begin
//    v := fld.Value;
    if sZAGS='' then  v:=null else v:=sZAGS;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      Result:='ID_ZAGS='+VarToStr(v);
    end;
  end;
end;

//------------------------------------------------------------------------
function TfmGurnalStdQuery.ChoiceBASE(var nCurID:Integer):String;
var
  fld : TField;
  Opis : TOpisEdit;
  v : Variant;
  arrRec : TCurrentRecord;
  i:Integer;
begin
  Result:='';
  Opis := GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_NAMEORG_OCH');
  if Opis<>nil then begin
    if nCurID=0 then v:=null else v:=nCurID;
    SetLength(arrRec,1);
    if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
      Result:=GetValueFieldEx(arrRec,'KNAME','');
      nCurID:=v;
    end;
  end;
end;
//------------------------------------------------------------------------
procedure TfmGurnalStdQuery.GridTitleBtnClick(Sender: TObject; ACol: Integer; Column: TColumnEh);
var
//  lWhere : Boolean;
  strFilter : String;
  CurValue:TParamFieldFlt;
//  tb : TAdsTable;
begin
 // FRunSetUp:=true;
//  tb:=nil;
  if (DataSource.DataSet is TAdsTable) or (DataSource.DataSet is TAdsQuery) then begin
  {
    if DataSource.DataSet is TAdsTable then begin
//      tb := TAdsTable(DataSource.DataSet);
      lWhere := false;
    end else begin
      lWhere := true;
    end;
   }
   if UpperCase(Column.FieldName)='ID_ZAGS' then begin
     strFilter := GridSeekZAGS(Column.Field.AsString);
   end else begin
     CurValue:=TParamFieldFlt.Create;
     CurValue.AOwner:=self;
     CurValue.Empty:=true;  // !!!   типа нет текущих значений для поиска
     strFilter := GridSeekColumn(Column, true, false, CurValue);
     CurValue.Free;
   end;
   if Length(strFilter)>0 then begin
     Query.Filter := strFilter;
     Query.Filtered := true;
     TBItemClrFlt.Enabled:=true;
   end;
   {
    lWhere := false;
    if lWhere then begin
      strFilter := GridSeekColumn(Column, true, true, nil);
      if Length(strFilter)>0 then begin
        strSQL := ChangeWhere(Query.SQL.Text, strFilter, false);
        FNewSQL := strSQL;
        Refresh(true);
        FNewSQL:='';
        TBItemClrFlt.Enabled:=true;
      end;
    end else begin
      strFilter := GridSeekColumn(Column, true, false, nil);
//      showmessage(strFilter);
      Query.Filter := strFilter;
      Query.Filtered := true;
      TBItemClrFlt.Enabled:=true;
    end;
    }
    {
      strFilter := GridSeekColumn(Column, true, false);
//      strFilter := GridSetFilter(Column, strNameFilter);
      if Length(strFilter)>0 then begin
        //strNameFilter:='ФИЛЬТР';
        if tb.Filtered then begin
          tb.Filtered:=false;
        end;
        tb.Filter  := strFilter;
        tb.Filtered:=true;
        tb.First;
        //SetCaptionForm;
        //tbClr.Visible := true;
      end;
      }
  end;
 // FRunSetUp:=false;
end;

procedure TfmGurnalStdQuery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_F4) and (Shift=[]) then begin
//    if Grid.SelectedIndex>-1 then begin
//      GridTitleBtnClick(Grid, Grid.SelectedIndex,
//        Grid.Columns[Grid.SelectedIndex]);
//    end;
  end;
end;

procedure TfmGurnalStdQuery.TBItemClrFltClick(Sender: TObject);
var
  strSQL : String;
begin
  strSQL := ChangeWhere(Query.SQL.Text, '', false);
  FFltCaption:='';
  SetCaptionGurnal;
  FNewSQL:=strSQL;
  Query.Filter:='';
  Query.OnFilterRecord := nil;
  Refresh(true);
  FNewSQL:='';
  TBItemClrFlt.Enabled:=false;
end;

procedure TfmGurnalStdQuery.TBItemOrderClick(Sender: TObject);
var
  strOrder : String;
  strSQL : String;
  fl : TFindList;
begin
  if TBItemClrFlt.Enabled then begin
     fl := FFilterInterface.Filter;
  end else begin
     fl := FFilterInterface.Filter;
//     fl := FOrderList;
  end;
  if fl <> nil then begin
//    fl.OrderList.AddNew('ORDER_N_FAMILIA',true,false);   vadim
//    fl.OrderList.AddNew('ORDER_N_NAME',true,false);
    if FFilterInterface.EditOrderBy( fl ) then begin
      strOrder := FFilterInterface.GetOrderBy( fl );
      if strOrder <> '' then begin
        strOrder:= StringReplace(strOrder,'*.','',[rfReplaceAll]);  // !!!  fmGurnAlKn
        strSQL  := ChangeOrderBy(Query.SQL.Text, strOrder);
        FNewSQL := strSQL;
        Refresh(true);       
        FNewSQL:='';
      end;
    end;
//    FFilterInterface.GetCurrentOrderByName;
  end;
end;

procedure TfmGurnalStdQuery.TBItemRepeatFilterClick(Sender: TObject);
var
  strSQL : String;
  strOrderBy : String;
begin
  strSQL := FilterInterface.GetCurrentSQL;
  FFltCaption:='';
  SetCaptionGurnal;
  if strSQL <> '' then begin
    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    strSQL  := ChangeWhere(Query.SQL.Text, strSQL , false);
    if strOrderBy<>'' then begin
      strSQL  := ChangeOrderBy(strSQL, strOrderBy);
    end;
    FNewSQL := strSQL;
    Refresh(true);
    FNewSQL:='';
    TBItemClrFlt.Enabled:=true;
  end;
end;

procedure TfmGurnalStdQuery.TBSubmenuItemFilterClick(Sender: TObject);
var
  strSQL : String;
  strOrderBy : String;
begin
  if FilterInterface.Edit then begin
    strOrderby := FilterInterface.GetCurrentOrderBy;
    strSQL := FilterInterface.GetCurrentSQL;
    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    if strSQL <> '' then begin
      strSQL  := ChangeWhere(Query.SQL.Text, strSQL , false);
      if strOrderBy<>'' then begin
        strSQL  := ChangeOrderBy(strSQL, strOrderBy);
      end;
      FNewSQL := strSQL;
      Refresh(true);
      FNewSQL:='';
      TBItemClrFlt.Enabled:=true;
    end;
  end;
  FilterInterface.BuildFilterMenu2(TBSubChoiceFlt,nil);
end;

procedure TfmGurnalStdQuery.TBItemSetFilterClick(Sender: TObject);
var
  strSQL : String;
  strOrderBy : String;
begin
  if FilterInterface.Edit then begin
    strOrderby := FilterInterface.GetCurrentOrderBy;
    strSQL := FilterInterface.GetCurrentSQL;
    if FilterInterface.Filter.Caption='' then FFltCaption:='*'
                                         else FFltCaption:=FilterInterface.Filter.Caption;
    SetCaptionGurnal;
    if strSQL <> '' then begin
      strSQL  := ChangeWhere(Query.SQL.Text, strSQL , false);
      if strOrderBy<>'' then begin
        strSQL  := ChangeOrderBy(strSQL, strOrderBy);       
      end;
      FNewSQL := strSQL;
      Refresh(true);
      FNewSQL:='';
      TBItemClrFlt.Enabled:=true;
    end;
  end;
  FilterInterface.BuildFilterMenu2(TBSubChoiceFlt,nil);
end;

//---------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.SetTypeEditObj(const Value: Integer);
begin
  FTypeEditObj := Value;
end;

//---------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.CheckGurnalZAGS;
begin
{$IFDEF ZAGS}
  FIdZAGS:=GlobalTask.ParamAsInteger('ID');
  if (TypeEditObj=dmBase.TypeObj_ZBrak) or (TypeEditObj=dmBase.TypeObj_ZRast) or (TypeEditObj=dmBase.TypeObj_ZRogd) or
     (TypeEditObj=dmBase.TypeObj_ZSmert) or (TypeEditObj=dmBase.TypeObj_ZUstOtc) or (TypeEditObj=dmBase.TypeObj_ZAdopt) or
     (TypeEditObj=dmBase.TypeObj_ZChName) or (TypeEditObj=dmBase.TypeObj_ZUstMat) then begin
    FGurnalZAGS:=true;
    TBItemLastSvid.Visible:=true;
  end else begin
    TBItemLastSvid.Visible:=false;
  end;
{$ELSE}
  FIdZAGS:=0;
  TBItemLastSvid.Visible:=false;
{$ENDIF}
end;

//---------------------------------------------------------------------------------
function TfmGurnalStdQuery.GetTypeEditObj: Integer;
var
  fld:TField;
  nType:Integer;
begin
  if FInterObj then begin
    nType:=0;
    fld:=Query.FindField('TYPEOBJ');
    if fld<>nil then begin
      nType:=fld.AsInteger;
    end else begin
      fld:=Query.FindField('TYPEDOK');
      if fld<>nil then begin
        nType:=fld.AsInteger;
      end;
    end;
    if nType=0 then begin
      nType:=FTypeEditObj;
    end;  
    Result:=nType;
  end else begin
    Result:=FTypeEditObj;
  end;
end;

//---------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.QueryAfterScroll(DataSet: TDataSet);
begin
  if Query.Eof and Query.Bof then begin
    TBItemEdit.Enabled:=false;
  end else begin
    TBItemEdit.Enabled:=true;
  end;
//  if FEnableWrite then begin
//    if Query.Eof and Query.Bof then begin
//      TBItemDelDok.Enabled:=false;
//    end else begin
//      TBItemDelDok.Enabled:=true;
//    end;
//  end;
end;

procedure TfmGurnalStdQuery.UpdateActions;
begin
  inherited;
  TBItemRepeatFilter.Enabled := TBItemClrFlt.Enabled;
  AddUpdateActions;
end;

procedure TfmGurnalStdQuery.AfterConstruction;
begin
  inherited;
end;

//--------------------------------------------------
// после получения отчета
procedure TfmGurnalStdQuery.AfterReport;
begin
//
end;

//--------------------------------------------------
// перед получением отчета
procedure TfmGurnalStdQuery.BeforeReport;
begin
  SetDateFiksReport(DateFiks);
end;

procedure TfmGurnalStdQuery.SetFilterInterface(const Value: TFilterInterface);
begin
  FFilterInterface := Value;
end;

procedure TfmGurnalStdQuery.TBItemPrintGridClick(Sender: TObject);
var
  f : TfmPrintGrid;
begin
  f := TfmPrintGrid.Create(nil);
  f.Grid := Grid;
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

//----------------------------------------------------------
//function TfmGurnal.GetNameReport(strID: String): String;
//begin
//  Result := strID;
//end;

//-----------------------------------------------------------
procedure TfmGurnalStdQuery.TBItemQueryClick(Sender: TObject);
begin
  FFilterInterface.EditCurrentGroupBy( TBItemClrFlt.Enabled );
end;

//-----------------------------------------------------------
procedure TfmGurnalStdQuery.TBItemGrupOneClick(Sender: TObject);
begin
  if Grid.SelectedField<>nil then begin
    FFilterInterface.ShowFieldGroupBy(Grid.SelectedField.FieldName, TBItemClrFlt.Enabled,Grid.Columns[Grid.SelectedIndex].Width);
  end;
end;

procedure TfmGurnalStdQuery.QueryAfterOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crDefault;
end;

procedure TfmGurnalStdQuery.QueryBeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crHourGlass;
end;

procedure TfmGurnalStdQuery.TBItemExportClick(Sender: TObject);
var
  strBookmark:String;
begin
  CheckExport;
  strBookmark:=Query.Bookmark;
  ExportDataSet('Экспорт', Query, efRtf, [], GetFolderMyDocument, False, False, ExportColumns);
  try
    Query.Bookmark:=strBookmark;
  except
    Query.First;
  end;
end;

procedure TfmGurnalStdQuery.AddUpdateActions;
begin
//
end;

procedure TfmGurnalStdQuery.SetDefCountExport(const Value: Integer);
begin
  FDefCountExport := Value;
end;

procedure TfmGurnalStdQuery.TBItemCountClick(Sender: TObject);
var
  cur : TCursor;
  i,n : Integer;
  bm : String;
begin
  cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  if Query.Filtered then begin
    Query.DisableControls;
    bm := Query.Bookmark;
    Query.First;
    i:=0;
    while not Query.Eof do begin
      Inc(i,1);
      Query.Next;
    end;
    Query.Bookmark := bm;
    Query.EnableControls;
  end else begin
    n:=Pos('FROM ',Query.SQL.Text);
    if n>0 then begin
      TmpQuery.SQL.Text:='SELECT Count(*) '+Copy(Query.SQL.Text, n, Length(Query.SQL.Text));
      n:=LastPos('ORDER BY ',TmpQuery.SQL.Text);
      if n>0 then begin
        TmpQuery.SQL.Text:=Copy(TmpQuery.SQL.Text, 1, n-1);
      end;  
      for i:=0 to TmpQuery.ParamCount-1 do begin
        if AnsiCompareText(TmpQuery.Params[i].Name, 'DATEFIKS') = 0 then begin
          try
            TmpQuery.Params[i].AsDateTime := DateFiks;
          except
          end;
        end else begin
          SetQueryParam(TmpQuery.Params[i]);
        end;
      end;
      TmpQuery.Open;
      i:=TmpQuery.Fields[0].AsInteger;
      TmpQuery.Close;
    end else begin
      i := TmpQuery.RecordCount;
    end;
  end;
  Screen.Cursor := cur;
  ShowMessageCont(IntToStr(i),self);
end;

procedure TfmGurnalStdQuery.TBItemPokazClick(Sender: TObject);
begin
  if EditVisiblePokaz(FPokaz) then begin
    CheckPropertyGridColumns;
  end;
end;

procedure TfmGurnalStdQuery.N1Click(Sender: TObject);
begin
  Self.WindowState:=wsNormal;
  Application.ProcessMessages;
  Self.Top    := 5;
  Self.Left   := 5;
  Self.Width  := fmMain.ClientWidth-30;
  Self.Height := fmMain.ClientHeight-70;
end;

class function TfmGurnalStdQuery.EnableOpen: Boolean;
begin
  Result := true;
end;

procedure TfmGurnalStdQuery.SetListParEditForm;
begin
  FListPar.Clear;
end;

function TfmGurnalStdQuery.GetStrSystemFilter(lWhere:Boolean) : String;
begin
  Result:='';
  if lWhere then begin
    if FTypeVisibleMens=0 then begin // исключить
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FRed    then Result:=Result+'and n.candelete=false ';
        if FBlue   then Result:=Result+'and not (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen1 then Result:=Result+'and not (n.propis=false and n.candelete=false and n.adres_id=0) ';
        if FGreen2 then Result:=Result+'and not (n.propis=false and n.candelete=false and n.adres_id>0) ';
        if FUnderline  then Result:=Result+'and not (n.candelete=false and n.propis=true and n.present=true and n.date_srok_dn is not null)';
        if FOldCopyMen then Result:=Result+'and (n.new_id=0 or n.candelete=false)';
//        if FRiap   then Result:=Result+'and (new_id=0 and (not_riap is null or not_riap=false))';
//        if FRiap   then Result:=Result+'and (n.adres_id>0 and n.lic_id>0 and (not_riap is null or not_riap=false))';
      end else begin  // для алфавитной книги
        if FRed    then Result:=Result+'and l.candelete=false ';
        if FBlue   then Result:=Result+'and not (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen2 then Result:=Result+'and not (n.propis=false and n.candelete=false) ';
        if FGreen1 then Result:=Result+'and (n.candelete=false or l.candelete=true) ';
      end;
    end else begin       //
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FRed    then Result:=Result+'or  n.candelete=true ';
        if FBlue   then Result:=Result+'or  (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen1 then Result:=Result+'or  (n.propis=false and n.candelete=false and n.adres_id=0) ';
        if FGreen2 then Result:=Result+'or  (n.propis=false and n.candelete=false and n.adres_id>0) ';
        if FUnderline  then Result:=Result+'or  (n.candelete=false and n.propis=true and n.present=true and n.date_srok_dn is not null)';
        if FOldCopyMen then Result:=Result+'or  (n.new_id>0 and n.candelete=true)';
//        if FRiap   then Result:=Result+'and not (new_id=0 and (not_riap is null or not_riap=false))';
      end else begin  // для алфавитной книги
        if FRed    then Result:=Result+'or  l.candelete=true ';
        if FBlue   then Result:=Result+'or  (n.propis=true and n.candelete=false and n.present=false) ';
        if FGreen2 then Result:=Result+'or  (n.propis=false and n.candelete=false) ';
        if FGreen1 then Result:=Result+'or  ((n.candelete=true or n.candelete is null) and l.candelete=false) ';    //
      end;
    end;
    if Result<>'' then Result:=Trim(Copy(Result,5,Length(Result)));
  end else begin
    if FTypeVisibleMens=0 then begin // исключить
      if FRed    then Result:=Result+'.and. candelete=.f.';
      if FBlue   then Result:=Result+'.and. .not.(propis=.t. .and. candelete=.f. .and. present=.f.)';
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FGreen1 then Result:=Result+'.and. .not.(propis=.f. .and. candelete=.f. .and. adres_id=0)';
        if FGreen2 then Result:=Result+'.and. .not.(propis=.f. .and. candelete=.f. .and. adres_id>0)';
        if FUnderline then  Result:=Result+'.and. .not.(propis=.t. .and. present=.t. .and. candelete=.f. .and. !empty(date_srok_dn))';
        if FOldCopyMen then Result:=Result+'.and. (new_id=0 .or. candelete=.f.) )';
//        if FRiap   then Result:=Result+'.and. (new_id=0  .and. empty(not_riap))';
      end else begin  // для алфавитной книги
        if FGreen1 then Result:=Result+'.and. .not.(propis=.f. .and. candelete=.f.)';
      end;
    end else begin       //
      if FRed    then Result:=Result+'.or.  candelete=.t.';
      if FBlue   then Result:=Result+'.or.  (propis=.t. .and. candelete=.f. .and. present=.f.)';
      if (TypeEditObj = dmBase.TypeObj_Nasel) then begin
        if FGreen1 then Result:=Result+'.or.  (propis=.f. .and. candelete=.f. .and. adres_id=0)';
        if FGreen2 then Result:=Result+'.or.  (propis=.f. .and. candelete=.f. .and. adres_id>0)';
        if FUnderline then  Result:=Result+'.or.  (propis=.t. .and. present=.t. .and. candelete=.f. .and. !empty(date_srok_dn))';
        if FOldCopyMen then Result:=Result+'.or.  (new_id>0 .and. candelete=.t.)';
//        if FRiap   then Result:=Result+'.and. .not. (new_id=0 .and. empty(not_riap))';
      end else begin  // для алфавитной книги
        if FGreen1 then Result:=Result+'.or.  (propis=.f. .and. candelete=.f.)';
      end;
    end;
    if Result<>'' then Result:=Trim(Copy(Result,7,Length(Result)));
  end;
  if Result='' then FSysFltCaption:=''
               else FSysFltCaption:='[ВКЛ.СИСТЕМ.ОТБОР]';
end;

procedure TfmGurnalStdQuery.TBItemSysFltClick(Sender: TObject);
var
  f : TfmVisibleMensGurnal;
  strSQL:String;
  lCheck:Boolean;
begin
  f := TfmVisibleMensGurnal.Create(Self);
  if KodGurnal='fmGurnAlfKn' then begin
    f.cbCanDelete.Caption:='Ликвидированные лицевые счета';
    f.cbTmpUbit.Caption:='Глава лицевого счета временно отсутствует';
    f.cbGreenMy.Caption:='Глава лицевого счета не зарегистрирован';
    f.cbGreenNotMy.Visible:=true;
    f.Image1.Visible:=true;
    f.RxLabel1.Color:=clBtnFace;
    f.RxLabel1.Left:=f.Image1.Left+25;
    f.RxLabel1.Caption:='Нет главы лицевого счета';
    f.cbZaregSrok.Visible:=false;
    f.cbOldCopyMen.Visible:=false;
    f.ClientHeight:=f.cbGreenNotMy.Top+f.cbGreenNotMy.Height+f.Panel1.Height+5;
  end;
  f.edType.ItemIndex:=FTypeVisibleMens;
  f.cbCanDelete.Checked:=FRed;
  f.cbTmpUbit.Checked:=FBlue;
  f.cbGreenNotMy.Checked:=FGreen1;
  f.cbGreenMy.Checked:=FGreen2;
  f.cbZaregSrok.Checked:=FUnderline;
  f.cbOldCopyMen.Checked:=FOldCopyMen;
//  f.cbRiap.Checked:=FRiap;
  lCheck:=false;
  try
    f.cbGreenNotMy.Color:=clInfoBk;
    if f.ShowModal = mrOk then begin
      if f.edType.ItemIndex=-1 then f.edType.ItemIndex:=0;
      FTypeVisibleMens:=f.edType.ItemIndex;
      FRed:=f.cbCanDelete.Checked;
      FBlue:=f.cbTmpUbit.Checked;
      FGreen1:=f.cbGreenNotMy.Checked;
      FGreen2:=f.cbGreenMy.Checked;
      FUnderline:=f.cbZaregSrok.Checked;
      FOldCopyMen:=f.cbOldCopyMen.Checked;
//      FRiap:=f.cbRiap.Checked;
//      strFilter:=GetStrSystemFilter(true);
      lCheck:=true;
    end;
  finally
    f.Free;
  end;
  Application.ProcessMessages;
  if lCheck then begin
    CreateAdditiveWhere(getAdditiveWhere);
    if TBItemClrFlt.Enabled then begin // установлен фильтр
      strSQL := FilterInterface.GetCurrentSQL;
      if (strSQL<>'') then begin
        TBItemRepeatFilterClick(nil);
      end;
    end else begin
      TBItemClrFltClick(nil);
    end;
  end;
  Application.ProcessMessages;
end;

//---------------------------------------------------------------------
function TfmGurnalStdQuery.getYearWhere: String;
var
  n:Integer;
begin
  if FCheckGodGurnal then begin
    n:=FCurGodGurnal;
    if n<=0 then n:=YearOf(dmBase.getCurDate);
    Result:='Year(datez)='+IntToStr(n);
  end else begin
    Result:='';
  end;
end;

function TfmGurnalStdQuery.getAdditiveWhere: String;
begin
  Result:=getYearWhere;
end;

function TfmGurnalStdQuery.getDefaultAddWhere: String;
begin
  Result:=getYearWhere;
end;

procedure TfmGurnalStdQuery.GridColumnsISKL(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    Params.ImageIndex:=Query.FieldByName('N_ISKL').AsInteger; //StrToInt(Params.Text);
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsFIRST(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    Params.ImageIndex:=Query.FieldByName('NFIRST').AsInteger-1;
  end;
end;

procedure TfmGurnalStdQuery.GridColumnsCANDELETE_FIRST(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if not EditMode then begin
    Params.ImageIndex:=Query.FieldByName('CANDELETE_FIRST').AsInteger;
    if (Params.ImageIndex=1) or Query.FieldByName('CANDELETE').AsBoolean then begin
      Params.ImageIndex:=-1;
    end;
  end;
end;

function TfmGurnalStdQuery.getID:String;
var
  fld:TField;
begin
  Result:='';
  fld:=Query.FindField('ID');
  if fld<>nil then begin
    Result:=fld.AsString;
  end;
end;

//---------------------------------------------------------------------
procedure TfmGurnalStdQuery.CreateSysFlt_GISUN;
{$IFDEF GISUN}
var
  itDop : TTbItem;
{$ENDIF}
begin
  {$IFDEF GISUN}
  if IsActiveGISUN then begin
//       if Gisun.IsEnableTypeAkt(FTypeObj,IsAktVosstan) then begin

    if TBSubSysFlt.Count>0 then begin
      TBSubSysFlt.Add(TTbSeparatorItem.Create(TBSubSysFlt));
    end;

    itDop := TTbItem.Create(TBSubSysFlt);
    itDop.Images:=ImageListGisun;
    itDop.ImageIndex:=3;
    itDop.Caption:= 'Взаимодействие с ГИС РН завершено';
    itDop.OnClick:=Event_POLE_GRN_3;
    TBSubSysFlt.Add(itDop);

    itDop := TTbItem.Create(TBSubSysFlt);
    itDop.Images:=ImageListGisun;
    itDop.ImageIndex:=2;
    itDop.Caption:= 'Взаимодействие с ГИС РН не завершено';
    itDop.OnClick:=Event_POLE_GRN_2;
    TBSubSysFlt.Add(itDop);

    itDop := TTbItem.Create(TBSubSysFlt);
    itDop.Images:=ImageListGisun;
    itDop.ImageIndex:=0;
    itDop.Caption:= 'Взаимодействие с ГИС РН не осуществлялось';
    itDop.OnClick:=Event_POLE_GRN_0;
    TBSubSysFlt.Add(itDop);
  end;
  {$ENDIF}
end;


procedure TfmGurnalStdQuery.Event_POLE_GRN_2(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn>=2000 and pole_grn<3000';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

//----------------------------------------------------------------------
procedure TfmGurnalStdQuery.Event_POLE_GRN_3(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn>=3000 and pole_grn<4000';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnalStdQuery.Event_POLE_GRN_0(Sender: TObject);
begin
  Query.OnFilterRecord := nil;
  Query.Filter   := 'pole_grn<2000 or Empty(pole_grn)';
  Query.Filtered := true;
  TBItemClrFlt.Enabled:=true;
end;

procedure TfmGurnalStdQuery.Event_ClearPoleGRN(Sender: TObject);
var
  tb :TAdsTable;
begin
  if not Query.FieldByName('DATEZ').IsNull and (Query.FieldByName('DATEZ').AsDateTime<STOD('2013-07-26',tdAds)) then begin
    if Problem('Очистить поле взаимодействия с ГИС РН ?',mtConfirmation,self) then begin
      tb:=dmBase.MainTableFromTypeObj(TypeEditObj);
      if tb.Locate('ID', Query.FieldByName('ID').AsInteger, []) then begin
        tb.Edit;
        tb.FieldByName('POLE_GRN').AsInteger:=0;
        tb.Post;
        Refresh(false);
      end;
    end;
  end else begin
    PutError('После 26.07.2013г. поле очистить нельзя.',self);
  end;
end;

procedure TfmGurnalStdQuery.TBItemGrantSpravClick(Sender: TObject);
var
  lEnableEdit : Boolean;
  par : TParamGrantSprav;
  fld:TField;
  n:Integer;
begin
  if TBItemGrantSprav.Visible then begin
    par:=TParamGrantSprav.Create;
    if Role.SystemAdmin
      then par.EnableEdit:=true
      else par.EnableEdit:=false;
    par.TypeEditObj:=GetTypeEditObj;
    par.Caption:='';
    par.KodGurnal:=KodGurnal;
    par.VUS:=false;
    fld:=Query.FindField('VUS');
    if fld<>nil then par.VUS:=fld.AsBoolean;
    par.OCHERED:=false;
    fld:=Query.FindField('OCHERED');
    if fld<>nil then par.OCHERED:=fld.AsBoolean;
    {$IFDEF ZAGS}
      n:=par.TypeEditObj;
    {$ELSE}
      n:=0;
    {$ENDIF}
    if n>0 then begin
      par.Caption:='Получить отчет';
    end;
    ExecSprav(getID,par,n,nil);
  end;
end;

//------------------------------------------------
{
procedure TfmGurnal.ClickPunkts;
var
  f:TfmMultiChoice;
  strSQL,s:String;
begin
  f := TfmMultiChoice.Create(Self);
  f.FFieldName:='punkt';
  dmBase.LookupPunkt.First;
  while not dmBase.LookupPunkt.Eof do begin
    f.cbChoice.Items.Add(dmBase.LookupPunkt.FieldByName('NAME').AsString);
    f.FKeyValues.Add(dmBase.LookupPunkt.FieldByName('ID').AsString);
    dmBase.LookupPunkt.Next;
  end;
  dmBase.LookupPunkt.First;
  f.SetValues(FValues_Punkt);
  if f.ShowModal=mrOk then begin
    s:=f.GetValuesForFilter;
    if s=''
      then FFilter_Punkt:=''
      else FFilter_Punkt:='('+f.GetValuesForFilter+')';
    SetGlobalFilterPunkt(FFilter_Punkt);
    FValues_Punkt:=f.GetValues;
    CreateAdditiveWhere(getAdditiveWhere);
    if TBItemClrFlt.Enabled then begin // установлен фильтр
      strSQL := FilterInterface.GetCurrentSQL;
      if (strSQL<>'') then begin
        TBItemRepeatFilterClick(nil);
      end;
    end else begin
      TBItemClrFltClick(nil);
    end;
  end;
  f.Free;
  Application.ProcessMessages;
end;
}

procedure TfmGurnalStdQuery.ClickPunkts;
var
  strSQL,s,ss:String;
begin
  if formChoiceAdres=nil then begin
    formChoiceAdres:=CreateFormChoiceAdres(TYPE_CHOICE_CHECKBOX,dmBase.AdsConnection,false);
  end;
  ChoiceLoadedAdres(s, ss,dmBase.AdsConnection, formChoiceAdres);
  if s<>'' then begin
    FFilter_Punkt:='('+s+')';
    SetGlobalFilterPunkt(FFilter_Punkt);
//    FValues_Punkt:=f.GetValues;
    CreateAdditiveWhere(getAdditiveWhere);
    if TBItemClrFlt.Enabled then begin // установлен фильтр
      strSQL := FilterInterface.GetCurrentSQL;
      if (strSQL<>'') then begin
        TBItemRepeatFilterClick(nil);
      end;
    end else begin
      TBItemClrFltClick(nil);
    end;
  end;
  Application.ProcessMessages;
end;
//------------------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.ClearPunkts;
var
  strSQL:String;
begin
  if FFilter_Punkt<>'' then begin
    FFilter_Punkt:='';
    SetGlobalFilterPunkt(FFilter_Punkt);
    CreateAdditiveWhere(getAdditiveWhere);
    if TBItemClrFlt.Enabled then begin // установлен фильтр
      strSQL := FilterInterface.GetCurrentSQL;
      if (strSQL<>'') then begin
        TBItemRepeatFilterClick(nil);
      end;
    end else begin
      TBItemClrFltClick(nil);
    end;
    Application.ProcessMessages;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.TBItemLastSvidClick(Sender: TObject);
var
  s1,s2,s3,s4:String;
  tb :TAdsTable;
  st:TSostTable;
begin
  tb:=dmBase.MainTableFromTypeObj(TypeEditObj);
  if TypeEditObj=dmBase.TypeObj_ZRast then begin
    dmBase.GetNewNomerSvidR(s1, s2,s3,s4);
  end else begin
    dmBase.GetNewNomerSvid(TypeEditObj, tb , s1, s2);
  end;
  if dmBase.FSeekID>0 then begin
    st:=SaveSostTable(tb, false,false);
    if tb.Locate('ID',dmBase.FSeekID,[]) then begin
      SetListParEditForm;   // заполнить FListPar
      if fmMain.EditDokument(tb, GetTypeEditObj,'ID',FListPar,true, KodGurnal) then begin

      end;
      FListPar.Clear;
    end else begin
      ShowMessageCont('Свидетельство не найдено.',self);
    end;
    RestSostTable(tb, st);
  end else begin
    ShowMessageCont('Свидетельство не найдено.',self);
  end;
end;

procedure TfmGurnalStdQuery.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure TfmGurnalStdQuery.FormDestroy(Sender: TObject);
begin
//  CurGurnal:=nil;
//  ShowMessage('FormDestroy  '+FKodGurnal);
end;

procedure TfmGurnalStdQuery.FormDeactivate(Sender: TObject);
begin
//  ShowMessage('Deactivate  '+FKodGurnal);
        // для показа по дате корретировки записи
          // для показа по дате корретировки записи
end;

procedure TfmGurnalStdQuery.FormActivate(Sender: TObject);
begin
//  CurGurnal:=Self;
//  WriteToDebug([name]);
end;

//--------------------------------------------------------------
procedure TfmGurnalStdQuery.WriteToDebug(arr:array of Variant);
var
 v:Variant;
begin
  RunFuncScript('WriteDebug_',arr,v);
end;

//-----------------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.GridColumnsGetAdresOwners(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Query.fieldByName('ADRES_OWNERS').AsString<>'' then begin
//    Params.Text := dmBase.HouseOwners2(Query.FieldByName('date_fiks').AsDateTime,
//                       Query.FieldByName('id').AsString, 1, nil);
    Params.Text := dmBase.HouseOwners(Query.FieldByName('date_fiks').AsDateTime,
                       Query.FieldByName('ADRES_OWNERS').AsString,nil, 1, nil, nil);
  end;
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.GridColumnsGetGES(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  {$IFDEF GKH}
  if (Params.Text='') or (Params.Text='0') then begin
    Params.Text:='';
  end else begin
    if dmBase.SprGES.Locate('PARENT;ID_BASE', VarArrayOf([FIdOrgan, Params.Text]), [] ) then begin
      Params.Text:=dmBase.SprGES.FieldByName('NAME').AsString;
    end;
  end;
  {$ENDIF}
end;
//-----------------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.GridColumnsGetID_BASE(Sender: TObject; EditMode: Boolean;  Params: TColCellParamsEh);
begin
  if (Params.Text='') or (Params.Text='0') then begin
    Params.Text:='';
  end else begin
    Params.Text:=fmMain.SprNameOrg( StrToInt(Params.Text), 'К', '');
  end;
end;

procedure TfmGurnalStdQuery.StBarDrawPanel(StatusBar: TStatusBar;  Panel: TStatusPanel; const Rect: TRect);
begin
  PutStrHelp(Panel.Text, StatusBar.Canvas ,Rect);
end;


procedure TfmGurnalStdQuery.TBItemAddDokClick(Sender: TObject);
var
  slPar:TStringList;
  sID:String;
begin
  if TBItemAddDok.Visible then begin
    slPar:=nil;
    if fmMain.EditDokument(nil, TypeEditObj, '-1', slPar, false, KodGurnal) then begin
      if IDLastDok>0
        then sID:=IntToStr(IDLastDok)
        else sID:='';
      Refresh(true,sID);
    end;
  end;
end;

procedure TfmGurnalStdQuery.TBItemYearClick(Sender: TObject);
begin
//
end;

//--------------------------------------------------------------------------------
//   Журналы учета заявлений ...
//--------------------------------------------------------------------------------
{$IFDEF ZAGS}

procedure TfmGurnalStdQuery.EditAktFromGurnalUZ(nTypeAkt:Integer);
var
  slPar:TStringList;
  sID:String;
  tb:TadsTable;
  fldV:TField;
begin
  tb:=dmBase.MainTableFromTypeObj(nTypeAkt);

  if Query.FieldByName('AKT_ID').AsInteger=0 then begin
    PutError(' Запись акта неизвестна. ',self);
  end else begin
    sID:=Query.FieldByName('AKT_ID').aSString;
    if Tb.Locate('ID', sID,[]) then begin
      fldV:=Tb.FindField('VOSSTAN');
      if (fldV<>nil) and not fldV.IsNull and (fldV.AsBoolean=true) then begin
        slPar:=TStringList.Create;
        slPar.Add('VOSSTAN=1');
      end else begin
        slPar:=nil;
      end;
      fmMain.EditDokument( nil, nTypeAkt, sID, slPar, false, KodGurnal);
      FreeAndNil(slPar);
    end else begin
      PutError(' Запись акта не найдена. ',self);
    end;
  end;
end;

procedure TfmGurnalStdQuery.CheckDecl_GurnalUZ(nTypeAkt:Integer; var arr:TarrStrings; tb:TDataSet);
var
  p:TPassport;
  s,s0,s1,s2:String;
begin
  if nTypeAkt=_TypeObj_ZRogd then begin
    CheckDecl(arr,tb.FieldByName('DECL').AsString);
  end else if nTypeAkt=_TypeObj_ZSmert then begin
    s:=dmBase.ReadPropSimpleDok(dmBase.TypeObj_ZSmert, tb.FieldByName('ID').AsInteger, STOD('1899-12-30',tdAds),
                                  'DECL_DOK', ftMemo);
    CheckDecl(arr,tb.FieldByName('DECL').AsString,s);
  end else if nTypeAkt=_TypeObj_ZUstOtc then begin
//[KEY_UST_FASER]
//1=совместное заявление родителей
//2=решение суда
    SetLength(arr,3);

    s0:=GetPadegFIO( CreateFIO(tb, 'ONA_'), 'Ж', 'И');
    s1:=dmBase.GetAdresAkt3(tb,'ONA_GOSUD,FName;ONA_OBL,ONA_B_OBL;ONA_RAION,ONA_B_RN;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',1);
    p := dmBase.PasportFromValues(tb.FieldByName('ONA_DOK_TYPE').AsInteger, tb.FieldByName('ONA_DOK_SERIA').AsString,
                                  tb.FieldByName('ONA_DOK_NOMER').AsString, tb.FieldByName('ONA_DOKUMENT').AsString,
                                  '', tb.FieldByName('ONA_DOK_DATE').Value);
    s := dmBase.PasportToText(p,0);
    s2:=s;

    if tb.FieldByName('OSNOV').AsString='1' then begin   // соместное заявление
      SetLength(arr,6);
      arr[0]:=GetPadegFIO( CreateFIO(tb, 'ON_'), 'М', 'И');
      arr[1]:=dmBase.GetAdresAkt3(tb,'ON_GOSUD,FName;ON_OBL,ON_B_OBL;ON_RAION,ON_B_RN;ON_GOROD,ON_B_GOROD;ON_GOROD_R,ON_*',1);
      p := dmBase.PasportFromValues(tb.FieldByName('ON_DOK_TYPE').AsInteger, tb.FieldByName('ON_DOK_SERIA').AsString,
                                    tb.FieldByName('ON_DOK_NOMER').AsString, tb.FieldByName('ON_DOKUMENT').AsString,
                                    '', tb.FieldByName('ON_DOK_DATE').Value);
      s := dmBase.PasportToText(p,0);
      arr[2]:=s;
      arr[3]:=s0;
      arr[4]:=s1;
      arr[5]:=s2;
    end else begin   // решение суда
      arr[0]:=s0;
      arr[1]:=s1;
      arr[2]:=s2;
    end;
  end;
end;
//-------------------------------------------------------------------------------------
procedure TfmGurnalStdQuery.LoadAkt_GurnalUZ(nTypeAkt:Integer);
var
  d1,d2:TDateTime;
  f:TfmParamQuest;
  n,nYear,nCurNomer,nID:Integer;
  s,sOld:String;
  arr:TArrStrings;
  v:Variant;
  tb:TAdsTable;
  fldV:TField;
begin
  tb:=dmBase.MainTableFromTypeObj(nTypeAkt);

  nID:=MyID;
  f:=TfmParamQuest.Create(Self);
  f.Caption:='Загрузить записи актов';
  f.AddParamEx(dmBase.getCurDate, 'Начальная дата' , 'DATE1' ,'TYPE=DATE');
  f.AddParamEx(dmBase.getCurDate, 'Конечная дата' , 'DATE2' ,'TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  d1:=0;
  d2:=0;
  if n=1 then begin
    d1:=f.GetValue('DATE1', 'D');
    d2:=f.GetValue('DATE2', 'D');
  end;
  f.Free;
  if (d1>0) and (d2>0) then begin
    if (d1>d2) or (YearOf(d1)<>YearOf(d2)) then begin
      PutError('Неправильно введены даты.',Self);
    end else begin
      if Problem('Загрузить в журнал записи актов за период с '+DatePropis(d1,3)+' по '+DatePropis(d2,3), mtConfirmation, self) then begin
        if dmBase._LockTypeObj(TypeEditObj,'') then begin
          try
            s:='FROM GurnalRegistr WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                       ' and datez>='+QStr(DTOS(d1,tdADS))+' and datez<='+QStr(DTOS(d2,tdADS))+ ' and handled=false';
            dmBase.WorkQuery.SQL.Text:='SELECT Count(*) '+s;
            dmBase.WorkQuery.Open;
            n:=dmBase.WorkQuery.Fields[0].AsInteger;
            dmBase.WorkQuery.Close;
            if n>0 then begin
              if Problem('Найдено '+IntToStr(n)+' записи за установленный период. Удалить их ?',mtConfirmation, Self) then begin
                dmBase.WorkQuery.SQL.Text:='DELETE '+s;
                dmBase.WorkQuery.ExecSQL;
              end;
            end;
            dmBase.WorkQuery.AdsCloseSQLStatement;

            nYear:=YearOf(d1);
            //-------- получить новый номер -----
            sOld:=dmBase.GurnalRegistr.IndexName;
            dmBase.GurnalRegistr.IndexName:='KEY_VIEW';    // typeobj;god;descend(nomer)
            dmBase.GurnalRegistr.SetRange([TypeEditObj,nYear],[TypeEditObj,nYear]);
            dmBase.GurnalRegistr.First;
            nCurNomer:=dmBase.GurnalRegistr.FieldByName('NOMER').AsInteger+1;
            dmBase.GurnalRegistr.CancelRange;
            dmBase.GurnalRegistr.IndexName:=sOld;
            //-----------------------------------

            n:=0;
            try
              OpenMessage('Загрузка ...', '', 0);
              tb.IndexName:='DATEZ';
              tb.Filter:='datez>=STOD('+QStr(DTOS(d1,tdClipper))+') and datez<=STOD('+QStr(DTOS(d2,tdClipper))+')';
              tb.Filtered:=true;
              SetWorkDataSet(Tb, 'CUR_DS');   // в скрипте доступна функция GetWorkDataSet(sName):TDataSet
              fldV:=tb.FindField('VOSSTAN');
              while not tb.Eof do begin
                // dmBase.WriteAktToGurnal(tb,nCurNomer)
                //-----------------------------
                if IsMyID(nID, tb.FieldByName('ID_ZAGS').AsInteger) and
                   ((fldV=nil) or fldV.IsNUll or (fldV.AsBoolean=false)) then begin
                  with dmBase.GurnalRegistr do begin
                    Append;

                    CheckDecl_GurnalUZ(nTypeAkt,arr,tb);
                    FieldByName('FIO').AsString:=arr[0];
                    FieldByName('ADRES').AsString:=arr[1];
                    FieldByName('DOKUMENT').AsString:=arr[2];
                    if Length(arr)>3 then begin
                      FieldByName('FIO2').AsString:=arr[3];
                      FieldByName('ADRES2').AsString:=arr[4];
                      FieldByName('DOKUMENT2').AsString:=arr[5];
                    end;
                    FieldByName('AKT_ID').AsInteger:=tb.FieldByName('ID').AsInteger;
                    FieldByName('AKT_NOMER').AsInteger:=tb.FieldByName('NOMER').AsInteger;
                    FieldByName('ID_ZAGS').AsInteger:=nID;
                    FieldByName('TYPEOBJ').AsInteger:=TypeEditObj;
                    FieldByName('GOD').AsInteger:=YearOf(tb.FieldByName('DATEZ').AsDateTime);
                    FieldByName('NOMER').AsInteger:=nCurNomer;
                    FieldByName('DATEZ').AsDateTime:=tb.FieldByName('DATEZ').AsDateTime;
                    FieldByName('OTMETKA').AsString:=AktToOtm(tb.FieldByName('NOMER').AsString,tb.FieldByName('DATEZ').AsDateTime);
                    FieldByName('HANDLED').AsBoolean:=false;
                    v:=null;
                    RunFuncScript(Self.Name+'_LoadRecord',[],v);
                    Inc(nCurNomer,1);
                    Inc(n,1);
                    Post;
                  end;
                end;
                //-----------------------------
                tb.Next;
              end;
            finally
              tb.Filtered:=false;
              tb.Filter:='';
              tb.IndexName:='PR_KEY';
              //tb.CancelRange;
              SetWorkDataSet(nil, 'CUR_DS');
              CloseMessage;
            end;

            Query.DisableControls;
            Query.Close;
            Query.Open;
            Query.First;
            Query.EnableControls;
            ShowMessageCont('Загружено '+IntToStr(n)+' записей.',self);
          finally
            dmBase._UnLockTypeObj(TypeEditObj);
          end;
        end;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------
procedure TfmGurnalStdQuery.Renumber_GurnalUZ;
var
  d1,d2:TDateTime;
  f:TfmParamQuest;
  n,nYear,nCurNomer,nID,m:Integer;
  s,sOld,sYear:String;
  arr:TArrStrings;
  v:Variant;
begin
  nID:=MyID;
  f:=TfmParamQuest.Create(Self);
  f.Caption:='Перенумеровать журнал';
  f.AddParamEx(dmBase.getCurDate, 'С какой даты' , 'DATE1' ,'TYPE=DATE');
//  f.AddParamEx(1, 'Использвать' , 'ISP' ,'TYPE=LIST~DESC=KEY_RENUMBER~WIDTH=200');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  d1:=0;
  if n=1 then begin
    d1:=f.GetValue('DATE1', 'D');
    m:=1; //f.GetValue('ISP', 'N');
  end;
  f.Free;
  if (d1>0) then begin //and (d2>0) then begin
    //---------------------------------------------------------------------
    sYear:=IntToStr(YearOf(d1));
    if m=1 then begin  // предыдущий номер
      s:='SELECT TOP 1 NOMER FROM GurnalRegistr WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez<'+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear+' '+
          'ORDER BY NOMER DESC';
    end else begin
      s:='SELECT Count(*) NOMER FROM GurnalRegistr WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez<'+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear;
    end;
    dmBase.WorkQuery.SQL.Text:=s;
    dmBase.WorkQuery.Open;
    m:=dmBase.WorkQuery.Fields[0].AsInteger+1;
    dmBase.WorkQuery.Close;
    //---------------------------------------------------------------------
      if Problem('Начальный номер: <'+IntToStr(m)+'>. Перенумеровать журнал за период с '+DatePropis(d1,3)+' ? ', mtConfirmation, self) then begin
        if dmBase._LockTypeObj(TypeEditObj,'') then begin
          try
            OpenMessage('Перенумерация ...', '', 0);
            s:='UPDATE GurnalRegistr SET new_nomer=null WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez>='+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear+' and new_nomer is not null;';
            dmBase.WorkQuery.SQL.Text:=s;
            dmBase.WorkQuery.ExecSQL;
            dmBase.WorkQuery.Close;
            sOld:=dmBase.GurnalRegistr.IndexName;
            dmBase.GurnalRegistr.IndexName:='KEY_VIEW';
            dmBase.GurnalRegistr.SetRange([TypeEditObj, sYear],[TypeEditObj, sYear]);
            dmBase.GurnalRegistr.Filter:='datez>=STOD('+QStr(DTOS(d1,tdClipper))+')';
            dmBase.GurnalRegistr.Filtered:=true;

            dmBase.GurnalRegistr.Last;
            while not dmBase.GurnalRegistr.Bof do begin
              dmBase.GurnalRegistr.Edit;
              dmBase.GurnalRegistr.FieldByName('NEW_NOMER').AsInteger:=m;
              Inc(m,1);
              dmBase.GurnalRegistr.Post;
              dmBase.GurnalRegistr.Prior;
            end;

            s:='UPDATE GurnalRegistr SET nomer=new_nomer WHERE TYPEOBJ='+IntToStr(TypeEditObj)+
                                                      ' and datez>='+QStr(DTOS(d1,tdADS))+' and Year(datez)='+sYear+' and new_nomer is not null;';
            dmBase.WorkQuery.SQL.Text:=s;
            dmBase.WorkQuery.ExecSQL;
            dmBase.WorkQuery.Close;

            Query.DisableControls;
            Query.Close;
            Query.Open;
            Query.First;
            Query.EnableControls;

          finally
            dmBase.GurnalRegistr.Filter:='';
            dmBase.GurnalRegistr.Filtered:=false;
            dmBase.GurnalRegistr.CancelRange;
            dmBase.GurnalRegistr.IndexName:=sOld;
            CloseMessage;
            dmBase._UnLockTypeObj(TypeEditObj);
          end;
        end;
      end;
//    end;
  end;

end;

{$ENDIF}

//-------------------------------------------------------------------------
procedure TfmGurnalStdQuery.TBItemDelayRegisterClick(Sender: TObject);
begin
end;

//-------------------------------------------------------------------------
// д.б. реализовано в наследниках где есть  Query.Filter:=...
function TfmGurnalStdQuery.getAdditiveFilter: String;
begin
  Result:='';
end;
//-------------------------------------------------------------------------
function TfmGurnalStdQuery.setAdditiveFilter: Boolean;
var
  sFlt:String;
  cur:TCursor;
begin
  cur:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
    sFlt:=getAdditiveFilter;
    if sFlt='' then begin
      if Query.Filter<>'' then begin
        Query.Filter:='';
        if Query.Active
          then Query.Filtered:=false;
      end;
    end else begin
      Query.Filter:=sFlt;
      if Query.Active
        then Query.Filtered:=true;
    end;
  finally
    Screen.Cursor:=cur;
  end;
end;

procedure TfmGurnalStdQuery.TBItemClearPunktsClick(Sender: TObject);
begin
  ClearPunkts;
end;

procedure TfmGurnalStdQuery.TBSubmenuPunktsClick(Sender: TObject);
begin
  ClickPunkts;
end;

procedure TfmGurnalStdQuery.SetCurBase(Value : Integer);
begin
  FCurBase:=Value;
end;

function TfmGurnalStdQuery.GetCurBase : Integer;
begin
  Result:=FCurBase;
end;

initialization

//  CurGurnal:=nil;

end.
