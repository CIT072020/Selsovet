unit fExpDs; // export dataset form
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, db, Mask, ExtCtrls, CheckLst, fWait, ShellApi,
   MetaTask,AdsTable,FuncPr,
   fExpGr, mExport, fGauge, FileCtrl, DBCtrlsEh;

type
   TfmExpds=class(TForm)
      btOk: TButton;
      btCancel: TButton;
      imIcon: TImage;
      rgFormat: TRadioGroup;
      laFileName: TLabel;
      chbShowResult: TCheckBox;
      btFields: TButton;
      sdFile: TSaveDialog;
      laCurDir: TLabel;
      edCurDir: TEdit;
      chbShowProgress: TCheckBox;
      feFile: TDBEditEh;
      chbNppColumn: TCheckBox;
      chbGridLine: TCheckBox;
      chbLandscape: TCheckBox;
      procedure rgFormatClick(Sender: TObject);
      procedure btFieldsClick(Sender: TObject);
      procedure edfChange(Sender: TObject);
      procedure chbShowResultClick(Sender: TObject);
      procedure feFileButtonClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure chbShowProgressClick(Sender: TObject);
      procedure btOkClick(Sender: TObject);
      procedure feFileEditButtons(Sender: TObject; var Handled: Boolean);
      procedure chbGridLineClick(Sender: TObject);
   private
      FBookmark:TStringList;
      FDataSet: TDataSet;
      FFileName: string;
      FTarget: TExportFormat;
      FShowResult: Boolean;
      FShowGauge: Boolean;
      FGridLine: Boolean;
      FExportColumns: TExportColumnList;
   private
      procedure InitExportFormat(ExludeFormat: TExportFormats);
      procedure SetExt(AExt: TExportFormat);
      procedure SetFileName;
      procedure SetDataSet(ds: TDataSet; ExportColumns: TExportColumnList);
   public
      procedure DoExport(Msg: string);
   end;

function ExportDataSet(Msg: string; ds: TDataSet; ExportTag: TExportFormat; ExcludeFormat: TExportFormats; ExportDir: string; ShowGauge, SelectAll: Boolean; ExportColumns: TExportColumnList; slBookmark:TStringList=nil):Boolean;

implementation

{$R *.DFM}

const
   MapRadioGroup: array [TExportFormat] of Integer=(-1, -1, -1, -1, -1, -1);

function ExportDataSet(Msg: string; ds: TDataSet; ExportTag: TExportFormat; ExcludeFormat: TExportFormats; ExportDir: string; ShowGauge, SelectAll: Boolean; ExportColumns: TExportColumnList; slBookmark:TStringList):Boolean;
var
   sFields,sAdd,CurDir,s: string;
   NppColumn: TExportColumn;
   I: Integer;
   Column: TExportColumn;
begin
   Result:=false;
   i:=Pos(';',Msg);
   sAdd:='';
   if i>0 then begin
     sAdd:=Copy(Msg,i+1,Length(Msg));
     Msg:=Copy(Msg,1,i-1);
   end;

   with TfmExpds.Create(Application) do begin
      CurDir:=GetCurrentDir;
      if ExportDir='' then begin
         ExportDir:=ExtractFilePath(Application.ExeName);
      end;
      try
         if (ExportDir<>'') and DirectoryExists(ExportDir) then begin
            SetCurrentDir(ExportDir);
         end;
         FBookmark:=slBookmark;
         SetFileName;
         InitExportFormat(ExcludeFormat);
         SetExt(ExportTag);
         SetDataSet(ds, ExportColumns);
         if SelectAll then begin
            FExportColumns.ShowAll;
         end
         else begin
            // что бы можно было передавать параметром
            //--FExportColumns.HideAll;
         end;
         if ShowModal=mrOk then begin
           Result:=true;
            //
            if chbNppColumn.Checked then begin
               NppColumn:=TExportColumn.Create('', -1);
               NppColumn.DisplayName:='є п/п';
               NppColumn.Caption:='є п/п';
               FExportColumns.Insert(0, NppColumn);
            end;
            //
            sFields:='';
            for I:=0 to Pred(ExportColumns.Count) do begin
               Column:=FExportColumns.ByFieldName(ExportColumns[I].FieldName);
               if (Column<>nil) and Column.Visible then begin
                 sFields:=sFields+Column.DisplayName+'('+Column.FieldNameInFile+'),';
               end;
            end;
            sFields:=Copy(sFields,1,Length(sFields)-1);
            //----------------------------------------
            s:=ds.ClassName+'('+ds.Name+')';
            if ds is TAdsQuery then begin
              s:=StringReplace(TAdsQuery(ds).SQL.Text, #13#10, ' ', [rfReplaceAll]);
            end else if ds is TAdsTable then begin
              s:='TableName:'+TAdsTable(ds).TableName+' ';
            end;
            if (ds.Filter<>'') and ds.Filtered
              then s:=s+', filter='+ds.Filter;
            GlobalTask.WriteToLogFile(sAdd+' эскпорт ('+FormatExt[FTarget]+')'#13#10+'  '+CheckLastSim(s,#13#10)+'  Fields:'+sFields);
            //----------------------------------------
            DoExport(Msg);
         end;
         //[2007.08.06] запоминаем видимые графы
         if ExportColumns<>nil then begin
            ExportColumns.HideAll;
            for I:=0 to Pred(ExportColumns.Count) do begin
               Column:=FExportColumns.ByFieldName(ExportColumns[I].FieldName);
               if (Column<>nil) and Column.Visible then begin
                  ExportColumns[I].Visible:=True;
               end;
            end;
         end;
      finally
         Free;
         if DirectoryExists(CurDir) then begin
            SetCurrentDir(CurDir);
         end;
      end;
   end;
end;


function GetExtIcon(AExt: string): HICON;
var
   Info: SHFileInfo;
begin
   SHGetFileInfo(PChar('*.'+AExt),
      FILE_ATTRIBUTE_NORMAL,
      Info,
      SizeOf(Info),
      SHGFI_ICON or SHGFI_USEFILEATTRIBUTES);
   Result:=Info.hIcon;
end;

{ TfmExportDS }

procedure TfmExpds.SetExt(AExt: TExportFormat);
var
   Ext: string;
begin
   if MapRadioGroup[AExt]<>-1 then begin
      Ext:=FormatExt[AExt];
      imIcon.Picture.Icon.Handle:=GetExtIcon(Ext);
      if feFile.Text<>'' then begin
         feFile.Text:=ChangeFileExt(feFile.Text, '.'+Ext);
      end;
      sdFile.DefaultExt:=Ext;
      sdFile.Filter:=Format('*.%s|*.%s', [Ext, Ext]);
      FTarget:=AExt;
      rgFormat.ItemIndex:=MapRadioGroup[FTarget];
   end;
   chbGridLine.Enabled:=AExt in [efRtf, efXls];
   chbLandscape.Enabled:=AExt in [efRtf];
end;

procedure TfmExpds.rgFormatClick(Sender: TObject);
begin
   SetExt(TExportFormat(rgFormat.Items.Objects[rgFormat.ItemIndex]));
end;

procedure TfmExpds.btFieldsClick(Sender: TObject);
begin
   SelectColumn('', FDataSet, FExportColumns);
end;

procedure TfmExpds.SetDataSet(ds: TDataSet; ExportColumns: TExportColumnList);
var
   I: Integer;
   Field: TField;
   ExportColumn: TExportColumn;
begin
   FDataSet:=ds;
   if ExportColumns=nil then begin
      FExportColumns.Clear;
      for I:=0 to Pred(FDataSet.FieldCount) do begin
         Field:=FDataSet.Fields[I];
         ExportColumn:=FExportColumns.AddNew(Field.FieldName, Field.Index);
         ExportColumn.DisplayName:=Field.DisplayLabel;
         ExportColumn.DisplayWidth:=Field.DisplayWidth;
         ExportColumn.Caption:=Field.DisplayLabel;
         ExportColumn.Visible:=Field.Visible;
      end;
   end
   else begin
      FExportColumns.Assign(ExportColumns);
   end;
end;

procedure TfmExpds.edfChange(Sender: TObject);
begin
   FFileName:=feFile.Text;
end;

procedure TfmExpds.chbShowResultClick(Sender: TObject);
begin
   FShowResult:=chbShowResult.Checked;
end;

procedure TfmExpds.DoExport(Msg: string);
begin
   FFileName:=ExpandFileName(ChangeFileExt(FFileName, '.'+FormatExt[FTarget]));
   FExportColumns.GridLine:=FGridLine;
   DoExportData(FFileName, Msg, '', FDataSet, FExportColumns, FTarget, FShowResult, False, FShowGauge, 100, 100, chbLandscape.Checked, FBookmark);
end;

procedure TfmExpds.SetFileName;
begin
   FFileName:='export.txt';
   feFile.Text:=FFileName;
   edCurDir.Text:=GetCurrentDir;
end;

procedure TfmExpds.feFileButtonClick(Sender: TObject);
begin
   sdFile.InitialDir:=GetCurrentDir;
   if sdFile.Execute then begin
      feFile.Text:=ExtractFileName(sdFile.FileName);
      edCurDir.Text:=GetCurrentDir;
   end;
end;

procedure TfmExpds.FormCreate(Sender: TObject);
begin
   FExportColumns:=TExportColumnList.Create;
   FShowResult:=True;
   chbShowResult.Checked:=FShowResult;
   FShowGauge:=True;
   chbShowProgress.Checked:=FShowGauge;
   FGridLine:=True;
   chbGridLine.Checked:=FGridLine;
end;

procedure TfmExpds.FormDestroy(Sender: TObject);
begin
   FExportColumns.Free;
end;

procedure TfmExpds.chbShowProgressClick(Sender: TObject);
begin
   FShowGauge:=chbShowProgress.Checked;
end;

procedure TfmExpds.btOkClick(Sender: TObject);
begin
   if FExportColumns.IsVisible then begin
      ModalResult:=mrOk;
   end
   else begin
      ShowMessage('Ёкспорт невозможен - не выбрана ни одна графа.');
   end;
end;

procedure TfmExpds.feFileEditButtons(Sender: TObject; var Handled: Boolean);
begin
   sdFile.InitialDir:=GetCurrentDir;
   if sdFile.Execute then begin
      feFile.Text:=ExtractFileName(sdFile.FileName);
      edCurDir.Text:=GetCurrentDir;
   end;
   Handled:=True;
end;

procedure TfmExpds.InitExportFormat(ExludeFormat: TExportFormats);
var
   ExportFormat: TExportFormat;
begin
   rgFormat.Items.Clear;
   for ExportFormat:=Low(TExportFormat) to High(TExportFormat) do begin
      if not (ExportFormat in ExludeFormat) then begin
         MapRadioGroup[ExportFormat]:=rgFormat.Items.Add(FormatName[ExportFormat]);
         rgFormat.Items.Objects[MapRadioGroup[ExportFormat]]:=TObject(ExportFormat);
      end;
   end;
end;

procedure TfmExpds.chbGridLineClick(Sender: TObject);
begin
   FGridLine:=chbGridLine.Checked;
end;

end.
