unit fDeliverStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB, kbmMemTable, Grids, DBGridEh, iniFiles,
  uTypes, FuncPr, mExport, fExpDs, uProjectAll, StdCtrls, MetaTask, fMultiChoice,
  TB2Dock, TB2Toolbar, TB2Item;

type
  TfmDeliverStatus = class(TForm)
    Grid: TDBGridEh;
    tbStatus: TkbmMemTable;
    tbStatusID: TIntegerField;
    tbStatusMSG_ID: TStringField;
    tbStatusSMDOCODE: TStringField;
    tbStatusUVD_RECEIVED: TBooleanField;
    tbStatusUVD_REGISTER: TBooleanField;
    tbStatusUVD_DISP: TBooleanField;
    tbStatusDATE_RECEIVED: TDateTimeField;
    tbStatusDATE_DISP: TDateTimeField;
    tbStatusDATE_REGISTER: TDateTimeField;
    tbStatusNAME: TStringField;
    DataSource: TDataSource;
    tbStatusADR_REGNUMBER: TStringField;
    tbStatusADR_REGDATE: TDateField;
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemExit: TTBItem;
    TBItemExport: TTBItem;
    TBItemAddGraf: TTBItem;
    tbStatusTEL_SMDO: TStringField;
    tbStatusTEL_ORG: TStringField;
    TBItemFilter: TTBItem;
    procedure TBItemExportClick(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure TBItemAddGrafClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBItemFilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FValues_AddGraf:String;
    FErr:String;
    FStrFilter:String;
    FId:Integer;
    FIni:TCustomIniFile;
    function LoadStatus(nID:Integer):Boolean;
    function GetDateTime(s:String):TDateTime;
    procedure CheckPropertyGridColumns;
    procedure Prepare(ini:TCustomIniFile);
  end;

  procedure ShowDeliverStatus(ini:TCustomIniFile; nID:Integer);

var
  fmDeliverStatus: TfmDeliverStatus;

implementation

uses fMain, dBase, uSMDO, StrUtils, DateUtils;

{$R *.dfm}

procedure ShowDeliverStatus(ini:TCustomIniFile; nID:Integer);
var
  fm:TfmDeliverStatus;
begin
  fm:=TfmDeliverStatus.Create(nil);
  fm.Prepare(ini);
  fm.LoadStatus(nID);
  fm.ShowModal;
  fm.Free;
end;

procedure TfmDeliverStatus.Prepare(ini:TCustomIniFile);
//var
//  i:Integer;
begin
//  for i:=0 to TBToolbar.Items.Count-1 do TBToolbar.Items[i].Hint:=TBToolbar.Items[i].Caption;
  FIni:=nil;
  TBItemFilter.Hint:=TBItemFilter.Caption;
  FStrFilter:=TBItemFilter.Hint;
  FValues_AddGraf:='';
  if Ini<>nil then begin
    FIni:=ini;
    SetPosForm(Self,FIni.ReadString('DeliverStatus','FormPos',''));
    FValues_AddGraf:=FIni.ReadString('DeliverStatus','AddGraf','');
    if FValues_AddGraf='' then FValues_AddGraf:=',NAME,'
                          else FValues_AddGraf:=','+FValues_AddGraf+',';
    CheckPropertyGridColumns;
  end;
end;

procedure TfmDeliverStatus.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:String;
begin
  s:='';
  if Grid.FieldColumns['NAME'].Visible then s:=s+'NAME,';
  if Grid.FieldColumns['DATE_DISP'].Visible then s:=s+'DATE_DISP,';
  if Grid.FieldColumns['TEL_SMDO'].Visible then s:=s+'TEL_SMDO,';
  if Grid.FieldColumns['TEL_ORG'].Visible then s:=s+'TEL_ORG,';
  if s='' then s:='-';
  if FIni<>nil then begin
    FIni.WriteString('DeliverStatus','AddGraf', s);
    FIni.WriteString('DeliverStatus','FormPos', GetPosForm(Self));
  end;
end;

function TfmDeliverStatus.GetDateTime(s:String):TDateTime;
begin
//  "02.11.2017 11.09.47"
  try
    Result:=EncodeDateTime(StrToInt(Copy(s,7,4)), StrToInt(Copy(s,4,2)), StrToInt(Copy(s,1,2)), StrToInt(Copy(s,12,2)),
                   StrToInt(Copy(s,15,2)), StrToInt(Copy(s,18,2)), 0);
  except
    Result:=0;
  end;
end;

function TfmDeliverStatus.LoadStatus(nID:Integer):Boolean;
var
  s:String;
  arr:TArrStrings;
  n,m,j,i:Integer;
  d:TDateTime;
begin
  if not tbStatus.Active
    then tbStatus.Active:=true;
  tbStatus.EmptyTable;
  Result:=false;
  // NAME список рассылки  ACK_TYPE 1-получение  2-регистрация    SMDOCODE=org или smdo_dis
  //  ADR_REGNUMBER ADR_REGDATE   номер и дата регистрации
  if dmBase.SMDOPost.Locate('ID', nID, []) then begin
    Fid:=nID;
    s:=dmBase.SMDOPost.FieldByName('SMDOCODE').AsString;
    if s=DELIVER_KEY then begin
      s:=dmBase.SMDOPost.FieldByName('NAME').AsString;
    end;
    arr:=FuncPr.StrToArr(s,',',true);
    for i:=Low(arr) to High(arr) do begin
      tbStatus.Append;
      tbStatusSMDOCODE.AsString:=arr[i];
      tbStatusUVD_DISP.AsBoolean:=false;
      tbStatusUVD_RECEIVED.AsBoolean:=false;
      tbStatusUVD_REGISTER.AsBoolean:=false;
      if dmBase.SMDOSprOrg.Locate('SMDOCODE', arr[i], []) then begin
        tbStatusNAME.AsString:=dmBase.SMDOSprOrg.FieldByName('SHORTNAME').AsString;
        tbStatusTEL_SMDO.AsString:=dmBase.SMDOSprOrg.FieldByName('PHONE').AsString;
      end;
      if dmBase.SprWork.Locate('SMDOCODE', arr[i], []) then begin
        tbStatusTEL_ORG.AsString:=dmBase.SprWork.FieldByName('TELEFON').AsString;
      end;
      tbStatus.Post;
      Result:=true;
    end;
    dmBase.WorkQuery.SQL.Text:='SELECT * FROM SmdoPost WHERE ack_msg_id='+QStr(dmBase.SMDOPost.FieldByName('MSG_ID').AsString)+' and msg_type='+IntToStr(MSG_TYPE_A);
    dmBase.WorkQuery.Open;
    with dmBase.WorkQuery do begin
      while not Eof do begin
        if FieldByName('SUBJ_SYSTEM').AsInteger=0 then begin  // от организации
           s:=FieldByName('SMDOCODE').AsString;
           if tbStatus.Locate('SMDOCODE', s, []) then begin
             tbStatus.Edit;
             case FieldByName('ACK_TYPE').AsInteger of
               ACK_DELIVER  : begin      // уведомление о получении док.
                                tbStatusDATE_RECEIVED.AsDateTime:=FieldByName('DTSTAMP').AsDateTime;
                                tbStatusUVD_RECEIVED.AsBoolean:=true;
                              end;
               ACK_REGISTER : begin    // уведомление о регистратции док.
                                tbStatusDATE_REGISTER.AsDateTime:=FieldByName('DTSTAMP').AsDateTime;
                                tbStatusUVD_REGISTER.AsBoolean:=true;
                                tbStatusADR_REGDATE.AsDateTime:=FieldByName('ADR_REGDATE').AsDateTime;
                                tbStatusADR_REGNUMBER.AsString:=FieldByName('ADR_REGNUMBER').AsString;
                              end;
             else
             end;
             tbStatus.Post;
           end;
        end else begin  // от маршрутизатора
          s:=ANSIUpperCase(FieldByName('TEXT').AsString);   //   "0=Документ успешно отправлен из ядра СМДО абоненту: Org4631 [02.11.2017 11.09.47]"
          for i:=Low(arr) to High(arr) do begin
            j:=Pos(ANSIUpperCase(arr[i])+' ', s);  // ищем код смдо
            if j>0 then begin
              if tbStatus.Locate('SMDOCODE', arr[i], []) then begin
                tbStatus.Edit;
                tbStatusUVD_DISP.AsBoolean:=true;
                n:=PosEx('[',s,j+1);
                m:=PosEx(']',s,n+1);
                if (n>0) and (m>0) then begin  // если нашли дату и время
                  d:=GetDateTime(Copy(s,n+1, m-n-1));
                  if d>0 then begin
                    tbStatusDATE_DISP.AsDateTime:=d;
                  end;
                end;
                tbStatus.Post;
              end;
            end;
          end;
        end;
        Next;
      end;
    end;
    dmBase.WorkQuery.Close;
    tbStatus.First;
  end;
end;

procedure TfmDeliverStatus.TBItemExportClick(Sender: TObject);
var
  ExportColumns:TExportColumnList;
begin
  ExportColumns := TExportColumnList.Create;
  FillColumnList2(Grid, ExportColumns);
  ExportDataSet('Экспорт', Grid.Datasource.DataSet, efRtf, [], GetFolderMyDocument, False, False, ExportColumns);
  ExportColumns.Free;
end;

procedure TfmDeliverStatus.TBItemAddGrafClick(Sender: TObject);
var
  f:TfmMultiChoice;
begin
  f := TfmMultiChoice.Create(Self);
  f.btOk.Caption:='Установить';
  f.FFieldName:='';
  f.Height:=250;
  f.Caption:='Настроить видимость граф';
  f.AddValue('NAME','Наименование организации');
  f.AddValue('DATE_DISP', 'Отправлено от маршрутизатора абоненту');
  f.AddValue('TEL_SMDO','Телефон из справочника СМДО');
  f.AddValue('TEL_ORG','Телефон из справочника организаций');
  f.SetValues(FValues_AddGraf, ',');
  if f.ShowModal=mrOk then begin
    FValues_AddGraf:=f.GetValues;
    CheckPropertyGridColumns;
  end;
  f.Free;
  Application.ProcessMessages;
end;

procedure TfmDeliverStatus.CheckPropertyGridColumns;
begin
  Grid.FieldColumns['NAME'].Visible:=(Pos('NAME,', FValues_AddGraf)>0);
  Grid.FieldColumns['DATE_DISP'].Visible:=(Pos('DATE_DISP,', FValues_AddGraf)>0);
  Grid.FieldColumns['TEL_SMDO'].Visible:=(Pos('TEL_SMDO,', FValues_AddGraf)>0);
  Grid.FieldColumns['TEL_ORG'].Visible:=(Pos('TEL_ORG,', FValues_AddGraf)>0);
end;

procedure TfmDeliverStatus.TBItemExitClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmDeliverStatus.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
begin
  case Key of
   VK_F2    : Modalresult:=mrOk;
   VK_ESCAPE: Modalresult:=mrCancel;
   VK_SPACE : TBItemFilterClick(nil);
  end;
end;
end;

procedure TfmDeliverStatus.TBItemFilterClick(Sender: TObject);
begin
  TBItemFilter.Checked:=not TBItemFilter.Checked;
  if TBItemFilter.Checked then begin
    tbStatus.Filter:='DATE_RECEIVED IS NULL or DATE_REGISTER IS NULL';
    tbStatus.Filtered:=true;
     tbStatus.Filtered:=true;
     TBItemFilter.Hint:='Сбросить отбор по необработанным';
  end else begin
    tbStatus.Filter:='';
    tbStatus.Filtered:=false;
    TBItemFilter.Hint:=FStrFilter;
  end;
end;

end.



