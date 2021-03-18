program LaisSmdo;

{%ToDo 'LaisSmdo.todo'}


{$I Task.inc}
                               
uses
  FastMM4,
  RKP,
  uAddKey,
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
  mDRecInt,
  ShellApi,
  FuncPr,
  mTemplS,
  ifp_Variant,
  SasaDbGrid,
  mAdsObj,
  fMain in 'fMain.pas' {fmMain},
  DataTask in 'DataTask.pas' {dmTask: TDataModule},
  dBase in 'dBase.pas' {dmBase: TDataModule},
  fExportStru in 'fExportStru.pas' {fmExportStru},
  fPropertyObj in 'fPropertyObj.pas' {fmPropertyObj},
  dDokument in 'dDokument.pas' {dmDokument: TDataModule},
  CreateControls in 'CreateControls.pas',
  fChoiceOrgan in 'fChoiceOrgan.pas' {fmChoiceOrgan},
  fAbout in 'fAbout.pas' {fmAbout},
  fChoiceUL in 'fChoiceUL.pas' {fmChoiceUL},
  fAddUL in 'fAddUL.pas' {fmAddUL},
  fGurnal in 'fGurnal.pas' {fmGurnal},
  fSplash in 'fSplash.pas' {fmSplash},
  fLogon in 'fLogon.pas' {fmLogon},
  SelLibFR in 'SelLibFR.pas',
  fAddSprName in 'fAddSprName.pas' {fmAddSprName},
  fSimpleD in 'fSimpleD.pas' {fmSimpleD},
  fOperFind in 'fOperFind.pas' {fmOperFind},
  ifp_SelSovet in 'ifp_SelSovet.pas',
  fDeleteFiks in 'fDeleteFiks.pas' {fmDeleteFiks},
  uFilter in 'uFilter.pas',
  dAdres in 'dAdres.pas' {dmAdres: TDataModule},
  fAdres in 'fAdres.pas' {fmAdres},
  fPrintGrid in 'fPrintGrid.pas' {fmPrintGrid},
  dMen in 'dMen.pas' {dmMen: TDataModule},
  fSetPassword in 'fSetPassword.pas' {fmSetPassword},
  fOpisTables in 'fOpisTables.pas' {fmOpisTables},
  uDate in 'uDate.pas',
  fmQueryUserParamsEditor in '..\..\Delphi7\Projects\Forms\fmQueryUserParamsEditor.pas' {fQueryUserParamsEditor},
  fEditAdres in 'fEditAdres.pas' {fmEditAdres},
  uObjectsScript in 'uObjectsScript.pas',
  mRtf in 'mRtf.pas',
  uPadegFIO in 'uPadegFIO.pas',
  fEditSpr in 'fEditSpr.pas' {fmEditSpr},
  fGurnNasel in 'fGurnNasel.pas' {fmGurnNasel},
  fRunObrab in 'fRunObrab.pas' {fmRunObrab},
  fPropHouse in 'fPropHouse.pas' {fmPropHouse},
  fGurnalAdres in 'fGurnalAdres.pas' {fmGurnalAdres},
  fHist in 'fHist.pas' {fmHist},
  fChoiceAdresS in 'fChoiceAdresS.pas' {fmChoiceAdresS},
  fWarning in 'fWarning.pas' {fmWarning},
  fUlPunkt in 'fUlPunkt.pas' {fmULPunkt},
  uCheckBase in 'uCheckBase.pas',
  fDomUlPunkt in 'fDomUlPunkt.pas' {fmdomUlPunkt},
  fPrintForm in 'fPrintForm.pas' {fmPrintForm},
  fPrintSSS in 'fPrintSSS.pas' {fmPrintSSS},
  fChoicePokaz in 'fChoicePokaz.pas' {fmChoicePokaz},
  fShablon in 'fShablon.pas' {fmShablon},
  fSimpleDialog in 'fSimpleDialog.pas' {fmSimpleDialog},
  fLookUp in 'fLookUp.pas' {fmLookUp},
  fChoiceNasel in 'fChoiceNasel.pas' {fmChoiceNasel},
  fChoiceUlica in 'fChoiceUlica.pas' {fmChoiceUlica},
  fTableGurnal in 'fTableGurnal.pas' {fmTableGurnal},
  fSetNameDolg in 'fSetNameDolg.pas' {fmSetNameDolg},
  fPrixodSvid in 'fPrixodSvid.pas' {fmPrixodSvid},
  uProject in 'uProject.pas',
  ifp_metatask in 'ifp_metatask.pas',
  fCallBackQuery in 'fCallBackQuery.pas' {fmCallBackQuery},
  fAddAdres in 'fAddAdres.pas' {fmAddAdres},
  fEnterDokument in 'fEnterDokument.pas' {fmEnterDokument},
  fInitField in 'fInitField.pas' {fmInitField},
  fVvodAdres in 'fVvodAdres.pas' {fmVvodAdres},
  fActions in 'fActions.pas' {fmActions},
  fMenShort in 'fMenShort.pas' {fmMenShort},
  uProjectAll in 'uProjectAll.pas',
  uTypes in 'uTypes.pas',
  fGurnSMDO in 'fGurnSMDO.pas' {fmGurnSMDO},
  fSMDODoc in 'fSMDODoc.pas' {fmSMDODoc},
  fSMDOZagrSpr in 'fSMDOZagrSpr.pas' {fmSMDOZagrSpr},
  uSMDO in 'uSMDO.pas',
  fParamsSMDO in 'fParamsSMDO.pas' {fmParamsSMDO};

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
  s,strUser, strPassword, strParam,sPIN : String;
  strErr : String;
//  strSoato : String;
  i,n : Integer;
  lRestore : Boolean;
{$IFDEF CHECK_KEY}
  CurKey : String;
{$ENDIF}
begin
  SetThreadLocale(1049);       
  strParam := 'VCBOUS_POST';
//  ShowMessage('before CheckThis');
  {$IFDEF CHECK_THIS}
  if not CheckThis1(strParam) then begin //or lDebug then begin
  {$ELSE}
  if true then begin //or lDebug then begin
  {$ENDIF}
//  ShowMessage('after CheckThis');

  GlobalTask.NameFileReportsIni:='reportsPost.ini';
  GlobalTask.SetNameFileMainScript('progp.pas');  // !!!

  Application.Title := 'ЛАИС.СМДО';
  {$IFDEF CHECK_KEY}    
  GlobalTask.DemoVersion := true; //not CheckAddKey(strSoato);
  if GlobalTask.DemoVersion then begin
    if Copy(ReadKeyProg(CurKey,false),1,5)<>'ZGS10' then begin
      GlobalTask.DemoVersion := true;
      DropKeyProg;
//        Application.Terminate;
    end else begin
      GlobalTask.DemoVersion := false;
      WriteKeyProg(CurKey);
    end;
  end;
  if GlobalTask.DemoVersion then begin
    Application.Title := 'ЛАИС.СМДО (демо-версия)';
  end;
  {$ELSE}
  GlobalTask.DemoVersion := false;
  {$ENDIF}

  {$IFDEF ENABLE_MEMCHECK}
  MemCheckLogFileName := 'F:\Projects\SelSovet\MemLog.txt';
  MemChk;
  {$ENDIF}

  strUser     :='';
  strPassword :='';

  lRestore := false;
  if ParamCount>0 then begin
    for i:=1 to ParamCount do begin
      strParam := Trim(ParamStr(i));
      if (ANSIUpperCase(Copy(strParam,1,5))='/USR:') or (ANSIUpperCase(Copy(strParam,1,6))='/USER:') then begin
        strUser := Copy(strParam,6,100);
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
  fmMain.TBItemRegisterProg.Visible := GlobalTask.DemoVersion;

  fmMain.IDProg := 'POST';
  GlobalTask.SetWorkParam('TYPEBASE','POST');

  Application.OnException := fmMain.MyHandleException;
  GlobalTask.OnUpdateParams := fmMain.UpdateParamsEvent;
  GlobalTask.OnAfterSaveParams := fmMain.AfterSaveParamsEvent;
  GlobalTask.OnBeforeSaveParams := fmMain.BeforeSaveParamsEvent;
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

  if not dmBase.CheckPathBase then begin   // установаливается NameFileParamTask и создается TaskParam !!!
    lOk := false;
    lExit := true;
  end else begin
    lExit := false;
    lOk := true;
  end;
//  ShowMessage('After Check Path Base');

//  GlobalTask.LogFile.MaxSize:=1000000;
  fmMain.Log_WriteException        := GlobalTask.ParamAsBoolean('LOG_EXCEPTION');
  fmMain.Log_WriteOwner            := GlobalTask.ParamAsBoolean('LOG_OWNER');

  GlobalTask.LogFile.IncDateTime := true;
  GlobalTask.LogFile.DateTimeFormatStr := 'dd.mm.yyyy hh:nn  ';
  GlobalTask.LogFile.LoggingActive:=dmBase.LogActive; //  !!!  читается из SysParams.ini
  GlobalTask.FLogTypes:=dmBase.LogTypes;                //  !!!  читается из SysParams.ini
  GlobalTask.LogFile.LogFileName   := CheckSleshN(GlobalTask.PathWorkDir)+'LogFile.txt';

  while lOk do begin
    i:=fmSplash.Left+100;
    n:=fmSplash.Top+150;
//    n:=fmSplash.Top+fmSplash.Height- 150;
    if (strPassword<>'') or ShowLogon( strUser, strPassword, sPIN, i, n, 0, fmSplash) then begin
//    if (strPassword<>'') or ShowLogon( strUser, strPassword, sPIN, -1, -1, 0, fmSplash) then begin
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

  {$IFNDEF ZAGS}
    MemoWrite(NameFromExe('current_organ'),GlobalTask.ParamAsString('KOD'));
  {$ENDIF}

  GlobalTask.CurrentOpisEdit.AddNameRI:='-POST';  // !!!   дополнение к имени RI_XXX   [RI_XXX-OCH]

  GlobalTask.TypeSaveLookUpSpr := SAVE_VERYSMALL2;
  GlobalTask.SetWorkParam('DATEFIKS', dmBase.GetDateCurrentSost);
  {$IFDEF GISUN}
    Gisun := TGisun.Create;
  {$ELSE}
//    Gisun := nil;
  {$ENDIF}

  if not lExit then begin
    fmSplash.Free;
    CheckPersonalPath;
    Globaltask.frReport := fmMain.frReport;
    {$IFDEF USE_FR3}
      fmMain.frxReport.iniFile:=CheckSleshN(GlobalTask.PathWorkDir)+'FastReports.ini';
      fmMain.frxReport.StoreInDFM:=false;
      fmMain.frxADSComponents.DefaultDatabase:=dmBase.AdsConnection;
      Globaltask.frxReport := fmMain.frxReport;
    {$ENDIF}

    if not GlobalTask.ParamAsBoolean('FLAT') then begin
      GlobalFlat := false;
      GlobalStepY:= 25;
    end;
    GlobalFontSizeE:=GlobalTask.ParamAsInteger('FONT_SIZE');

    RegisterScriptClass( SIRegister_Metatask, RIRegister_Metatask);
    RegisterScriptClass( SIRegister_RtfLibrary, RIRegister_RtfLibrary);
    RegisterScriptLib( RegisterMetaTaskLibrary_C, RegisterMetaTaskLibrary_R);

    RegisterScriptClass( SIRegister_SelSovet, RIRegister_SelSovet);
    RegisterScriptLib( RegisterSelSovetLibrary_C, RegisterSelSovetLibrary_R);

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
//    RegisterScriptVar('LicSchet', 'TLicSchet', LicSchet);
    RegisterScriptVar('Adres', 'TAdresLic', Adres);
    RegisterScriptVar('Men', 'TMens', Men);
    RegisterScriptVar('DokZAGS', 'TDokZAGS', DokZAGS);
    RegisterScriptVar('CurDok', 'TDokZAGS', CurDok);
    RegisterScriptVar('slExcelReport', 'TStringList', slExcelreport);

    {$IFDEF OBR_GRAG}
    fmMain.DocRecord.RegisterScript;
    {$ENDIF}

    GlobalTask.CreateMainScript; // обязательно после RegisterDatatask

    fmMain.Caption := 'ЛАИС.СМДО';

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
      fmMain.TemplateInterface.OutputDir := GetFolderMyDocument+'\';
      fmMain.TemplateInterface.TemplateDir     := GlobalTask.PathTemplate+'\';
      fmMain.TemplateInterface.UserTemplateDir := GlobalTask.PathTemplate+'_\';

      if fmMain.TemplateInterface.Engine.ReadTemplateList(GlobalTask.PathService+'template.ini') then begin
      end;
      fmMain.BuildToolbarMenu;
      {$IFDEF OBR_GRAG}
      fmMain.DocRecord.SetTemplateInterface(fmMain.TemplateInterface);
      if not GlobalTask.ParamAsBoolean('CORR_DOCSUBJG')
        then fmMain.DocRecord.SprDBItems.ByName('SP_SUBJG').TableView.ExcludeOper([toAdd, toAddFolder, toDelete, toEdit]);
//        else DocRecord.SprDBItems.ByName('SP_SUBJG').TableView.SetDefaultOper;
      {$ENDIF}
    {$ENDIF}


    if (dmBase.LastDatabaseError=0) and (strErr='') then begin

//!!!      fmMain.CheckFormMen;  // для того чтобы fmMen и dmMen никогда небыли nil
      SMDO:=TSMDO.Create;
      SMDO.Demo:=GlobalTask.DemoVersion;
//      SMDO.Demo:=not CheckAddKeyEx('SMDO','S'+strSoato);
{
      if SMDO.Demo then begin
        SMDO.Demo:=not CheckAddKeyEx('SMDO',GlobalTask.ParamAsString('ID'));
        if SMDO.Demo then begin
          if Copy(ReadKeyProg(CurKey,false,false),1,5)<>'ZGS10' then begin
            SMDO.Demo:=true;
            DropKeyProg;
          end else begin
            SMDO.Demo:=false;
            WriteKeyProg(CurKey);
          end;
        end;
      end;
      }
      fmMain.TBItemRegisterProg.Visible:=SMDO.Demo;

      Role.Permit.Init( dmBase.AdsConnection, dmBase.ListP, dmBase.UserID, fmMain.mtActions );
//        Role.Permit.AddSubSystem(SS_HOZ_UCHET,'Похозяйственный учет','','*');
//        Role.Permit.AddSubSystem(SS_VUS,'Военно-учетный стол','','*');
//        Role.Permit.AddSubSystem(SS_PASP,'Паспортный стол','','*');
//        Role.Permit.AddSubSystem(SS_ZAGS,'ЗАГС','','*');
      Role.Permit.AddSubSystem(SS_OBRACH,'Учет документов','','*');
      Role.Permit.AddSubSystem(SS_SMDO,'СМДО','','*');
//      Role.Permit.AddSubSystem(SS_SMDO_RUN,'Отправить,получить','','*');
      Role.Permit.AddSubSystem(SS_PAR,'Параметры','','*');
      Role.Permit.AddSubSystem(SS_OTCHET,'Отчеты','','*');

      Role.Permit.AddAdminSubSystem(SS_ADMIN,'Администрирование','','*');
      Role.Permit.AddSysDBASubSystem(SS_SYSDBA,'ВЦ','','*');

      // включен контроль прав пользователей
      Role.IsCheckSubSystem:=GlobalTask.ParamAsBoolean('CHECK_ROLE');

      if Role.IsCheckSubSystem then begin
        Role.CheckActions(fmMain.ActionList);
        Role.CheckToolBar(fmMain.TBToolbarMain );
        GlobalTask.CurrentOpisEdit.OnCheckEnableEdit:=fmMain.OnCheckEnableEditSpr; // для переключения доступ. спр-ов
        {$IFDEF OBR_GRAG}
          if Role.Permit.CheckSubSystem(SS_OBRACH)<>ptFull
            then fmMain.DocRecord.AdmOnlyRead:=true;
        {$ENDIF}
      end;
      fmMain.SetRole;

      SMDO.CheckEnabledPost;

      fmMain.CheckSubMenu;   // для отключение пустых подменю

      GlobalTask.OnCheckStringFilter:=dmBase.Event_CheckStringFilter;
      CreateSprList( fmMain.FltSprList );
      CreateOpList( fmMain.FltOpList );
      GlobalTask.CreateReportTable('LOGFILE',true);
      // глобальные настройки для справочников
      GlobalEditSpr.OnlyRead:=(Role.Status=rsOnlyRead);
      GlobalEditSpr.EnablePopupMenu:=Role.SystemAdmin;

      fmMain.CreateParamsOpisEditSpr;
      fmMain.CreateSubMenu;
//      dmBase.CheckBaseAfterOpen;
      if not Role.SystemAdmin
        then CheckRegistry(dmBase.IsMainComputer);

      if dmBase.GetTypeBase<>_TypeObj_SMDOPost then begin
        PutError('ОШИБКА: База данных НЕ ЛАИС.СМДО !');
      end;

      if GlobalTask.ParamAsBoolean('HUNSPELL') then begin
        CreateHunSpell;
      end;

      Application.ProcessMessages;

      if FileExists(NameFromExe('anynews')) then begin
        DeleteFile(PChar(NameFromExe('anynews')));
        Application.ProcessMessages;
        ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки ЛАИС.СМДО.doc')), nil, nil, SW_SHOWMAXIMIZED);
        Application.ProcessMessages;
      end;
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
