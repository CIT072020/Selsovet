unit mTplInt; // 19.10.2005
interface
uses
   Classes, SysUtils, Forms, Controls, TB2Item, mTempl, mTemplS, Script;

type

   // интерфейсный объект, для доступа к механизму шаблонов
   TTemplateInterface=class(TObject)
   private
      FEngine: TTemplateEngine;
      FDefaultScript: TScript;
      FDefaultDatabaseName: string;
      FDefaultParameterIniFile: string;
      // имя папки, в которую сохранять сгенерированные документы
      // должно заканчиваться на '\'
      // по умолчанию ExtractFilePath(Application.ExeName)+'output\'
      FOutputDir: string;
      // имя папки, в которой должны находиться шаблоны отчётов
      // должно заканчиваться на '\'
      // по умолчанию ExtractFilePath(Application.ExeName)+'template\'
      FTemplateDir: string;
      // если файл с именем результата шаблона уже существует, то программа
      // выдаст запрос на подтверждение его перезаписи (по умолчанию False)
      //FConfirmRewrite: Boolean;
   private
      function CheckFileName(FileName: string): string;
   public
      constructor Create;
      destructor Destroy; override;
      function BuildMenu(TemplateGroup: string; Menu: TTBSubMenuItem; DoClear: Boolean; OnClick: TNotifyEvent): Boolean;
      function ReadTemplateList(TemplateIniFile: string; Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
      function SetTemplate(ParameterIniFile, DatabaseName: string; Script: TScript; Template: TTemplate): Boolean;
      function SetSimpleTemplate(FullName: string): Boolean;
      procedure SetParams(DateFiks: TDateTime; PID, LicId: Word);
      procedure OnMenuClick(Sender: TObject);
      function GetTemplate(FullName: string):TTemplate;
      function GetFullNameFile(Template:TTemplate):String;
   public
      property Engine: TTemplateEngine read FEngine;
      property DefaultScript: TScript read FDefaultScript write FDefaultScript;
      property DefaultDatabaseName: string read FDefaultDatabaseName write FDefaultDatabaseName;
      property DefaultParameterIniFile: string read FDefaultParameterIniFile write FDefaultParameterIniFile;
      property OutputDir: string read FOutputDir write FOutputDir;
      property TemplateDir: string read FTemplateDir write FTemplateDir;
      //property ConfirmRewrite: Boolean read FConfirmRewrite write FConfirmRewrite;
      property Template[FullName: string]: TTemplate read GetTemplate; default;
   end;

implementation

{ TTemplateInterface }

procedure FillSubMenuList(Menu: TTBSubMenuItem; Caption: string; SubMenuList: TStringList);
var
   I: Integer;
   SubMenuItem: TTBSubMenuItem;
begin
   for I:=0 to Pred(Menu.Count) do begin
      if Menu.Items[I] is TTBSubMenuItem then begin
         SubMenuItem:=Menu.Items[I] as TTBSubMenuItem;
         Caption:=Caption+'\'+AnsiUpperCase(SubMenuItem.Caption);
         SubMenuList.AddObject(Caption, SubMenuItem);
         FillSubMenuList(SubMenuItem, Caption, SubMenuList);
      end;
   end;
end;

function TTemplateInterface.BuildMenu(TemplateGroup: string; Menu: TTBSubMenuItem; DoClear: Boolean; OnClick: TNotifyEvent): Boolean;
var
   I: Integer;
   Ind: Integer;
   P: Integer;
   S: string;
   S1: string;
   SubMenuPath: string;
   Template: TTemplate;
   MenuItem: TTBItem;
   SubMenuItem: TTBSubMenuItem;
   SubMenuItem1: TTBSubMenuItem;
   SubMenuList: TStringList;
begin
   Result:=False;
   if Menu<>nil then begin
      SubMenuList:=TStringList.Create;
      try
         if DoClear then begin
            Menu.Clear;
         end
         else begin
            FillSubMenuList(Menu, '', SubMenuList);
         end;
         TemplateGroup:=Trim(TemplateGroup);
         for I:=0 to Pred(FEngine.TemplateList.Count) do begin
            Template:=FEngine.TemplateList[I];
            if (Template<>nil) and (AnsiCompareText(TemplateGroup, Template.Group)=0) then begin
               Result:=True;
               if Template.SubMenu='' then begin
                  SubMenuItem:=Menu;
               end
               else begin
                  SubMenuItem:=Menu;
                  SubMenuPath:='';
                  S:=Template.SubMenu;
                  repeat
                     P:=Pos('\', S);
                     if P>0 then begin
                        Delete(S, 1, P);
                        S1:=Copy(S, 1, Pred(P));
                     end
                     else begin
                        S1:=S;
                     end;
                     Ind:=SubMenuList.IndexOf(SubMenuPath+'\'+S1);
                     if Ind<>-1 then begin
                        SubMenuPath:=SubMenuPath+'\'+S1;
                        SubMenuItem:=TTBSubMenuItem(SubMenuList.Objects[Ind]);
                     end
                     else begin
                        SubMenuItem1:=TTBSubMenuItem.Create(Menu.Owner);
                        SubMenuItem1.Caption:=S1;
                        SubMenuItem.Add(SubMenuItem1);
                        SubMenuItem:=SubMenuItem1;
                        SubMenuPath:=SubMenuPath+'\'+S1;
                        SubMenuList.AddObject(SubMenuPath, SubMenuItem);
                     end;
                  until P=0;
               end;
               MenuItem:=TTBItem.Create(Menu.Owner);
               MenuItem.Tag:=Integer(Template);
               MenuItem.Caption:=Template.Caption;
               if Assigned(OnClick) then begin
                  MenuItem.OnClick:=OnClick;
               end
               else begin
                  MenuItem.OnClick:=OnMenuClick;
               end;
               SubMenuItem.Add(MenuItem);
            end;
         end;
      finally
         SubMenuList.Free;
      end;
   end;
end;

function TTemplateInterface.CheckFileName(FileName: string): string;
begin
   if ExtractFilePath(FileName)='' then begin
      Result:=ExtractFilePath(Application.ExeName)+'template\'+Trim(FileName);
   end
   else begin
      Result:=Trim(FileName);
   end;
end;

constructor TTemplateInterface.Create;
begin
   FEngine:=TTemplateEngine.Create;
   FEngine.TemplateReaderClass:=TReadTemplateFromIni;
   //FEngine.ParameterReaderClass:=TReadParameterFromIni;
   FEngine.ParameterReaderClass:=TReadParameterFromRtf;
   FEngine.FormGeneratorClass:=TDefaultFormGenerator;
   //FEngine.DataGetterClass:=TAdsDataGetter;
   FEngine.DataGetterClass:=TROPScriptDataGetter;
   FEngine.FormSetterClass:=TDefaultFormSetter;
   FEngine.FormGetterClass:=TDefaultFormGetter;
   //FEngine.TextGeneratorClass:=TWordGenerator;
   FEngine.TextGeneratorClass:=TRtfGenerator;
   FEngine.TextViewerClass:=TDefaultTextViewer;
   FOutputDir:=ExtractFilePath(Application.ExeName)+'output\';
   FTemplateDir:=ExtractFilePath(Application.ExeName)+'template\';
   //FConfirmRewrite:=False;
end;

destructor TTemplateInterface.Destroy;
begin
   FEngine.Free;
   inherited;
end;

procedure TTemplateInterface.OnMenuClick(Sender: TObject);
var
   Template: TTemplate;
begin
   if (Sender<>nil) and (Sender is TComponent) then begin
      Template:=TTemplate(TComponent(Sender).Tag);
      if Template<>nil then begin
         if Trim(FDefaultParameterIniFile)<>'' then begin
            SetTemplate(FDefaultParameterIniFile, FDefaultDatabaseName, FDefaultScript, Template)
         end
         else begin
            SetTemplate(TemplateDir+Template.TemplateFile, FDefaultDatabaseName, FDefaultScript, Template)
         end;
      end;
   end;
end;

function TTemplateInterface.ReadTemplateList(TemplateIniFile: string; Menu: TTBSubMenuItem; OnClick: TNotifyEvent): Boolean;
var
   I: Integer;
   Template: TTemplate;
   MenuItem: TTBItem;
begin
   TemplateIniFile:=CheckFileName(TemplateIniFile);
   Result:=FEngine.ReadTemplateList(TemplateIniFile);
   if Menu<>nil then begin
      Menu.Clear;
      if Result then begin
         for I:=0 to Pred(FEngine.TemplateList.Count) do begin
            Template:=FEngine.TemplateList[I];
            if Template<>nil then begin
               MenuItem:=TTBItem.Create(Menu.Owner);
               MenuItem.Tag:=Integer(Template);
               MenuItem.Caption:=Template.Caption;
               if Assigned(OnClick) then begin
                  MenuItem.OnClick:=OnClick;
               end
               else begin
                  MenuItem.OnClick:=OnMenuClick;
               end;
               Menu.Add(MenuItem);
            end;
         end;
      end;
   end;
end;

procedure TTemplateInterface.SetParams(DateFiks: TDateTime; PID, LicId: Word);
begin
   FEngine.Params.Values['LIC_ID']:=IntToStr(LicId);
   FEngine.Params.Values['PID']:=IntToStr(PID);
   FEngine.Params.Values['DATE_FIKS']:='"'+FormatDateTime('YYYY-MM-DD', DateFiks)+'"';
end;

function TTemplateInterface.SetSimpleTemplate(FullName: string): Boolean;
var
   Template: TTemplate;
begin
   Result:=False;
   Template:=FEngine.TemplateList.GetByName(FullName);
   if Template<>nil then begin
      if Trim(FDefaultParameterIniFile)<>'' then begin
         Result:=SetTemplate(FDefaultParameterIniFile, FDefaultDatabaseName, FDefaultScript, Template)
      end
      else begin
         Result:=SetTemplate(FTemplateDir+Template.TemplateFile, FDefaultDatabaseName, FDefaultScript, Template)
      end;
   end;
end;

function TTemplateInterface.SetTemplate(ParameterIniFile, DatabaseName: string; Script: TScript; Template: TTemplate): Boolean;
var
   fm: TForm;
   fl: Boolean;
   OutputFileName: string;
   TemplateFileName: string;
begin
   Result:=False;
   ParameterIniFile:=CheckFileName(ParameterIniFile);
   if (Template<>nil) and (ParameterIniFile<>'') and FileExists(ParameterIniFile) then begin
      if FEngine.ReadParameterList(ParameterIniFile, Template) then begin
         if FEngine.GetData(DatabaseName, Script, Template) then begin
            fl:=False;
            if Template.UseForm then begin
               fm:=TForm.CreateNew(nil);
               try
                  FEngine.GenerateForm(Template, fm);
                  FEngine.SetFormData(Template);
                  if fm.ShowModal=mrOk then begin
                     FEngine.GetFormData(Template);
                     fl:=True;
                  end;
               finally
                  fm.Free;
               end;
            end;
            if (not Template.UseForm) or fl then begin
               OutputFileName:=OutputDir+ChangeFileExt(ExtractFileName(Template.TemplateFile), '.doc');
               TemplateFileName:=TemplateDir+Template.TemplateFile;
               if FEngine.GenerateText(Template, TemplateFileName, OutputFileName) then begin
                  FEngine.ViewText(Template, OutputFileName);
               end;
            end;
         end
         else begin
            // ошибка чтения данных
         end;
      end
      else begin
         // ошибка чтения параметров
      end;
   end;
end;

function TTemplateInterface.GetTemplate(FullName: string):TTemplate;
begin
   Result:=FEngine.TemplateList.GetByName(FullName);
end;

end.
