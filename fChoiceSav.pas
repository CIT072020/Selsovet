// форма для сохранения выбранных адресатов
unit fChoiceSav;
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db,
   ComCtrls, StdCtrls, Menus, ImgList, ActnList, ToolWin, FileCtrl, FuncPr, mFindInt,
   ElTree, ExtCtrls, IniFiles, TypInfo, ElXPThemedControl;

type
   TDialogView=(
      dvList,
      dvReport,
      dvPreview
   );

   TfmChoiceSave = class(TForm)
      laFolder: TLabel;
      cbFolder: TComboBox;
      laCaption: TLabel;
      edCaption: TEdit;
      btOk: TButton;
      btCancel: TButton;
      imDialog: TImageList;
      acDialog: TActionList;
      acFolderUp: TAction;
      acSave: TAction;
      acOpen: TAction;
      acDelete: TAction;
      pmDialog: TPopupMenu;
      miDelete: TMenuItem;
      acNewFolder: TAction;
      acListView: TAction;
      acReportView: TAction;
      acPreview: TAction;
      paDialog: TPanel;
      lvList: TListView;
      paToolBar: TPanel;
      tbaDialog: TToolBar;
      tbFolderUp: TToolButton;
      tbNewFolder: TToolButton;
      tbDelete: TToolButton;
      tbaView: TToolBar;
      tbListView: TToolButton;
      tbReportView: TToolButton;
      tbPreView: TToolButton;
    edFind: TMemo;
      procedure lvListSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
      procedure lvListDblClick(Sender: TObject);
      procedure btOkClick(Sender: TObject);
      procedure edCaptionChange(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure acDeleteExecute(Sender: TObject);
      procedure acFolderUpExecute(Sender: TObject);
      procedure acNewFolderExecute(Sender: TObject);
      procedure cbFolderDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
      procedure cbFolderChange(Sender: TObject);
      procedure acListViewExecute(Sender: TObject);
      procedure acReportViewExecute(Sender: TObject);
      procedure acPreviewExecute(Sender: TObject);
      procedure tvFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   private
      FBaseDir: string;
      FFolder: string;
      FSave: Boolean;
      FNames: TStringList;
//      FFilter: TFindList;
      FFolderUp: TStringList;
      FFolders: TStringList;
//      FPreView: TFindList;
//      FFilterInterface: TFilterInterface;
      FViewType: TDialogView;
   public
      function GetName: string;
      procedure SetBaseDir(BaseDir: string);
      procedure SetFolder(Folder: string);
      function GetSaveName: string;
      function GetOpenName: string;
      procedure UpdateButton;
      function CheckName(Name: string; Unique: Boolean): Boolean;
      function IsCurrentFilter(Name: string): Boolean;
      procedure ChangeFolder;
      procedure SetView(View: TDialogView);
      procedure SetPreview(IsVisible: Boolean);
      procedure ShowPreview;
      procedure SaveLayout(Ini: TCustomIniFile; Section: string);
      procedure LoadLayout(Ini: TCustomIniFile; Section: string);
   end;

function SaveMultiChoice(Ini: TCustomIniFile; sBaseDir:String; dsOrg:TDataSet; NewFilter: Boolean): Boolean;
function LoadMultiChoice(Ini: TCustomIniFile; sBaseDir:String; dsOrg:TDataSet): Boolean;

const
   II_Find=0;
   II_Folder=1;
   II_CloseFolder=1;
   II_OpenFolder=2;

implementation
//uses
//   fFind2, fFindAdd;

{$R *.DFM}

const
  SECTION='MUILTICHOICE';
  ZAG='MUILTICHOICE='#13#10;

function SaveMultiChoice(Ini: TCustomIniFile; sBaseDir:String; dsOrg:TDataSet; NewFilter: Boolean): Boolean;
var
   FileName: string;
   Err,s: string;
begin
   Result:=False;
   with TfmChoiceSave.Create(nil) do begin
      try
         FSave:=True;
//         FFilter:=Filter;
         Caption:='Сохранить список';
         btOk.Caption:='Сохранить';
         SetBaseDir(sBaseDir);
         edCaption.Text:=''; //Filter.Caption;
         ChangeFolder;
         UpdateButton;
         LoadLayout(Ini, SECTION);
         if ShowModal=mrOk then begin
           FileName:=GetSaveName;
           dsOrg.DisableControls;
           dsOrg.First;
           s:=ZAG+#13#10;
           while not dsOrg.Eof do begin
             s:=s+dsOrg.FieldByName('ID').AsString+'-'+dsOrg.FieldByName('NAME').AsString+#13#10;
             dsOrg.Next;
           end;
           dsOrg.First;
           dsOrg.EnableControls;
           MemoWrite(FileName, s);
         end;
         SaveLayout(ini, SECTION);
      finally
         Free;
      end;
   end;
end;

function LoadMultiChoice(Ini: TCustomIniFile; sBaseDir:String; dsOrg:TDataSet): Boolean;
var
   FileName: string;
   s,Err: string;
   i,n:Integer;
   arr:TArrStrings;
begin
   Result:=False;
   with TfmChoiceSave.Create(nil) do begin
      try
         FSave:=False;
//         FFilterInterface:=FilterInterface;
//         FFilter:=Filter;
         Caption:='Открыть список';
         btOk.Caption:='Открыть';
         SetBaseDir(sBaseDir);
         ChangeFolder;
         UpdateButton;
         LoadLayout(Ini, SECTION);
         if ShowModal=mrOk then begin
            FileName:=GetOpenName;
            if FileName<>'' then begin
              MemoRead(FileName, s);
              if (ANSIUpperCase(Copy(s,1,Length(ZAG)))=ZAG) then begin
                s:=Copy(s,Length(ZAG)+1,Length(s));
                dsOrg.DisableControls;
                dsOrg.First;
                while not dsOrg.Eof do begin
                  dsOrg.Delete;
                  dsOrg.First;
                end;
                StrToArr(s,arr,#13#10,true);
                for i:=0 to Length(arr)-1 do begin
                  n:=Pos('-',arr[i]);
                  if n>0 then begin
                    dsOrg.Append;
                    dsOrg.FieldByName('ID').AsString:=Copy(arr[i],1,n-1);
                    dsOrg.FieldByName('NAME').AsString:=Copy(arr[i],n+1,Length(arr[i]));
                    dsOrg.Post;
                  end;
                end;
                dsOrg.First;
                dsOrg.EnableControls;
                Result:=True;
              end else begin
                PutError('Ошибка открытия');
              end;
            end;
         end;
         SaveLayout(Ini, SECTION);
      finally
         Free;
      end;
   end;
end;

{ TfmChoiceSave }

procedure TfmChoiceSave.SetBaseDir(BaseDir: string);
begin
   FBaseDir:=BaseDir;
   FFolderUp.Clear;
   SetFolder(FBaseDir);
end;

procedure TfmChoiceSave.lvListSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
   if lvList.Selected<>nil then begin
      case Integer(lvList.Selected.Data) of
         // папка
         1: begin
            ShowPreview;
         end;
         // фильтр
         2: begin
            edCaption.Text:=lvList.Selected.Caption;
            ShowPreview;
         end;
      end;
   end;
   UpdateButton;
end;

procedure TfmChoiceSave.lvListDblClick(Sender: TObject);
begin
   if lvList.Selected<>nil then begin
      case Integer(lvList.Selected.Data) of
         // папка
         1: begin
            FFolderUp.Insert(0, FFolder);
            SetFolder(FFolder+'\'+lvList.Selected.Caption);
            ChangeFolder;
         end;
         // фильтр
         2: begin
            if not FSave then begin
               btOkClick(nil);
            end;
         end;
      end;
   end;
end;

procedure TfmChoiceSave.btOkClick(Sender: TObject);
var
   Name: string;
begin
   Name:=GetName;
   if FSave then begin
      if CheckName(Name, False) then begin
         if FNames.IndexOf(AnsiUpperCase(Name))=-1 then begin
            ModalResult:=mrOk;
         end
         else if Problem('Список условий для поиска с таким названием уже существует, перезаписать?', mtConfirmation) then begin
            ModalResult:=mrOk;
         end;
      end;
   end
   else begin
      if FNames.IndexOf(AnsiUpperCase(Name))=-1 then begin
         ShowMessage('Список условий для поиска с указанным названием отсутствует');
      end
      else if IsCurrentFilter(Name) then begin
         if Problem('Список условий для поиска с таким названием уже открыт, переоткрыть?', mtConfirmation) then begin
            ModalResult:=mrOk;
         end;
      end
      else begin
         ModalResult:=mrOk;
      end;
   end;
end;

procedure TfmChoiceSave.SetFolder(Folder: string);
var
   sr: TSearchRec;
   ListItem: TListItem;
   LastFolderIndex: Integer;
begin
   FFolder:=Folder;
   lvList.Items.BeginUpdate;
   try
      lvList.Items.Clear;
      FFolders.Clear;
      FNames.Clear;
      if FindFirst(Folder+'\*', faAnyFile, sr)=0 then begin
         LastFolderIndex:=0;
         repeat
            if (sr.Attr and faDirectory)=faDirectory then begin
               if (sr.Name<>'.') and (sr.Name<>'..') then begin
                  FFolders.Add(sr.Name);
                  ListItem:=lvList.Items.Insert(LastFolderIndex);
                  ListItem.Caption:=sr.Name;
                  ListItem.ImageIndex:=II_Folder;
                  ListItem.Data:=Pointer(1);
                  ListItem.SubItems.Add('Папка');
                  ListItem.SubItems.Add(FormatDateTime('DD.MM.YYYY HH:NN', FileDateToDateTime(sr.Time)));
                  LastFolderIndex:=Succ(ListItem.Index);
               end;
            end
            else begin
               ListItem:=lvList.Items.Add;
               ListItem.Caption:=ChangeFileExt(sr.Name, '');
               ListItem.ImageIndex:=II_Find;
               ListItem.Data:=Pointer(2);
               ListItem.SubItems.Add('Список условий');
               ListItem.SubItems.Add(FormatDateTime('DD.MM.YYYY HH:NN', FileDateToDateTime(sr.Time)));
               FNames.Add(AnsiUpperCase(ListItem.Caption));
            end;
         until FindNext(sr)<>0;
         FindClose(sr);
      end;
   finally
      lvList.Items.EndUpdate;
   end;
   UpdateButton;
end;

function TfmChoiceSave.GetSaveName: string;
begin
   Result:=FFolder+'\'+GetName+'.flt';
end;

function TfmChoiceSave.GetOpenName: string;
begin
   Result:=GetSaveName;
end;

procedure TfmChoiceSave.edCaptionChange(Sender: TObject);
begin
   UpdateButton;
end;

procedure TfmChoiceSave.UpdateButton;
begin
   btOk.Enabled:=GetName<>'';
   acDelete.Enabled:=lvList.Selected<>nil;
   acFolderUp.Enabled:=FFolderUp.Count>0;
end;

function IsBadChar(Name: string): Boolean;
var
   I: Integer;
begin
   Result:=False;
   for I:=1 to Length(Name) do begin
      if IsDelimiter('`=[]''./\|~!@#$%^&*+{}"<>?', Name, I) then begin
         Result:=True;
         Break;
      end;
   end;
end;

function TfmChoiceSave.CheckName(Name: string; Unique: Boolean): Boolean;
begin
   Result:=False;
   if Name='' then begin
      ShowMessage('Необходимо ввести название, под которым будет сохранен список условий для поиска');
   end
   else if IsBadChar(Name) then begin
      ShowMessage('В названии можно использовать только буквы русского/английского алфавита, цифры, пробел и символ подчеркивания');
   end
   else if Unique and (FNames.IndexOf(AnsiUpperCase(Name))<>-1) then begin
      ShowMessage('Список условий для поиска с таким названием уже существует');
   end
   else begin
      Result:=True;
   end;
end;

procedure TfmChoiceSave.FormCreate(Sender: TObject);
begin
   FNames:=TStringList.Create;
   FNames.Sorted:=True;
   FFolders:=TStringList.Create;
   FFolderUp:=TStringList.Create;
//   FPreView:=TFindList.Create('', '', '', False);
end;

procedure TfmChoiceSave.FormDestroy(Sender: TObject);
begin
   lvList.OnSelectItem:=nil;
//   FPreView.Free;
   FNames.Free;
   FFolderUp.Free;
   FFolders.Free;
end;

procedure TfmChoiceSave.acDeleteExecute(Sender: TObject);
var
   Name: string;
   FileName: string;
begin
   if lvList.Selected<>nil then begin
      case Integer(lvList.Selected.Data) of
         // папка
         1: begin
            RemoveDir(FFolder+'\'+lvList.Selected.Caption);
            SetFolder(FFolder);
         end;
         // фильтр
         2: begin
            if FSave then begin
               FileName:=GetSaveName;
            end
            else begin
               FileName:=GetOpenName;
            end;
            Name:=lvList.Selected.Caption;
            if Problem(Format('Удалить список условий для поиска "%s"?', [Name]), mtConfirmation) then begin
               try
                  if DeleteFile(FileName) then begin
                     lvList.Items.Delete(lvList.Selected.Index);
                     if IsCurrentFilter(Name) then begin
//                         FFilter.Folder:='';
                     end;
                  end;
               except
                  on E: Exception do begin
                     PutError(Format('Ошибка удаления: %s', [E.Message]));
                  end;
               end;
            end;
            ShowPreview;
         end;
      end;
   end;
end;

function TfmChoiceSave.IsCurrentFilter(Name: string): Boolean;
begin
   Result:=true
//   Result:=(AnsiCompareText(FFilter.Folder, FFolder)=0) and (AnsiCompareText(Name, FFilter.Caption)=0)
end;

procedure TfmChoiceSave.acFolderUpExecute(Sender: TObject);
begin
   if FFolderUp.Count>0 then begin
      SetFolder(FFolderUp[0]);
      FFolderUp.Delete(0);
      ChangeFolder;
   end;
end;

procedure TfmChoiceSave.acNewFolderExecute(Sender: TObject);
var
   NewFolder: string;
begin
   NewFolder:='';
   if InputQueryR('Создать папку', 'Введите имя новой папки', NewFolder) then begin
      NewFolder:=Trim(NewFolder);
      if (NewFolder<>'') and (FFolders.IndexOf(NewFolder)=-1) and not IsBadChar(NewFolder) then begin
         ForceDirectories(FFolder+'\'+NewFolder);
         SetFolder(FFolder);
      end;
   end;
end;

function TfmChoiceSave.GetName: string;
begin
   Result:=Trim(edCaption.Text);
end;

procedure TfmChoiceSave.ChangeFolder;
var
   I: Integer;
begin
   cbFolder.Items.Clear;
   for I:=Pred(FFolderUp.Count) downto 0 do begin
      cbFolder.Items.Add(ExtractFileName(FFolderUp[I]));
   end;
   cbFolder.Items.Add(ExtractFileName(FFolder));
   cbFolder.ItemIndex:=Pred(cbFolder.Items.Count);
   UpdateButton
end;

procedure TfmChoiceSave.cbFolderDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
   S: string;
   B: Integer;
   ImageIndex: Integer;
begin
   S:=cbFolder.Items[Index];
   ImageIndex:=II_OpenFolder;
   if odComboBoxEdit in State then begin
      B:=0;
   end
   else begin
      B:=Index*10;
      if Index<>Pred(cbFolder.Items.Count) then begin
         ImageIndex:=II_CloseFolder;
      end;
   end;
   cbFolder.Canvas.Brush.Color:=cbFolder.Color;
   cbFolder.Canvas.FillRect(Rect);
   cbFolder.Canvas.Font.Color:=cbFolder.Font.Color;
   imDialog.Draw(cbFolder.Canvas, Rect.Left+2+B, Rect.Top, ImageIndex, True);
   cbFolder.Canvas.TextOut(Rect.Left+B+4+16+2, Rect.Top+1, S);
end;

procedure TfmChoiceSave.cbFolderChange(Sender: TObject);
const
   InEvent: Boolean=False;
var
   I: Integer;
   S: string;
begin
   if InEvent then Exit;
   InEvent:=True;
   try
      if cbFolder.ItemIndex<>-1 then begin
         S:=FBaseDir;
         for I:=1 to cbFolder.ItemIndex do begin
            S:=S+'\'+cbFolder.Items[I];
         end;
         for I:=Pred(cbFolder.Items.Count) downto Succ(cbFolder.ItemIndex) do begin
            FFolderUp.Delete(0);
         end;
         SetFolder(S);
         ChangeFolder;
      end;
   finally
      InEvent:=False;
   end;
end;

procedure TfmChoiceSave.acListViewExecute(Sender: TObject);
begin
   SetView(dvList);
end;

procedure TfmChoiceSave.acReportViewExecute(Sender: TObject);
begin
   SetView(dvReport);
end;

procedure TfmChoiceSave.acPreviewExecute(Sender: TObject);
begin
   SetView(dvPreview);
end;

procedure TfmChoiceSave.SetPreview(IsVisible: Boolean);
var
   W: Integer;
begin
   W:=(paDialog.Width-6) div 2;
   if IsVisible then begin
      lvList.Align:=alLeft;
      lvList.Width:=W;
      edFind.Visible:=True;
      edFind.Width:=W;
      ShowPreview;
   end
   else begin
      edFind.Visible:=False;
      edFind.Width:=0;
      lvList.Align:=alClient;
   end;
end;

procedure TfmChoiceSave.SetView(View: TDialogView);
begin
   FViewType:=View;
   case View of
      dvList: begin
         lvList.ViewStyle:=vsList;
         SetPreview(False);
         tbListView.Down:=True;
      end;
      dvReport: begin
         lvList.ViewStyle:=vsReport;
         SetPreview(False);
         tbReportView.Down:=True;
      end;
      dvPreview: begin
         lvList.ViewStyle:=vsList;
         SetPreview(True);
         tbPreView.Down:=True;
      end;
   end;
end;

procedure TfmChoiceSave.ShowPreview;
var
   Err: string;
begin
   if edFind.Visible then begin
      if (lvList.Selected<>nil) and (Integer(lvList.Selected.Data)=2) then begin
         try
            if (FindForm<>nil) and FPreView.LoadFromFile(FFolder+'\'+lvList.Selected.Caption+'.flt', Err, FFilterInterface.FindFieldList, FFilterInterface.OperList) then begin
               FindForm.BuildFindTree(tvFind, FPreView);
            end;
         except
            tvFind.Items.Clear;
         end;
      end
      else begin
         tvFind.Items.BeginUpdate;
         try
            tvFind.Items.Clear;
         finally
            tvFind.Items.EndUpdate;
         end;
      end;
   end;
end;

procedure TfmChoiceSave.tvFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_LEFT: Key:=VK_UP;
      VK_RIGHT: Key:=VK_DOWN;
   end;
end;

procedure TfmChoiceSave.LoadLayout(Ini: TCustomIniFile; Section: string);
begin
   SetComboBoxHeight(cbFolder, 0);
   if (Ini<>nil) and (Section<>'') then begin
      SetView(TDialogView(GetEnumValue(TypeInfo(TDialogView), Ini.ReadString(Section, 'FndSave.View', 'dvList')))); ;
   end;
end;

procedure TfmChoiceSave.SaveLayout(Ini: TCustomIniFile; Section: string);
begin
   if (Ini<>nil) and (Section<>'') then begin
      Ini.WriteString(Section, 'FndSave.View', GetEnumName(TypeInfo(TDialogView), Ord(FViewType)));
   end;
end;

end.
