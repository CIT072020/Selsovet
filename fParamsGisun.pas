unit fParamsGisun;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,fmChList, uProjectAll,
  StdCtrls, Buttons, DBCtrlsEh, Mask, IniFiles, FuncPr, MetaTask, ExtCtrls, fParamQuest,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, ShellAPI,
  IdException, IdAntiFreezeBase;

type                             
  TfmParamsGisun = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TCPClient: TIdTCPClient;
    pnOsn: TPanel;
    Panel2: TPanel;
    cbActive: TDBCheckBoxEh;
    cbTmpOff: TDBCheckBoxEh;
    cbUser: TDBCheckBoxEh;
    cbUserBase: TDBCheckBoxEh;
    edSource: TDBEditEh;
    cbETSP: TDBCheckBoxEh;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edZAGSUrl: TDBEditEh;
    edZAGSProxy: TDBEditEh;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edGisunUrl: TDBEditEh;
    edGisunProxy: TDBEditEh;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    edUrlUpdate: TDBEditEh;
    pnExt: TPanel;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edZAGSUrl1: TDBEditEh;
    edZAGSProxy1: TDBEditEh;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edGisunUrl1: TDBEditEh;
    edGisunProxy1: TDBEditEh;
    cbURLOtd: TDBCheckBoxEh;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cbCommonMessageSource: TDBCheckBoxEh;
    edTimeOut: TDBNumberEditEh;
    Label10: TLabel;
    Label11: TLabel;
    cbLog: TDBCheckBoxEh;
    cbCheckUSB: TDBCheckBoxEh;
    Bevel3: TBevel;
    cbCheckSpr: TDBCheckBoxEh;
    edTypeSource: TDBEditEh;
    cbRegFIO: TDBCheckBoxEh;
    cbRegAdres: TDBCheckBoxEh;
    cbAvestPIN: TDBCheckBoxEh;
    cbLoadFamSt: TDBCheckBoxEh;
    cbZaprosZah: TDBCheckBoxEh;
    lbLocal: TLabel;
    cbLocal2: TDBCheckBoxEh;
    cbAteGIS: TDBCheckBoxEh;
    cbIgnoreCOC: TDBCheckBoxEh;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
    procedure edZAGSUrlEditButtonsIPClick(Sender: TObject; var Handled: Boolean);
    procedure edZAGSUrlEditButtons0Click(Sender: TObject;  var Handled: Boolean);
    procedure edZAGSUrlEditButtons1Click(Sender: TObject;  var Handled: Boolean);
    procedure TCPClientStatus(ASender: TObject; const AStatus: TIdStatus;   const AStatusText: String);
    procedure edZAGSUrlEditButtons2Click(Sender: TObject;  var Handled: Boolean);
    procedure edUrlUpdateEditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure edGisunUrlEditButtons0Click(Sender: TObject;       var Handled: Boolean);
    procedure sbAddClick(Sender: TObject);
    procedure edZAGSUrl1EditButtons3Click(Sender: TObject;       var Handled: Boolean);
    procedure edGisunUrl1EditButtons0Click(Sender: TObject;      var Handled: Boolean);
    procedure sbAddDblClick(Sender: TObject);
    procedure cbUserClick(Sender: TObject);
    procedure cbETSPClick(Sender: TObject);
    procedure cbURLOtdClick(Sender: TObject);
  private
    { Private declarations }
    FTypeBase:String;
  public
    { Public declarations }
    Version:Integer;
    ini : TIniFile;
    procedure SetTypeBase(sType:String);
    procedure UpdateActions; override;
    procedure CheckCont;
  end;

var
  fmParamsGisun: TfmParamsGisun;
  tail_url_reg:String;
  tail_url_query:String;
  PathFileParamsGISUN:String;

implementation

uses uSock;

{$R *.DFM}

procedure TfmParamsGisun.SetTypeBase(sType:String);
var
  l:Boolean;
begin   
  FTypeBase:=sType;
  if (FTypeBase='OPEKA') then begin
    edTypeSource.Visible:=true;
  end;
  if (FTypeBase='LAIS') or (FTypeBase='SELSOVET') then begin
    lbLocal.Visible:=true;
//    cbLocal1.Visible:=true;
    cbLocal2.Visible:=true;
//    cbLocal1.Checked:=true; //ini.ReadBool('ADMIN','ENABLE_LOCAL_ZAH',false);
    cbLocal2.Checked:=ini.ReadBool('ADMIN','ENABLE_LOCAL_OPEKA',false);
  end;
  if (FTypeBase='LAIS') or (FTypeBase='ZAH') then begin
    cbZaprosZah.Visible:=true;
    if (FTypeBase='LAIS') then l:=true else l:=false;
    cbZaprosZah.Checked:=ini.ReadBool('ADMIN','CHECK_ZAPROS_ZAH',l);
  end;
  if (FTypeBase='LAIS')  or (FTypeBase='SELSOVET') or (FTypeBase='ZAGS') then begin
    cbAteGIS.Visible:=true;
  end else begin
    cbAteGIS.Visible:=false;
  end;
  if (FTypeBase='LAIS')  or (FTypeBase='SELSOVET') then begin
    cbIgnoreCOC.Visible:=false;
//    cbAvestPIN.Visible:=false;
  end else begin
    cbIgnoreCOC.Visible:=true;
//    cbAvestPIN.Visible:=true;
  end;
  cbAvestPIN.Visible:=false;  // !!!
end;

procedure TfmParamsGisun.BitBtn1Click(Sender: TObject);
begin
  Ini.WriteString('HTTP', 'ZAGS_URL', Trim(edZAGSUrl.Text));
  Ini.WriteString('HTTP', 'ZAGS_PROXY', Trim(edZAGSProxy.Text));
  Ini.WriteString('HTTP', 'GISUN_URL', Trim(edGisunUrl.Text));
  Ini.WriteString('HTTP', 'GISUN_PROXY', Trim(edGisunProxy.Text));

  Ini.WriteString('HTTP', 'DOWNLOAD_URL', Trim(edUrlUpdate.Text));

  ini.WriteString('ADMIN','MESSAGESOURCE',Trim(edSource.Text));
  ini.WriteString('ADMIN','TYPEMESSAGESOURCE',Trim(edTypeSource.Text));
  if Trim(edTimeOut.Text)<>''
    then ini.WriteString('ADMIN','TIMEOUT',edTimeOut.Text)
    else ini.WriteString('ADMIN','TIMEOUT','0');

  ini.WriteBool('ADMIN','ACTIVE',cbActive.Checked);
  ini.WriteBool('ADMIN','POST_USERNAME',cbUser.Checked);
  ini.WriteBool('ADMIN','DBUSER_AS_GIS',cbUserBase.Checked);
  ini.WriteBool('ADMIN','VISIBLE_TMPOFF',cbTmpOff.Checked);

  ini.WriteBool('ADMIN','ETSP_ACTIVE',cbETSP.Checked);
  ini.WriteBool('ADMIN','ETSP_URL_SEP',cbURLOtd.Checked);

  ini.WriteBool('ADMIN','AVEST_PIN',cbAvestPIN.Checked);
  ini.WriteBool('ADMIN','CHECK_USB',cbCheckUSB.Checked);
  ini.WriteBool('ADMIN','AVEST_IGNORE_COC',cbIgnoreCOC.Checked);
//  ini.WriteBool('ADMIN','ETSP_SPR',cbCheckSPR.Checked);

  {$IFDEF AVEST_GISUN}
//    if cbTypeETSP.ItemIndex=1
//      then Ini.WriteString('ADMIN', 'ETSP_TYPE', 'AVEST')
//      else Ini.WriteString('ADMIN', 'ETSP_TYPE', 'NII_TZI');
  {$ELSE}
//    Ini.WriteString('ADMIN', 'ETSP_TYPE', 'NII_TZI');
  {$ENDIF}

//  ini.WriteBool('ADMIN','PIN_ENABLED_SIM',cbSimPIN.Checked);

//  if cbLocal1.Visible
//    then ini.WriteBool('ADMIN','ENABLE_LOCAL_ZAH',cbLocal1.Checked);
  if cbLocal2.Visible
    then ini.WriteBool('ADMIN','ENABLE_LOCAL_OPEKA',cbLocal2.Checked);
  if cbZaprosZah.Visible
    then ini.WriteBool('ADMIN','CHECK_ZAPROS_ZAH',cbZaprosZah.Checked);

  ini.WriteBool('ADMIN','LOG',cbLog.Checked);
  ini.WriteBool('ADMIN','CHECK_REGISTER_FIO',cbRegFIO.Checked);
  ini.WriteBool('ADMIN','CHECK_REGISTER_ADRES',cbRegAdres.Checked);
  ini.WriteBool('ADMIN','LOAD_FAM_ST',cbLoadFamSt.Checked);

  ini.WriteBool('ADMIN', 'ATE_GIS', cbAteGIS.Checked);  // учитывать код территории из регистра

//  ini.WriteBool('ADMIN','ORGANZAGS_AS_MESSAGESOURCE',cbCommonMessageSource.Checked);  // !!!

  Ini.WriteString('HTTP', 'ZAGS_URL1', Trim(edZAGSUrl1.Text));
  Ini.WriteString('HTTP', 'ZAGS_PROXY1', Trim(edZAGSProxy1.Text));
  Ini.WriteString('HTTP', 'GISUN_URL1', Trim(edGisunUrl1.Text));
  Ini.WriteString('HTTP', 'GISUN_PROXY1', Trim(edGisunProxy1.Text));

  ini.UpdateFile;
  ModalResult := mrOk;
end;

procedure TfmParamsGisun.UpdateActions;
begin
  inherited;
end;

procedure TfmParamsGisun.FormCreate(Sender: TObject);
begin
  FTypeBase:='';
  if PathFileParamsGISUN=''   // !!!
    then Ini:=TIniFile.Create(GlobalTask.PathService+'gisun.ini')
    else Ini:=TIniFile.Create(PathFileParamsGISUN+'gisun.ini');
  edZAGSUrl.Text   := Ini.ReadString('HTTP', 'ZAGS_URL', '');
  edZAGSProxy.Text := Ini.ReadString('HTTP', 'ZAGS_PROXY', '');
  edGisunUrl.Text   := Ini.ReadString('HTTP', 'GISUN_URL', '');
  edGisunProxy.Text := Ini.ReadString('HTTP', 'GISUN_PROXY', '');
  edUrlUpdate.Text := Ini.ReadString('HTTP', 'DOWNLOAD_URL', '');

  edSource.Text := Ini.ReadString('ADMIN', 'MESSAGESOURCE', '');
  edTypeSource.Text := Ini.ReadString('ADMIN', 'TYPEMESSAGESOURCE', '');
  edTimeOut.Value := Ini.ReadInteger('ADMIN', 'TIMEOUT', 0);

  cbActive.Checked:=ini.ReadBool('ADMIN','ACTIVE',true);
  cbUser.Checked:=ini.ReadBool('ADMIN','POST_USERNAME',true);
  cbUserBase.Checked:=ini.ReadBool('ADMIN','DBUSER_AS_GIS',false);
  cbTmpOff.Checked:=ini.ReadBool('ADMIN','VISIBLE_TMPOFF',true);
  cbETSP.Checked:=ini.ReadBool('ADMIN','ETSP_ACTIVE',false);
  cbURLOtd.Checked:=ini.ReadBool('ADMIN','ETSP_URL_SEP',false);
  cbLog.Checked:=Ini.ReadBool('ADMIN', 'LOG', false);
  cbRegFIO.Checked:=Ini.ReadBool('ADMIN','CHECK_REGISTER_FIO',false);
  cbRegAdres.Checked:=Ini.ReadBool('ADMIN','CHECK_REGISTER_ADRES',false);
  cbLoadFamSt.Checked:=Ini.ReadBool('ADMIN','LOAD_FAM_ST',true);

  cbAvestPIN.Checked:=Ini.ReadBool('ADMIN', 'AVEST_PIN', false);
  cbCheckUSB.Checked:=Ini.ReadBool('ADMIN', 'CHECK_USB', false);
  cbIgnoreCOC.Checked:=Ini.ReadBool('ADMIN', 'AVEST_IGNORE_COC', false);
//  cbCheckSPR.Checked:=Ini.ReadBool('ADMIN', 'ETSP_SPR', true);

//  cbSimPin.Checked:=Ini.ReadBool('ADMIN', 'PIN_ENABLED_SIM', false);

  cbAteGIS.Checked:=Ini.ReadBool('ADMIN', 'ATE_GIS', true);  // учитывать код территории из регистра

  {$IFDEF AVEST_GISUN}
//    cbTypeETSP.Visible:=true;
//    if Trim(UpperCase(Ini.ReadString('ADMIN', 'ETSP_TYPE', 'NII_TZI')))='AVEST' then begin
//      cbTypeETSP.ItemIndex:=1;
//    end else begin
//      cbTypeETSP.ItemIndex:=0;
//    end;
  {$ELSE}
//    cbTypeETSP.Visible:=false;
//    cbTypeETSP.ItemIndex:=0;
  {$ENDIF}
//  if cbLocal1.Visible  then cbLocal1.Checked:=ini.ReadBool('ADMIN','ENABLE_LOCAL_ZAH',false);
  if cbLocal2.Visible     then cbLocal2.Checked:=ini.ReadBool('ADMIN','ENABLE_LOCAL_OPEKA',false);
  {$IFDEF LAIS}
    if cbZaprosZah.Visible  then cbZaprosZah.Checked:=ini.ReadBool('ADMIN','CHECK_ZAPROS_ZAH',true);
  {$ELSE}
    if cbZaprosZah.Visible  then cbZaprosZah.Checked:=ini.ReadBool('ADMIN','CHECK_ZAPROS_ZAH',false);
  {$ENDIF}

  Version:=Ini.ReadInteger('ADMIN', 'VERSION', 4);

//  cbCommonMessageSource.Checked:=ini.ReadBool('ADMIN','ORGANZAGS_AS_MESSAGESOURCE',false);  // !!!

  edZAGSUrl1.Text   := Ini.ReadString('HTTP', 'ZAGS_URL1', '');
  edZAGSProxy1.Text := Ini.ReadString('HTTP', 'ZAGS_PROXY1', '');
  edGisunUrl1.Text   := Ini.ReadString('HTTP', 'GISUN_URL1', '');
  edGisunProxy1.Text := Ini.ReadString('HTTP', 'GISUN_PROXY1', '');
end;

procedure TfmParamsGisun.FormDestroy(Sender: TObject);
begin
  ini.Free;
end;

procedure TfmParamsGisun.cbActiveClick(Sender: TObject);
begin
  edZAGSUrl.Enabled:=cbActive.Checked;
  edZAGSProxy.Enabled:=cbActive.Checked;
  edGisunUrl.Enabled:=cbActive.Checked;
  edGisunProxy.Enabled:=cbActive.Checked;
end;
                 
procedure TfmParamsGisun.edZAGSUrlEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  sIP:String;
  List:TstringList;
  i:Integer;
  lOk:Boolean;
begin
  lOk:=true;
  List := TStringList.Create;
  try
    GetAllIP(List);
  except
    PutError('Ошибка получения списка адресов');
    lOk:=false;
  end;
  if lOk then begin
    if List.Count=0 then begin
      PutError('Список IP адресов пуст');
    end else begin
      i := ChoiceFromList(List,'Выберите IP адрес', edZAGSUrl);
      if (i>-1)  then begin
        sIP:=List.Strings[i]+':8000';
        edZAGSurl.Text:='http://' + sIP + getTailUrlReg;    //   '/gisun/zags/ws'    функции определены в uProjectAll.pas
        edGISUNurl.Text:='http://' + sIP + getTailUrlQuery ; //   '/gisun/common/ws'
//      ShowMessage(sIP);
//        i:=LastPos('.',sIP);
//        if i>0 then begin
//          edZAGSurl.Text:='http://' + Copy(sIP,1,i) {todes.by:8084}+'9:8000/gisun/zags/ws';
//          edGISUNurl.Text:='http://' + Copy(sIP,1,i) {todes.by:8084}+'9:8000/gisun/common/ws';
//        end;
      end;
    end;
  end;
  FreeAndNil(List);
end;

procedure TfmParamsGisun.edZAGSUrlEditButtons1Click(Sender: TObject;  var Handled: Boolean);
var
  i:Integer;
  s,sPort,sAdres:String;
  ed1,ed2:TDbEditEh;
begin
  if TComponent(Sender).Owner=edZAGSurl then begin
    ed1:=edZAGSurl;
    ed2:=edGisunurl;
  end else begin
    ed1:=edZAGSurl1;
    ed2:=edGisunurl1;       
  end;
  i:=LastPos(':',ed1.Text);
  if i>0 then begin
    sPort:=Copy(ed1.Text,i+1,Length(ed1.Text));
    sAdres:=Copy(ed1.Text,1,i-1);
    i:=Pos('/',sPort);
    if i>0 then begin
      sPort:=Copy(sPort,1,i-1);
    end;
    i:=Pos('//',sAdres);
    if i>0 then begin
      sAdres:=Copy(sAdres,i+2,Length(sAdres));
    end;
  end else begin
    sPort:='0';
    sAdres:='';
  end;
  TCPClient.Host:=sAdres;
  TCPClient.Port:=StrToInt(sPort);
  OpenMessage('Проверка подключения','',10);
  try
    try
      TCPClient.Connect;
    except
      on E: EIdException do begin
        CloseMessage;
        if Pos('# 11001',E.Message) > 0 then begin
          s:='Адрес "'+sAdres+'" не найден.';
        end else if Pos('# 10060',E.Message) > 0 then begin
          s:='Время ожидания "'+sPort+'" истекло.';
        end else begin
          s:=E.Message;
        end;
        PutError(s);
      end;
    end;
    if TCPClient.Connected then begin
      CloseMessage;
      ShowMessage('Соединение установлено.');
    end;
  finally
    TCPClient.Disconnect;
    CloseMessage;
  end;
end;

procedure TfmParamsGisun.TCPClientStatus(ASender: TObject;  const AStatus: TIdStatus; const AStatusText: String);
begin
  Application.ProcessMessages;
end;

procedure TfmParamsGisun.edZAGSUrlEditButtons2Click(Sender: TObject; var Handled: Boolean);
begin
  ShellExecute(0, 'Open', 'iexplore.exe', PChar(edZAGSURL.Text), nil, SW_NORMAL);
end;

procedure TfmParamsGisun.edGisunUrlEditButtons0Click(Sender: TObject;  var Handled: Boolean);
begin
  ShellExecute(0, 'Open', 'iexplore.exe', PChar(edGisunUrl.Text), nil, SW_NORMAL);
end;

procedure TfmParamsGisun.edZAGSUrlEditButtonsIPClick(Sender: TObject; var Handled: Boolean);
var
  fmParam:TfmParamQuest;
  n:INteger;
  s1,s2,sIP:String;
  ed1,ed2:TDbEditEh;
begin
//  SetFontParamQuest(12,false);
  if TComponent(Sender).Owner=edZAGSurl then begin
    ed1:=edZAGSurl;
    ed2:=edGisunurl;
  end else begin
    ed1:=edZAGSurl1;
    ed2:=edGisunurl1;
  end;
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.FontSize:=12;
  fmParam.Flat:=false;
  fmParam.Caption:='Введите IP адрес и номер порта';
  fmParam.AddParamEx('', 'Новый адрес', 'IP' ,'TYPE=STRING~WIDTH=150~EDITMASK=!999.999.999.999;1; ');
  fmParam.AddParamEx('', 'Новый порт', 'PORT' ,'TYPE=STRING~EDITMASK=9999');
  fmParam.AddButtons('Записать~Отказ',0);
  n:=fmParam.ShowQuest;

  if n=1 then begin
    s1:=fmParam.GetValueAsText('IP');
    s2:=fmParam.GetValueAsText('PORT');
    CharDel(s1,' ');
    CharDel(s2,' ');
    if (Length(s1)>6) and (s2<>'') then begin
      sIP:=s1+':'+s2;
      if (FTypeBase='OPEKA') or (FTypeBase='ZAH') then begin
        ed1.Text:='http://' + sIP + '/gisun-inf/local/ws';
        ed2.Text:='http://' + sIP + '/gisun-inf/common/ws';
      end else begin
        ed1.Text:='http://' + sIP + getTailUrlReg;    //   '/gisun/zags/ws'    функции определены в uProjectAll.pas
        ed2.Text:='http://' + sIP + getTailUrlQuery ; //   '/gisun/common/ws'
      end;
    end;
  end;
  fmParam.Free;
end;

procedure TfmParamsGisun.edUrlUpdateEditButtons0Click(Sender: TObject;  var Handled: Boolean);
var
  fmParam:TfmParamQuest;
  n:INteger;
  s1,s2,sIP:String;
  ed1,ed2:TDbEditEh;
begin
//  SetFontParamQuest(12,false);
  if TComponent(Sender).Owner=edZAGSurl then begin
    ed1:=edZAGSurl;
    ed2:=edGisunurl;
  end else begin
    ed1:=edZAGSurl1;
    ed2:=edGisunurl1;
  end;
  fmParam:=TfmParamQuest.Create(nil);
  fmParam.FontSize:=12;
  fmParam.Flat:=false;
  fmParam.Caption:='Введите IP адрес и номер порта';
  fmParam.AddParamEx('', 'Новый адрес', 'IP' ,'TYPE=STRING~WIDTH=150~EDITMASK=!999.999.999.999;1; ');
  fmParam.AddParamEx('', 'Новый порт', 'PORT' ,'TYPE=STRING~EDITMASK=9999');
  fmParam.AddButtons('Записать~Отказ',0);
  n:=fmParam.ShowQuest;

  if n=1 then begin
    s1:=fmParam.GetValueAsText('IP');
    s2:=fmParam.GetValueAsText('PORT');
    CharDel(s1,' ');
    CharDel(s2,' ');
    if (Length(s1)>6) and (s2<>'') then begin
      sIP:=s1+':'+s2;
      edUrlUpdate.Text:='http://'+sIP;
    end;
  end;
  fmParam.Free;
end;


procedure TfmParamsGisun.sbAddClick(Sender: TObject);
begin
{
  if sbAdd.GroupIndex=0 then begin
    sbAdd.GroupIndex:=1;
//    sbAdd.Down:=true;
  end else begin
    sbAdd.GroupIndex:=0;
//    sbAdd.Down:=false;
  end;
  }
end;

procedure TfmParamsGisun.sbAddDblClick(Sender: TObject);
begin
  sbAddClick(Sender);
end;

procedure TfmParamsGisun.edZAGSUrl1EditButtons3Click(Sender: TObject; var Handled: Boolean);
begin
  ShellExecute(0, 'Open', 'iexplore.exe', PChar(edZAGSURL1.Text), nil, SW_NORMAL);
end;

procedure TfmParamsGisun.edGisunUrl1EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  ShellExecute(0, 'Open', 'iexplore.exe', PChar(edGisunURL1.Text), nil, SW_NORMAL);
end;

//------------------------------------------------------------
procedure TfmParamsGisun.CheckCont;
begin
  cbUserBase.Enabled:=cbUser.Checked;
  cbURLOtd.Enabled:=cbETSP.Checked;
  cbCheckUSB.Enabled:=cbETSP.Checked;
  cbIgnoreCOC.Enabled:=cbETSP.Checked;
  cbCheckSPR.Enabled:=cbETSP.Checked;
  cbAvestPIN.Enabled:=cbETSP.Checked;
  if cbURLOtd.Enabled and cbURLOtd.Checked then begin
    pnExt.Visible:=true;
    self.ClientWidth:=pnOsn.Width+pnOsn.Width+3;
  end else begin
    pnExt.Visible:=false;
    self.ClientWidth:=pnOsn.Width+1;
  end;
end;
//------------------------------------------------------------
procedure TfmParamsGisun.cbUserClick(Sender: TObject);
begin
  CheckCont;
end;

procedure TfmParamsGisun.cbETSPClick(Sender: TObject);
begin
  CheckCont;
end;

procedure TfmParamsGisun.cbURLOtdClick(Sender: TObject);
begin
  CheckCont;
end;

initialization
  PathFileParamsGISUN:='';
finalization

end.
