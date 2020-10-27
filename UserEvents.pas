unit UserEvents;

interface

uses Classes, SysUtils, Dialogs, TB2Item, TB2Dock, TB2Toolbar, Variants, uTypes,
     SasaIniFile;

{$I Task.inc}

type

  TEventDescriptor = record
    Name   : String;
    Func   : String;
    Vision : Boolean;
  end;
  TArrEvents = array of TEventDescriptor;

  TUserEvents = class(TObject)
  private
    FNameFile:String;
  public
    FUserEvents : TArrEvents;
    procedure SetFileName(sName:String);
    procedure OnRunEvent(Sender: TObject);
    function LoadEvents( strNameSect : String; SubMenu : TTbSubMenuItem) : Boolean;
    function LoadEvents2( strNameSect : String; SubMenu : TTbSubMenuItem; lClear : Boolean) : Boolean;
    function IsEnable(var sName:String):Boolean;
    constructor Create;
    destructor  Destroy; override;
  end;

//  procedure CreateUserEvents( strNameFile : String; SubMenu : TTbSubMenuItem);
var
  MainUserEvents : TUserEvents;

implementation

uses  FuncPr, MetaTask;

var
  IniFileEvents  : TSasaIniFile;

{
procedure CreateUserEvents( strNameFile : String; SubMenu : TTbSubMenuItem);
var
 it : TTbItem;
 a  : TArrStrings;
 sl : TStringList;
 i,j  : Integer;
begin
  sl := TStringList.Create;
  if FileExists(strNameFile) then begin
    sl.LoadFromFile(strNameFile);
  end;
  if sl.Count = 0 then begin
    SubMenu.Visible := false;
  end else begin
    SubMenu.Visible := true;
    Setlength(MainUserEvents.FUserEvents,0);
    j:=0;
    for i:=0 to sl.Count-1 do begin
      StrToArr(sl.Strings[i], a, '#', true);
      if Length(a)>1 then begin
        Inc(j);
        SetLength(MainUserEvents.FUserEvents,j);
        MainUserEvents.FUserEvents[j-1].Name:=a[0];
        MainUserEvents.FUserEvents[j-1].Func:=a[1];
        it := TTbItem.Create(SubMenu);
        it.Caption:=a[0];
        it.OnClick:=MainUserEvents.OnRunEvent;
        SubMenu.Add(it);
      end;
    end;
  end;
  sl.Free;
end;
}
{ TUserEvents }

constructor TUserEvents.Create;
begin
  FNameFile:='';
  SetLength(FUserEvents,0);
end;

destructor TUserEvents.Destroy;
begin
  SetLength(FUserEvents,0);
  inherited;
end;

function TUserEvents.LoadEvents( strNameSect: String; SubMenu : TTbSubMenuItem) : Boolean;
begin
  Result := LoadEvents2( strNameSect, SubMenu, true);
end;

//-------------------------------------------------------------------------
function TUserEvents.IsEnable(var sName:String):Boolean;
var
  i:Integer;
  s:String;
  v:Variant;
begin
  i:=Pos('~',sName);
  if i=0 then begin
    Result:=true;
  end else begin
    s:=Copy(sName,1,i-1);
    sName:=Copy(sName,i+1,Length(sName));
    {$IFDEF USE_SCRIPT}
      Result:=true;
      if GlobalTask.Script <> nil then begin
        v:=null;
        GlobalTask.Script.RunEx(s, [sName], v);
        if (v<>null)
          then Result:=v;
      end;
    {$ELSE}
      PutError(' Выполнение скриптов недоступно ! (IsEnable)');
    {$ENDIF}
  end;
end;

function TUserEvents.LoadEvents2(strNameSect: String; SubMenu: TTbSubMenuItem; lClear: Boolean): Boolean;
var
 it  : TTbItem;
 sep : TTbSeparatorItem;
// a  : TArrStrings;
 sl : TStringList;
 i,j,n,m,k  : Integer;
 SubMenuList : TStringList;
 sm, smMain : TTbSubMenuItem;
 strName,strSubMenu : String;
begin
  Result:=false;
//  if not Role.Enabled(toRunProcess) then begin
//    SubMenu.Visible := false;
//    exit;
//  end;
  if iniFileEvents=nil then begin
    if FNameFile='' then FNameFile:=NameFile_EVENTS;
    iniFileEvents := TSasaIniFile.Create(GlobalTask.PathService+FNameFile);
  end;
  smMain := SubMenu;
  SubMenuList := TStringList.Create;
  sl  := TStringList.Create;
  iniFileEvents.ReadSectionValues(strNameSect, sl);
  if lClear then begin
    SubMenu.Clear;
  end;
  if sl.Count = 0 then begin
//    SubMenu.Visible := false;
  end else begin
    Result:=true;
//    SubMenu.Visible := true;
    Setlength(FUserEvents,0);
    j:=0;
    for i:=0 to sl.Count-1 do begin
      SubMenu := smMain;
      n:=Pos('=',sl.Strings[i]);
      if n>0 then begin
        strName:=Trim(Copy(sl.Strings[i],1,n-1));
        if IsEnable(strName) then begin
          m := Pos('\', strName);
          if m > 0 then begin
            strSubMenu := Copy(strName,1,m-1);
            strName := Copy(strName,m+1,200);
            k := SubMenuList.IndexOf(strSubMenu);
            if k = -1 then begin
              sm := TTBSubMenuItem.Create(smMain);
              sm.ParentComponent := smMain;
              sm.Visible := true;
              sm.Caption := strSubMenu;
              smMain.Add(sm);
              SubMenuList.AddObject(strSubMenu, sm);
            end else begin
              sm := TTBSubMenuItem(SubMenuList.Objects[k]);
            end;
            SubMenu := sm;
          end;
          Inc(j);
          SetLength(FUserEvents,j);
          FUserEvents[j-1].Name:=strName;
          FUserEvents[j-1].Func:=ANSIUpperCase(Trim(Copy(sl.Strings[i],n+1,200)));
          it := TTbItem.Create(SubMenu);
          it.Caption:=FUserEvents[j-1].Name;
          it.OnClick:=OnRunEvent;
          SubMenu.Add(it);
        end;
      end else begin
        if Copy(sl.Strings[i],1,5)='-----' then begin
          sep := TTbSeparatorItem.Create(SubMenu);
          SubMenu.Add(sep);
        end;
      end;
    end;
  end;
  sl.Free;
  SubMenuList.Free;
  if SubMenu.Count=0
    then SubMenu.Visible := false
    else SubMenu.Visible := true;
end;

procedure TUserEvents.OnRunEvent(Sender: TObject);
var
  strName,strFunc : String;
  i : Integer;
  {$IFDEF USE_SCRIPT}
  v : Variant;
  {$ENDIF}
  lOk : Boolean;
begin
  lOk := false;
  strName := TTbItem(Sender).Caption;
  for i:=Low(FUserEvents) to High(FUserEvents) do begin
    if FUserEvents[i].Name=strName then begin
      strFunc := FUserEvents[i].Func;
      lOk:=true;
      break;
    end;
  end;
  {
  for i:=Low(MainUserEvents.FUserEvents) to High(MainUserEvents.FUserEvents) do begin
    if MainUserEvents.FUserEvents[i].Name=strName then begin
      strFunc := MainUserEvents.FUserEvents[i].Func;
      lOk:=true;
      break;
    end;
  end;    }
  if lOk then begin
    strFunc:=ANSIUpperCase(Trim(strFunc));
    {$IFDEF USE_SCRIPT}
      if GlobalTask.Script=nil then begin
        PutError('   Скрипт не создан !  ');
      end else begin
        GlobalTask.Script.RunEx(strFunc,[],v);
      end;
    {$ENDIF}
  end;
end;

procedure TUserEvents.SetFileName(sName: String);
begin
  if IniFileEvents<>nil then FreeAndNil(IniFileEvents);
  FNameFile:=sName;
end;

initialization
  MainUserEvents := TUserEvents.Create;
  IniFileEvents:=nil;
finalization
  FreeAndNil(MainUserEvents);
  if IniFileEvents<>nil then begin
    FreeAndNil(iniFileEvents);
  end;
end.
