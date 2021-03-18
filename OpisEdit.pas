unit OpisEdit;

interface

{$I Task.inc}

// USE_TREE_SOATO - подключает возможность выбора из спр. СОАТО в виде дерева
{$DEFINE USE_NEW_SPR}

uses Windows, AdsData, DbGridEh, DBCtrlsEh, IniFiles,
    {$IFDEF VER150} Variants, {$ENDIF}
     AdsTable, SysUtils, Forms, Classes, ifpii_dbfunc,
     SasaIniFile, Dialogs, db, SasaDbGrid{, ToolEdit}, DbLookUpEh,
     TypInfo, DbFunc, FuncPr, FuncEh, FileCtrl,
     ToolCtrlsEh, Controls, Messages;

type

  EVvodError = class(Exception);

  TMyField = class(TField);

  TTypeOpenSpr  = ( osQuery, osTable );
  TTypesOpenSpr = set of TTypeOpenSpr;

  //----- для фильтрации ---------------------
  TTypeSrav = ( tsfBolshe, tsfMenshe, tsfRavno, tsfBolsheRavno, tsfMensheRavno, tsfInStr );
  TFilter = record
    TypeSrav  : TTypeSrav;
    NameField : String;
    Value     : Variant;
    Tip       : String;
  end;
  TArrayFilter = array of TFilter;
  //------------------------------------------

  TRI = class(TObject)
  public
    Field_ID     : String;
    Field_NAME   : String;
    CheckName : Boolean;
    ListChild : TStringList;
    constructor Create;
    destructor  Destroy; override;
  end;

  TTypeCheck = ( ckNotCheck, ckCheck );

               // простой  список справочник  комп.LookUp
  TTypeEdit = ( teSimple, teList, teSpr, teLookUpStd, teDir);
  TTypeEditSpr = ( tesSimple, tesTreeSoato, tesTree, tesLookUp, tesLookupPlusEdit );
  TTypeSeekSpr = ( tssListBox, tssComboBox, tssGrid, tssGrid2);

  {
   TDetailDS = record
     Caption  : String;
     Name     : String;
     NameOpis : String;
     Table    : TAdsTable;
     MasterFields : String;
     IndexName : String;
   end;
   TArrDetail = array of TDetailDS;
  }
//   TPublicDataSet = class(TDataSet)


   TListOpisEdit = class;
   TOpisEdit = class;

   TAfterChoice = procedure(OpisEdit : TOpisEdit; var ArrRec : TCurrentRecord) of object;
   TCheckEnableEdit = procedure(OpisEdit : TOpisEdit; var Enabled : Integer) of object;
   TCheckStringFilter = procedure(var sFilter:String) of object;

   TTypeDataSet = (dsExistTable, dsExistQuery, dsTable, dsQuery);

   TOpisEdit = class(TObject)
   private
     FSection: String;
     FTypeEdit: TTypeEdit;
     FTypeEditSpr : TTypeEditSpr;
     FDisplayField: String;
//     FArrDisplayWidth : TArrInteger;
     FEnableEditSpr: Boolean;
     FAddCorr: String;
     FWriteDateChoice: Boolean;
     FOnAfterChoice: TAfterChoice;
     FDataSet: TDataSet;
     FAutoFilter: Boolean;
     FFullName: String;
     FKomm: String;
     FListSource: TDataSource;
     FCheckValue: TTypeCheck;
     FTypeSeekSpr: TTypeSeekSpr;
     FKeyListFromDataSet: Boolean;
     FMultiSelect: Boolean;
     FMultiSelectDelim: String;
     FValuePlus: Boolean;
     FFilterDataSet: String;
     FCheckDeleteSpr: Boolean;
     FMultiSelectDir:String;
     FMultiSelectFilter:String;
     FMultiSelectShowID:Boolean;
     FParamsEditSpr : TParamsEditSpr;
     procedure SetSection(const Value: String);
     procedure SetTypeEdit(const Value: TTypeEdit);
     procedure SetTypeEditSpr(const Value: TTypeEditSpr);
     procedure SetDisplayField(const Value: String);
     procedure SetEnableEditSpr(const Value: Boolean);
     procedure SetAddCorr(const Value: String);
     procedure SetWriteDateChoice(const Value: Boolean);
     procedure SetOnAfterChoice(const Value: TAfterChoice);
     procedure SetDataSet(const Value: TDataSet);
     procedure SetAutoFilter(const Value: Boolean);
     procedure SetFullName(const Value: String);
     procedure SetKomm(const Value: String);
     procedure SetListSource(const Value: TDataSource);
     procedure SetCheckValue(const Value: TTypeCheck);
     procedure SetTypeSeekSpr(const Value: TTypeSeekSpr);
     procedure SetKeyListFromDataSet(const Value: Boolean);
     procedure SetMultiSelect(const Value: Boolean);
     procedure SetValuePlus(const Value: Boolean);
     procedure SetMultiSelectDelim(const Value: String);
     function GetEnableEditSpr: Boolean;
     procedure SetFilterDataSet(const Value: String);
     procedure SetCheckDeleteSpr(const Value:Boolean);
   public
     TreeViewSoato: String;
     EnableExport : Boolean;
     arrOldValue  : TCurrentRecord;
     RI           : TRI;
     TypeDataSet  : TTypeDataSet;
     Table        : TAdsTable;
     Query        : TAdsQuery;
//     DataSet      : TDataSet;
     ResultField  : String;
//     KeyField     : String;
     ArrDisplayFld : TArrStrings;
     FieldForNaim : String;
     NameSort     : String;
     UpDownField  : String;   // поле для перемещения значения вверх, вниз !!! д.б. установлена сортировка по этому полю !!!
     NotVisibleColumns : TStringList;   // список невидимых колонок, означивать через скрипт для разных типов приложений (LAIS,ZAGS,ZAH ...)
     ChangeCode   : Boolean;
     Items        : TStringList;   // для ComboBox
     KrItems      : TStringList;   // краткие значения подписей
     KeyList      : TStringList;   // для ComboBox
     YesKrItems   : Boolean;
     Caption      : String;
     ConfSection  : String;   // имя секции для формы fmLookUp
     CloseOnCancel: Boolean;  // автоматичечки закрывать при вызове метода Cancel
     MasterFields : String;
     MasterSource : TDataSource;
     IndexForDetail : String;
     ListDetail   : TList; //ArrDetail;  // массив подключаемых таблиц
     ListOpisEdit : TListOpisEdit;
     ListIndex    : TStringList;   // список сортировок для переключения
     AddConst :Boolean;
     LastError:String;
     CurValue:Variant;
     constructor Create;
     destructor  Destroy; override;
     property    CheckDeleteSpr:Boolean read FCheckDeleteSpr write SetCheckDeleteSpr;
     property    ParamsEditSpr:TParamsEditSpr read FParamsEditSpr;
     property    FilterDataSet:String read FFilterDataSet write SetFilterDataSet;
     property    KeyListFromDataSet : Boolean read FKeyListFromDataSet write SetKeyListFromDataSet;
     property    ValuePlus : Boolean read FValuePlus write SetValuePlus;
     property    MultiSelect : Boolean read FMultiSelect write SetMultiSelect;
     property    MultiSelectDelim : String read FMultiSelectDelim write SetMultiSelectDelim;
     property    MultiSelectDir : String read FMultiSelectDir write FMultiSelectDir;
     property    MultiSelectFilter : String read FMultiSelectFilter write FMultiSelectFilter;
     property    MultiSelectShowID : Boolean read FMultiSelectShowID write FMultiSelectShowID;
     property    CheckValue : TTypeCheck read FCheckValue write SetCheckValue;
     property    ListSource : TDataSource read FListSource write SetListSource;
     property    DataSet : TDataSet read FDataSet write SetDataSet;
     property    DisplayField : String read FDisplayField write SetDisplayField;
     property    Section : String read FSection write SetSection;
     property    TypeEdit : TTypeEdit read FTypeEdit write SetTypeEdit;
     property    TypeEditSpr : TTypeEditSpr read FTypeEditSpr write SetTypeEditSpr;
     property    TypeSeekSpr : TTypeSeekSpr read FTypeSeekSpr write SetTypeSeekSpr;
     property    Name : String read FSection;
     property    FullName : String read FFullName write SetFullName;
     property    Komm : String read FKomm write SetKomm;
     property    EnableEditSpr : Boolean read GetEnableEditSpr write SetEnableEditSpr;
     property    AddCorr : String read FAddCorr write SetAddCorr;
     property    WriteDateChoice : Boolean read FWriteDateChoice write SetWriteDateChoice;
     property    AutoFilter : Boolean read FAutoFilter write SetAutoFilter;
     procedure   SetExternalDataSet( ds : TDataSet );
     procedure   LoadFromIni;
     procedure   EditDetail( n : Integer; MasterDS : TDataSource);

     function    IsChangeCode : Boolean;
     function    IsCheckAllRI : Boolean;
     function    CheckAllRI(nType : Integer; Value : String;  lShowError, lShowQuery : Boolean; win:TWinControl=nil) : Boolean;

     function    ChoiceFromKeyList( HControl : TWinControl ) : String;
     function    ChoiceFromSpr( var CurValue : Variant; var arrRec : TCurrentRecord ) : Boolean;
     function    ChoiceFromSprEx(Control : TControl; var CurValue : Variant;
                 var arrRec : TCurrentRecord; ParamFlt : TParamFieldFlt ) : Boolean;
     function    Naim( Value : Variant; lKrat : Boolean=false) : String;
     function    GetIndexKey( Value : Variant) : Integer;
     procedure   RunAddCorr(ds : TDataset; arrRec : TCurrentRecord);
     procedure   RunWriteDateChoice( ds : TDataSet);
     procedure   Cancel;
     property    OnAfterChoice : TAfterChoice read FOnAfterChoice write SetOnAfterChoice;
     function    DeleteDetailRecords : Boolean;
     function    TypeSeek : TTypeSeekSpr;
     function    CheckMultiSelect(Field : TField; s : String) : String;
     procedure   OnAfterEditDataSet(ds : TDataSet);
     procedure   OnBeforePostDataSet(ds : TDataSet);
     procedure   SetParamsEditSpr(par : TParamsEditSpr);

   end;

   TListOpisEdit=class(TObject)
   private
     FList        : TStringList;
     FMemoKeyList : TSasaIniFile;
     FAdditiveIni : TSasaIniFile;
     FDataModule  : TComponent;
     FLastOpisInt : Integer; // последнее описание к которому было обращение
     FLastOpisStr : String;
     FCurrentOpis: TOpisEdit;
     FFullNameKey: Boolean;
     FName : String;
     FNameDop : String;
     FOwner: TObject;
     FOnCheckEnableEdit: TCheckEnableEdit;
     FAddNameRI: String;
//    FWorkDataModule: TDataModule;
     procedure SetCurrentOpis(const Value: TOpisEdit);
     procedure SetFullNameKey(const Value: Boolean);
    procedure SetOwner(const Value: TObject);
    procedure SetOnCheckEnableEdit(const Value: TCheckEnableEdit);
    procedure SetAddNameRI(const Value: String);
//    procedure SetWorkDataModule(const Value: TDataModule);  // последнее описание к которому было обращение
   public
     constructor Create( FileName : String );
     destructor  Destroy; override;
     property    Name : String read FName;
     property    NameDop : String read FNameDop;
     property    AddNameRI : String read FAddNameRI write SetAddNameRI;
     property    Owner : TObject read FOwner write SetOwner;
     property    OnCheckEnableEdit : TCheckEnableEdit read FOnCheckEnableEdit write SetOnCheckEnableEdit;

     function    ReadKeyList( cFileName : String ) : Boolean;
     procedure   AddOpis( NameOpis : String; Opis : TOpisEdit);
     function    FindOpis( NameOpis: String ) : TOpisEdit;

     function    CheckFilter(s : String) :String;

     function    ReloadOpis(Opis:TOpisEdit):Boolean;
     function    LoadDS(Opis:TOpisEdit):Boolean;

     procedure   CheckStdYear(Opis:TOpisEdit; sKey : String);
     function    GetNotLoadOpis(sType:String; sProg:String) : String;
     function    GetListOpis(cKey : String; ItemsList,ValueList : TStrings ) : Boolean;
     function    GetSprOpis(cKey : String; typeOpen : TTypesOpenSpr=[osQuery, osTable]; lShowError:Boolean=true ) : TOpisEdit;
     function    GetOpis( i : Integer ) : TOpisEdit;

     function    GetListOpisA(cKey : String) : TOpisEdit;
     function    GetSprOpisA(cKey : String) : TOpisEdit;
     function    GetDataSetOpis(Opis : TOpisEdit; typeOpen : TTypesOpenSpr=[osQuery, osTable]; lShowError : Boolean=true) : Boolean;

     procedure   SetListGrid(Grid : TSasaDbGrid);
     procedure   SetSprGrid(Grid : TSasaDbGrid);

     procedure   SetListComboBox(ComboBox : TDbComboBoxEh);
     procedure   SetSprComboEdit(ComboEdit : TCustomDBEditEh);

     procedure   SetKeyForm( Form : TForm; Data : TComponent);
     function    SeekValue(strName : String; strKey : String; lKrat : Boolean ) : String;
     property    CurrentOpis : TOpisEdit read FCurrentOpis write SetCurrentOpis;
//     property    WorkDataModule : TDataModule read FWorkDataModule write SetWorkDataModule;
     property    FullNameKey : Boolean read FFullNameKey write SetFullNameKey;
     function    OpisToStr(strName : String; strDelim : String; lKrat : Boolean) : String;
     function    GetAllLookupNames : String;
     function    GetAllListNames : String;
     function    GetAllEditNames: String;
     // удалить все описания необходимо вызывать перед закрытием базы данных
     procedure   DeleteAllOpis;
   end;

   TEvents = class(TObject)
     class procedure Grid_EditButtonClick(Sender: TObject);
     class procedure Column_GetCellParams(Sender: TObject; EditMode: Boolean;
                                          Params: TColCellParamsEh);
     class procedure Column_UpdateData(Sender: TObject; var Text: String;
               var Value: Variant; var UseText: Boolean; var Handled: Boolean);
     class procedure EditButtons_OnClick(Sender: TObject; var Handled: Boolean);
     class procedure EditButtons_OnDown(Sender: TObject; TopButton: Boolean;
                                       var AutoRepeat, Handled: Boolean);
     class procedure AdsTable_OnFilter( DataSet : TDataSet; var Accept : Boolean);
     class procedure EditButtonsFile_OnClick(Sender: TObject; var Handled: Boolean);
     class procedure EditButtonsDir_OnClick(Sender: TObject; var Handled: Boolean);
   end;

   function  GetTypeOpisFromName( NameOpis : String) : TTypeEdit;
   function  GetGlobalListOpis : TListOpisEdit;
   procedure SetGlobalListOpis( ListOpis : TListOpisEdit);

var
  ArrFilter : TArrayFilter;
  GlobalListOpis : TListOpisEdit;

const
  RI_DELETE = 1;
  RI_EDIT   = 2;
  RI_CHANGE_AND_DEL = 3;

implementation

{$IFDEF USE_TREE_SOATO}
uses fmTreeSoato, Soato,MetaTask,fmChList,
{$ELSE}
uses MetaTask, StrUtils,fmChList,
{$ENDIF}
{$IFDEF USE_NEW_SPR}
  fLookUp, fmStringSeek;
{$ELSE}
  fmLookUp;
{$ENDIF}

{ TOpisEdit }

//---------------------------------------------------------
// допускаются значения: LOOKUP_XXXX, KEY_XXXX, DIR
function GetTypeOpisFromName( NameOpis : String) : TTypeEdit;
begin
  Result := teSimple;
  NameOpis := Trim(ANSIUpperCase(NameOpis));
  if Copy(NameOpis,1,1) = 'L' then begin
    Result := teSpr;
  end else if Copy(NameOpis,1,1) = 'K' then begin
    Result := teList;
  end else if Copy(NameOpis,1,3) = 'DIR' then begin
    Result := teDir;
  end;
end;

function GetGlobalListOpis : TListOpisEdit;
begin
  Result := GlobalListOpis;
end;

procedure SetGlobalListOpis( ListOpis : TListOpisEdit);
begin
  GlobalListOpis := ListOpis;
end;

constructor TOpisEdit.Create;
begin
  inherited;
  CurValue:=null;
  AddConst:=false;
  NameSort := '';
  UpDownField:='';
  NotVisibleColumns:=nil;
  ChangeCode:=false;
  EnableExport:=true;
  TreeViewSoato:='';
  FEnableEditSpr:=false;
  FAddCorr:='';
  FWriteDateChoice:=false;
  FAutoFilter := false;
  ListDetail:=nil;
  FOnAfterChoice:=nil;
  ListSource := nil;
  ListIndex := nil;
  FCheckValue := ckNotCheck;
  FMultiSelect := false;
  FValuePlus:=false;
  FMultiSelectDelim := ',';
  RI := nil;
  DataSet:=nil;
  FParamsEditSpr:=nil;
  FCheckDeleteSpr:=false;
end;

destructor TOpisEdit.Destroy;
begin
  Items.Free;
  KeyList.Free;
  KrItems.Free;
  if NotVisibleColumns<>nil
    then FreeAndNil(NotVisibleColumns);
  if  TypeEdit = teSpr then begin
    if ListDetail<>nil then FreeAndNil(ListDetail);
    // DataSet был создан динамически
    if (TypeDataSet = dsTable) or (TypeDataSet = dsQuery) then begin
      try
        FreeAndNil(FDataSet);
      except
      end;
    end;
  end;
  if ListSource<>nil then ListSource.Free;
  if ListIndex<>nil then ListIndex.Free;
  if RI<>nil then RI.Free;

//  if ParamsEditSpr<>nil then FreeAndNil(ParamsEditSpr);   11.09.2018     при выходе из программы возникает exception !!!

  inherited;
end;

// пока не используется
procedure TOpisEdit.OnAfterEditDataSet(ds: TDataSet);
begin
  if (RI<>nil) and (RI.ListChild.Count>0)
    then GetCurrentRecord(ds, '', arrOldValue);
end;

// пока не используется
procedure TOpisEdit.OnBeforePostDataSet(ds: TDataSet);
var
  v : Variant;
begin
  if (RI<>nil) and (RI.ListChild.Count>0) then begin
    // поле с кодом не автоинкрементное
    if ds.FieldByName(RI.Field_ID).DataType <> ftAutoInc then begin
      v := GetValueField(arrOldValue, RI.Field_ID);
      if v<>null then begin
        // старое значение не равно новому
        if VarToStr(v)<>ds.FieldByName(RI.Field_ID).AsString then begin
          PutError('Корректировка кода запрещена.');
          abort;
        end;
      end;
    end;
//    if not CheckAllRI(RI_EDIT, ds.FieldByName(RI.Field_ID).AsString, true, true)
//      then abort;
  end;
end;
//-----------------------------------------------------
procedure TOpisEdit.SetCheckDeleteSpr(const Value:Boolean);
begin
  FCheckDeleteSpr:=Value;
end;
//-----------------------------------------------------
function TOpisEdit.IsChangeCode : Boolean;
begin
  if ChangeCode and (ResultField<>'')
    then Result:=true
    else Result:=false;
end;
//-----------------------------------------------------
function TOpisEdit.IsCheckAllRI : Boolean;
begin
  Result := false;
  if (RI<>nil) then begin
    if (RI.ListChild.Count>0) then begin
      Result:=true;
    end;
  end;
end;
//-----------------------------------------------------
function TOpisEdit.CheckAllRI(nType : Integer; Value : String; lShowError, lShowQuery: Boolean; win:TWinControl) : Boolean;
var
  i,j : Integer;
  sComment, sSQL, sCurValue, strDataSet,strField,s,ss, strName, strErr : String;
  ds : TAdsTable;
  lPlusField, lCreate, lFind : Boolean;
  v : Variant;
  ft,ftCur:TFieldType;
begin
  LastError:='';
  Result := true;
  if (RI<>nil) then begin
    if (RI.ListChild.Count>0) then begin
      sCurValue:=FDataSet.FieldByName(RI.Field_ID).AsString;
      ftCur:=FDataSet.FieldByName(RI.Field_ID).DataType;
      sSQL:='';
      for i:=0 to RI.ListChild.Count-1 do begin
        j := Pos('=',RI.ListChild.Strings[i]);
        strDataSet := Copy(RI.ListChild.Strings[i],1,j-1);
        strField   := Copy(RI.ListChild.Strings[i],j+1,100);
        lPlusField := false;
        if Right(strField,1)='+' then begin  // в поиске по таблице участвует имя поля (для поиска в базе свойств)
          strField   := Copy(strField,1,Length(strField)-1);
          lPlusField := true;
        end;
        if Copy(strDataSet,1,6)='TABLE:' then begin
          s:=Copy(strDataSet,7,100);
          ds:=GlobalTask.OpenDataSetAsTable( 'RI_'+s, s, true, strErr );
          lCreate:=true;
        end else begin
          ds:=GlobalSeekTable(strDataSet);
          if ds=nil then begin
            ds:=TAdsTable(GlobalSeekDataSet(strDataSet,sdsTableName));
          end;
          lCreate:=false;
        end;
        if (ds<>nil) and ds.Active then begin
          if nType=RI_DELETE then begin
            lFind:=false;
            s:=FDataSet.FieldByName(RI.Field_ID).AsString;
            if s<>'' then begin
              if lPlusField then begin
                v := VarArrayCreate( [0, 1], varOleStr );
                v[0] := strField;
                v[1] := s;
                if ds.Locate('POKAZ;VALUE',v,[]) then begin
                  strName:=FDataSet.FieldByName(RI.Field_NAME).AsString;
                  lFind:=true;
                end;
              end else begin
                if ds.Locate(strField,s,[]) then begin
                  strName:=FDataSet.FieldByName(RI.Field_NAME).AsString;
                  lFind:=true;
                end;
              end;
            end;
            if lFind then begin
              // если запрос на удаление и разрешено удалять из справочника без проверки
              if GlobalTask.CheckDeleteSpr(self) or FCheckDeleteSpr then begin
                if not Problem(' Значение "'+strName+'" присутствует в таблице '+ds.TableName+'. Удалить ?',mtConfirmation, win)
                  then Result:=false;
              end else begin
                sComment:=GlobalTask.getCommentTable(ds.TableName, true);
                PutError(' Значение "'+strName+'"'+#13#10+
                        ' присутствует в таблице '+sComment+'.'+#13#10+
                        ' Удаление невозможно.',win);
                Result := false;
              end;
              break;
            end;
          end else if nType=RI_CHANGE_AND_DEL then begin  //
            ft:=ds.FieldByName(strField).DataType;
            if ft in [ftString, ftWideString] then begin
              ss:=QStr(Value);
              s:=QStr(sCurValue);
            end else begin
              ss:=Value;
              s:=sCurValue;
            end;
            sSQL:=sSQL+'UPDATE '+ds.TableName+' SET '+strField+'='+s+' WHERE '+strField+'='+ss+';'#13#10;
          end else begin  // RI_EDIT
            if ds.Active then begin
              if ds.Locate(strField,Value,[]) then begin
                PutError('Значение "'+Value+'"'+' присутствует в таблице '+ds.TableName+'.'+#13#10+
                         'Корректировка невозможна.',win);
                Result := false;
                break;
              end;
            end;
          end;
          if lCreate then ds.Free;
        end else begin
//          PutError('не найден датасет '+strDataSet+' для контроля RI',win);
//          Result := false;
//          break;
        end;
      end;
      if (nType=RI_CHANGE_AND_DEL) and (sSQL<>'') then begin
        OpenMessage('Замена значения в базе ...');
        GlobalTask.WriteToLogFile('Замена в базе кода из справочника:'+FDataSet.Name+' '+Value+'->'+sCurValue);
        LastError:=GlobalTask.ExecuteSQL(sSQL,false);
        if LastError<>''
          then Result:=false;
        CloseMessage;
      end;
    end;
  end;
end;

procedure TOpisEdit.LoadFromIni;
begin
//
end;

procedure TOpisEdit.SetSection(const Value: String);
begin
  FSection := Value;
end;

procedure TOpisEdit.SetTypeEdit(const Value: TTypeEdit);
begin
  FTypeEdit := Value;
end;

procedure TOpisEdit.EditDetail(n: Integer; MasterDS : TDataSource);
var
  arrRec : TCurrentRecord;
  fmEdit : TfmLookUp;
  v : Variant;
  Opis : TOpisEdit;
  st : TSostTable;
  i : Integer;
  sl : TStringList;
begin
 {$IFDEF USE_NEW_SPR}
 if (ListDetail=nil) or (ListDetail.Count=0) then begin
   Beep;
   exit;
 end;
 if ListDetail.Count=1 then n:=0;
 if (n=-1) then begin
   sl := TStringList.Create;
   for i:=0 to ListDetail.Count-1 do begin
     Opis := TOpisEdit(ListDetail.Items[i]);
     if Opis.Caption=''
       then sl.Add(Opis.Table.TableName)
       else sl.Add(Opis.Caption);
   end;
   n:=ChoiceFromList(sl);
   sl.Free;
 end;
 if (n>-1) and (n<=ListDetail.Count) then begin
   Opis := TOpisEdit(ListDetail.Items[n]);
   Opis.MasterSource := MasterDS;
   if (Opis.Table<>nil) and Opis.Table.Active and (Opis.MasterSource<>nil) then begin
     fmEdit := TfmLookUp.Create(nil);
     fmEdit.Flat := true;
     fmEdit.OpisEdit:=Opis;
     fmEdit.EnableEdit:=true;
     fmEdit.TBItemChoice.Visible:=false;
     fmEdit.TBItemCancel.Caption:='Выход';
     fmEdit.TBItemCancel.Hint:='Выход';
     v:=null;
     st := SaveSostTable(Opis.Table, true);
     Opis.Table.MasterSource := Opis.MasterSource;
     Opis.Table.MasterFields := Opis.MasterFields;
     Opis.Table.IndexName    := Opis.IndexForDetail;
     Opis.Table.First;
     fmEdit.ExecuteSelect(nil, Opis.Table, Opis.ResultField, v, arrRec, Opis.IndexForDetail );
     // отключимся от папы
     Opis.MasterSource:=nil;
     RestSostTable(Opis.Table, st);
//    fmEdit.Execute(nil, ArrDetail[n].Table, 'FirmID', v, arrRec, ArrDetail[n].IndexName);
   end else begin
     Beep;
   end;
 end else begin
   Beep;
 end;
 {$ENDIF}
end;
//-----------------------------------------------------------------
procedure  TOpisEdit.SetParamsEditSpr(par : TParamsEditSpr);
begin
  FParamsEditSpr:=par;                
end;
//-----------------------------------------------------------------
function TOpisEdit.ChoiceFromSpr(var CurValue: Variant; var arrRec : TCurrentRecord): Boolean;
var
  v,old : Variant;
  {$IFDEF USE_TREE_SOATO}
  s : String;
  {$ENDIF}
  lChoice : Boolean;
 {$IFDEF USE_NEW_SPR}
  f : TfmLookUp;
  ParamFlt : TParamFieldFlt;
 {$ENDIF}
begin
  Result := false;
  if (Table<>nil) and Table.Active then begin
    lChoice:=true;
    v := CurValue;
    old := v;
    if (TypeEditSpr = tesSimple) or (TypeEditSpr = tesLookup) or (TypeEditSpr = tesLookupPlusEdit) then begin
     {$IFDEF USE_NEW_SPR}
       f := TfmLookUp.Create(nil);
       f.Flat:=GlobalFlat;
       f.EnableDetail:=false;
       f.OpisEdit:=Self;
       f.EnableEdit:=EnableEditSpr;
       ParamFlt:=nil;
       try
         lChoice:=f.Execute(nil, Table, ResultField, v, arrRec, NameSort, ParamFlt);
       finally
         f.Free;
       end;
     {$ELSE}
       lChoice:=FormLookUp.Execute(nil, Table, ResultField, v, NameSort);
     {$ENDIF}
    {$IFDEF USE_TREE_SOATO}
    end else if TypeEditSpr = tesTreeSoato then begin
      s := CurValue;
      fChTreeSoato.Execute(nil,Table,s);
      v := s;
    {$ENDIF}
    end;
    if (v<>null) and lChoice then begin //(old<>v) then begin
      RunWriteDateChoice(Table);
      Result := true;
      CurValue := v;
    end;
  end;
end;

function TOpisEdit.ChoiceFromSprEx(Control : TControl; var CurValue: Variant; var arrRec : TCurrentRecord; ParamFlt : TParamFieldFlt): Boolean;
var
  v,old : Variant;
  lChoice : Boolean;
 {$IFDEF USE_NEW_SPR}
  f : TfmLookUp;
 {$ENDIF}
 s:string;
begin
  Result := false;
  if (DataSet<>nil) and DataSet.Active then begin
    v := CurValue;
    old := v;
    lChoice:=true;
    if (TypeEditSpr = tesSimple) or (TypeEditSpr = tesLookup) or (TypeEditSpr = tesLookupPlusEdit) then begin
     {$IFDEF USE_NEW_SPR}
       f := TfmLookUp.Create(nil);
       f.Flat:=GlobalFlat;
       f.EnableDetail:=false;
       f.OpisEdit := Self;
       f.EnableEdit:=EnableEditSpr;
       try
         if MultiSelect then begin
           s := VarToStr(v);
           if Control = nil then begin
             lChoice:=f.ExecuteMultiSelect(nil, DataSet, ResultField, s, NameSort);
           end else begin
             lChoice:=f.ExecuteMultiSelect(Control, DataSet, ResultField, s, NameSort);
           end;
           v := s;
         end else begin
           if Control = nil then begin
             lChoice:=f.ExecuteSelect(nil, DataSet, ResultField, v, arrRec, NameSort, ParamFlt);
           end else begin
             lChoice:=f.Execute(Control, DataSet, ResultField, v, arrRec, NameSort, ParamFlt);
           end;
         end;
       finally
         f.Free;
       end;
     {$ELSE}
       if Control = nil then begin
         lChoice:=FormLookUp.ExecuteSelect(nil, DataSet, ResultField, v, NameSort);
       end else begin
         lChoice:=FormLookUp.Execute(Control, DataSet, ResultField, v, NameSort);
       end;
     {$ENDIF}
    {$IFDEF USE_TREE_SOATO}
    end else if TypeEditSpr = tesTreeSoato then begin
      s := CurValue;
      fChTreeSoato.Execute(Control,DataSet,s);
      v := s;
    {$ENDIF}
    end;
    if (v<>null) and lChoice then begin //(old<>v) then begin
      RunWriteDateChoice(DataSet);
      Result := true;
      CurValue := v;
    end;
  end;
end;

function TOpisEdit.Naim(Value : Variant; lKrat : Boolean): String;
var
  i : Integer;
  strSeek : String;
  st : TSostTable;
begin
  Result := '';
  if (Value=null) or (VarToStr(Value)='') then exit;
  if TypeEdit=teSpr then begin
    if (Table<>nil) and Table.Active then begin
      st := SaveSostTable(Table,true);
      try
        if Table.Locate(ResultField,Value,[]) then begin //FindKey([Value]) then begin
          Result := Table.FieldByName(FieldForNaim).AsString;
        end;
      except
        Result:='';
      end;
      RestSostTable(Table,st);
    end;
  end else if TypeEdit=teList then begin
    strSeek := Trim(VarToStr(Value));
    i := KeyList.IndexOf(strSeek);
    if i > -1 then begin
      if YesKrItems and lKrat then Result := KrItems.Strings[i]
                              else Result := Items.Strings[i];
    end;
  end;
end;

procedure TOpisEdit.SetDisplayField(const Value: String);
begin
  FDisplayField := Value;
  if Pos(',',FDisplayField)>0 then
    FDisplayField:=StringReplace(FDisplayField,',',';',[rfReplaceAll]);
  SetLength(ArrDisplayFld,0);
//  SetLength(FArrDisplayWidth,0);
  if FDisplayField<>'' then begin
    StrToArr(FDisplayField,ArrDisplayFld,';',true);
//    StrToArr(FWidth,FArrDisplayWidth,';',true);
  end;
end;
//----------------------------------------------------------
function TOpisEdit.GetEnableEditSpr: Boolean;
var
  nEnabled:Integer;
begin
  nEnabled:=-1;  // значение не определено
  if (ListOpisEdit<>nil) and FEnableEditSpr then begin
    if Assigned(ListOpisEdit.OnCheckEnableEdit) then begin
      ListOpisEdit.OnCheckEnableEdit(Self,nEnabled);
    end;
  end;
  if nEnabled=-1 then begin
    Result:=FEnableEditSpr;
  end else begin
    if nEnabled=0 then Result:=false
                  else Result:=true;
  end;
  if (Table<>nil) and Table.ReadOnly then begin  // если таблица в режиме ReadOnly
    Result:=false;
  end;
end;
//----------------------------------------------------------
procedure TOpisEdit.SetEnableEditSpr(const Value: Boolean);
begin
  FEnableEditSpr := Value;
end;

{ TListOpisEdit }

constructor TListOpisEdit.Create( FileName : String );
var
  i : Integer;
  s,ss : String;
begin
  inherited Create;
  FList := TStringList.Create;
  FOwner := nil;
  ReadKeyList(FileName);
  FLastOpisInt := -1;
  s := ExtractFileName(FileName);
  ss := ExtractFilePath(FileName);
  i:=Pos('.',s);
  if i>0
    then FName := Copy(s,1,i-1)
    else FName := s;
  FNameDop:=ss+FName+'Add.ini';
  FAddNameRI:='';
  FAdditiveIni := TSasaIniFile.Create(FNameDop);
  if GlobalListOpis=nil then begin
    GlobalListOpis := self;
  end;
end;

//----------------------------------------
procedure TListOpisEdit.DeleteAllOpis;
var
  i : integer;
begin
  for i:=0 to FList.Count-1 do begin
    TOpisEdit(FList.Objects[i]).Free;
  end;
  FList.Clear;
end;

destructor TListOpisEdit.Destroy;
begin      
  DeleteAllOpis;
  FList.Free;
  FMemoKeyList.Free;
  FAdditiveIni.Free;
  inherited;
end;


//----------------------------------------------------------
// прочитать списки значений
//----------------------------------------------------------
function TListOpisEdit.ReadKeyList(cFileName : String) : Boolean;
begin
  Result := False;
  if FileExists(cFileName) then begin
    FMemoKeyList := TSasaIniFile.Create(cFileName);
    Result := True;
  end;
end;

procedure TListOpisEdit.AddOpis(NameOpis: String; Opis: TOpisEdit);
begin
  FList.AddObject(NameOpis, Opis);
end;

function TListOpisEdit.FindOpis(NameOpis: String) : TOpisEdit;
var
  i,j : integer;
begin
  FLastOpisInt := -1;
  Result := nil;
  j:=-1;
  NameOpis:=ANSIUpperCase(Trim(NameOpis));
//  if FList.Find(NameOpis, i) then begin
  for i:=0 to FList.Count-1 do begin
    if FList.Strings[i]=NameOpis then begin
      j:=i;
      break;
    end;
  end;
  if j>-1 then begin
    Result := GetOpis(j);
    FLastOpisInt := j;
    FLastOpisStr := NameOpis;
  end;
end;

function TListOpisEdit.GetOpis( i : Integer ) : TOpisEdit;
begin
  Result := TOpisEdit(FList.Objects[i]);
end;

function TListOpisEdit.GetListOpisA(cKey : String) : TOpisEdit;
begin
  Result := nil;
  if GetListOpis(cKey, nil, nil) then begin
    if CurrentOpis <> nil then begin
      Result := CurrentOpis;
    end;
  end;
end;

//-----------------------------------------------------------------------
function TListOpisEdit.CheckFilter(s : String) :String;
begin
  if Assigned(GlobalTask.OnCheckStringFilter) then begin
    GlobalTask.OnCheckStringFilter(s);
  end;
  Result:=s;
end;
//----------------------------------------------------------
function TListOpisEdit.ReloadOpis(Opis:TOpisEdit):Boolean;
var
  lOpen,lFilter:Boolean;
  sOldFilter:String;
  List:TStringList;
  i:Integer;
begin
  Result:=true;
  lOpen := false;
  if not Opis.DataSet.Active then begin
    Opis.DataSet.Open;
    lOpen:=true;
  end;
  lFilter:=false;
  if Opis.FilterDataSet<>'' then begin
    if Opis.DataSet.Filtered then begin
      lFilter:=true;
      sOldFilter:=Opis.DataSet.Filter;
    end;
    Opis.DataSet.Filter:=Opis.FilterDataSet;
    Opis.DataSet.Filtered:=true;
  end;

  LoadDS(Opis);

  if Opis.FilterDataSet<>'' then begin
    Opis.DataSet.Filter:='';
    Opis.DataSet.Filtered:=false;
    if lFilter then begin
      Opis.DataSet.Filter:=sOldFilter;
      Opis.DataSet.Filtered:=true;
    end;
  end;
  if lOpen then begin
    Opis.DataSet.Close;
  end;
end;
//----------------------------------------------------------
function TListOpisEdit.LoadDS(Opis:TOpisEdit):Boolean;
var
  ListA:TStringList;
  n,m:Integer;
  fldRes,fldName:TField;
  ds:TDataSet;
begin
  Result:=false;
  ds:=Opis.DataSet;
  if ds<>nil then begin
    Result:=true;
    ds.First;
    fldRes:=ds.FieldByName(Opis.ResultField);
    fldName:=ds.FieldByName(Opis.DisplayField);
    Opis.KeyList.Clear;
    Opis.Items.Clear;
    n:=0;
    if Opis.AddConst then begin
      n:=1000; //!!!  ADD_KOD_SHABLON uTypes.pas
      ListA := TStringList.Create;
      FMemoKeyList.ReadSectionValues(Opis.Section+'+CONST', ListA);
      if ListA.Count > 0 then begin
        for m:=0 to ListA.Count-1 do begin
          Opis.KeyList.Add(ListA.Names[m]);
          Opis.Items.Add(ListA.ValueFromIndex[m]);
        end;
      end;
      ListA.Free;
    end;
    if n>0 then begin
      while not ds.Eof do begin
        if Opis.KeyList.IndexOf(IntToStr(fldRes.AsInteger+n))=-1 then begin
          Opis.KeyList.Add(IntToStr(fldRes.AsInteger+n));
          Opis.Items.Add(fldName.AsString);
        end;
        ds.Next;
      end;
    end else begin
      while not ds.Eof do begin
        Opis.KeyList.Add(fldRes.AsString);
        Opis.Items.Add(fldName.AsString);
        ds.Next;
      end;
    end;
    ds.First;
  end;
end;
//-----------------------------------------------------------------------
procedure TListOpisEdit.CheckStdYear(Opis:TOpisEdit; sKey : String);
begin
  if Pos('ALL', sKey)>0 then begin
    Opis.KeyList.Add('0');
    Opis.Items.Add('все');
  end;
  if Pos('CUR', sKey)>0 then begin
    Opis.KeyList.Add('1');
    Opis.Items.Add('текущий');
  end;
end;
//-----------------------------------------------------------------------
function TListOpisEdit.GetListOpis(cKey : String; ItemsList,ValueList : TStrings) : Boolean;
var
  i,j : integer;
  Opis : TOpisEdit;
  List,ListA : TStringList;
  sName,strValue,s,ss,sFilter,sOldFilter : String;
  ds : TdataSet;
  ResultField, NameField : TField;
  lOpen,lErr,lFilter : Boolean;
  //---------------------------
  function IsDataSet : Boolean;
  var
    m:Integer;
  begin
    Result := false;
    if (ANSIUpperCase(List.Names[0]) = 'DATASET') and (List.Count >= 3) then begin
      Opis.DataSet := nil;
      ds := GlobalSeekDataSet(List.Values[ List.Names[0] ]);
      if ds <> nil then begin
        lOpen := false;
        if not ds.Active then begin
          ds.Open;
          lOpen := true;
        end;
        lErr := false;
        ResultField := ds.FindField(List.Values[ 'RESULT' ] );
        if ResultField=nil then begin
          lErr := true;
          PutError(' Для списка ' + cKey + '(из DataSet) не найдено поле "'+List.Values[ 'RESULT' ]+'"');
        end;
        NameField := ds.FindField(List.Values[ 'DISPLAY' ] );
        if NameField=nil then begin
          lErr := true;
          PutError(' Для списка ' + cKey + '(из DataSet) не найдено поле "'+List.Values[ 'DISPLAY' ]+'"');
        end;
        if not lErr then begin
          Opis.ResultField  := ResultField.FieldName;
          Opis.DisplayField := NameField.FieldName;
          Opis.DataSet      := ds;
          sFilter:=CheckFilter(List.Values['FILTER']);
          lFilter:=false;
          if sFilter<>'' then begin
            if ds.Filtered then begin
              lFilter:=true;
              sOldFilter:=ds.Filter;
            end;
            try
              Opis.FilterDataSet:=sFilter;
              ds.Filter:=sFilter;
              ds.Filtered:=true;
            except
              on E:Exception do begin
                PutError('Ошибка установки фильра '+ds.Name+': '+sFilter);
                Opis.FilterDataSet:='';
                lErr:=true;
              end;
            end;
          end;
          if not lErr then begin
            LoadDS(Opis);
          end;

          Result := true;
          if sFilter<>'' then begin
            if lFilter then begin
              ds.Filter:=sOldFilter;
              ds.Filtered:=true;
            end else begin
              ds.Filter:='';
              ds.Filtered:=false;
            end;
          end;
        end;
        if lOpen then begin
          ds.Close;
        end;
      end;
    end;
  end;
  function IsRange : Boolean;
  var
    y,m,d : Word;
    ii : Integer;
    sLast:string;
  begin
    Result := false;
    sName:=ANSIUpperCase(List.Names[0]);
    if Copy(sName,1,11) = 'RANGE_YEARS' then begin
      DecodeDate(GlobalTask.CurrentDate,y,m,d);
      Opis.KeyList.Clear;
      Opis.Items.Clear;
      s:=Trim(List.ValueFromIndex[0]);
      ii:=Pos('<',s);
      if ii>0 then begin
        CheckStdYear(Opis, Copy(s,1,ii-1));
        s:=Copy(s,ii+1,Length(s));
      end;
      ii:=Pos('>',s);
      if ii>0 then begin
        sLast:=Copy(s,ii+1,Length(s));
        s:=Copy(s,1,ii-1);
      end else begin
        sLast:='';
      end;
      ii:=Pos('..',s);
      if ii>0 then begin
        try
          i:=StrToInt(Copy(s,1,ii-1));
          j:=StrToInt(Copy(s,ii+2,100));
        except
          i:=-5;
          j:=5;
        end;
      end else begin
        i:=-5;
        j:=5;
      end;
      if i>j then begin
        for ii:=i downto j do begin
          Opis.KeyList.Add(IntToStr(y+ii));
          Opis.Items.Add(IntToStr(y+ii));
        end;
      end else begin
        for ii:=i to j do begin
          Opis.KeyList.Add(IntToStr(y+ii));
          Opis.Items.Add(IntToStr(y+ii));
        end;
      end;
      CheckStdYear(Opis, sLast);
      Result := true;
    end;
  end;
begin
  cKey:=ANSIUpperCase(Trim(cKey));
  Opis := FindOpis(cKey);
  if Opis = nil then begin
    Result:=False;
    Opis := TOpisEdit.Create;
    Opis.ListOpisEdit:=Self;
    Opis.KeyListFromDataSet := false;
    Opis.TypeEdit := teList;
    Opis.YesKrItems := false;
    Opis.Items    := TStringList.Create;
    Opis.KeyList  := TStringList.Create;
    Opis.KrItems  := TStringList.Create;
    Opis.Section  := cKey;
    Opis.TypeSeekSpr := tssListBox;
    List := TStringList.Create;
    FMemoKeyList.ReadSectionValues(cKey, List);
    if List.Count > 0 then begin
      Result := True;
      if List.Values['CONST']='1' then begin
        Opis.AddConst:=true;
      end;
      if FAdditiveIni.SectionExists(cKey) then begin
        Opis.FullName := FAdditiveIni.ReadString(cKey, 'NAME', cKey);
        Opis.Komm     := FAdditiveIni.ReadString(cKey, 'KOMM', '');
        s := ANSIUpperCase(Trim(FAdditiveIni.ReadString(cKey, 'TYPESEEK', '')));
        if (Copy(s,1,5) = 'COMBO') then begin
          Opis.TypeSeekSpr := tssComboBox;
        end;
      end;
      if not IsDataSet then begin
        if not IsRange then begin
          Opis.YesKrItems := true;
          // если включены значения
          if Pos('=',List.Strings[0])>0 then begin
            for i:=0 to List.Count-1 do begin
              Opis.KeyList.Add(Trim(List.Names[i]));
              strValue := List.Values[List.Names[i]];
              j:=Pos('#',strValue);
              if j>0 then begin
                Opis.Items.Add(Copy(strValue,1,j-1));
                Opis.KrItems.Add(Copy(strValue,j+1,Length(strValue)));
              end else begin
                Opis.Items.Add(strValue);
                Opis.YesKrItems := false;
              end;
            end;
          // иначе значения от 1 до Count
          end else  begin
            for i:=0 to List.Count-1 do begin
              Opis.KeyList.Add(IntToStr(i+1));
              strValue := List.Strings[i];
              j:=Pos('#',strValue);
              if j>0 then begin
                Opis.Items.Add(Copy(strValue,1,j-1));
                Opis.KrItems.Add(Copy(strValue,j+1,Length(strValue)));
              end else begin
                Opis.Items.Add(strValue);
                Opis.YesKrItems := false;
              end;
            end;
          end;
        end;
      end;
      AddOpis(cKey, Opis);
      CurrentOpis := Opis;
    end else begin
      Opis.Free;
    end;
    List.Free;
{    FMemoKeyList.ReadSectionValues(cKey, Opis.Items);
    if Opis.Items.Count > 0 then begin
      Result := True;
      for i:=0 to Opis.Items.Count-1 do begin
        Opis.KeyList.Add(IntToStr(i+1));
      end;
      AddOpis(cKey, Opis);
    end;
}
  end else begin
    // перезагрузим значение из DataSet
    if Opis.KeyListFromDataSet then begin
      ReloadOpis(Opis);
      Opis.KeyListFromDataSet:=false;
    end;
    CurrentOpis := Opis;
    Result := True;
  end;
  if Result and (ItemsList<>nil) then begin
    ItemsList.Clear;
    for i:=0 to Opis.Items.Count-1 do begin
      if FullNameKey or not Opis.YesKrItems then begin
        ItemsList.Add( Opis.Items[i] );
      end else begin
        ItemsList.Add( Opis.KrItems[i] );
      end;
    end;
    ValueList.Clear;
    for i:=0 to Opis.KeyList.Count-1 do begin
      ValueList.Add( Opis.KeyList[i] );
    end;
  end;
end;

//-----------------------------------------------------------------------
function TListOpisEdit.SeekValue(strName : String; strKey : String; lKrat : Boolean) : String;
var
  i : integer;
  Opis : TOpisEdit;
begin
  if (FLastOpisInt > -1) and (FLastOpisStr = strName) then begin
     Opis := GetOpis(FLastOpisInt);
  end else begin
    Opis := GetListOpisA(strName);
  end;
  if Opis = nil then begin
    Result := '';
  end else begin
    strKey := Trim(strKey);
    for i:=0 to Opis.KeyList.Count-1 do begin
      if Opis.KeyList.Strings[i] = strKey then begin
        if Opis.YesKrItems and lKrat then Result := Opis.KrItems.Strings[i]
                                     else Result := Opis.Items.Strings[i];
        exit;
      end;
    end;
  end;
end;

//-----------------------------------------------------------------------
function TListOpisEdit.OpisToStr(strName : String; strDelim : String; lKrat : Boolean) : String;
var
  i : integer;
  Opis : TOpisEdit;
begin
  Result := '';
  if (FLastOpisInt > -1) and (FLastOpisStr = strName) then begin
     Opis := GetOpis( FLastOpisInt );
  end else begin
    Opis := GetListOpisA(strName);
  end;
  if Opis <> nil then begin
    for i:=0 to Opis.KeyList.Count-1 do begin
      Result:=Result+Opis.KeyList.Strings[i];
      Result:=Result+'=';
      if Opis.YesKrItems and lKrat then Result := Result+Opis.KrItems.Strings[i]
                                   else Result := Result+Opis.Items.Strings[i];
      if i<>(Opis.KeyList.Count-1) then Result:=Result+strDelim;
    end;
  end;
end;

function TListOpisEdit.GetSprOpisA(cKey: String): TOpisEdit;
begin
  Result := GetSprOpis(cKey);
end;

function TListOpisEdit.GetDataSetOpis(Opis : TOpisEdit; typeOpen : TTypesOpenSpr; lShowError : Boolean) : Boolean;
var
  cNameTable : String;
  cTableName, cSQL, cFilter, cErr,s : String;
  v : Variant;
  cKey : String;
  function NormName(sss:string):String;
  begin
    if ANSIUpperCase(Copy(sss,1,7)) = 'SCRIPT:' then begin
      if GlobalTask.Script=nil then begin
        Result:='';
      end else begin
        try
        v := null;
        GlobalTask.Script.RunEx(Copy(sss,8,Length(sss)),[],v);
        if v<>null then begin
          Result:=varToStr(v);
        end;
        except
          on E:Exception do begin
            Result:='';
            PutError('Ошибка выполнения скрипта ('+Copy(sss,8,Length(sss))+') '+E.Message);
          end;
        end;
      end;
    end else begin
      Result:=sss;
    end;
  end;
begin
  Result := true;
  cKey := Opis.Section;
  cNameTable := FMemoKeyList.ReadString(cKey, 'TABLE', '');
  if cNameTable = '' then begin
    cNameTable := FMemoKeyList.ReadString(cKey, 'DATASET', '');
  end;
  cNameTable:=NormName(cNameTable);  // !!! см. выше

  cTableName := FMemoKeyList.ReadString(cKey, 'TABLENAME', '');
  cFilter    := CheckFilter(FMemoKeyList.ReadString(cKey, 'FILTER', ''));
  cSQL       := FMemoKeyList.ReadString(cKey, 'SQL', '');
  Opis.EnableEditSpr:= FMemoKeyList.ReadBool(cKey, 'EDIT', true);
  Opis.AutoFilter  := FMemoKeyList.ReadBool(cKey, 'AUTOFILTER', false);
  Opis.MultiSelect := FMemoKeyList.ReadBool(cKey, 'MULTISELECT', false);
  Opis.MultiSelectDelim := FMemoKeyList.ReadString(cKey, 'MULTISELECTDELIM', ',');
  Opis.MultiSelectDir:=FMemoKeyList.ReadString(cKey, 'MULTISELECTDIR', '');
  Opis.MultiSelectFilter:=FMemoKeyList.ReadString(cKey, 'MULTISELECTFILTER', '');
  Opis.MultiSelectShowID:=FMemoKeyList.ReadBool(cKey, 'MULTISELECTSHOWID', true);

  if FMemoKeyList.ReadString(cKey, 'CHECKVALUE', 'NOTCHECK') <> 'NOTCHECK' then begin
    Opis.CheckValue := ckCheck;
  end;
  if (Length(cNameTable) > 0) then begin // имя DataSet
    if FDataModule <> nil then begin
      Opis.FDataSet := SeekDataSet(FDataModule, cNameTable);
//      Opis.Table := SeekTable(FDataModule, cNameTable);   // 12.02.2009
    end;
    if Opis.FDataSet = nil then begin  // не нашли таблицу в текущем DataModule
      Opis.FDataSet := GlobalSeekDataSet(cNameTable);
//      Opis.Table := GlobalSeekTable(cNameTable);
    end;
    if Opis.FDataSet = nil then begin
      Result := false;
      if lShowError then
        PutError('Не найден DataSet с именем '+cNameTable+' (ListOpisEdit.GetSprOpis)');
    end else begin
      if cFilter<>'' then begin
        Opis.FDataSet.Filtered:=false;
        Opis.FDataSet.Filter:=cFilter;
        Opis.FDataSet.Filtered:=true;
      end;
      if Opis.FDataSet is TAdsTable then begin
        Opis.Table := Opis.FDataSet as TAdsTable;
        Opis.TypeDataSet := dsExistTable;
      end else if Opis.FDataSet is TAdsQuery then begin
        Opis.Table := nil;
        Opis.Query := Opis.FDataSet as TAdsQuery;
        Opis.TypeDataSet := dsExistQuery;
      end else begin
        if lShowError then
          PutError('Неизветный тип для DataSet: '+Opis.FDataSet.ClassName+' с именем '+cNameTable+' (ListOpisEdit.GetSprOpis)');
      end;
    end
  end else if (Length(cTableName)>0) then begin      // Table
    if (osTable in TypeOpen) then begin
      Opis.Table := GlobalTask.OpenDataSetAsTable( cKey, cTableName, Opis.EnableEditSpr, cErr );
      if Opis.Table = nil then begin
        Result := false;
        if lShowError then
          PutError(cErr+' (ListOpisEdit.GetSprOpis)');
      end else begin
        if cFilter<>'' then begin
          Opis.Table.Filtered:=false;
          Opis.Table.Filter:=cFilter;
          Opis.Table.Filtered:=true;
        end;
        Opis.CloseOnCancel:=true;
        Opis.FDataSet := Opis.Table;
        Opis.TypeDataSet := dsTable;
      end;
    end else begin
      Result := false;
    end;
  end else if (Length(cSQL)>0) then begin   // Query
    s:=cSQL;
//    if (osQuery in TypeOpen) then begin
    cSQL:=NormName(cSQL);
    Opis.Query:=nil;
    if cSQL<>'' then begin
      Opis.Query := GlobalTask.OpenDataSetAsQuery( cKey, cSQL, Opis.EnableEditSpr, cErr );
    end else begin
      cErr:='Ошибка SQL запроса:'+s;
    end;
    if Opis.Query = nil then begin
      Result := false;
      if lShowError then
        PutError(cErr+' (ListOpisEdit.GetSprOpis)');
    end else begin
      Opis.CloseOnCancel:=true;
      Opis.FDataSet := Opis.Query;
      Opis.TypeDataSet := dsQuery;
    end;
//    end else begin
//      Result := false;
//    end;
  end else begin
    Result := false;
    if lShowError then
      PutError('Неизвестен источник данных для описания '+cKey+' (ListOpisEdit.GetSprOpis)');
  end;
end;
//----------------------------------------------------------------
function  TListOpisEdit.GetNotLoadOpis(sType:String; sProg:String) : String;
begin
// NOT_LOAD_KEY    NOT_LOAD_LOOKUP    sType='KEY' или 'LOOKUP'
  Result:=FMemoKeyList.ReadString('NOT_LOAD_'+sType, sProg, '');
end;
//----------------------------------------------------------------
function  TListOpisEdit.GetSprOpis(cKey : String; typeOpen : TTypesOpenSpr; lShowError : Boolean) : TOpisEdit;
var
  Opis  : TOpisEdit;
  s : String;
  arr : TArrStrings;
  i : Integer;
  OpisDetail : TOpisEdit;
  lErr : Boolean;
  cSQL,sSeek : String;
  v : Variant;
  sl : TStringList;
begin
  Result := FindOpis(cKey);
  if Result = nil then begin
    Opis := TOpisEdit.Create;
    Opis.ListOpisEdit:=Self;
    Opis.Section := cKey;
    Opis.Table   := nil;
    Opis.Query   := nil;
    Opis.FDataSet := nil;
    Opis.CheckValue := ckNotCheck;

    lErr := not GetDataSetOpis(Opis,typeOpen,lShowError);

    if lErr then begin
      Opis.Free;
    end else begin
      Opis.TypeEdit     := teSpr;
      Opis.TypeEditSpr  := tesSimple;
      Opis.Caption      := FMemoKeyList.ReadString(cKey, 'CAPTION', '');
      Opis.ResultField  := FMemoKeyList.ReadString(cKey, 'RESULT', 'KOD');
      Opis.DisplayField := FMemoKeyList.ReadString(cKey, 'DISPLAY', '');
      if Opis.DisplayField='' then  Opis.DisplayField:='NAME';
      Opis.FieldForNaim := FMemoKeyList.ReadString(cKey, 'NAIM', 'NAME');
      if Opis.FieldForNaim = ''
        then Opis.FieldForNaim := Opis.DisplayField;
      if (Opis.ResultField<>'')
        then Opis.ChangeCode:=FMemoKeyList.ReadBool(cKey, 'CHANGECODE', false)   // доступна функция изменения кода в EditSpr
        else Opis.ChangeCode:=false;

      Opis.NameSort      := FMemoKeyList.ReadString(cKey, 'INDEXNAME', '');
      Opis.UpDownField   := FMemoKeyList.ReadString(cKey, 'UPDOWNFIELD', '');
      Opis.AddCorr       := FMemoKeyList.ReadString(cKey, 'ADDCORR', '');
      Opis.ValuePlus := FMemoKeyList.ReadBool(cKey, 'VALUEPLUS', false);
      Opis.WriteDateChoice := FMemoKeyList.ReadBool(cKey, 'DATECHOICE', false);
      Opis.MasterFields  := FMemoKeyList.ReadString(cKey,'MASTERFIELDS','');
      Opis.IndexForDetail:= FMemoKeyList.ReadString(cKey,'INDEXFORDETAIL','');
      Opis.ConfSection   := FMemoKeyList.ReadString(cKey,'CONFSECTION','');
      Opis.EnableExport  := FMemoKeyList.ReadBool(cKey,'ENABLEEXPORT',true);
      Opis.TreeViewSoato := FMemoKeyList.ReadString(cKey,'FIELD_SOATO','');
      s := FMemoKeyList.ReadString(cKey, 'TYPESPR', '');
      if s <> '' then begin
        if ANSIUpperCase(s) = 'TREESOATO' then begin
          {$IFDEF USE_TREE_SOATO}
            Opis.TypeEditSpr := tesTreeSoato;
          {$ENDIF}
        end else if (s = 'LOOKUP') then begin
          Opis.TypeEditSpr := tesLookUp;
          Opis.FListSource := TDataSource.Create(nil);
        end else if (s = 'LOOKUP_PLUS_EDIT') then begin
          Opis.TypeEditSpr := tesLookUpPlusEdit;
          Opis.FListSource := TDataSource.Create(nil);
        end;
      end;
      Opis.TypeSeekSpr := tssComboBox;
      s := FMemoKeyList.ReadString(cKey, 'TYPESEEKSPR', '');
      if s = '' then begin
        s := FMemoKeyList.ReadString(cKey, 'TYPESEEK', '');
      end;
      if s<>'' then begin
        if (s='KEYLIST') or (s='LISTBOX') then begin
          Opis.TypeSeekSpr := tssListBox;
        end else if (s='GRID') then begin
          Opis.TypeSeekSpr := tssGrid;
        end else if (s='GRID2') then begin
          Opis.TypeSeekSpr := tssGrid2;
        end;
      end;
      s := FMemoKeyList.ReadString(cKey, 'DETAIL', '');
      if s<>'' then begin
        StrToArr(s,arr,';',true);
        for i:=Low(arr) to High(arr) do begin
          OpisDetail := GetSprOpis(arr[i]);
          if OpisDetail<>nil then begin
            if Opis.ListDetail=nil
              then Opis.ListDetail:=TList.Create;
            Opis.ListDetail.Add(OpisDetail);
          end;
        end;
      end;

      if Opis.FDataSet<>nil then begin
        if FMemoKeyList.SectionExists('INDEX_'+UpperCase(Opis.FDataSet.Name)) then begin
          Opis.ListIndex := TStringList.Create;
          FMemoKeyList.ReadSectionValues('INDEX_'+UpperCase(Opis.FDataSet.Name),Opis.ListIndex);
        end;                                    
        //---- чтение RI ------------
        sSeek:='RI_'+UpperCase(Opis.FDataSet.Name)+FAddNameRI;
        s := FMemoKeyList.ReadString(sSeek, 'FIELD', '');
        if s='' then begin
          sSeek:='RI_'+UpperCase(Opis.FDataSet.Name);
          s := FMemoKeyList.ReadString(sSeek, 'FIELD', '');
        end;
        if s <> '' then begin
          Opis.RI := TRI.Create;
          SetLength(Opis.arrOldValue,0);
          i:=Pos(',',s);
          if i=0 then begin
            Opis.RI.Field_ID   := s;
            Opis.RI.Field_NAME := 'NAME';
          end else begin
            Opis.RI.Field_ID   := Copy(s,1,i-1);
            Opis.RI.Field_NAME := Copy(s,i+1,100);
          end;
          sl := TStringList.Create;
          FMemoKeyList.ReadSectionValues(sSeek, sl);
          for i:=1 to sl.Count-1 do begin
            Opis.RI.ListChild.Add(sl.Strings[i]);
          end;
          sl.Free;
        end;
        //----------------------------
      end;

      AddOpis(cKey, Opis);
      Result := Opis;
    end;
  end else begin
    if Result.DataSet=nil then begin
      if GetDataSetOpis(Result) then begin
        if not Result.DataSet.Active then
          Result.DataSet.Open;
      end else begin
        if lShowError then
          PutError(' Неизвестен DataSet (ListOpisEdit.GetSprOpis)');
        Result:=nil;
      end;
    end else begin
      if not Result.DataSet.Active then begin
        try
          Result.DataSet.Filter:='';
          if Result.TypeDataSet = dsQuery then begin
            cSQL := FMemoKeyList.ReadString(cKey, 'SQL', '');
            if ANSIUpperCase(Copy(cSQL,1,7)) = 'SCRIPT:' then begin
              {$IFDEF USE_SCRIPT}
              v := null;
              GlobalTask.Script.RunEx(Copy(cSQL,8,Length(cSQL)),[],v);
              if v<>null then begin
                cSQL := v;
              end;
              {$ENDIF}
            end;
            Result.Query.SQL.Text := cSQL;
          end else begin

          end;
          Result.DataSet.Open;
        except
          on E:Exception do begin
            if lShowError then
              PutError(E.Message+' (ListOpisEdit.GetSprOpis)');
            Result:=nil;
          end;
        end;
      end;
    end;
  end;
end;

//---------------------------------------------------------------------------
procedure GetNameSect(DataSet : TDataSet; TypeOpis : TTypeEdit; var cSection,cSeek : String);
var
  s : String;
begin
  if TypeOpis = teSpr
    then s:='SPR'
    else s:='LIST';
  if DataSet is TAdsQuery then begin
    cSection := 'QUERY_'+s;
    cSeek    := '';
  end else begin
    cSection := 'TABLE_'+s;
    cSeek := ANSIUpperCase(DataSet.Name)+'->';
  end;
end;

//--------------------------------------------------------
// установить для грида списки значений
//--------------------------------------------------------
procedure TListOpisEdit.SetListGrid(Grid: TSasaDbGrid);
var
  Column : TColumnEh;
  i : integer;
  cSection,cKey,cSeek : string;
begin
  if Assigned(FMemoKeyList) and Assigned(Grid)
     and (Grid.Columns.Count > 0) and (Grid.DataSource<>nil) then begin
    GetNameSect( Grid.DataSource.DataSet, teList, cSection, cSeek);
 //   if Grid.DataSource.DataSet.Active then begin
      for i:=0 to Grid.Columns.Count-1 do begin
        Column := Grid.Columns[i];
        cKey := '';
        if Grid.DataSource.DataSet.Owner <> nil then begin
          cKey := FMemoKeyList.ReadString(cSection,
                  Grid.DataSource.DataSet.Owner.Name+'.'+cSeek+ANSIUpperCase(Column.FieldName),'');
        end;
        if cKey='' then begin
          cKey := FMemoKeyList.ReadString(cSection,cSeek+ANSIUpperCase(Column.FieldName),'');
        end;
//        cKey := FMemoKeyList.ReadString(cSection,cSeek+ANSIUpperCase(Column.Field.FieldName),'');
        if Length(cKey) > 0 then begin
          if GetListOpis(cKey, Column.PickList, Column.KeyList) then begin
            if CurrentOpis <> nil then begin
              Column.Tag := Integer(CurrentOpis);
            end;
            Column.ButtonStyle := cbsAuto;
          end;
        end;
      end;
//    end;
  end;
end;

//--------------------------------------------------------
// установить для грида LookUp поля
//--------------------------------------------------------
procedure TListOpisEdit.SetSprGrid(Grid: TSasaDbGrid);
var
  Column : TColumnEh;
  i : integer;
  cSection,cKey,cSeek : string;
  Opis : TOpisEdit;
begin
  if Assigned(FMemoKeyList) and Assigned(Grid) and
     (Grid.Columns.Count > 0) and (Grid.DataSource<>nil) then begin
    GetNameSect( Grid.DataSource.DataSet, teSpr, cSection, cSeek);
    for i:=0 to Grid.Columns.Count-1 do begin
      Column := Grid.Columns[i];
      cKey := '';
      if Grid.DataSource.DataSet.Owner <> nil then begin
        cKey := FMemoKeyList.ReadString(cSection,
                Grid.DataSource.DataSet.Owner.Name+'.'+cSeek+ANSIUpperCase(Column.FieldName),'');
      end;
//      cKey := FMemoKeyList.ReadString(cSection,
//              Grid.DataSource.DataSet.Owner.Name+'.'+cSeek+ANSIUpperCase(Column.Field.FieldName),'');
      if cKey='' then begin
        cKey := FMemoKeyList.ReadString(cSection,cSeek+ANSIUpperCase(Column.FieldName),'');
//        cKey := FMemoKeyList.ReadString(cSection,cSeek+ANSIUpperCase(Column.Field.FieldName),'');
      end;
      if Length(cKey) > 0 then begin
        Opis := GetSprOpis(cKey);
        if Opis <> nil then begin
          if Opis.TypeEditSpr = tesLookup then begin
            Column.DropDownBox.ListSource := Opis.FListSource;
          end else begin
            if not Assigned(Grid.OnEditButtonClick) then begin
              Grid.OnEditButtonClick := TEvents.Grid_EditButtonClick;
            end;
            if Opis.DisplayField<>'' then begin
//              Column.LookupDisplayFields:=Opis.DisplayField;
              Column.OnGetCellParams := TEvents.Column_GetCellParams;
            end;
            if Opis.CheckValue <> ckNotCheck then begin
              if not Assigned(Column.OnUpdateData) then begin
                Column.OnUpdateData := TEvents.Column_UpdateData;
              end;
            end;
            Column.ButtonStyle := TColumnButtonStyleEh(cbsEllipsis);
          end;
          Column.Tag := Integer(Opis);
        end else begin
          Column.Tag := 0;
        end;
      end;
    end;
  end;
end;

//--------------------------------------------------------
// установить для TDbComboBoxEh списки значений
//--------------------------------------------------------
procedure TListOpisEdit.SetListComboBox(ComboBox : TDbComboBoxEh);
var
  cSection,cKey,cSeek : string;
begin
  if Assigned(ComboBox) and (ComboBox.DataSource<>nil) and
    (ComboBox.DataSource.DataSet<>nil) then begin
    GetNameSect(ComboBox.DataSource.DataSet,teList,cSection,cSeek);
    if ComboBox.DataSource.DataSet.Owner <> nil then begin
      cKey := FMemoKeyList.ReadString(cSection,ComboBox.DataSource.DataSet.Owner.Name+'.'+
              cSeek+ANSIUpperCase(ComboBox.DataField),'');
    end;                       
    if cKey='' then
      cKey := FMemoKeyList.ReadString(cSection,cSeek+ANSIUpperCase(ComboBox.DataField),'');
    if Length(cKey) > 0 then begin
      if GetListOpis(cKey, ComboBox.Items, ComboBox.KeyItems) then begin
        ComboBox.EditButton.Style   := ebsDropDownEh;
        ComboBox.EditButton.Visible := true;
      end else begin
        ComboBox.EditButton.Visible := false;
      end;
    end;
  end;
end;

//--------------------------------------------------------
// установить для ComboEdit LookUp
//--------------------------------------------------------
procedure TListOpisEdit.SetSprComboEdit(ComboEdit : TCustomDBEditEh);
var
  cSection,cKey,cSeek : string;
  Opis : TOpisEdit;
//  s : String;
begin
  if (ComboEdit.DataSource<>nil) and (ComboEdit.Field<>nil) then begin
    GetNameSect(ComboEdit.DataSource.DataSet, teSpr, cSection, cSeek);
//    ShowMessage(ComboEdit.DataSource.DataSet.Owner.Name+#13+cSeek);
    cKey := FMemoKeyList.ReadString(cSection,
      ComboEdit.DataSource.DataSet.Owner.Name+'.'+cSeek+ANSIUpperCase(ComboEdit.Field.FieldName),'');
    if cKey='' then begin
      cKey := FMemoKeyList.ReadString(cSection,cSeek+ANSIUpperCase(ComboEdit.Field.FieldName),'');
    end;
    if Length(cKey) > 0 then begin
      Opis := GetSprOpis(cKey);
      if Opis <> nil then begin
        if ComboEdit is TDbLookUpComboBoxEh then begin
          with TDbLookUpComboBoxEh(ComboEdit) do begin
            OnButtonClick := TEvents.EditButtons_OnClick;
            OnButtonDown  := TEvents.EditButtons_OnDown;
            Tag := Integer(Opis);
          end;
        end else if ComboEdit is TDbEditEh then begin
          with TDbEditEh(ComboEdit) do begin
            if EditButtons.Count>0 then begin
              if not Assigned(EditButtons[0].OnClick) then begin
                EditButtons[0].OnClick := TEvents.EditButtons_OnClick;
                EditButtons[0].OnDown  := TEvents.EditButtons_OnDown;
                EditButtons[0].Visible := true;
    //          ComboEdit.GlyphKind := gkDropDown; // TGlyphKind
                Tag := Integer(Opis);
              end;
              if not Assigned(EditButtons[0].OnClick) then begin
                EditButtons[0].Visible := false;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TListOpisEdit.SetKeyForm( Form : TForm; Data : TComponent);
var
  i : integer;
begin
  FDataModule := Data;
  for i:=0 to Form.ComponentCount-1 do begin
    if Form.Components[i] is TDbComboBoxEh then begin
      SetListComboBox(TDbComboBoxEh(Form.Components[i]));
    end else if Form.Components[i] is TDbEditEh then begin
      SetSprComboEdit(TDBEditEh(Form.Components[i]));
    end else if Form.Components[i] is TDbLookUpComboBoxEh then begin
//      SetSprComboEdit(TDBEditEh(Form.Components[i]));
    end else if Form.Components[i] is TDbGridEh then begin //SasaDbGrid then begin
      if (TSasaDbGrid(Form.Components[i]).DataSource<>nil) and
         (TSasaDbGrid(Form.Components[i]).DataSource.DataSet<>nil) then begin
        SetListGrid(TSasaDbGrid(Form.Components[i]));
        SetSprGrid(TSasaDbGrid(Form.Components[i]));
      end;          
    end;
  end;
end;

{
procedure EventsWriteField(Field : TField; v : Variant);
var
  strFieldName : String;
  dsLookUp : TDataSet;
begin
  if Field.FieldKind = fkLookUp then begin
//    strFieldName := Field.KeyFields;
    if Pos(';',strFieldName) = 0 then begin  // ключевой поле одно
      dsLookUp := Field.LookupDataSet;
      dsLookUp.Locate(Field.LookupKeyFields,v,[]);
      Field.Value := dsLookUp.FieldByName(Field.LookupResultField).Value;
//      Field.DataSet.FieldByName(strFieldName).Value := v;
//      PostDataSet(Field.DataSet);
//      Field.DataSet.Refresh;
    end else begin
      PutError(' модуль OpisEdit.pas, EventsWriteField - невозможна запись в несколько полей');
    end;
  end else begin
    Field.Value := v;
  end;
end;
}

{$IFDEF VER_LOOKUP_2}
procedure EventsWriteField(Field : TField; v : Variant; curValue:Variant; sDelim:String);
var
  strFieldName, sVal : String;
  lAdd:Boolean;
begin
  lAdd:=false;
  if curValue<>null then begin
    try
      sVal:=VarToStr(curValue);
      if (VarToStr(v)<>'') and (sVal<>'') and (RightStr(sVal,Length(sDelim))<>sDelim) then begin
        sVal:=sVal+sDelim;
        lAdd:=true;
      end;
    except
      sVal:='';
    end;
  end;
  if Field.FieldKind = fkLookUp then begin
    strFieldName := Field.KeyFields;
    if Pos(';',strFieldName) = 0 then begin  // ключевой поле одно
      Field.DataSet.FieldByName(strFieldName).Value:=v;
      if lAdd
        then Field.DataSet.FieldByName(strFieldName).Value:=sVal+v
        else Field.DataSet.FieldByName(strFieldName).Value:=v;
    end else begin
      PutError(' модуль OpisEdit.pas, EventsWriteField - невозможна запись в несколько полей');
    end;
  end else begin
    if lAdd
      then Field.Value := sVal+v
      else Field.Value := v;
  end;
end;
{$ELSE}
procedure EventsWriteField(Field : TField; v : Variant);
var
  strFieldName : String;
begin
  if Field.FieldKind = fkLookUp then begin
    strFieldName := Field.KeyFields;
    if Pos(';',strFieldName) = 0 then begin  // ключевой поле одно
      Field.DataSet.FieldByName(strFieldName).Value := v;
    end else begin
      PutError(' модуль OpisEdit.pas, EventsWriteField - невозможна запись в несколько полей');
    end;
  end else begin
    Field.Value := v;
  end;
end;
{$ENDIF}

function EventsReadField(Field : TField) : Variant;
var
  strFieldName : String;
begin
  Result := null;
  if Field.FieldKind = fkLookUp then begin
    strFieldName := Field.KeyFields;
    if Pos(';',strFieldName) = 0 then begin  // ключевой поле одно
      Result := Field.DataSet.FieldByName(strFieldName).Value;
    end else begin
      PutError(' модуль OpisEdit.pas, EventsWriteField - невозможна запись в несколько полей');
    end;
  end else begin
    Result := Field.Value;
  end;
end;

//--------------------------------------------------------
//                   События
//--------------------------------------------------------
class procedure TEvents.Grid_EditButtonClick(Sender: TObject);
var
  i : integer;
  Column : TColumnEh;
  v, old : variant;
  OpisEdit : TOpisEdit;
  Cont : TControl;
  ed : TDbEditEh;
  gr : TDbGridEh;
  arrRec : TCurrentRecord;
  ParamFlt : TParamFieldFlt;
begin
  gr := TDbGridEh(Sender);
  i := gr.SelectedIndex;
  Column := TDbGridEh(Sender).Columns[i];
  ed:=nil;
  if TObject(Column.Tag) is TOpisEdit then begin
    OpisEdit := TOpisEdit(Column.Tag);
 //   if (OpisEdit.TypeEdit=teSpr) then begin
      if (OpisEdit.Table<>nil) and (OpisEdit.Table.Active) then begin
        v := TDbGridEh(Sender).SelectedField.Value;
        old := v;
        ParamFlt:=nil;
        if TDbGridEh(Sender).EditorMode then begin
          Cont := gr.InplaceEditor;
          if gr.InplaceEditor.Modified then begin // было изменено значение
            ParamFlt := TParamFieldFlt.Create;
            ParamFlt.Value1:=Trim(gr.InplaceEditor.Text);
            ParamFlt.OnlySet:=true;
          end;
        end else begin
          //----- для привязки по координатам ------------
          ed := TDbEditEh.Create(nil);
          ed.Visible:=false;
          ed.Parent:=gr;
          ed.Left := gr.CellRect(gr.Col,gr.Row).Left;
          ed.Top := gr.CellRect(gr.Col,gr.Row).Top;
          ed.Width := gr.CellRect(gr.Col,gr.Row).Right-ed.Left;
          ed.Height:= gr.CellRect(gr.Col,gr.Row).Bottom-ed.Top;
          //-----------------------------------------------
          Cont := ed;
        end;
        SetLength(arrRec,1);
        if OpisEdit.ChoiceFromSprEx(Cont,v,arrRec,ParamFlt) then begin
          if not TDbGridEh(Sender).ReadOnly then begin
            TDbGridEh(Sender).DataSource.DataSet.Edit;
            if OpisEdit.MultiSelect then begin
              v := OpisEdit.CheckMultiSelect(Column.Field,v);
              Column.Field.Value := v;
            end else begin
              if not OpisEdit.ValuePlus then old:=null;
              EventsWriteField(Column.Field, v, old, OpisEdit.MultiSelectDelim ); //Column.Field.Value := v;
              OpisEdit.RunAddCorr(Column.Field.Dataset, arrRec );
            end;
            if Assigned(OpisEdit.OnAfterChoice) then begin
              OpisEdit.OnAfterChoice(OpisEdit,arrRec);
            end;
//            ComboEdit.Value:=ComboEdit.Field.Value; // вставил для того, чтобы вызывалось событие OnUpdateData у DbEditEh
          end;
        end;
        if ParamFlt<>nil then ParamFlt.Free;
      end;
  //  end;
  end;
  if ed<>nil then FreeAndNil(ed);
end;

class procedure TEvents.Column_GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  cc : TColumnEh;
  Opis : TOpisEdit;
  i : Integer;
begin
  if not EditMode and (Params.Text<>'') then begin
    cc   := TColumnEh(Sender);
    Opis := TOpisEdit(cc.Tag);
    if (Opis.TypeEdit = teSpr) and (Opis.Table<>nil) and (Opis.Table.Active) then begin
      if Opis.Table.Locate(Opis.ResultField, Params.Text, []) then begin
        if (Pos(';',Opis.DisplayField)=0) then begin
          Params.Text:=Opis.Table.FieldByName(Opis.DisplayField).AsString;
        end else begin
          Params.Text:='';
          for i:=Low(Opis.ArrDisplayFld) to High(Opis.ArrDisplayFld) do begin
            Params.Text:=Params.Text + Opis.Table.FieldByName(Opis.ArrDisplayFld[i]).AsString;
            Params.Text:=Params.Text + ' ';
          end;
        end;
      end else begin

      end;
    end;
  end;
end;
//-------------------------------------------------------------------------
class procedure TEvents.Column_UpdateData(Sender: TObject; var Text: String; var Value: Variant; var UseText, Handled: Boolean);
var
  cc : TColumnEh;
  Opis : TOpisEdit;
  Msg: TMsg;
begin
  if (Text<>'') and (Value<>null) then begin
    cc   := TColumnEh(Sender);
    Opis := TOpisEdit(cc.Tag);
    if (Opis.TypeEdit = teSpr) and (Opis.DataSet<>nil) and (Opis.DataSet.Active) then begin
      if not Opis.DataSet.Locate(Opis.ResultField, Text, []) then begin
        Handled := true;
        // из-за того, что в SasaDbGrid вызывается: PostMessage(Handle,WM_KEYDOWN,NewKey,0)
        // необходимо почистить очередь сообщений, иначе Enter проходит два раза
        PeekMessage(Msg, cc.Grid.Handle, WM_KEYDOWN, WM_KEYDOWN, PM_REMOVE);
        raise EVvodError.Create(' Значение "'+Text+'" отсутствует в справочнике ');
//        PutError(' Значение "'+Text+'" отсутствует в справочнике ')
      end;
    end;
  end;
end;
//-------------------------------------------------------------------------
class procedure TEvents.EditButtonsFile_OnClick(Sender: TObject;
                var Handled: Boolean);
var
  v : variant;
  Edit : TDbEditEh;
  d : TOpenDialog;
begin
//  if Sender is TDbEditEh then begin
    Handled := true;
    if Sender is TDbEditEh then begin
      Edit := TDbEditEh(Sender);
    end else begin
      Edit := TDbEditEh(TComponent(Sender).Owner);
    end;
//    if TObject(Edit.Tag) is TOpisEdit then begin
//      OpisEdit  := TOpisEdit(ComboEdit.Tag);
     v := Edit.Value;
     d := TOpenDialog.Create(nil);
     d.FileName:=v;
     if d.Execute then begin
       Edit.Value := d.FileName;
     end;
     d.Free;
//  end;
end;

class procedure TEvents.EditButtonsDir_OnClick(Sender: TObject;  var Handled: Boolean);
var
  v : variant;
  Edit : TDbEditEh;
  s : String;
begin
  Handled := true;
  if Sender is TDbEditEh then begin
    Edit := TDbEditEh(Sender);
  end else begin
    Edit := TDbEditEh(TComponent(Sender).Owner);
  end;
  v := Edit.Value;
  if SelectDirectory('','',s) then begin
    Edit.Value := s;
  end;
end;

//--------------------------------------------------------
class procedure TEvents.EditButtons_OnClick(Sender: TObject; var Handled: Boolean);
var
  v, curValue : variant;
  ComboEdit : TDbEditEh;
  OpisEdit : TOpisEdit;
  arrRec : TCurrentRecord;
  ParamFlt : TParamFieldFlt;
//  s : String;
begin
//  if Sender is TDbEditEh then begin
    Handled := true;
    if Sender is TDbEditEh then begin
      ComboEdit := TDbEditEh(Sender);
    end else begin
      ComboEdit := TDbEditEh(TComponent(Sender).Owner);
    end;
    if TObject(ComboEdit.Tag) is TOpisEdit then begin
      OpisEdit  := TOpisEdit(ComboEdit.Tag);
      if Assigned(OpisEdit.Table) and  OpisEdit.Table.Active then begin
        ParamFlt:=nil;
        if ComboEdit.Modified then begin  // было изменение при вводе
          v := ComboEdit.Value;
          ParamFlt := TParamFieldFlt.Create;
          ParamFlt.Value1:=v;
          ParamFlt.OnlySet:=true;
        end else begin
          if ComboEdit.Field<>nil then begin
            v := EventsReadField(ComboEdit.Field); //ComboEdit.Field.Value;
          end else begin
            v := ComboEdit.Value;
          end;
        end;
        curValue := v;
        SetLength(arrRec,1);
        if OpisEdit.ChoiceFromSprEx(ComboEdit,v,arrRec, ParamFlt) then begin
//        FormLookUp.Execute(ComboEdit,
//              OpisEdit.Table, OpisEdit.ResultField, v, OpisEdit.NameSort);
//        if old <> v then begin
          if not ComboEdit.ReadOnly and (ComboEdit.Field<>nil) then begin
            ComboEdit.Field.DataSet.Edit;
            if OpisEdit.MultiSelect then begin
              v := OpisEdit.CheckMultiSelect(ComboEdit.Field,v);
              ComboEdit.Field.Value := v;
              ComboEdit.Value:=ComboEdit.Field.Value; // вставил для того, чтобы вызывалось событие OnUpdateData у DbEditEh
            end else begin
              if not OpisEdit.ValuePlus then curValue:=null;
              EventsWriteField(ComboEdit.Field,v,curValue, OpisEdit.MultiSelectDelim); //ComboEdit.Field.Value := v;
              ComboEdit.Value:=ComboEdit.Field.Value; // вставил для того, чтобы вызывалось событие OnUpdateData у DbEditEh
              OpisEdit.RunAddCorr(ComboEdit.Field.DataSet, arrRec);
            end;
            if Assigned(OpisEdit.OnAfterChoice) then begin
              OpisEdit.OnAfterChoice(OpisEdit,arrRec);
            end;
          end else begin
            if OpisEdit.MultiSelect then begin
              v := OpisEdit.CheckMultiSelect(nil,v);
            end;
            ComboEdit.Value := v;
//            s := IntToStr(v);
//            ComboEdit.Text  := Replicate(s[1],3);
          end;
        end;
        if ParamFlt<>nil then ParamFlt.Free;
      end;
    end;
//  end;
end;

class procedure TEvents.EditButtons_OnDown(Sender: TObject; TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
end;

// ------- событие фильтрации таблицы -----------------------
class procedure TEvents.AdsTable_OnFilter(DataSet: TDataSet;
  var Accept: Boolean);
var
  i : Integer;
    v : Variant;
  s1,s2 : String;
begin
  Accept := false;
  for i:=Low(ArrFilter) to High(ArrFilter) do begin
    v := dataSet.FieldByName(ArrFilter[i].NameField).Value;
    if v = null then begin       // поле не заполнено
      Accept := false;
    end else begin
      case ArrFilter[i].TypeSrav of
        tsfRavno       : Accept := ( v = ArrFilter[i].Value );
        tsfBolsheRavno : Accept := ( v >= ArrFilter[i].Value );
        tsfMensheRavno : Accept := ( v <= ArrFilter[i].Value );
        tsfInStr       : begin
                          s1 := v;
                          s2 := ArrFilter[i].Value;
                          Accept := ( Pos(','+s1+',',s2)>0 );
                        end;
      end;
    end;
    if not Accept then exit;
  end;
end;

procedure TListOpisEdit.SetCurrentOpis(const Value: TOpisEdit);
begin
  FCurrentOpis := Value;
end;

procedure TListOpisEdit.SetFullNameKey(const Value: Boolean);
begin
  FFullNameKey := Value;
end;

procedure TOpisEdit.SetTypeEditSpr(const Value: TTypeEditSpr);
begin
  FTypeEditSpr := Value;
end;

procedure TListOpisEdit.SetOwner(const Value: TObject);
begin
  FOwner := Value;
end;


procedure TOpisEdit.SetAddCorr(const Value: String);
begin
  FAddCorr := Value;
end;

procedure TOpisEdit.RunAddCorr(ds : TDataset; arrRec : TCurrentRecord);
var
  a   : TArrStrings;
  fld : TField;
  vField : Variant;
  strNameField,sFld : String;
  i,j,m : Integer;
  lFind,lAll : Boolean;
begin
  if (Length(arrRec)>0) and (Table<>nil) and (AddCorr<>'') then begin
    StrToArr(AddCorr,a,';',true);
    for i:=Low(a) to High(a) do begin
      lAll:=false;
      j:=Pos('->',a[i]);
      if j>0 then begin
        strNameField := ANSIUpperCase(Copy(a[i],1,j-1));
        if Copy(a[i],j+2,1)='>'   then begin   //   "FFF->>SSS"
          sFld:=Copy(a[i],j+3,Length(a[i])); 
          lAll:=true;
        end else begin
          sFld:=Copy(a[i],j+2,Length(a[i])); 
        end;
        fld := ds.FindField(sFld);
//        fld1 := Table.FindField(Copy(a[i],1,j-1));
        vField:=null;
        lFind:=false;
        for m:=Low(arrRec) to High(arrRec) do begin
          if arrRec[m].FieldName = strNameField then begin
            vField := arrRec[m].Value;
            lFind := true;
            break;
          end;
        end;
        if (fld<>nil) and lFind then begin
          if vField = null then begin
            if lAll then fld.AsString:='';
//            fld.AsString:='';     если значение пустое не затираем то, что было раньше
          end else begin
            fld.Value := vField;
          end;
        end else begin
          if fld=nil then begin
            PutError('В DataSet '+ds.Name+' не найдено поле '+Copy(a[i],j+2,Length(a[i])));
          end;
          if not lFind then begin
            PutError('В DataSet '+Table.Name+' не найдено поле '+strNameField);
          end;
        end;
      end;
    end;
  end;
end;

procedure TOpisEdit.SetWriteDateChoice(const Value: Boolean);
begin
  FWriteDateChoice := Value;
end;

procedure TOpisEdit.RunWriteDateChoice(ds: TDataSet);
var
  fld : TField;
begin
  if (ds<>nil) then begin
    fld := ds.FindField('DATECHOICE');
    if fld<>nil then begin
      try
        EditDataSet(ds);
        fld.AsDateTime:=GlobalTask.CurrentDate;
        PostDataSet(ds);
      except
      end;
    end;
  end;
end;

function TOpisEdit.GetIndexKey(Value : Variant): Integer;
var
  strSeek : String;
begin
  strSeek := Trim(VarToStr(Value));
  Result  := KeyList.IndexOf(strSeek);
end;

function TListOpisEdit.GetAllLookupNames: String;
var
  sl : TStringList;
  i : Integer;
begin
  sl := TStringList.Create;
  FMemoKeyList.ReadSections(sl);
  Result := '';
  for i:=0 to sl.Count-1 do begin
    if Copy(sl.Strings[i],1,7)='LOOKUP_' then begin
      Result := Result + sl.Strings[i] + ';';
    end;
  end;
  sl.Free;
end;

function TListOpisEdit.GetAllListNames: String;
var
  sl : TStringList;
  i : Integer;
begin
  sl := TStringList.Create;
  FMemoKeyList.ReadSections(sl);
  Result := '';
  for i:=0 to sl.Count-1 do begin
    if Copy(sl.Strings[i],1,4)='KEY_' then begin
      Result := Result + sl.Strings[i] + ';';
    end;
  end;
  sl.Free;
end;

function TListOpisEdit.GetAllEditNames: String;
var
  sl : TStringList;
  i : Integer;
begin
  sl := TStringList.Create;
  FMemoKeyList.ReadSections(sl);
  Result := '';
  for i:=0 to sl.Count-1 do begin
    if Copy(sl.Strings[i],1,5)='EDIT_' then begin
      Result := Result + sl.Strings[i] + ';';
    end;
  end;
  sl.Free;
end;

procedure TOpisEdit.SetOnAfterChoice(const Value: TAfterChoice);
begin
  FOnAfterChoice := Value;
end;

{
procedure TListOpisEdit.SetWorkDataModule(const Value: TDataModule);
begin
  FWorkDataModule := Value;
end;
}
procedure TOpisEdit.Cancel;
begin
  if CloseOnCancel and DataSet.Active then begin
    DataSet.Close;
    DataSet.Filter:='';
    FreeAndNil(FDataSet);
  end;
end;

// пока не очень хорошо, потом переделать
function TOpisEdit.DeleteDetailRecords;
var
  i : Integer;
  Opis : TOpisEdit;
  lOk : boolean;
  strFields : String;
  ValueSeek : Variant;
begin
  Result:=true;
  if (ListDetail<>nil) and (ListDetail.Count>0) then begin
    for i:=0 to ListDetail.Count-1 do begin
      Opis := TOpisEdit(ListDetail.Items[i]);
      // ключевое поле может быть только одно (пока)
      strFields := Opis.MasterFields;
      ValueSeek := DataSet.FieldByName(strFields).Value;
      lOk:=false;
      if (Opis.TypeDataSet=dsExistTable) or (Opis.TypeDataSet=dsTable) then begin
        lOk:=true;
        Opis.Table.IndexName := Opis.IndexForDetail;
        while Opis.Table.FindKey( [ ValueSeek ] ) do begin
          Opis.Table.Delete;
        end;
      end;
      if not lOk then begin
        Result:=false;
        PutError('  Детальными DataSets могут быть только таблицы ! (TOpisEdit.DeleteDetailRecords)');
        break;
      end;
    end;
  end;
end;

procedure TOpisEdit.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
end;

procedure TOpisEdit.SetExternalDataSet(ds: TDataSet);
begin
  if ds is TAdsTable then begin
    Table       := TAdsTable(ds);
    FDataSet    := ds;
    TypeDataSet := dsExistTable;
  end else if ds is TAdsQuery then begin
    Query       := TAdsQuery(ds);
    FDataSet    := ds;
    TypeDataSet := dsExistQuery;
  end else begin
    PutError(' Ошибка SetExternalDataSet: неизвестный тип DataSet');
  end;
end;

procedure TOpisEdit.SetAutoFilter(const Value: Boolean);
begin
  FAutoFilter := Value;
end;

procedure TOpisEdit.SetFullName(const Value: String);
begin
  FFullName := Value;
end;

procedure TOpisEdit.SetKomm(const Value: String);
begin
  FKomm := Value;
end;

procedure TOpisEdit.SetListSource(const Value: TDataSource);
begin
  FListSource := Value;
end;


procedure TOpisEdit.SetCheckValue(const Value: TTypeCheck);
begin
  FCheckValue := Value;
end;

procedure TOpisEdit.SetTypeSeekSpr(const Value: TTypeSeekSpr);
begin
  FTypeSeekSpr := Value;
end;

procedure TOpisEdit.SetKeyListFromDataSet(const Value: Boolean);
begin
  FKeyListFromDataSet := Value;
end;

function TOpisEdit.TypeSeek: TTypeSeekSpr;
begin
  Result := FTypeSeekSpr;
end;

function TOpisEdit.ChoiceFromKeyList( HControl: TWinControl ) : String;
var
  n : Integer;
begin
  Result := '';
  n := ChoiceFromList(Items);
  if n > -1 then begin
    Result := KeyList.Strings[n];
  end;
end;

procedure TOpisEdit.SetValuePlus(const Value: Boolean);
begin
  FValuePlus := Value;
end;

procedure TOpisEdit.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
end;

procedure TOpisEdit.SetMultiSelectDelim(const Value: String);
begin
  FMultiSelectDelim := Value;
end;

function TOpisEdit.CheckMultiSelect(Field : TField; s: String): String;
var
  i : Integer;
  arr : TArrStrings;
begin
  Result := s;
  if MultiSelect then begin
    Result := '';
    if Field<>nil then begin
      Result := Trim(Field.AsString);
    end;
    StrToArr(s,arr,Chr(13)+Chr(10),true);
    if (Length(arr)>0) and (Result<>'') and
       (Right(Result,Length(MultiSelectDelim))<>MultiSelectDelim) then begin
      Result := Result + MultiSelectDelim;
    end;
    for i:=0 to Length(arr)-1 do begin
      Result := Result + arr[i];
      if i<>Length(arr)-1 then begin
        Result := Result + MultiSelectDelim;
      end;
    end;
  end;
end;

procedure TListOpisEdit.SetOnCheckEnableEdit(const Value: TCheckEnableEdit);
begin
  FOnCheckEnableEdit := Value;
end;

procedure TListOpisEdit.SetAddNameRI(const Value: String);
begin
  FAddNameRI := Value;
end;

{ TRI }

constructor TRI.Create;
begin
  inherited;
  Field_ID   := '';
  Field_NAME := 'NAME';
  CheckName  := false;
  ListChild := TStringList.Create;
end;

destructor TRI.Destroy;
begin
  ListChild.Free;
  inherited;
end;

procedure TOpisEdit.SetFilterDataSet(const Value: String);
begin
  FFilterDataSet := Value;
end;

initialization
  GlobalListOpis:=nil;
  SetLength(ArrFilter,0);
finalization
  GlobalListOpis:=nil;
  SetLength(ArrFilter,0);
end.
