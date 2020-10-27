unit fEdMeta;
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, kbmMemTable, kbmMemCSVStreamFormat, DB, ComCtrls, ToolWin,
   ExtCtrls, Grids, DBGridEh, StdCtrls, ActnList, ImgList, mDRecData, mDoc2Sel;

type
   TfmEdMeta=class(TForm)
      dsTable: TkbmMemTable;
      fmtCSV: TkbmCSVStreamFormat;
      dsoTable: TDataSource;
      dsoField: TDataSource;
      dsField: TkbmMemTable;
      tbaEdMeta: TToolBar;
      tbOk: TToolButton;
      tbSep1: TToolButton;
      tbCancel: TToolButton;
      imEdMeta: TImageList;
      alEdMeta: TActionList;
      acOk: TAction;
      acCancel: TAction;
      dsTableTABLE_ID: TAutoIncField;
      dsFieldTABLE_ID: TIntegerField;
      dsFieldFIELD_ID: TAutoIncField;
      dsTableNAME: TStringField;
      dsFieldNAME: TStringField;
      dsFieldFIELD_NAME: TStringField;
      dsFieldSYNONIM: TStringField;
      dsFieldCAPTION: TStringField;
      dsFieldCOMM: TStringField;
      dsFieldGROUP: TStringField;
      dsFieldSPR_NAME: TStringField;
      dsFieldENUM_NAME: TStringField;
      dsFieldORDER: TIntegerField;
      dsFieldSTYLE: TStringField;
      dsFieldLINK_STYLE: TStringField;
      dsFieldSEL_STYLE: TStringField;
      dsFieldDATA_KIND: TStringField;
      dsTableALIAS: TStringField;
      dsTableSHORT: TStringField;
      dsTableCAPTION: TStringField;
      dsTableCOMM: TStringField;
      dsTableINDEX_NAME: TStringField;
      dsTableMASTER_FIELD: TStringField;
      dsTableKEY_FIELD: TStringField;
      dsTableNAME_FIELD: TStringField;
      dsTableAUTO_INC: TStringField;
      dsTableSTYLE: TStringField;
      dsTableTABLE_NAME: TStringField;
      fmtSave: TkbmCSVStreamFormat;
      pcMeta: TPageControl;
      tsMetaMain: TTabSheet;
      tsMetaFind: TTabSheet;
      paAll: TPanel;
      spTop: TSplitter;
      dgTable: TDBGridEh;
      pcBottom: TPageControl;
      tsField: TTabSheet;
      dgField: TDBGridEh;
      stField: TStaticText;
      stTable: TStaticText;
      dsFindOper: TkbmMemTable;
      dsFindOperName: TStringField;
      dsFindOperCaption: TStringField;
      dsFindOperSQL: TStringField;
      dsFindOperFieldKinds: TStringField;
      dsFindOperNeedValue: TBooleanField;
      dsFindOperTwoValue: TBooleanField;
      dsFindOperIgnoreCase: TBooleanField;
      dsFindOperMultiSel: TBooleanField;
      dsFindOperMultiOr: TBooleanField;
      dsFindOperOrder: TIntegerField;
      dsFindOperVisible: TBooleanField;
      dsFindOperOwnValue: TBooleanField;
      dsFindOperOwnValName: TStringField;
      dsFindOperOwnValKind: TStringField;
      dsFindOperSprName: TStringField;
      dsoFindOper: TDataSource;
      stFindOper: TStaticText;
      dgFindOper: TDBGridEh;
      procedure acOkExecute(Sender: TObject);
      procedure acCancelExecute(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure dgTableColumns11EditButtons0Click(Sender: TObject; var Handled: Boolean);
      procedure dgFieldColumns9EditButtons0Click(Sender: TObject; var Handled: Boolean);
   private
      FLoader: TDBItemLoader;
   end;

function EditMeta: Boolean;   

implementation
uses
   fEdStyle;
{$R *.dfm}

function EditMeta: Boolean;
var
   MetaFileName: string;
   BakFileName: string;
   (*
   TableFileName: string;
   FieldFileName: string;
   *)
begin
   Result:=False;
   with TfmEdMeta.Create(nil) do begin
      try
         (*
         TableFileName:=ExtractFilePath(Application.ExeName)+'table.csv';
         FieldFileName:=ExtractFilePath(Application.ExeName)+'field.csv';
         if FileExists(TableFileName) and FileExists(FieldFileName) then begin
            dsTable.LoadFromFileViaFormat(TableFileName, fmtSave{fmtCSV});
            dsField.LoadFromFileViaFormat(FieldFileName, fmtSave{fmtCSV});
         end;
         //dsFindOper.Open;
         //dsFindOper.LoadFromFileViaFormat(ExtractFilePath(Application.ExeName)+'FindOper.mtb', fmtCSV);
         *)
         dgTable.DataSource:=FLoader.dsoTable;
         dgField.DataSource:=FLoader.dsoField;
         dgFindOper.DataSource:=FLoader.dsoFindOper;
         MetaFileName:=Doc2Sel.GetMetaFileName;
         BakFileName:=ChangeFileExt(MetaFileName, '.bak');
         if FLoader.LoadFromIni(MetaFileName) then begin
            FLoader.Open;
            if ShowModal=mrOk then begin
               (*
               dsTable.SaveToFileViaFormat(TableFileName, fmtSave{fmtCSV});
               dsField.SaveToFileViaFormat(FieldFileName, fmtSave{fmtCSV});
               //dsFindOper.SaveToFileViaFormat(ExtractFilePath(Application.ExeName)+'FindOper.mtb', fmtSave);
               *)
               CopyFile(PChar(MetaFileName), PChar(BakFileName), False);
               FLoader.SaveToIni(MetaFileName);
               Result:=True;
            end;
         end;
      finally
         Free;
      end;
   end;
end;

procedure TfmEdMeta.acOkExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TfmEdMeta.acCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmEdMeta.FormCreate(Sender: TObject);
begin
{
   dsTable.Open;
   dsField.Open;
}
   FLoader:=TDBItemLoader.Create;
   pcMeta.ActivePage:=tsMetaMain;
end;

procedure TfmEdMeta.FormDestroy(Sender: TObject);
begin
   FLoader.Free;
{
   dsField.Close;
   dsTable.Close;
}
end;

procedure TfmEdMeta.dgTableColumns11EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
   Style: string;
begin
   Style:=FLoader.dsTable.FieldByName('STYLE').AsString;
   if EditStyle(Style, True) then begin
      FLoader.dsTable.Edit;
      FLoader.dsTable.FieldByName('STYLE').AsString:=Style;
      FLoader.dsTable.Post;
   end;
end;

procedure TfmEdMeta.dgFieldColumns9EditButtons0Click(Sender: TObject; var Handled: Boolean);
var
   Style: string;
begin
   Style:=FLoader.dsField.FieldByName('STYLE').AsString;
   if EditStyle(Style, False) then begin
      FLoader.dsField.Edit;
      FLoader.dsField.FieldByName('STYLE').AsString:=Style;
      FLoader.dsField.Post;
   end;
end;

end.
