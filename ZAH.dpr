program ZAH;

{%ToDo 'ZAH.todo'}

{$I Task.inc}

uses
  FastMM4,
  ExceptionLog,
  RKP,
  uBase,
  uAddKey,
  fMyNotify,
  SysUtils,
  Windows,
  Dialogs,
  Forms,
  Controls,
  fmProgress,
  ROPasScript,
  MetaTask,
  mPermit,
  OpisEdit,
  FuncPr,
  Variants,
  frxRes,
  mTemplS,
  ifp_Variant,
  ShellAPI,
  SasaDbGrid,
  fMain in 'fMain.pas' {fmMain},
  DataTask in 'DataTask.pas' {dmTask: TDataModule},
  dBase in 'dBase.pas' {dmBase: TDataModule},
  fChRR in 'fChRR.pas' {fmChRR},
  fExportStru in 'fExportStru.pas' {fmExportStru},
  CreateControls in 'CreateControls.pas',
  fAbout in 'fAbout.pas' {fmAbout},
  fSplash in 'fSplash.pas' {fmSplash},
  fLogon in 'fLogon.pas' {fmLogon},
  SelLibFR in 'SelLibFR.pas',
  fSimpleD in 'fSimpleD.pas' {fmSimpleD},
  ifp_SelSovet in 'ifp_SelSovet.pas',
  uFilter in 'uFilter.pas',
  fPrintGrid in 'fPrintGrid.pas' {fmPrintGrid},
  fSetPassword in 'fSetPassword.pas' {fmSetPassword},
  fOpisTables in 'fOpisTables.pas' {fmOpisTables},
  uDate in 'uDate.pas',
  uObjectsScript in 'uObjectsScript.pas',
  mRtf in 'mRtf.pas',
  uPadegFIO in 'uPadegFIO.pas',
  fEditSpr in 'fEditSpr.pas' {fmEditSpr},
  fRunObrab in 'fRunObrab.pas' {fmRunObrab},
  fHist in 'fHist.pas' {fmHist},
  fWarning in 'fWarning.pas' {fmWarning},
  fEditPerevod in 'fEditPerevod.pas' {fmEditPerevod},
  uCheckBase in 'uCheckBase.pas',
  fShablon in 'fShablon.pas' {fmShablon},
  fSimpleDialog in 'fSimpleDialog.pas' {fmSimpleDialog},
  fTableGurnal in 'fTableGurnal.pas' {fmTableGurnal},
  fSetNameDolg in 'fSetNameDolg.pas' {fmSetNameDolg},
  uProject in 'uProject.pas',
  ifp_metatask in 'ifp_metatask.pas',
  fCallBackQuery in 'fCallBackQuery.pas' {fmCallBackQuery},
  fInitField in 'fInitField.pas' {fmInitField},
  fCopyData in 'fCopyData.pas' {fmCopyData},
  fActions in 'fActions.pas' {fmActions},
  fRunSprav in 'fRunSprav.pas' {fmRunSprav},
  fRunSprav_EditZ in 'fRunSprav_EditZ.pas' {fmRunSprav_EditZ},
  fRegGISUN in 'fRegGISUN.pas' {fmRegGISUN},
  fGetGISUN1 in 'fGetGISUN1.pas' {fmGetGISUN1},
  fGetGISUNR in 'fGetGISUNR.pas' {fmGetGISUNR},
  fSeekAkt in 'fSeekAkt.pas' {fmSeekAkt},
  fLookUp in 'fLookUp.pas' {fmLookUp},
  fCurDokFR in 'fCurDokFR.pas' {fmCurDokFR},
  AddEvents in 'AddEvents.pas',
  uGisun in 'uGisun.pas',
  fGurnal in 'fGurnal.pas' {fmGurnal},
  uProjectAll in 'uProjectAll.pas',
  frxPreview in 'frxPreview.pas' {frxPreviewForm},
  fAktZ in 'fAktZ.pas' {fmAktZ},
  fGurnAktZ in 'fGurnAktZ.pas' {fmGurnAktZ},
  fChGKX in 'fChGKX.pas' {fmChGKX},
  uTypes in 'uTypes.pas',
  fChZagrZah in 'fChZagrZah.pas' {fmChZagrZAH},
  fChVigrZAH in 'fChVigrZAH.pas' {fmChVigrZAH},
  fEditRecSprZAH in 'fEditRecSprZAH.pas' {fmEditRecSprZAH},
  fChoiceGIS_Class in 'fChoiceGIS_Class.pas' {fmChoiceGIS_Class},
  fLoadZAH_CSV in 'fLoadZAH_CSV.pas' {fmLoadZAH_CSV};

{$R *.RES}

{TODO 1: Важные замечания }
{
  дата фиксации задачи               :  fmMain.DateFiks
  значение для текущей даты фиксации :  dmBase.GetDateCurrentSost


}
{$DEFINE CHECK_KEY}
{$DEFINE CHECK_THIS}

var
  lExit, lOk : Boolean;
  s,strUser, strPassword, strPIN, strParam : String;
  strErr : String;
  i,n : Integer;
  lRestore : Boolean;
  Opis : TOpisEdit;
//  cur:TCursor;
{$IFDEF CHECK_KEY}
  CurKey:String;
  lDemo:Boolean;
{$ENDIF}
begin
  SetThreadLocale(1049);
  strParam := 'VCBOUS_ZAH';
//  ShowMessage('before CheckThis');
  {$IFDEF CHECK_THIS}
  if not CheckThis1(strParam) then begin //or lDebug then begin
  {$ELSE}
  if true then begin //or lDebug then begin
  {$ENDIF}
//  ShowMessage('after CheckThis');

  GlobalTask.NameFileReportsIni:='reportsZAH.ini';
  GlobalTask.SetNameFileMainScript('progz.pas');  // !!!

  {$IFDEF ENABLE_MEMCHECK}
  MemCheckLogFileName := 'F:\Projects\SelSovet\MemLog.txt';
  MemChk;
  {$ENDIF}
//  GlobalTask.LogFile.MaxSize:=1000000;
  GlobalTask.LogFile.IncDateTime := true;
  GlobalTask.LogFile.DateTimeFormatStr := 'dd.mm.yyyy hh:nn  ';

  strUser     :='';
  strPassword :='';
  strPIN:='';
  lRestore := false;
  if ParamCount>0 then begin
    for i:=1 to ParamCount do begin
      strParam := Trim(ParamStr(i));
      if ANSIUpperCase(Copy(strParam,1,6))='/USER:' then begin
        strUser := Copy(strParam,7,100);
      end else if ANSIUpperCase(Copy(strParam,1,5))='/PSW:' then begin
        strPassword := Copy(strParam,6,100);
      end else if ANSIUpperCase(Copy(strParam,1,7))='/REPORT' then begin
        EnableReport := true;
      end else if ANSIUpperCase(Copy(strParam,1,8))='/RESTORE' then begin
        lRestore := true;
//      end else if ANSIUpperCase(Copy(strParam,1,8))='/K:ZGS10' then begin
      end;
    end;
  end;
  Application.Initialize;
  ;
  Application.CreateForm(TfmMain, fmMain);
  ;

  fmMain.IDProg := 'ZAH';
  GlobalTask.SetWorkParam('TYPEBASE','ZAH');


  Application.OnException := fmMain.MyHandleException;
  GlobalTask.OnBeforeSaveParams := fmMain.BeforeSaveParamsEvent;
  GlobalTask.OnUpdateParams := fmMain.UpdateParamsEvent;
  GlobalTask.OnAfterSaveParams := fmMain.AfterSaveParamsEvent;
//  ShowMessage('Create Splash');
  fmSplash := TfmSplash.Create(nil);
  fmSplash.Show;
  fmSplash.Update;
  SetSpalshProgress(fmSplash.lb1,fmSplash.lb2,fmSplash.pb1,fmSplash.pb2);

  Application.CreateForm(TdmBase, dmBase);

  Application.UpdateFormatSettings:=false;

 //  dmBase := TdmBase.Create(Application);
  if (strUser='') and FileExists(NameFromExe('lastuser')) then begin
    MemoRead(NameFromExe('lastuser'), strUser);
  end;
//  ShowMessage('After Create dmBase');

  if not dmBase.CheckPathBase then begin  // установаливается NameFileParamTask и создается TaskParam !!!
    lOk := false;
    lExit := true;
  end else begin
    lExit := false;
    lOk := true;
  end;
//  ShowMessage('After Check Path Base');
  fmMain.Log_WriteException        := GlobalTask.ParamAsBoolean('LOG_EXCEPTION');
  fmMain.Log_WriteOwner            := GlobalTask.ParamAsBoolean('LOG_OWNER');
  GlobalTask.LogFile.LoggingActive := dmBase.LogActive; //  !!!  читается из SysParams.ini
  GlobalTask.FLogTypes:=dmBase.LogTypes;                //  !!!  читается из SysParams.ini
  GlobalTask.LogFile.LogFileName   := CheckSleshN(GlobalTask.PathWorkDir)+'LogFile.txt';
  while lOk do begin
    i:=fmSplash.Left+25;
    n:=fmSplash.Top+170;
    if (strPassword<>'') or ShowLogon( strUser, strPassword, strPIN, i, n, 0) then begin
      Application.ProcessMessages;
      dmBase.CheckNewUser := true;
      dmBase.CheckUser     := strUser;
      dmBase.CheckPassword := strPassword;
      strErr := '';

      if lRestore then begin
        ShowMessage(' Восстановление из резервной копии ! ');
      end;

      if dmBase.OpenConnect(strErr) then begin
        Role.SystemAdmin := false;
        lOk := false;
        GlobalTask.WriteToLogFile('>>>>Начат сеанс пользователя '+strUser+'; версия: ПО '+GetVersionProgram(5)+', базы '+dmBase.GetVersionBase(dmBase.AdsConnection));
        GlobalTask.WriteToLogFile(strUser, nil, LOG_SQL);
        dmBase.SimpleDisconnect;

        if dmBase.FullOpen(dmBase.GlobalPar.RelConnectPath, dmBase.GlobalPar.RelSharedConnectPath ) then begin

//          if not dmBase.LockBase then begin
//            ShowMessage('Not Lock');
//          end;

        end else begin
          strErr := 'Ошибка открытия базы';
        end;

        RegisterDataTask(dmBase);
        Role.User := dmBase.UserID;
        if (dmBase.UserID='ADSSYS') or (dmBase.UserID='АДМИНИСТРАТОР') then begin
          Role.Status := rsAdmin;
          if dmBase.UserID='ADSSYS' then begin
            Role.SystemAdmin := true;
          end;
        end else begin
          if dmBase.UserID='ГОСТЬ' then begin
            Role.Status := rsOnlyRead;
          end else if dmBase.UserID='СЕКРЕТАРЬ' then begin
            Role.Status := rsMainUser;
          end else begin
            Role.Status := rsUser;
          end;
        end;
        MemoWrite(NameFromExe('lastuser'), strUser);
        if dmBase.IsMainComputer then begin
          MemoWrite(NameFromExe('version'), GetVersionProgram(5));
        end;

      end else begin
        if (dmBase.LastDatabaseError=-1) or (dmBase.LastDatabaseError=-2) then begin
          if dmBase.LastDatabaseError=-1 then begin
            SysUtils.Beep;
            PutError('    База данных не найдена.  ');
          end;
          if dmBase.LastDatabaseError=-2 then begin
            SysUtils.Beep;
            PutError('    Системные справочники не найдены.  ');
          end;
          lExit := true;
          lOk := false;
        end else begin
          strPassword := '';
          SysUtils.Beep;
          PutError(strErr);
        end;
      end;
    end else begin
      lExit := true;
      lOk := false;
//      strUser := '';
      strPassword := '';
    end;
  end;
  Application.ProcessMessages;
  fmSplash.lb1.Visible := false;
  fmSplash.lb2.Visible := false;
  SetSpalshProgress(nil,nil,nil,nil);

  Screen.HintFont.Size:=GlobalTask.ParamAsInteger('FONT_SIZE');
  if Screen.HintFont.Size<8 then Screen.HintFont.Size:=8;

  GlobalTask.TypeSaveLookUpSpr := SAVE_VERYSMALL2;
  GlobalTask.SetWorkParam('DATEFIKS', dmBase.GetDateCurrentSost);

//  showmessage('"'+GlobalTask.ParamAsString('ID')+'"');
  {$IFDEF CHECK_KEY}
  if dmBase.LastDatabaseError=0 then begin
    if GlobalTask.ParamAsString('ID')='' then begin
      lDemo:=true;
    end else begin
      lDemo:=ReadNotKeyProg('ADD63', GlobalTask.ParamAsString('ID'), s);
      if lDemo and Role.SystemAdmin
        then AddNotifyProg(fmMain, 'Текущий ключ:"'+s+'"', false, true,0,0);
    end;
  end else begin
    lDemo:=false;
  end;
  {
  if GlobalTask.ParamAsString('ID')='' then begin
    lDemo:=true;
  end else begin
    lDemo:=CheckAddKeyEx('ZAH',GlobalTask.ParamAsString('ID'));
  end;
  }
  if lDemo then begin
    GlobalTask.DemoVersion:=true;
  end else begin
    if Copy(ReadKeyProg(CurKey,false),1,5)<>'ZGS10' then begin
      GlobalTask.DemoVersion:=true;
      DropKeyProg;
    end else begin
      GlobalTask.DemoVersion:=false;
      WriteKeyProg(CurKey);
    end;
  end;
  {$ELSE}
  GlobalTask.DemoVersion:=false;
  {$ENDIF}
  if GlobalTask.DemoVersion then begin
    Application.Title := 'Учет захоронений (демо-версия)';
  end;
  fmMain.TBItemRegisterProg.Visible:=GlobalTask.DemoVersion;

//  if Role.SystemAdmin then begin
//    GlobalTask.ErrorIfNotFoundParam( true );  // для отладки ненайденных параметров
//  end;
  if not lExit then begin

    {$IFDEF GISUN}
      Gisun := TGisun.Create;
      Gisun.AllSpr:=dmBase.AllSprGISUN;
      if IsActiveGisun then begin
        if Gisun.PostUserName then begin
          if Gisun.DbUserAsGIS
            then Gisun.SetUserNameToken(strUser,strPassword,strPIN);
        end;
        fmMain.CaptionProg(Role.UserGIS);
      end;
    {$ELSE}
  //    Gisun := nil;
    {$ENDIF}

    fmSplash.Free;
//    CheckPersonalPath;
    Globaltask.frReport := fmMain.frReport;
//    fmMain.frxReport.PrintOptions.ShowDialog:=false;
//    fmMain.frxReport.Preview :=fmMain.frxPreview1;

    frxResources.PreviewButtonImages.AddImage(fmMain.ImageList,89);   // !!!

    {$IFDEF USE_FR3}
      fmMain.frxReport.iniFile:=CheckSleshN(GlobalTask.PathWorkDir)+'FastReports.ini';
      fmMain.frxReport.StoreInDFM:=false;
      fmMain.frxADSComponents.DefaultDatabase:=dmBase.AdsConnection;
      Globaltask.frxReport := fmMain.frxReport;
    {$ENDIF}
    GlobalTask.SetEnabledDuplex( GlobalTask.ParamAsBoolean('DUPLEX') );

    if not GlobalTask.ParamAsBoolean('FLAT') then begin
      GlobalFlat := false;
      GlobalStepY:= 25;
    end;
    GlobalFontSizeE:=GlobalTask.ParamAsInteger('FONT_SIZE');

    RegisterScriptClass( SIRegister_Metatask, RIRegister_Metatask);
    RegisterScriptClass( SIRegister_RtfLibrary, RIRegister_RtfLibrary);
    RegisterScriptLib( RegisterMetaTaskLibrary_C, RegisterMetaTaskLibrary_R);

    RegisterScriptLib( RegisterSelSovetLibrary_C, RegisterSelSovetLibrary_R);
    RegisterScriptClass( SIRegister_SelSovet, RIRegister_SelSovet);

    RegisterScriptLib( RegisterRtfLibrary_C, RegisterRtfLibrary_R);
    RegisterScriptLib( RegisterMetaTaskLibrary_C, RegisterMetaTaskLibrary_R);

    RegisterScriptClass( SIRegister_Variant, RIRegister_Variant);
    RegisterScriptLib( RegisterComObj_C, RegisterComObj_R);

    {$IFDEF USE_TEMPLATE}
      RegisterScriptLib(RegisterTemplateLibrary_C, RegisterTemplateLibrary_R);
    {$ENDIF}
    RegisterScriptVar('GlobalTask', 'TMetaTask', GlobalTask);
    RegisterScriptVar('fmMain', 'TfmMain', fmMain);
    RegisterScriptVar('dmBase', 'TdmBase', dmBase);
    RegisterScriptVar('LicSchet', 'TLicSchet', LicSchet);
    RegisterScriptVar('Adres', 'TAdresLic', Adres);
    RegisterScriptVar('Men', 'TMens', Men);
    RegisterScriptVar('DokZAGS', 'TDokZAGS', DokZAGS);
    RegisterScriptVar('CurDok', 'TDokZAGS', CurDok);
    RegisterScriptVar('slExcelReport', 'TStringList', slExcelreport);

    {$IFDEF OBR_GRAG}
    fmMain.DocRecord.RegisterScript;
    {$ENDIF}

    GlobalTask.CreateMainScript; // обязательно после RegisterDatatask

//    dmBase.CheckSysSprPrichSm;


    // пока присвоим дате фиксации дату текущего состояния
    fmMain.DateFiks := dmBase.GetDateCurrentSost;
    // загрузим описание структуры таблицы для отчетов
    fmMain.LoadOpisReportTable;
    // загрузим описание табциц базы
    fmMain.LoadOpisTables;
    // загрузим описание свойств объектов
    fmMain.mtSprRazdel.Open;
    fmMain.mtSprRazdel.LoadFromFile(GlobalTask.PathService+'Partitions.mtb');
    fmMain.mtSprProperty.Open;
    fmMain.mtSprProperty.LoadFromFile(GlobalTask.PathService+'Propertys.mtb');
    dmBase.SprRazdel   := fmMain.mtSprRazdel;
    dmBase.SprProperty := fmMain.mtSprProperty;
//  GlobalTask.TypeWinEditSpr:=twMDI;
    {$IFDEF USE_TEMPLATE}
      fmMain.TemplateInterface.DefaultScript := GlobalTask.Script;
      fmMain.TemplateInterface.DefaultDatabaseName := 'dmBase.AdsConnection';
//      fmMain.TemplateInterface.OutputDir   := GlobalTask.PathWorkDir+'\'; // GetFolderMyDocument+'\';
      fmMain.TemplateInterface.OutputDir := GetFolderMyDocument+'\_АКТЫ_\';
      fmMain.TemplateInterface.TemplateDir     := GlobalTask.PathTemplate+'\';
      fmMain.TemplateInterface.UserTemplateDir := GlobalTask.PathTemplate+'_\';
      fmMain.TemplateInterface.SetLocation(GlobalTask.ParamAsString('KOD'),0{!!!GlobalTask.ParamAsInteger('ID')},fmMain.OnBeforeTemplateAdd);
      if fmMain.TemplateInterface.Engine.ReadTemplateList(GlobalTask.PathService+'template.ini') then begin

      end;
      fmMain.BuildToolbarMenu;
      {$IFDEF OBR_GRAG}
      fmMain.DocRecord.SetTemplateInterface(fmMain.TemplateInterface);
      {$ENDIF}
    {$ENDIF}


    if (dmBase.LastDatabaseError=0) and (strErr='') then begin

      // выключен контроль прав пользователей
      Role.Permit.Init( dmBase.AdsConnection, dmBase.ListP, dmBase.UserID, fmMain.mtActions );
      Role.IsCheckSubSystem:=false;
      if (Role.Status<>rsAdmin) then begin
        if dmBase.ListP.Locate('NAMEUSER;SUBSYSTEM',VarArrayOf([dmBase.UserID,SS_ADMIN]),[]) then begin
          if not dmBase.ListP.FieldByName('ENABLE_EDIT').IsNull and dmBase.ListP.FieldByName('ENABLE_EDIT').AsBoolean then begin
            Role.Status:=rsAdmin;
          end;
        end;
      end;
      fmMain.SetRole;
      fmMain.LoadKeyRnGor(GlobalTask.ParamAsString('KOD'));
      GlobalTask.OnCheckStringFilter:=dmBase.Event_CheckStringFilter;
      CreateSprList( fmMain.FltSprList );
      CreateOpList( fmMain.FltOpList );
      GlobalTask.CreateReportTable('LOGFILE',true);
      // глобальные настройки для справочников
      GlobalEditSpr.OnlyRead:=(Role.Status=rsOnlyRead);
      GlobalEditSpr.EnablePopupMenu:=Role.SystemAdmin;

      if GlobalTask.ParamAsBoolean('HUNSPELL') then begin
        CreateHunSpell;
      end;
{
      try
        if dmBase.SvidSeria.RecordCount=0 then begin
          dmBase.SvidSeria.Append;
          dmBase.SvidSeria.FieldByName('SERIA').AsString := 'I-АЛ';
          dmBase.SvidSeria.Post;
        end;
      except
      end;
}
         // для ввода старых значений об образовании
         Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_OBRAZ');
         Opis.Items.Add('**********************');
         Opis.Items.Add('незаконченное высшее');
         Opis.Items.Add('среднее общее');
         Opis.Items.Add('неполное среднее');
         Opis.Items.Add('начальное');
      {$IFDEF ZAGS}
         Opis.Items.Add('нет графы');
      {$ENDIF}
         Opis.KeyList.Add('20');
         Opis.KeyList.Add('21');
         Opis.KeyList.Add('22');
         Opis.KeyList.Add('23');
         Opis.KeyList.Add('24');
      {$IFDEF ZAGS}
         Opis.KeyList.Add('29');
         Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_CHERN');
         Opis.Items.Add('нет графы');
         Opis.KeyList.Add('29');
      {$ENDIF}

       // для ввода старых значений смерть последовала
//       Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SMERT_POSL');
//       Opis.Items.Add('**********************');
//       Opis.Items.Add('в стационаре');
//       Opis.KeyList.Add('20');
//       Opis.KeyList.Add('21');

      fmMain.CreateParamsOpisEditSpr;
//      dmBase.CheckBaseAfterOpen;
      if not Role.SystemAdmin
        then CheckRegistry(dmBase.IsMainComputer);
//       CheckRegistry(dmBase.IsMainComputer);
{
      if GlobalTask.ParamAsString('SHTAMP_ZAGS')='' then begin
        try
          GlobalTask.WriteParamAsString('SHTAMP_ZAGS', GlobalTask.ParamAsString('SHTAMP'));
          GlobalTask.SaveParameters;
        except
        end;
      end;
}
      if dmBase.GetTypeBase<>_TypeObj_AktZAH then begin
        PutError('ОШИБКА: Неверный тип базы данных');
      end;

      if FileExists(NameFromExe('anynews')) then begin
        DeleteFile(PChar(NameFromExe('anynews')));
        Application.ProcessMessages;
        ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки Учет захоронений.doc')), nil, nil, SW_SHOWMAXIMIZED);
        Application.ProcessMessages;
      end;

      Application.ProcessMessages;
    {
      s:=fmMain.CheckUpdate(false, false, 0, false, s);
      if s<>'' then begin
        ShowMessage('Доступно обновление "'+s+'"');
      end;
    }
//      if FileExists(NameFromExe('anynews')) then begin
//        DeleteFile(PChar(NameFromExe('anynews')));
//        ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки ЗАГС.doc')), nil, nil, SW_SHOWNORMAL);
//      end;
    end else begin
      CheckSystemAdmin;  // uProject.pas
    end;
    Application.Run;
  end else begin
    fmSplash.Free;
  end;
  if (fmMain<>nil) and (ListGurnal<>nil) then begin
    s:='begin close ('+InttoStr(ListGurnal.Count)+')'#13#10;
    while ListGurnal.Count>0 do begin
      s:=s+'  '+TWinControl(ListGurnal.Objects[0]).Name+#13#10;
      ListGurnal.Objects[0].Free;   // внутри вызывается ListGurnal.Delete(i)
    end;
    s:=s+'end close'#13#10;
    MemoWrite('close',s);
  end;

  dmBase.FullClose;
  dmBase.SimpleDisconnect;
  dmBase.Free;
  dmBase:=nil;
  fmMain.Free;
  fmMain:=nil;
  end;
end.
