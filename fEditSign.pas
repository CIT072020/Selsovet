unit fEditSign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  Dialogs, uSMDO, uAvest, mPermit,
  FuncPr, fSimpleDialog, Buttons, StdCtrls, Grids, ExtCtrls, DB, DBGridEh, kbmMemTable, Metatask, uProjectAll,
  frxClass, frxDBSet;

type
  TfmEditSign = class(TfmSimpleDialog)
    Panel2: TPanel;
    Label1: TLabel;
    lbFile: TLabel;
    Panel3: TPanel;
    btAdd: TSpeedButton;
    btDel: TSpeedButton;
    tbSign: TkbmMemTable;
    tbSignSIGN: TMemoField;
    tbSignINFO: TMemoField;
    tbSignNOMER: TSmallintField;
    Grid: TDBGridEh;
    DataSource1: TDataSource;
    btPreveiw: TSpeedButton;
    frxDBDatasetSign: TfrxDBDataset;
    btDesign: TSpeedButton;
    cbPrintSIGN: TCheckBox;
    procedure btDelClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btPreveiwClick(Sender: TObject);
    procedure btDesignClick(Sender: TObject);
  private
    { Private declarations }
    slSign:TStringList;
    slInfo:TStringList;
    FFile:String;
    FChange:Boolean;
    FOnAddMens:TNotifyEvent;
    function getInfo:String;
    procedure BeforePreview;
  public
    { Public declarations }
    function EditSign(lSignEnabled:Boolean; sFile:String; var sSignature:String; var sSignInfo:String; OnAddMens:TNotifyEvent):Boolean;
  end;

var
  fmEditSign: TfmEditSign;

implementation

{$R *.dfm}

procedure TfmEditSign.btDelClick(Sender: TObject);
begin
  if Problem('Удалить ЭЦП'+getInfo+' ?') then begin
    FChange:=true;
    tbSign.Delete;
  end;
end;

procedure TfmEditSign.btAddClick(Sender: TObject);
var
  sDolg, sFile, sErr, sFIO, sOrg, sDate, sSign,sInfo:String;
  dSign:TDateTime;
  res:DWORD;
  i:Integer;
  CurKeyBoard:LongWord;
  slSign,sl:TStringList;
begin
  sSign:='';
  sInfo:='';
  sFio:='';
  sDolg:='';
  Avest.FDeleteCRLF:=true;      // в ЭЦП будем удалять CRLF
  CurKeyBoard:=GetTypeKeyBoard;
  ActivateENGKeyboard;
  res:=Avest.SMDOSignFile(FFile,sSign);
  if CurKeyBoard>0 then
    ActivateKeyboardLayout(CurKeyBoard,KLF_ACTIVATE);
  if res=0 then begin
    slSign:=TStringList.Create;
    slSign.Add(sSign);
    sFile:=ReadFileToString(FFile, sErr);
    res:=Avest.SMDOVerify(sFile,slSign,false, CHECK_CERT_DEFAULT);
    if res=0 then begin
      sDolg:=Avest.GetAttrSign(0,'dolg');
      sFIO:=Avest.GetAttrSign(0,'fio');
      sDate:=Avest.GetAttrSign(0,'signdate');
      sOrg:=Avest.GetAttrSign(0,'org');
      sInfo:=Trim(sDolg+' '+sFIO)+', '+sDate+', '+sOrg;
    end;
    slSign.Free;
  end;
  sl:=TStringList.Create;
  if (sSign<>'') and (sInfo<>'') then begin
    FChange:=true;
    tbSign.Append;
    tbSignINFO.AsString:=sInfo;
    tbSignSIGN.AsString:=sSign;
    tbSign.Post;
    if Assigned(FOnAddMens) then begin
      sl.Add('FIO='+sFIO);
      sl.Add('DOLG='+sDolg);
      sl.Add('SIGNDATE='+sDate);
      sl.Add('ORG='+sOrg);
      FOnAddMens(sl);
    end;  
  end else begin
    {
    sl.Add('ERROR');
    sl.Add('FIO=Иванов Иван Иванович');
    sl.Add('SIGNDATE='+FormatDateTime('dd.mm.yyyy hh:nn:ss', Now));
    sl.Add('ORG=Государственное предприятие "ЦИТ Белстата"');
    FOnAddMens(sl);
    }
    PutError(Avest.ErrorInfo(res));
  end;
  sl.Free;
end;

function TfmEditSign.EditSign(lSignEnabled:Boolean; sFile: String; var sSignature,  sSignInfo: String; OnAddMens:TNotifyEvent): Boolean;
var
  i:Integer;
begin
  FChange:=false;
  Result:=false;
  FOnAddMens:=OnAddMens;
  StrToStrings(sSignature, slSign, chr(13)+chr(10), false);
  StrToStrings(sSignInfo, slInfo, chr(13)+chr(10), false);
  FFile:=sFile;
  lbFile.Caption:=ExtractFileName(sFile);
  for i:=0 to slInfo.Count-1 do begin
    tbSign.Append;
    tbSignINFO.AsString:=slInfo.Strings[i];
    if i<=slSign.Count-1
      then tbSignSIGN.AsString:=slSign.Strings[i];
    tbSign.Post;
  end;
  btAdd.Enabled:=lSignEnabled;
  btDel.Enabled:=lSignEnabled;
  tbSign.First;

  EditModal; // then begin

  if lSignEnabled and FChange then begin
    Result:=true;
    sSignature:='';
    sSignInfo:='';
    tbSign.First;
    while not tbSign.Eof do begin
      sSignature:=sSignature+tbSignSIGN.AsString+chr(13)+chr(10);
      sSignInfo:=sSignInfo+tbSignINFO.AsString+chr(13)+chr(10);
      tbSign.Next;
    end;
    if sSignature<>'' then sSignature:=Copy(sSignature,1,Length(sSignature)-2);
    if sSignInfo<>''  then sSignInfo:=Copy(sSignInfo,1,Length(sSignInfo)-2);
  end;
end;

procedure TfmEditSign.FormCreate(Sender: TObject);
var
  s:String;
begin
  slSign:=TStringList.Create;
  slInfo:=TStringList.Create;
  if Role.SystemAdmin then begin
    btOk.Visible:=true;
    btDesign.Visible:=true;
  end;
  s:=GlobalTask.GetLastValueAsString('PRINT_SIGN');
  if (s='') or (s='0')
    then cbPrintSIGN.Checked:=false
    else cbPrintSIGN.Checked:=true;
end;

procedure TfmEditSign.FormDestroy(Sender: TObject);
begin
  slSign.Free;
  slInfo.Free;
end;

function TfmEditSign.getInfo: String;
var
  s:String;
  n:Integer;
begin
  s:=tbSignINFO.AsString;
  if s='' then begin
    Result:='';
  end else begin
    n:=Pos(',',s);
    if n>0 then begin
      Result:=Copy(s,1,n-1);
      s:=Copy(s,n+1,Length(s));
    end else begin
      Result:=s;
    end;
  end;
  if Result<>'' then Result:=':  "'+Result+'"  ';
end;

procedure TfmEditSign.btOkClick(Sender: TObject);
var
  sDolg, sErr, sFile, sFIO, sOrg, sDate, sSign,sInfo:String;
  res:DWORD;
  slSign:TStringList;
begin
  if Role.SystemAdmin then begin
    slSign:=TStringList.Create;
    slSign.Add(tbSignSIGN.AsString);
    sFile:=ReadFileToString(FFile, sErr);
    if sErr='' then begin
      res:=Avest.SMDOVerify(sFile,slSign,false, SMDO.FCheckCert);
//      if res=0 then begin
        sDolg:=Avest.GetAttrSign(0,'dolg');
        sFIO:=Avest.GetAttrSign(0,'fio');
        sDate:=Avest.GetAttrSign(0,'signdate');
        sOrg:=Avest.GetAttrSign(0,'org');
        sErr:=Avest.GetAttrSign(0,'error');
        sInfo:=Trim(sDolg+' '+sFIO)+#13+sDate+#13+sOrg;
        if sErr<>'' then begin
          sErr:='ОШИБКА: '+sErr;
          PutError(sErr+#13+sInfo);
        end else begin
          ShowMessage(sInfo);
        end;
//      end else begin
//        PutError(Avest.ErrorInfo(res));
//      end;
    end else begin
      PutError(sErr);
    end;
    slSign.Free;
  end;
end;

const
  sNameReport='&СМДО_СписокЭЦП.fr3';

procedure TfmEditSign.BeforePreview;
var
  s:String;
begin
  GlobalTask.SetWorkParam('CUR_FILE', lbFile.Caption);
  if cbPrintSIGN.Checked then s:='1' else s:='0';
  GlobalTask.SetLastValueAsString('PRINT_SIGN', s);
end;

procedure TfmEditSign.btPreveiwClick(Sender: TObject);
begin
  BeforePreview;
  GlobalTask.PreViewReport(sNameReport);
end;

procedure TfmEditSign.btDesignClick(Sender: TObject);
begin
  BeforePreview;
  GlobalTask.DesignTailReport(sNameReport);
end;

end.
