unit mPermit;
interface
uses
  Windows, Messages, SysUtils, adscnnct, adstable, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, kbmMemTable, Grids, adsdictionary,
  DBGridEh, FuncPr, DbFunc, IniFiles, adsdata, adsfunc, variants,
  TB2Toolbar,TB2Item,ActnList;

type

   //типы доступа к подсистемам
   TPermitType=(
      //полный доступ
      ptFull,
      //только чтение
      ptOnlyRead,
      //доступ запрещен
      ptDeniedAccess,
      //код подсистемы не найден в списке подсистем
      ptSubSystemNotFound,
      //пользователь не найден в списке пользователей
      ptUserNotFound
   );

   TPermit=class(TObject)
   private
      FConnect: TAdsConnection;
      //таблица прав доступа пользователей к подсистемам
      FPermitTable: TAdsTable;
      //текущий пользователь
      FCurrentUser: string;
      //список кодов подсистем
      FCodeList: TStringList;
      //список наименований подсистем
      FNameList: TStringList;
      //список пользователей
      FUserList:  TStringList;
      //список классов связанных с подсистемой
      FClassList: TStringList;
      //список акций связанных с подсистемой
      FActionList: TStringList;
      //тип доступа по умолчанию для нового пользователя
      //(по умолчанию DefaultUserPermit=ptOnlyRead)
      FDefaultUserPermit: TPermitType;
      //тип доступа по умолчанию для новой подсистемы
      //(по умолчанию DefaultSubSystemPermit=ptOnlyRead)
      FDefaultSubSystemPermit: TPermitType;
      FTableActions : TkbmMemTable;
      FAdminClasses:String;
      FAdminActions:String;
      FAdminCode:Integer;
      FAdminName:String;
      FSysAdminClasses:String;
      FSysAdminActions:String;
      FSysAdminCode:Integer;
      FSysAdminName:String;
   private
      procedure Load(MemTable: TkbmMemTable);
      procedure AddSS(Code: Integer; Name:String; var strTypeObjects, strActions: String);
   public
      ADS10:Boolean;
      constructor Create;
      destructor Destroy; override;
      //
      procedure Init(Connect: TAdsConnection; PermitTable: TAdsTable; CurrentUser: String; tbAct:TkbmMemTable);
      procedure AddSubSystem(Code: Integer; Name: string; strTypeObjects,strActions  : String);
      procedure AddAdminSubSystem(Code: Integer; Name: string; strTypeObjects,strActions  : String);
      procedure AddSysDBASubSystem(Code: Integer; Name: string; strTypeObjects,strActions  : String);
      function CheckSubSystem(Code: Integer): TPermitType;
      function Count:Integer;
      function GetName(i:Integer):String;
      function GetCode(i:Integer):Integer;
      procedure Edit;
      procedure Save(MemTable: TkbmMemTable);
      procedure QueryUsers;
   public
      property DefaultUserPermit: TPermitType read FDefaultUserPermit write FDefaultUserPermit;
      property DefaultSubSystemPermit: TPermitType read FDefaultSubSystemPermit write FDefaultSubSystemPermit;
   end;

//-------------------------------------------------------------
  TRoleStatus = (rsAdmin, rsMainUser, rsUser, rsOnlyRead);
  TTypeOper   = (toAdd, toDel, toCorrect, toDesignReport, toConfig,
                 toOnlyUserDok, toRunProcess, toEditScript);
  TTypeOpers  = set of TTypeOper;

  TRole = class(TObject)
  private
    FStatus: TRoleStatus;
    FEnabledOper : TTypeOpers;
    FUser: String;
    FUserGIS: String;
    FSystemAdmin: Boolean;
    FIsCheckSubSystem: Boolean;
    procedure SetStatus(const Value: TRoleStatus);
    procedure SetUser(const Value: String);
    procedure SetSystemAdmin(const Value: Boolean);
    procedure SetUserGIS(const Value: String);
    procedure SetIsCheckSubSystem(const Value: Boolean);
  public
    Permit : TPermit;
    function Enabled( Oper : TTypeOper ) : Boolean;   // доступна или нет операция
    property IsCheckSubSystem : Boolean read FIsCheckSubSystem write SetIsCheckSubSystem;   //
    property Status : TRoleStatus read FStatus write SetStatus;
    property User : String read FUser write SetUser;
    property UserGIS : String read FUserGIS write SetUserGIS;
    property SystemAdmin : Boolean read FSystemAdmin write SetSystemAdmin;

    // доступна или нет таблица для корректировки (nType =0-перед.имя таблицы =1-перед.имя dataset)

    //-1 - не определено, 0 - не разрешено, 1 - разрешено
    function EnableEdit(nTypeObj:Integer; strName: String; nAdd: Integer): Integer;
    function EnableEditTable(strName:String; nType:Integer):Integer;
    function EnableEditForm(strName:String; strSubType:String):Integer;
    function EnableMenu(strName:String): TPermitType;

    function CheckSubSystem(Code: Integer): TPermitType;
    function CheckClass(Sender : TObject) : TPermitType;
    procedure CheckActions(ActionList : TActionList);
    procedure CheckToolBar(tb : TTBToolBar);
    constructor Create;
    destructor Destroy; override;
  end;

//-------------------------------------------------------------
Const
  ADMIN: String='АДМИНИСТРАТОР';
  SYSADMIN: String='ADSSYS';

  SST_ACTION  = '1';  //Акции
  SST_MENU    = '2';  //Меню
  SST_TABLE   = '3';  //Таблицы
  SST_FORM    = '4';  //Формы

var
  Role : TRole;

implementation

uses fPermit2{, uProject};

{ TPermit }


procedure TPermit.AddSS(Code: Integer; Name:String; var strTypeObjects, strActions: String);
begin
  FTableActions.Filter:='TypeObj='+SST_ACTION+' and SubSystem='+IntToStr(Code);
  FTableActions.Filtered:=true;
  strActions:='';
  while not FTableActions.Eof do begin
    if FTableActions.FieldByName('KOD').AsString<>'' then begin
      strActions:=strActions+FTableActions.FieldByName('KOD').AsString+',';
    end;
    FTableActions.Next;
  end;
  FTableActions.Filtered:=false;
  FTableActions.Filter:='TypeObj='+SST_FORM+' and SubSystem='+IntToStr(Code);
  FTableActions.Filtered:=true;
  strTypeObjects:='';
  while not FTableActions.Eof do begin
    if FTableActions.FieldByName('KOD').AsString<>'' then begin
      strTypeObjects := strTypeObjects + FTableActions.FieldByName('KOD').AsString + ',';
    end;
    FTableActions.Next;
  end;
  FTableActions.Filter:='';
  FTableActions.Filtered:=false;
end;

procedure TPermit.AddAdminSubSystem(Code: Integer; Name, strTypeObjects, strActions: String);
begin
  if (strActions='*') and (FTableActions<>nil) then begin
    AddSS(Code, Name, strTypeObjects, strActions);
  end;
  FAdminClasses:=UpperCase(strTypeObjects);
  FAdminActions:=UpperCase(strActions);
  FAdminCode:=Code;
  FAdminName:=Name;
end;

procedure TPermit.AddSysDBASubSystem(Code: Integer; Name, strTypeObjects, strActions: String);
begin
  if (strActions='*') and (FTableActions<>nil) then begin
    AddSS(Code, Name, strTypeObjects, strActions);
  end;
  FSysAdminClasses:=UpperCase(strTypeObjects);
  FSysAdminActions:=UpperCase(strActions);
  FSysAdminCode:=Code;
  FSysAdminName:=Name;
end;

procedure TPermit.AddSubSystem(Code: Integer; Name: string; strTypeObjects,strActions : String);
begin
  if FCodeList.IndexOf(IntToStr(Code))= -1 then begin
    FCodeList.Add(IntToStr(Code));
    FNameList.Add(Name);
    if (strActions='*') and (FTableActions<>nil) then begin
      AddSS(Code, Name, strTypeObjects, strActions);
    end;
    FActionList.Add(UpperCase(strActions));
    FClassList.Add(UpperCase(strTypeObjects));
  end;
end;

procedure TPermit.Load(MemTable: TkbmMemTable);
Var
  i, k: Integer;
begin
//заполнить таблицу пользователями и подсистемами
// в зависимости от существования их прав, показывать их
  if not FPermitTable.Active
    then FPermitTable.Open;
//--  if FPermitTable.AdsIsTableLocked then
//--    showmessage('Таблица занята другим приложением')
//--  else
//--  begin
    MemTable.EmptyTable;
    MemTable.Open;                                 

      for i:=0 to FUserList.Count-1 do begin
//фильтруем АДМИНИСТРАТОРА
        if FUserList[i] <> ADMIN then
          for k:=0 to FCodeList.Count-1 do begin
            MemTable.Append;
            MemTable.FieldByName('NAMEUSER').AsString:= FUserList[i];
            MemTable.FieldByName('SUBSYSTEM').AsInteger:= StrToInt(FCodeList[k]);

// если такие пользователь и подсистема существовали ранее, то считать их права из базы
            if FPermitTable.Locate('NAMEUSER;SUBSYSTEM',VarArrayOf([FUserList[i],FCodeList[k]]),[]) then begin
              MemTable.FieldByName('ENABLE_VIEW').AsBoolean:= FPermitTable.FieldByName('ENABLE_VIEW').AsBoolean;
              MemTable.FieldByName('ENABLE_EDIT').AsBoolean:= FPermitTable.FieldByName('ENABLE_EDIT').AsBoolean;
            end
              else
                begin
                  MemTable.FieldByName('ENABLE_VIEW').AsBoolean:= false;
                  MemTable.FieldByName('ENABLE_EDIT').AsBoolean:= false;
                end;
            MemTable.Post;
          end;
      end;
//--  end;
end;

function TPermit.CheckSubSystem(Code: Integer): TPermitType;
begin
  if (FCurrentUser=ADMIN) or (FCurrentUser=SYSADMIN) then begin //если пользователь АДМИНИСТРАТОР
    Result:=ptFull;
    exit;
  end;
  if (Code=FAdminCode) or (Code=FAdminCode) then begin
    Result:=ptDeniedAccess;
    exit;               
  end;
  // проверить уровень доступа текущего пользователя к подсистеме Code
  if not FPermitTable.Active
    then FPermitTable.Open;
  if FUserList.IndexOf(FCurrentUser)=-1 then begin // проверить наличие проверяемого пользователя
    Result:=ptUserNotFound
  end else begin
    if FCodeList.IndexOf(IntToStr(Code))=-1 then begin // проверить наличие проверяемой подсистемы
      Result:=ptSubSystemNotFound;
    end else begin
      // если дошли сюда, значит ищем пользователя с подсистемой
      if FPermitTable.Locate('NAMEUSER;SUBSYSTEM',VarArrayOf([FCurrentUser,Code]),[]) then begin
        if FPermitTable.FieldByName('ENABLE_EDIT').AsBoolean then begin
          Result:=ptFull;
        end else begin
          if FPermitTable.FieldByName('ENABLE_VIEW').AsBoolean
            then Result:=ptOnlyRead
            else Result:=ptDeniedAccess;
        end;
      end else begin
        if FPermitTable.Locate('NAMEUSER',VarArrayOf([FCurrentUser]),[]) then begin
          Result:=DefaultUserPermit;      //  если есть пользователь в системной таблице и нет в списке прав
        end else begin
          Result:=DefaultSubSystemPermit; //  если нет подсистемы в списке прав и она добавлена на форму
        end;
      end;
    end;
  end;
end;

constructor TPermit.Create;
begin
  FAdminActions:='';
  FSysAdminActions:='';

  FCodeList:=TStringList.Create;
  FNameList:=TStringList.Create;
  FUserList:=TStringList.Create;
  FClassList:=TStringList.Create;
  FActionList:=TStringList.Create;
  FDefaultUserPermit:=ptFull;
  FDefaultSubSystemPermit:=ptFull;
end;

destructor TPermit.Destroy;
begin
  FCodeList.Free;
  FNameList.Free;
  FUserList.Free;
  FClassList.Free;
  FActionList.Free;
   inherited;
end;

//  выполняем выборку всех пользователей
procedure TPermit.QueryUsers;
Var
  QueryWork: TAdsQuery;
begin
  QueryWork := TAdsQuery.Create(nil);
  try
    QueryWork.AdsConnection:=FConnect;
    QueryWork.SQL.Text := 'SELECT NAME FROM '+CheckSysView('SYSTEM.USERS',ADS10);
    QueryWork.Active:=True;
    FUserList.Clear;
    while not QueryWork.Eof do begin
      FUserList.Add(QueryWork.FieldByName('NAME').AsString);
      QueryWork.Next;
    end;
  finally
    QueryWork.Active:=false;
    QueryWork.AdsCloseSQLStatement;
    QueryWork.Free;
  end;
end;

procedure TPermit.Edit;
begin
   with TfmPermit2.Create(nil) do begin
      try
         Load(ListP);
         Grid.Columns[0].KeyList.Assign(FCodeList);
         Grid.Columns[0].PickList.Assign(FNameList);
         lbUser.Items.Assign(FUserList);
//удалить АДМИНИСТРАТОРа из формы-
         if lbUser.Items.IndexOf(ADMIN) <> -1 then
           lbUser.Items.Delete(lbUser.Items.IndexOf(ADMIN));
//список пользователей не пустой
         if lbUser.Items.Count > 0 then begin
           lbUser.ItemIndex:=0;
           lbUserClick(nil);
         end;

         if ShowModal=mrOk then begin
            //сохранение
            Save(ListP);
         end;
      finally
         Free;
      end;
   end;
end;

procedure TPermit.Save(MemTable: TkbmMemTable);
var
  j: integer;
begin
  MemTable.DisableControls;
  try
    MemTable.CheckBrowseMode;
    MemTable.Filtered:=false;
    MemTable.First;
    // удаляем без использования эксклюзивного режима
    if not FPermitTable.Active then FPermitTable.Open;
    FPermitTable.First;
    while not FPermitTable.Eof do FPermitTable.Delete;
    for j:=0 to MemTable.RecordCount-1 do begin
      FPermitTable.Append;
      FPermitTable.FieldByName('NAMEUSER').AsString     := MemTable.FieldByName('NAMEUSER').AsString;
      FPermitTable.FieldByName('SUBSYSTEM').AsInteger   := MemTable.FieldByName('SUBSYSTEM').AsInteger;
      FPermitTable.FieldByName('ENABLE_VIEW').AsBoolean := MemTable.FieldByName('ENABLE_VIEW').AsBoolean;
      FPermitTable.FieldByName('ENABLE_EDIT').AsBoolean := MemTable.FieldByName('ENABLE_EDIT').AsBoolean;
      FPermitTable.Post;
      MemTable.Next;
    end;
  finally
    MemTable.Filtered:=true;
    MemTable.EnableControls;
  end;
end;

procedure TPermit.Init(Connect: TAdsConnection; PermitTable: TAdsTable; CurrentUser: string; tbAct:TkbmMemTable);
begin
  FConnect:=Connect;
  FPermitTable:=PermitTable;
  if Copy(FPermitTable.Version,1,1)='8'
    then ADS10:=false
    else ADS10:=true;
  FCurrentUser:=CurrentUser;
  FTableActions:=tbAct;
  QueryUsers;
end;

function TPermit.Count: Integer;
begin
  Result:=FNameList.Count;
end;

function TPermit.GetCode(i: Integer): Integer;
begin
  Result:=StrToInt(FCodeList.Strings[i]);
end;

function TPermit.GetName(i: Integer): String;
begin
  Result:=FNameList.Strings[i];
end;

{ TRole }

constructor TRole.Create;
begin
  FStatus:=rsAdmin;
  FUserGIS:='';
  FSystemAdmin := false;
  FIsCheckSubSystem:=true;
  Permit := TPermit.Create;
end;

destructor TRole.Destroy;
begin
  Permit.Free;
  inherited;
end;

function TRole.CheckClass(Sender: TObject) : TPermitType;
begin
  Result:=ptFull;
end;

procedure TRole.CheckActions(ActionList : TActionList);
var
  i,Code,nResult,n,nSS : Integer;
  strActions, strEnabledActions,strName : String;
  pt:TPermitType;
//  n1,n2:Integer;
  oldInd:String;
begin        
  if not IsCheckSubSystem then exit;
  //-- для администраторов доступно все --
  if (Status=rsAdmin) or SystemAdmin
    then exit;
//  n1:=GetTickCount;
                                            
  for i:=0 to ActionList.ActionCount-1 do begin
    oldInd:=Permit.FTableActions.IndexFieldNames;
    Permit.FTableActions.IndexFieldNames:='TYPEOBJ;KOD';
    Permit.FTableActions.SetRange([SST_ACTION,ActionList.Actions[i].Name],[SST_ACTION,ActionList.Actions[i].Name]);
    nResult:=-1;
    while not Permit.FTableActions.Eof do begin
      nSS:=Permit.FTableActions.FieldByName('SUBSYSTEM').AsInteger;
      if (nSS=Permit.FAdminCode) or (nSS=Permit.FSysAdminCode)
        then pt:=ptDeniedAccess
        else pt:=CheckSubSystem(nSS);
      n:=-1;
      case pt of
       ptDeniedAccess : n:=0;
       ptOnlyRead     : n:=1;
       ptFull         : n:=2;
      end;
      if n>nResult then begin
        nResult:=n;
      end;                                      
      Permit.FTableActions.Next;
    end;
    Permit.FTableActions.CancelRange;
    Permit.FTableActions.IndexFieldNames:=oldInd;
    if (nResult=0) or ((nResult=1) and (Permit.FTableActions.FieldByName('NEW').AsBoolean=true))
      then TAction(ActionList.Actions[i]).Visible := false;
  end;

//  n2:=GetTickCount;
//  ShowMessage(IntToStr(n2-n1));


  {
  strActions:=Permit.FAdminActions+',';    // все названия акций которые нужно отключить
  strEnabledActions:='';
  for i:=0 to Permit.FActionList.Count-1 do begin
    if Permit.FActionList.Strings[i]<>'' then begin
      Code:=StrToInt(Permit.FCodeList.Strings[i]);
      pt:=Permit.CheckSubSystem(Code);
//      ptFull, ptOnlyRead, ptDeniedAccess, ptSubSystemNotFound, ptUserNotFound
      if pt=ptDeniedAccess then begin  // доступ запрещен
        strActions:=strActions+Permit.FActionList.Strings[i]+',';
      end else if (pt=ptFull) or (pt=ptOnlyRead) then begin
        // если одна акция участвует в нескольких подсистемах и в одной из них она доступна
        strEnabledActions:=strEnabledActions+Permit.FActionList.Strings[i]+',';
      end;
    end;
  end;
  if strActions<>'' then begin
    for i:=0 to ActionList.ActionCount-1 do begin
      strName:=UpperCase(ActionList.Actions[i].Name);
      if Pos(strName+',', strActions) > 0 then begin
        // а вдруг она разрешена ?
        if Pos(strName+',', strEnabledActions)=0 then begin
          TAction(ActionList.Actions[i]).Visible := false;
        end else begin
        end;
      end;
    end;
  end;
  }
end;

//-------------------------------------------------------------------
procedure TRole.CheckToolBar(tb : TTBToolBar);
var
  i,j,n,Code : Integer;
  strActions, strEnabledActions : String;
  pt:TPermitType;
  sub,sub1:TTbSubMenuItem;
begin
  if not IsCheckSubSystem then exit;
  //-- для администраторов доступно все --
  if (Status=rsAdmin) or SystemAdmin
    then exit;
  strActions:=Permit.FAdminClasses+',';            // все названия пунктов меню которые нужно отключить
  strEnabledActions:='';
  for i:=0 to Permit.FClassList.Count-1 do begin
    if Permit.FClassList.Strings[i]<>'' then begin
      Code:=StrToInt(Permit.FCodeList.Strings[i]);
      pt:=Permit.CheckSubSystem(Code);
//      ptFull, ptOnlyRead, ptDeniedAccess, ptSubSystemNotFound, ptUserNotFound
      if pt=ptDeniedAccess then begin  // доступ запрещен
        strActions:=strActions+Permit.FClassList.Strings[i]+',';
      end else if (pt=ptFull) or (pt=ptOnlyRead) then begin
        // если одна акция участвует в нескольких подсистемах и в одной из них она доступна
        strEnabledActions:=strEnabledActions+Permit.FClassList.Strings[i]+',';
      end;
    end;
  end;
  if strActions<>'' then begin
    for i:=0 to tb.Items.Count-1 do begin
      if Pos(UpperCase(tb.Items[i].Name)+',', strActions) > 0 then begin
        // а вдруг она разрешена ?
        if Pos(UpperCase(tb.Items[i].Name)+',', strEnabledActions)=0 then begin
          tb.Items[i].Visible := false;
        end;
      end;
      if tb.Items[i] is TTbSubMenuItem then begin
        sub:= TTbSubMenuItem(tb.Items[i]);
        if sub.Count>0 then begin
          for j:=0 to sub.Count-1 do begin
            if Pos(UpperCase(sub.Items[j].Name)+',', strActions) > 0 then begin
              // а вдруг она разрешена ?
              if Pos(UpperCase(sub.Items[j].Name)+',', strEnabledActions)=0 then begin
                sub.Items[j].Visible := false;
              end;
            end;
            if sub.Items[j] is TTbSubMenuItem then begin
              sub1:= TTbSubMenuItem(sub.Items[j]);
              if sub1.Count>0 then begin
                for n:=0 to sub1.Count-1 do begin
                  if Pos(UpperCase(sub1.Items[n].Name)+',', strActions) > 0 then begin
                    // а вдруг она разрешена ?
                    if Pos(UpperCase(sub1.Items[n].Name)+',', strEnabledActions)=0 then begin
                      sub1.Items[n].Visible := false;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

//--------------------------------------------------------------------------
//-1 - не определено, 0 - не разрешено, 1 - разрешено
function TRole.EnableEdit(nTypeObj:Integer; strName: String; nAdd: Integer): Integer;
var
  pt:TPermitType;
  n:Integer;
  fld:TField;
  oldInd:String;
begin
  Result:=1;

  if not IsCheckSubSystem then exit;
  if (Status=rsAdmin) or SystemAdmin then exit;

  if Status=rsOnlyRead then begin
    Result:=0;
    exit;
  end;
                      
  Result:=-1;
  oldInd:=Permit.FTableActions.IndexFieldNames;
  Permit.FTableActions.IndexFieldNames:='TYPEOBJ;KOD';
  Permit.FTableActions.SetRange([nTypeObj,strName],[nTypeObj,strName]);
//  Permit.FTableActions.Filter:='TypeObj='+IntToStr(nTypeObj);
//  Permit.FTableActions.Filtered:=true;
  fld:=Permit.FTableActions.FindField('KOD');
  strName:=ANSIUpperCase(strName);
  while not Permit.FTableActions.Eof do begin
    if strName=ANSIUpperCase(fld.AsString) then begin
      pt:=CheckSubSystem(Permit.FTableActions.FieldByName('SUBSYSTEM').AsInteger);
      n:=-1;
      if (pt=ptUserNotFound) or (pt=ptSubSystemNotFound) then begin
        n:=-1;
      end else if (pt=ptOnlyRead) or (pt=ptDeniedAccess) then begin
        n:=0;
      end else if (pt=ptFull) then begin
        n:=1;
      end;
      if n>Result then begin
        Result:=n;
      end;
    end;
    Permit.FTableActions.Next;
  end;
//  Permit.FTableActions.Filter:='';
//  Permit.FTableActions.Filtered:=false;
  Permit.FTableActions.CancelRange;
  Permit.FTableActions.IndexFieldNames:=oldInd;
end;

//--------------------------------------------------------------------------
//-1 - не определено, 0 - не разрешено, 1 - разрешено
function TRole.EnableEditTable(strName: String; nType: Integer): Integer;
begin
  Result:=EnableEdit(StrToInt(SST_TABLE),strName,nType);
end;

//--------------------------------------------------------------------------
function TRole.EnableEditForm(strName: String; strSubType:String): Integer;
begin
  if strSubType=''
    then Result:=EnableEdit(StrToInt(SST_FORM),strName,0)
    else Result:=EnableEdit(StrToInt(SST_FORM),strName+'_'+strSubType,0);
end;

//--------------------------------------------------------------------------
function TRole.EnableMenu(strName: String): TPermitType;
var
  n:Integer;
  fld:TField;
  oldInd:String;
begin
  Result:=ptFull;

  if not IsCheckSubSystem or (Status=rsAdmin) or SystemAdmin
    then exit;

  oldInd:=Permit.FTableActions.IndexFieldNames;
  Permit.FTableActions.IndexFieldNames:='TYPEOBJ;KOD';
  Permit.FTableActions.SetRange([SST_MENU,strName],[SST_MENU,strName]);
  fld:=Permit.FTableActions.FindField('KOD');
  strName:=ANSIUpperCase(strName);
  while not Permit.FTableActions.Eof do begin
    if strName=ANSIUpperCase(fld.AsString) then begin
      Result:=CheckSubSystem(Permit.FTableActions.FieldByName('SUBSYSTEM').AsInteger);
      if (Result=ptUserNotFound) or (Result=ptSubSystemNotFound) then begin
        Result:=ptDeniedAccess;
      end;
    end;
    Permit.FTableActions.Next;
  end;
  Permit.FTableActions.CancelRange;
  Permit.FTableActions.IndexFieldNames:=oldInd;
end;

// на выходе только три значения: ptFull,ptOnlyRead,ptDeniedAccess
function TRole.CheckSubSystem(Code: Integer): TPermitType;
begin         
  if IsCheckSubSystem then begin
    if (Status=rsAdmin) or SystemAdmin then begin
      Result := ptFull;
    end else begin
      Result := Permit.CheckSubSystem(Code);
      // для гостя либо доступ запрещен либо только чтение
      if (User='ГОСТЬ') then begin
        if (Result=ptOnlyRead) or (Result=ptDeniedAccess) then begin

        end else begin
          Result:=ptOnlyRead;
        end;
      end else begin
        if (Result=ptUserNotFound) or (Result=ptSubSystemNotFound) then begin
          Result:=ptFull;
        end;
      end;
    end;
  end else begin
    if (User='ГОСТЬ') then begin
      Result:=ptOnlyRead;
    end else begin
      Result := ptFull;
    end;
  end;
end;

function TRole.Enabled(Oper: TTypeOper): Boolean;
begin
//  Result:=false;
//  exit;
  if Status = rsAdmin then begin
    Result:=true;
  end else begin
    if Oper in FEnabledOper then begin
      Result := true;
    end else begin
      Result := false;
    end;
  end;
end;

procedure TRole.SetStatus(const Value: TRoleStatus);
begin
  FStatus := Value;
  FEnabledOper:=[];
  case FStatus of
    rsMainUser: begin
                  FEnabledOper := FEnabledOper + [toRunProcess];
                end;

  end
end;

procedure TRole.SetSystemAdmin(const Value: Boolean);
begin
  FSystemAdmin := Value;
end;
          
procedure TRole.SetUser(const Value: String);
begin
  FUser := Value;
end;

procedure TRole.SetIsCheckSubSystem(const Value: Boolean);
begin
  FIsCheckSubSystem := Value;
end;

//    FCodeList.Add(IntToStr(Code));
//    FNameList.Add(Name);

procedure TRole.SetUserGIS(const Value: String);
begin
  FUserGIS:=Value;
end;

initialization
  Role := TRole.Create;
finalization
  Role.Free;
end.



