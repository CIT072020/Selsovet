unit fSetPassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uProject, uProjectAll,
  StdCtrls, Mask, DBCtrlsEh, dBase, FuncPr, fSimpleDialog, Buttons, adsdata, VAriants,
  adscnnct;

type
  TfmSetPassword = class(TForm)
    GroupBox1: TGroupBox;
    lbUser: TListBox;
    btChange: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edPsw1: TDBEditEh;
    edPsw2: TDBEditEh;
    btClear: TButton;
    btAddUser: TBitBtn;
    btDelUser: TBitBtn;
    btExit: TBitBtn;
    Conn: TAdsConnection;
    procedure btChangeClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure btAddUserClick(Sender: TObject);
    procedure btDelUserClick(Sender: TObject);
    procedure lbUserKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Owner : TComponent); override;
    procedure UpdateActions; override;
    procedure OnAddUser(Sender:TObject);
  end;

var
  fmSetPassword: TfmSetPassword;

implementation

{$R *.DFM}

procedure TfmSetPassword.btChangeClick(Sender: TObject);
var
  strSQL : String;
begin
  try
    strSQL := Format('EXECUTE PROCEDURE sp_ModifyUserProperty(''%s'', ''USER_PASSWORD'', ''%s'')',
                      [lbUser.Items[lbUser.ItemIndex],edPsw1.Text]);
    Conn.Execute(strSQL);
//    dmBase.AdsConnection.Execute(strSQL);
  except
    on E: Exception do PutError(E.Message);
  end;
  edPsw1.Text := '';
  edPsw2.Text := '';
end;

procedure TfmSetPassword.btClearClick(Sender: TObject);
var
  strSQL : String;
begin
  if lbUser.ItemIndex>-1 then begin
    if lbUser.Items[lbUser.ItemIndex]='АДМИНИСТРАТОР' then begin
      PutError('Отменять пароль пользователя <АДМИНИСТРАТОР> запрещено.');
      exit;
    end;
    try
      strSQL := Format('EXECUTE PROCEDURE sp_ModifyUserProperty(''%s'', ''USER_PASSWORD'', '''')',
                        [lbUser.Items[lbUser.ItemIndex]]);
      Conn.Execute(strSQL);
      ShowMessage('Пароль отменен.')
    except
      on E: Exception do PutError(E.Message);
    end;
    edPsw1.Text := '';
    edPsw2.Text := '';
  end;
end;

constructor TfmSetPassword.Create(Owner: TComponent);
begin
  inherited;
  dmBase.WorkQuery.Active := false;
  dmBase.WorkQuery.DatabaseName := dmBase.AdsConnection.Name;
  dmBase.WorkQuery.SQL.text := 'SELECT * FROM '+SysQuery('System.Users')+' ORDER BY NAME';
  dmBase.WorkQuery.Active := true;
  while not dmBase.WorkQuery.Eof do begin
    lbUser.Items.Add( dmBase.WorkQuery.FieldByName('NAME').AsString );
    dmBase.WorkQuery.Next;
  end;
  dmBase.WorkQuery.Active := false;
  if lbUser.Items.Count > 0
    then lbUser.ItemIndex := 0;
end;

procedure TfmSetPassword.FormCreate(Sender: TObject);
begin
  Conn.AdsServerTypes := dmBase.AdsConnection.AdsServerTypes;
  Conn.ConnectPath := dmBase.AdsConnection.ConnectPath;
  Conn.UserName := SYSTEM_USER;
  Conn.Password := SYSTEM_PASSWORD;
  Conn.IsConnected:=true;
end;

procedure TfmSetPassword.UpdateActions;
begin
  inherited;
  btChange.Enabled := (lbUser.ItemIndex>-1) and (edPsw1.Text<>'') and
                      (edPsw1.Text=edPsw2.Text);
  btClear.Enabled := (lbUser.ItemIndex>-1) and (edPsw1.Text='') and
                      (edPsw1.Text=edPsw2.Text);
  edPsw1.Enabled := (lbUser.ItemIndex>-1);
  edPsw2.Enabled := (lbUser.ItemIndex>-1);
end;

procedure TfmSetPassword.btAddUserClick(Sender: TObject);
var
 ed : TDbEditEh;
 cb :TDBCheckBoxEh;
 nErrCode:Integer;
 strErr:String;
begin
  fmSimpleDialog:=TfmSimpleDialog.Create(nil);
  fmSimpleDialog.Height:=150;
  fmSimpleDialog.Width:=280;
  fmSimpleDialog.Caption:='Имя пользователя';
  fmSimpleDialog.btOk.Default:=true;
//  fmSimpleDialog.btOk.OnClick:=OnAddUser;
  ed := TDbEditEh.Create(fmSimpleDialog);
  with ed do begin
    Text:='';
    Parent:=fmSimpleDialog;
//    FontFromProp(Font);
    Name:='edUser';
    Top:=20;
    Left:=20;
    Width:=150;
    Flat:=false;
    CharCase:=ecUpperCase;
  end;
  cb := TDBCheckBoxEh.Create(fmSimpleDialog);
  with cb do begin
    Caption:='С правами администратора';
    Parent:=fmSimpleDialog;
//    FontFromProp(Font);
    Name:='cbAdmin';
    Top:=50;
    Left:=20;
    Width:=220;
    Flat:=false;
  end;
  fmSimpleDialog.ActiveControl:=ed;
  if fmSimpleDialog.ShowModal=mrOk then begin
    strErr:='';
    try
      Conn.Execute('EXECUTE PROCEDURE sp_CreateUser('+QStr(ed.Text)+',NULL,'+QStr('')+');');
      Conn.Execute('GRANT Alter ON ['+ed.Text+'] TO [АДМИНИСТРАТОР];');
//      GRANT Alter ON [NEW_USER] TO [АДМИНИСТРАТОР];
      if dmBase.ListP.Locate('NAMEUSER;SUBSYSTEM',VarArrayOf([ed.Text,SS_ADMIN]),[]) then begin
        dmBase.ListP.Edit;
      end else begin
        dmBase.ListP.Append;
        dmBase.ListP.FieldByName('NAMEUSER').AsString:=ed.Text;
        dmBase.ListP.FieldByName('SUBSYSTEM').AsInteger:=SS_ADMIN;
      end;
      dmBase.ListP.FieldByName('ENABLE_EDIT').AsBoolean:=cb.Checked;
      dmBase.ListP.Post;
    except
      on E:Exception do begin
        strErr := E.Message;
        nErrCode:=0;
        if ( E is EADSDatabaseError ) then begin
//          nErrCode := ( E as EADSDatabaseError ).ACEErrorCode;
          nErrCode := ( E as EADSDatabaseError ).SQLErrorCode;
        end;
        if nErrCode>0 then begin
          if nErrCode=5132 then begin
            strErr:='Неправильное имя пользователя.'
          end;
        end;
        PutError('ОШИБКА: '+strErr);
      end;
    end;
    if strErr='' then begin
      lbUser.AddItem(ed.Text,nil);
      lbUser.ItemIndex:=lbUser.Items.Count-1;
    end;
    ActiveControl:=lbUser;
  end;
  fmSimpleDialog.Free;
end;

procedure TfmSetPassword.btDelUserClick(Sender: TObject);
var
  strErr,strUser:String;
  nErrCode,n:Integer;
begin
  if lbUser.ItemIndex>-1 then begin
    strUser:=lbUser.Items[lbUser.ItemIndex];
    if strUser='АДМИНИСТРАТОР' then begin
      PutError('Удалять пользователя <АДМИНИСТРАТОР> запрещено.');
      exit;
    end;
    if strUser='ГОСТЬ' then begin
      PutError('Удалять пользователя <ГОСТЬ> запрещено.');
      exit;
    end;
    if Problem(' Удалить пользователя <'+strUser+'> ?') then begin
      nErrCode:=0;
      try
        Conn.Execute('EXECUTE PROCEDURE sp_DropUser('+QStr(strUser)+')');
        Conn.Execute('DELETE FROM ListP WHERE NAMEUSER='+QStr(strUser));
      except
        on E:Exception do begin
          strErr := E.Message;
          if ( E is EADSDatabaseError ) then begin
//            nErrCode := ( E as EADSDatabaseError ).ACEErrorCode;
            nErrCode := ( E as EADSDatabaseError ).SQLErrorCode;
          end;
          PutError('Ошибка удаления пользователя (код='+IntToStr(nErrCode)+')');
        end;
      end;
      if nErrCode=0 then begin
        n:=lbUser.ItemIndex;
        lbUser.DeleteSelected;
        if n>lbUser.Items.Count-1
          then lbUser.ItemIndex:=lbUser.Items.Count-1
          else lbUser.ItemIndex:=n;
      end;
    end;
  end;
end;

procedure TfmSetPassword.OnAddUser(Sender: TObject);
begin
//
end;

procedure TfmSetPassword.lbUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_INSERT then begin
    btAddUserClick(lbUser);
    Key:=0;
  end else if Key=VK_DELETE then begin
    btDelUserClick(lbUser);
    Key:=0;
  end;
end;


end.
