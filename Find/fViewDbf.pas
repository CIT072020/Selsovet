unit fViewDbf; // view dbf-file form
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, Grids, DBGridEh, Menus, ActnList, adstable, adscnnct, adsset, adsdata,
   adsfunc;

type
   TfmViewDbf=class(TForm)
      dgTable: TDBGridEh;
      dsoTable: TDataSource;
      acDbf: TActionList;
      mmDbf: TMainMenu;
      acOpen: TAction;
      acExit: TAction;
      miFile: TMenuItem;
      miOpen: TMenuItem;
      miExit: TMenuItem;
      procedure dgTableKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure acOpenExecute(Sender: TObject);
      procedure acExitExecute(Sender: TObject);
   protected
      procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
   end;

function ViewDbf(FileName: string): Integer;

implementation

{$R *.DFM}

function ViewDbf(FileName: string): Integer;
var
   Table: TAdsTable;
   OpenDialog: TOpenDialog;
begin
   if FileName='' then begin
      OpenDialog:=TOpenDialog.Create(Application);
      try
         if OpenDialog.Execute then begin
            FileName:=OpenDialog.FileName;
         end;
      finally
         OpenDialog.Free;
      end;
   end;
   Result:=mrCancel;
   if (FileName<>'') and FileExists(FileName) then begin
      with TfmViewDbf.Create(nil) do begin
         try
            FileName:=ExpandFileName(FileName);
            Caption:=Format(Caption, [FileName]);
            Table:=TAdsTable.Create(nil);
            Table.TableType:=ttAdsNTX;
            Table.DatabaseName:=ExtractFilePath(FileName);
            Table.TableName:=ExtractFileName(FileName);
            Table.AdsTableOptions.AdsCharType:=OEM;
            dsoTable.DataSet:=Table;
            dsoTable.DataSet.Open;
            Result:=ShowModal;
         finally
            if dsoTable.DataSet<>nil then begin
               dsoTable.DataSet.Close;
               dsoTable.DataSet.Free;
            end;
            Free;
         end;
      end;
   end;
end;

procedure TfmViewDbf.dgTableKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE: begin
         Key:=0;
         ModalResult:=mrCancel;
      end;
   end;
end;

procedure TfmViewDbf.WMSysCommand(var Msg: TWMSysCommand);
begin
   if (Msg.CmdType and $FFF0)=SC_MINIMIZE then begin
      Application.Minimize;
   end
   else begin
      inherited;
   end;
end;

procedure TfmViewDbf.acOpenExecute(Sender: TObject);
var
   FileName: string;
   OpenDialog: TOpenDialog;
   Table: TAdsTable;
begin
   OpenDialog:=TOpenDialog.Create(Application);
   try
      if OpenDialog.Execute then begin
         FileName:=OpenDialog.FileName;
         FileName:=ExpandFileName(FileName);
         Caption:=Format('Просмотр файла %s', [FileName]);
         if dsoTable.DataSet<>nil then begin
            dsoTable.DataSet.Close;
            dsoTable.DataSet.Free;
         end;
         Table:=TAdsTable.Create(nil);
         Table.TableType:=ttAdsNTX;
         Table.DatabaseName:=ExtractFilePath(FileName);
         Table.TableName:=ExtractFileName(FileName);
         Table.AdsTableOptions.AdsCharType:=OEM;
         dsoTable.DataSet:=Table;
         dsoTable.DataSet.Open;
      end;
   finally
      OpenDialog.Free;
   end;
end;

procedure TfmViewDbf.acExitExecute(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

end.
