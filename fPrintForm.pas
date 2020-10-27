unit fPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fMain, dBase,
  TB2Dock, TB2Toolbar, FR_Class, Db, kbmMemTable, FR_DSet, FR_DBSet,
  TB2Item, SasaIniFile, ReportTask {fmReport}, FuncPr, mPermit, MetaTask,
  frxClass, frxDBSet;

type
  TfmPrintForm = class(TForm)
    frReport: TfrReport;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItemPreView: TTBItem;
    TBItemPrint: TTBItem;
    frDBPrintForm: TfrDBDataSet;
    frDBListPrintForm: TfrDBDataSet;
    Dokument: TkbmMemTable;
    List: TkbmMemTable;
    TBItemDesign: TTBItem;
    TBItemExit: TTBItem;
    dsDokument: TDataSource;
    dsList: TDataSource;
    DokumentNAME: TStringField;
    ListNPP: TIntegerField;
    frxDBPrintForm: TfrxDBDataset;
    frxDBListPrintForm: TfrxDBDataset;
    frxReport: TfrxReport;
    procedure TBItemPreViewClick(Sender: TObject);
    procedure TBItemPrintClick(Sender: TObject);
    procedure TBItemDesignClick(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    FFile : String;
    FIni : TSasaIniFile;
    FFr3:Boolean;
//    frxReport: TfrxReport;
  end;

var
  fmPrintForm: TfmPrintForm;

implementation

uses StrUtils;


{$R *.DFM}

procedure TfmPrintForm.TBItemPreViewClick(Sender: TObject);
begin
  if Dokument.Active then
    Dokument.CheckBrowseMode;
  if List.Active then
    List.CheckBrowseMode;

  if FFr3
    then frxReport.ShowReport
    else frReport.ShowReport;

//  PreViewReport(FFile, globaltask.Script);
end;

procedure TfmPrintForm.TBItemPrintClick(Sender: TObject);
begin
  if Dokument.Active then
    Dokument.CheckBrowseMode;
  if List.Active then
    List.CheckBrowseMode;

//  PrintReport(FFile, globaltask.Script);
  if FFr3 then begin
    frxReport.PrepareReport;
    frxReport.Print;
  end else begin
    frReport.PrepareReport;
    frReport.PrintPreparedReportDlg;
  end;
end;

procedure TfmPrintForm.TBItemDesignClick(Sender: TObject);
begin
  if Dokument.Active then
    Dokument.CheckBrowseMode;
  if List.Active then
    List.CheckBrowseMode;

//  DesignTailReport(FFile, globaltask.Script);

  if FFr3
    then frxReport.DesignReport
    else frReport.DesignReport;

end;

procedure TfmPrintForm.TBItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPrintForm.FormCreate(Sender: TObject);
begin
  FFR3:=false;
  frxReport.IniFile:=fmMain.frxReport.IniFile;
  Dokument.Open;
  Dokument.Append;
  Dokument.Post;
  FIni:=GlobalTask.iniFile('CONF');
  List.Open;
  FFile := ReportsIni.ReadString('PRINTFORM', Self.Name, '');
  if FFile <> '' then begin
    FFile := GetFullNameReport( FFile );
    if FileExists(FFile) then begin
      if ANSIUpperCase(RightStr(FFile,3))='FR3' then begin
        FFR3:=true;
        frxReport.FileName:= FFile;
        frxReport.LoadFromFile(FFile);
      end else begin
        frReport.FileName:= FFile;
        frReport.LoadFromFile(FFile);
      end;
    end else begin
      PutError(' Не найден файл отчета: '+#13+FFile);
    end;
  end else begin
//    PutError(' Неизвестен файл отчета формы !  ')
  end;
  TBItemDesign.Visible:=Role.SystemAdmin; //Role.Enabled(toDesignReport);
end;

procedure TfmPrintForm.FormDestroy(Sender: TObject);
begin
  if Dokument.Active then  Dokument.CheckBrowseMode;
  if List.Active then   List.CheckBrowseMode;
end;

end.
