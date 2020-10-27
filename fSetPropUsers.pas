unit fSetPropUsers;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fSimpleDialog, StdCtrls, Buttons, ExtCtrls, DB, kbmMemTable,
  Grids, DBGridEh, adscnnct, adsdata, adsfunc, adstable;

type
  TfmSetPropUsers = class(TfmSimpleDialog)
    Grid: TDBGridEh;
    DataSource: TDataSource;
    PropUsers: TkbmMemTable;
    PropUsersUSER_NAME: TStringField;
    PropUsersGISRN_ETSP: TIntegerField;
    Conn: TAdsConnection;
    WorkQuery: TAdsQuery;
    PropUsersAVEST_PUBKEY: TStringField;
    btLink: TSpeedButton;
    btDelLink: TSpeedButton;
    procedure GridColEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Column: TColumnEh;      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btLinkClick(Sender: TObject);
    procedure btDelLinkClick(Sender: TObject);
  private
    { Private declarations }
    FDef:Integer;
  public
    { Public declarations }
    procedure Load(sUser:String);
    procedure Save;
    function SaveOneRecord:Boolean;
  end;

  function EditPropUsers:Boolean;
  function SetPropertyUser(sUser:String; sProp:String; sValue:String):Boolean;
  function GetPropertyUser(sUser:String; sProp:String; sDef:String):String;

const
  PROP_USER_PUBKEY='AVEST_PUBKEY';
  PROP_USER_TYPEETSP='GISRN_ETSP';

implementation

uses dBase, uProjectAll, uTypes, FuncPr, uAvest;

{$R *.dfm}

//--------------------------------------------------
function GetPropertyUser(sUser:String; sProp:String; sDef:String):String;
var
  s:String;
  arr:TArrStrings;
  i,n:Integer;
begin
//  dmBase.WorkQuery.DatabaseName := dmBase.AdsConnection.Name;
  if MySameText(sUser,'ADSSYS') then begin
    Result:=sDef;
  end else begin
    Result:=sDef;
    dmBase.WorkQuery.Active := false;
    dmBase.WorkQuery.SQL.text := 'SELECT * FROM '+SysQuery('System.Users')+' WHERE NAME='+QStr(sUser);
    dmBase.WorkQuery.Active := true;
    s:=dmBase.WorkQuery.FieldByName('USER_DEFINED_PROP').AsString;
    dmBase.WorkQuery.Active := false;
    if s<>'' then begin
      StrToArr(s,arr,';',true);
      for i:=Low(arr) to High(arr) do begin
        n:=Pos('=', arr[i]);
        if MySameText(Copy(arr[i],1,n-1),sProp) then begin
          Result:=Copy(arr[i],n+1,1);
        end;
      end;
    end;
  end;
end;
//--------------------------------------------------
function SetPropertyUser(sUser:String; sProp:String; sValue:String):Boolean;
var
  f:TfmSetPropUsers;
begin
  Result:=false;
  if MySametext(sUser,'ADSSYS')
    then exit;
  f:=TfmSetPropUsers.Create(nil);
  f.Load(sUser);
  f.PropUsers.Edit;
  f.PropUsers.FieldByName(sProp).AsString:=sValue;
  f.PropUsers.Post;
  if f.SaveOneRecord
    then Result:=true;
  if f.Conn.IsConnected
    then f.Conn.IsConnected:=false;;
  f.Free;
end;
//--------------------------------------------------
function EditPropUsers:Boolean;
var
  f:TfmSetPropUsers;
begin
  Result:=false;
  f:=TfmSetPropUsers.Create(nil);
  f.Load('');
  if f.ShowModal=mrOk then begin
    f.Save;
    Result:=true;
    ShowMessage('Измененные параметры вступят в силу после перезапуска программы.');
  end;
  if f.Conn.IsConnected
    then f.Conn.IsConnected:=false;;
  f.Free;
end;
//--------------------------------------------------
procedure TfmSetPropUsers.Load(sUser:String);
var
  arr:TArrStrings;
  i,n:Integer;
  s,sAdd:String;                    
begin
  WorkQuery.Active := false;
  if sUser<>''
    then sAdd:=' WHERE name='+QStr(sUser)
    else sAdd:=' ORDER BY NAME';
  WorkQuery.SQL.text := 'SELECT * FROM '+SysQuery('System.Users')+sAdd;
  WorkQuery.Active := true;
  {$IFDEF DEFAULT_AVEST}
    FDef:=ETSP_AVEST;
  {$ELSE}
    FDef:=ETSP_NIITZI;
  {$ENDIF}
  while not WorkQuery.Eof do begin
    PropUsers.Append;
    PropUsersUSER_NAME.AsString:=WorkQuery.FieldByName('NAME').AsString;
    s:=WorkQuery.FieldByName('USER_DEFINED_PROP').AsString;
    PropUsersGISRN_ETSP.AsInteger:=FDef;
    if s<>'' then begin
      StrToArr(s,arr,';',true);
      for i:=Low(arr) to High(arr) do begin
        n:=Pos('=', arr[i]);
        if Copy(arr[i],1,n-1)=PROP_USER_TYPEETSP then begin
          PropUsersGISRN_ETSP.AsInteger:=StrToIntDef(Copy(arr[i],n+1,1),FDef);
        end else if Copy(arr[i],1,n-1)=PROP_USER_PUBKEY then begin
          PropUsersAVEST_PUBKEY.AsString:=Copy(arr[i],n+1,Length(arr[i]));
        end;
      end;
    end;
    PropUsers.Post;
    WorkQuery.Next;
  end;
  WorkQuery.Active := false;
  Grid.Col:=2;
  PropUsers.First;
  ActiveControl:=Grid;
end;

procedure TfmSetPropUsers.Save;
begin
  PropUsers.First;
  while not PropUsers.Eof do begin
    SaveOneRecord;
    PropUsers.Next;
  end;
  PropUsers.First;
end;

function TfmSetPropUsers.SaveOneRecord:Boolean;
var
  sProp,sSQL:String;
  n:Integer;
begin
  Result:=false;
  if PropUsersGISRN_ETSP.AsInteger=0
    then n:=FDef
    else n:=PropUsersGISRN_ETSP.AsInteger;
  sProp:=PROP_USER_TYPEETSP+'='+intToStr(n);
  if (PropUsersGISRN_ETSP.AsInteger=ETSP_AVEST) and (PropUsersAVEST_PUBKEY.AsString<>'')
    then sProp:=sProp+';'+PROP_USER_PUBKEY+'='+PropUsersAVEST_PUBKEY.AsString;
  try
    sSQL := Format('EXECUTE PROCEDURE sp_ModifyUserProperty(''%s'', ''USER_DEFINED_PROP'', ''%s'')',
                      [PropUsersUSER_NAME.AsString, sProp]);
    Conn.Execute(sSQL);
    Result:=true;
  except
    on E: Exception do begin
      PutError(E.Message);
    end;
  end;
end;

procedure TfmSetPropUsers.GridColEnter(Sender: TObject);
begin
  if Grid.Col=1 then  Grid.Col:=2;
end;

procedure TfmSetPropUsers.FormCreate(Sender: TObject);
begin
  Conn.AdsServerTypes := dmBase.AdsConnection.AdsServerTypes;
  Conn.ConnectPath := dmBase.AdsConnection.ConnectPath;
  Conn.UserName := SYSTEM_USER;
  Conn.Password := SYSTEM_PASSWORD;
  Conn.IsConnected:=true;
  if not PropUsers.Active
    then PropUsers.Active:=true;
end;

procedure TfmSetPropUsers.GridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (PropUsersGISRN_ETSP.AsInteger=ETSP_AVEST) and (Column.FieldName='USER_NAME') and (PropUsersAVEST_PUBKEY.AsString<>'') then begin
    AFont.Style:=AFont.Style+[fsBold];
  end;
end;

procedure TfmSetPropUsers.btLinkClick(Sender: TObject);
var
  sKey,ss:ANSIString;
  n:DWORD;
begin
  if PropUsersGISRN_ETSP.AsInteger=ETSP_AVEST then begin
    if (Avest<>nil) and Avest.IsActive then begin
      ss:='+';
      n:=Avest.ChoicePublicKey(sKey,ss);
      if n=0 then begin
        if Problem('Привязать пользователя "'+PropUsersUSER_NAME.AsString+'" к сертификату:'#13#10+ss) then begin
          PropUsers.Edit;
          PropUsersAVEST_PUBKEY.AsString:=sKey;
          PropUsers.Post;
        end;
      end else begin
        PutError(Avest.ErrorInfo(n));
      end;
    end else begin
      PutError(PadCStr('Авест не загружен',40,' '));
    end;
  end else begin
    PutError(PadCStr('Неверный ти ЭЦП',40,' '));
  end;
end;

procedure TfmSetPropUsers.btDelLinkClick(Sender: TObject);
begin
  if PropUsersGISRN_ETSP.AsInteger=ETSP_AVEST then begin
    if Problem('Удалить привязку пользователя "'+PropUsersUSER_NAME.AsString+'" к сертификату ?') then begin
      PropUsers.Edit;
      PropUsersAVEST_PUBKEY.AsString:='';
      PropUsers.Post;
    end;
  end else begin
    PutError(PadCStr('Неверный ти ЭЦП',40,' '));
  end;
end;

end.
