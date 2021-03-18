program GKH;

{%ToDo 'GKH.todo'}


{$I Task.inc}

uses
  FastMM4,
  ExceptionLog,
  RKP,
  uAddKey,
  SysUtils,
  Controls,
  Windows,
  Dialogs,
  Forms,
  fmProgress,
  ROPasScript,
  MetaTask,
  mPermit,
  OpisEdit,
  mDRecInt,
  FuncPr,
  uProjectAll,
  mTemplS,
  ifp_Variant,
  SasaDbGrid,
  mAdsObj,
  fMain in 'fMain.pas' {fmMain},
  DataTask in 'DataTask.pas' {dmTask: TDataModule},
  dBase in 'dBase.pas' {dmBase: TDataModule},
  fChRR in 'fChRR.pas' {fmChRR},
  fExportStru in 'fExportStru.pas' {fmExportStru},
  fPropertyObj in 'fPropertyObj.pas' {fmPropertyObj},
  fSimple in 'fSimple.pas' {fmSimple},
  dDokument in 'dDokument.pas' {dmDokument: TDataModule},
  dLichSchet in 'dLichSchet.pas' {dmLichSchet: TDataModule},
  fLichSchet in 'fLichSchet.pas' {fmLichSchet},
  CreateControls in 'CreateControls.pas',
  fMen in 'fMen.pas' {fmMen},
  fChoiceAdres in 'fChoiceAdres.pas' {fmChoiceAdres},
  fAbout in 'fAbout.pas' {fmAbout},
  fChoiceUL in 'fChoiceUL.pas' {fmChoiceUL},
  fAddUL in 'fAddUL.pas' {fmAddUL},
  fGurnal in 'fGurnal.pas' {fmGurnal},
  fSplash in 'fSplash.pas' {fmSplash},
  fLogon in 'fLogon.pas' {fmLogon},
  fGurnOchered in 'fGurnOchered.pas' {fmGurnOchered},
  SelLibFR in 'SelLibFR.pas',
  fAddSprName in 'fAddSprName.pas' {fmAddSprName},
  fSimpleD in 'fSimpleD.pas' {fmSimpleD},
  fVidGit in 'fVidGit.pas' {fmVidGit},
  fGurnPassportViza in 'fGurnPassportViza.pas' {fmGurnPassportViza},
  fOperFind in 'fOperFind.pas' {fmOperFind},
  ifp_SelSovet in 'ifp_SelSovet.pas',
  fCreateFiks in 'fCreateFiks.pas' {fmCreateFiks},
  fDeleteFiks in 'fDeleteFiks.pas' {fmDeleteFiks},
  uFilter in 'uFilter.pas',
  fGurnOwners in 'fGurnOwners.pas' {fmGurnOwners},
  dAdres in 'dAdres.pas' {dmAdres: TDataModule},
  fAdres in 'fAdres.pas' {fmAdres},
  fPrintGrid in 'fPrintGrid.pas' {fmPrintGrid},
  dMen in 'dMen.pas' {dmMen: TDataModule},
  fTalonUbit in 'fTalonUbit.pas' {fmTalonUbit},
  fSetPassword in 'fSetPassword.pas' {fmSetPassword},
  fLoadLicGES in 'fLoadLicGES.pas' {fmLoadLicGES},
  fGurnTalonUbit in 'fGurnTalonUbit.pas' {fmGurnTalonUbit},
  fTalonPrib in 'fTalonPrib.pas' {fmTalonPrib},
  fGurnDeclRegistr in 'fGurnDeclRegistr.pas' {fmGurnDeclRegistr},
  fOpisTables in 'fOpisTables.pas' {fmOpisTables},
  uDate in 'uDate.pas',
  fChGES in 'fChGES.pas' {fmChGES},
  fGurnDBrak in 'fGurnDBrak.pas' {fmGurnDBrak},
  fIzvechNal in 'fIzvechNal.pas' {fmIzvechNal},
  fChoiceZAGS in 'fChoiceZAGS.pas' {fmChoiceZAGS},
  fChVigrSpr in 'fChVigrSpr.pas' {fmChVigrSpr},
  fChZagrSpr in 'fChZagrSpr.pas' {fmChZagrSpr},
  fEditAdres in 'fEditAdres.pas' {fmEditAdres},
  uObjectsScript in 'uObjectsScript.pas',
  mRtf in 'mRtf.pas',
  uPadegFIO in 'uPadegFIO.pas',
  fEditSpr in 'fEditSpr.pas' {fmEditSpr},
  fIzbUch in 'fIzbUch.pas' {fmIzbUch},
  fGurnAlfKn in 'fGurnAlfKn.pas' {fmGurnAlfKn},
  fGurnNasel in 'fGurnNasel.pas' {fmGurnNasel},
  fRunObrab in 'fRunObrab.pas' {fmRunObrab},
  fPropHouse in 'fPropHouse.pas' {fmPropHouse},
  fGurnalAdres in 'fGurnalAdres.pas' {fmGurnalAdres},
  fHist in 'fHist.pas' {fmHist},
  fChoiceAdresS in 'fChoiceAdresS.pas' {fmChoiceAdresS},
  fWarning in 'fWarning.pas' {fmWarning},
  fUlPunkt in 'fUlPunkt.pas' {fmULPunkt},
  fEditPerevod in 'fEditPerevod.pas' {fmEditPerevod},
  fArxivZAGS in 'fArxivZAGS.pas' {fmArxivZAGS},
  uCheckBase in 'uCheckBase.pas',
  fAccountSvid in 'fAccountSvid.pas' {fmAccountSvid},
  fDomUlPunkt in 'fDomUlPunkt.pas' {fmdomUlPunkt},
  fPrintForm in 'fPrintForm.pas' {fmPrintForm},
  fPrintSSS in 'fPrintSSS.pas' {fmPrintSSS},
  fChoicePokaz in 'fChoicePokaz.pas' {fmChoicePokaz},
  fShablon in 'fShablon.pas' {fmShablon},
  fSimpleDialog in 'fSimpleDialog.pas' {fmSimpleDialog},
  fAddLic in 'fAddLic.pas' {fmAddLic},
  fLookUp in 'fLookUp.pas' {fmLookUp},
  fChoiceNasel in 'fChoiceNasel.pas' {fmChoiceNasel},
  fChoiceUlica in 'fChoiceUlica.pas' {fmChoiceUlica},
  fParamsAlfavit in 'fParamsAlfavit.pas' {fmParamsAlfavit},
  fTableGurnal in 'fTableGurnal.pas' {fmTableGurnal},
  fAlfavitZAGS in 'fAlfavitZAGS.pas' {fmAlfavitZAGS},
  fSetNameDolg in 'fSetNameDolg.pas' {fmSetNameDolg},
  fPerexodSvid in 'fPerexodSvid.pas' {fmPerexodSvid},
  fRasxodSvid in 'fRasxodSvid.pas' {fmRasxodSvid},
  fDeleteSvid in 'fDeleteSvid.pas' {fmDeleteSvid},
  fPrixodSvid in 'fPrixodSvid.pas' {fmPrixodSvid},
  fRekvOtec in 'fRekvOtec.pas' {fmRekvOtec},
  uProject in 'uProject.pas',
  ifp_metatask in 'ifp_metatask.pas',
  fCallBackQuery in 'fCallBackQuery.pas' {fmCallBackQuery},
  fTypeCountMensAdres in 'fTypeCountMensAdres.pas' {fmTypeCountMensAdres},
  fAddAkt in 'fAddAkt.pas' {fmAddAkt},
  fLoadAlfavitZags in 'fLoadAlfavitZags.pas' {fmLoadAlfavitZags},
  fClearZakl in 'fClearZakl.pas' {fmClearZakl},
  fVisibleMensGurnal in 'fVisibleMensGurnal.pas' {fmVisibleMensGurnal},
  fAddAdres in 'fAddAdres.pas' {fmAddAdres},
  fTypeGurnalNasel in 'fTypeGurnalNasel.pas' {fmTypeGurnalNasel},
  fEnterDokument in 'fEnterDokument.pas' {fmEnterDokument},
  fTypeMensOchered in 'fTypeMensOchered.pas' {fmTypeMensOchered},
  fGurnVUS in 'fGurnVUS.pas' {fmGurnVUS},
  fInitField in 'fInitField.pas' {fmInitField},
  fLgotOchered in 'fLgotOchered.pas' {fmLgotOchered},
  fVvodAdres in 'fVvodAdres.pas' {fmVvodAdres},
  fCopyData in 'fCopyData.pas' {fmCopyData},
  fNotLoadPunkt in 'fNotLoadPunkt.pas' {fmNotLoadPunkt},
  fAddSobstv in 'fAddSobstv.pas' {fmAddSobstv},
  fEditRecHistOwners in 'fEditRecHistOwners.pas' {fmEditRecHistOwners},
  fSeekSobstv in 'fSeekSobstv.pas' {fmSeekSobstv},
  fActions in 'fActions.pas' {fmActions},
  fLichSchetDok in 'fLichSchetDok.pas' {fmLicSchetDok},
  fMenDvig in 'fMenDvig.pas' {fmMenDvig},
  fRunSprav in 'fRunSprav.pas' {fmRunSprav},
  fRunSprav_Edit in 'fRunSprav_Edit.pas' {fmRunSprav_Edit},
  fCheckMens in 'fCheckMens.pas' {fmCheckMens},
  fChSS in 'fChSS.pas' {fmChSS},
  fDeclRegistr in 'fDeclRegistr.pas' {fmDeclRegistr},
  fMenShort in 'fMenShort.pas' {fmMenShort},
  fGurnTalonPrib in 'fGurnTalonPrib.pas' {fmGurnTalonPrib},
  fRunSprav_UserPropt in 'fRunSprav_UserPropt.pas' {fmRunSprav_UserProp},
  fPassport in 'fPassport.pas' {fmPassport};

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
  strUser, strPassword, strParam : String;
  s,strErr : String;
  strSoato,strPin : String;
  i,n : Integer;
  lRestore : Boolean;
  Opis : TOpisEdit;
{$IFDEF CHECK_KEY}
  CurKey : String;
{$ENDIF}
begin
  SetThreadLocale(1049);
  strParam := 'VCBOUS_GKH';

//  ShowMessage('before CheckThis');

  {$IFDEF CHECK_THIS}
  if not CheckThis1(strParam) then begin //or lDebug then begin
  {$ELSE}
  if true then begin //or lDebug then begin
  {$ENDIF}
//  ShowMessage('after CheckThis');

  GlobalTask.NameFileReportsIni:='reportsGKH.ini';

  {$IFDEF ZAGS}
    Application.Title := 'ЗАГС';
    GlobalTask.DemoVersion := false;
  {$ELSE}
    MemoRead(NameFromExe('current_organ'),strSoato);
    {$IFDEF LAIS}
      Application.Title := 'ЛАИС';
      GlobalTask.DemoVersion := false;
    {$ELSE}
        Application.Title := 'ЖКХ';
        GlobalTask.DemoVersion := true; //not CheckAddKey(strSoato); не смотрим на файл addkey.adt
        if GlobalTask.DemoVersion then begin
          if Copy(ReadKeyProg(CurKey,false),1,5)<>'ZGS10' then begin
            GlobalTask.DemoVersion := true;
            DropKeyProg;
          end else begin
            GlobalTask.DemoVersion := false;
            WriteKeyProg(CurKey);
          end;
        end;
    {$ENDIF}
  {$ENDIF}

  {$IFDEF ENABLE_MEMCHECK}
  MemCheckLogFileName := 'F:\Projects\SelSovet7\MemLog.txt';
  MemChk;
  {$ENDIF}
  strUser     :='';
  strPassword :='';

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
  fmMain.TBItemRegisterProg.Visible := GlobalTask.DemoVersion;

  fmMain.IDProg := 'GKH';
  GlobalTask.SetWorkParam('TYPEBASE','GKH');

  Application.OnException := fmMain.MyHandleException;

  fmMain.Log_WriteException        := GlobalTask.ParamAsBoolean('LOG_EXCEPTION');
  fmMain.Log_WriteOwner            := GlobalTask.ParamAsBoolean('LOG_OWNER');

  GlobalTask.OnUpdateParams := fmMain.UpdateParamsEvent;
  GlobalTask.OnAfterSaveParams := fmMain.AfterSaveParamsEvent;
  GlobalTask.OnBeforeSaveParams := fmMain.BeforeSaveParamsEvent;
  GlobalTask.OnBeforeEditParams := fmMain.BeforeEditParamsEvent;

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
  GlobalTask.LogFile.LoggingActive:=dmBase.LogActive; //  !!!  читается из SysParams.ini
  GlobalTask.FLogTypes:=dmBase.LogTypes;                //  !!!  читается из SysParams.ini
  GlobalTask.LogFile.LogFileName   := CheckSleshN(GlobalTask.PathWorkDir)+'LogFile.txt';
  GlobalTask.LogFile.IncDateTime := true;
  GlobalTask.LogFile.DateTimeFormatStr := 'dd.mm.yyyy hh:nn  ';

  while lOk do begin
    i:=fmSplash.Left+120;
    n:=fmSplash.Top+180;
    if (strPassword<>'') or ShowLogon( strUser, strPassword,strPin, i, n, 0, fmSplash) then begin
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
          MemoWrite(NameFromExe('version'), GetVersionProgram);
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

  GlobalTask.TypeSaveLookUpSpr := SAVE_VERYSMALL2;
  GlobalTask.SetWorkParam('DATEFIKS', dmBase.GetDateCurrentSost);
  GlobalTask.SetWorkParam('TYPEBASE',fmMain.IDPROG);
  {$IFDEF GISUN}
    Gisun := TGisun.Create;
  {$ELSE}
//    Gisun := nil;
  {$ENDIF}

//  if Role.SystemAdmin then begin
//    GlobalTask.ErrorIfNotFoundParam( true );  // для отладки ненайденных параметров
//  end;
  {$IFDEF ZAGS}
//    GlobalTask.NameFileTaskParameters := 'ParamZags.tsk';
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

    fmMain.Caption := 'ЖКХ';

    // пока присвоим дате фиксации дату текущего состояния
    fmMain.DateFiks := dmBase.GetDateCurrentSost;
    // загрузим описание структуры таблицы для отчетов
    fmMain.LoadOpisReportTable;
    // загрузим описание табциц базы
    fmMain.LoadOpisTables;
    // загрузим описание свойств объектов
    fmMain.mtSprRazdel.Open;
    fmMain.mtSprRazdel.LoadFromFile(GlobalTask.PathService+NameFile_Partitions); // 'Partitions.mtb');
    fmMain.mtSprProperty.Open;
    fmMain.mtSprProperty.LoadFromFile(GlobalTask.PathService+NameFile_Propertys); // 'Propertys.mtb');
    dmBase.SprRazdel   := fmMain.mtSprRazdel;
    dmBase.SprProperty := fmMain.mtSprProperty;
//  GlobalTask.TypeWinEditSpr:=twMDI;
    {$IFDEF USE_TEMPLATE}
      fmMain.TemplateInterface.DefaultScript := GlobalTask.Script;
      fmMain.TemplateInterface.DefaultDatabaseName := 'dmBase.AdsConnection';
//      fmMain.TemplateInterface.OutputDir   := GlobalTask.PathWorkDir+'\'; // GetFolderMyDocument+'\';

      fmMain.TemplateInterface.OutputDir := GetFolderMyDocument+'\_ЖКХ_\';

      fmMain.TemplateInterface.TemplateDir     := GlobalTask.PathTemplate+'\';
      fmMain.TemplateInterface.UserTemplateDir := GlobalTask.PathTemplate+'_\';

      fmMain.TemplateInterface.SetLocation(GlobalTask.ParamAsString('KOD'),GlobalTask.ParamAsInteger('ID'),fmMain.OnBeforeTemplateAdd);
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

      fmMain.SetRole;
      fmMain.CheckFormMen;  // для того чтобы fmMen и dmMen никогда небыли nil

      {$IFDEF GKH}
        // включен контроль прав пользователей
        Role.IsCheckSubSystem:=GlobalTask.ParamAsBoolean('CHECK_ROLE');

        Role.Permit.Init( dmBase.AdsConnection, dmBase.ListP, dmBase.UserID, fmMain.mtActions );
        Role.Permit.AddSubSystem(SS_HOZ_UCHET,'Похозяйственный учет','','*');
        Role.Permit.AddSubSystem(SS_VUS,'Военно-учетный стол','','*');
        Role.Permit.AddSubSystem(SS_PASP,'Паспортный стол','','*');
        Role.Permit.AddSubSystem(SS_OBRACH,'Обращения граждан','','*');
        Role.Permit.AddSubSystem(SS_OCHERED,'Очередь на жильё','','*');
        Role.Permit.AddSubSystem(SS_PAR,'Параметры','','*');
        Role.Permit.AddSubSystem(SS_OTCHET,'Отчеты','','*');

        Role.Permit.AddAdminSubSystem(SS_ADMIN,'Администрирование','','*');
        Role.Permit.AddSysDBASubSystem(SS_SYSDBA,'ВЦ','','*');

        GlobalTask.CurrentOpisEdit.OnCheckEnableEdit:=fmMain.OnCheckEnableEditSprGKH; // для переключения доступ. спр-ов


//  было
//        GlobalTask.CurrentOpisEdit.OnCheckEnableEdit:=fmMain.OnCheckEnableEditSprGKH; // для переключения доступ. спр-ов
        if Role.IsCheckSubSystem then begin
          Role.CheckActions(fmMain.ActionList);
          Role.CheckToolBar(fmMain.TBToolbarMain );
          fmMain.CheckSubMenu;   // для отключение пустых подменю
          GlobalTask.CurrentOpisEdit.OnCheckEnableEdit:=fmMain.OnCheckEnableEditSpr; // для переключения доступ. спр-ов
          {$IFDEF OBR_GRAG}
            if Role.Permit.CheckSubSystem(SS_OBRACH)<>ptFull
              then fmMain.DocRecord.AdmOnlyRead:=true;
          {$ENDIF}
        end;
      {$ELSE}
        Role.Permit.Init( dmBase.AdsConnection, dmBase.ListP, dmBase.UserID, fmMain.mtActions );
        Role.Permit.AddSubSystem(SS_HOZ_UCHET,'Похозяйственный учет','','*');
        Role.Permit.AddSubSystem(SS_VUS,'Военно-учетный стол','','*');
        Role.Permit.AddSubSystem(SS_PASP,'Паспортный стол','','*');
        Role.Permit.AddSubSystem(SS_ZAGS,'ЗАГС','','*');
        Role.Permit.AddSubSystem(SS_OBRACH,'Обращения граждан','','*');
        Role.Permit.AddSubSystem(SS_OCHERED,'Очередь на жильё','','*');
        Role.Permit.AddSubSystem(SS_PAR,'Параметры','','*');
        Role.Permit.AddSubSystem(SS_OTCHET,'Отчеты','','*');

        Role.Permit.AddAdminSubSystem(SS_ADMIN,'Администрирование','','*');
        Role.Permit.AddSysDBASubSystem(SS_SYSDBA,'ВЦ','','*');

        // включен контроль прав пользователей
        Role.IsCheckSubSystem:=GlobalTask.ParamAsBoolean('CHECK_ROLE');
        if Role.IsCheckSubSystem then begin
          Role.CheckActions(fmMain.ActionList);
          Role.CheckToolBar(fmMain.TBToolbarMain );
          fmMain.CheckSubMenu;   // для отключение пустых подменю
          GlobalTask.CurrentOpisEdit.OnCheckEnableEdit:=fmMain.OnCheckEnableEditSpr; // для переключения доступ. спр-ов
          {$IFDEF OBR_GRAG}
            if Role.Permit.CheckSubSystem(SS_OBRACH)<>ptFull
              then fmMain.DocRecord.AdmOnlyRead:=true;
          {$ENDIF}
        end;

      {$ENDIF}

      GlobalTask.OnCheckStringFilter:=dmBase.Event_CheckStringFilter;
      {$IFNDEF ZAGS}
        CreateAddPriznaki('Признаки жилья', 'KEY_TYPE_HOUSE_CONST', 'KEY_TYPE_HOUSE',
                      dmBase.SprPropHouse, 100, true);
      {$ENDIF}
      CreateSprList( fmMain.FltSprList );
      CreateOpList( fmMain.FltOpList );
      GlobalTask.CreateReportTable('LOGFILE',true);
      // глобальные настройки для справочников
      GlobalEditSpr.OnlyRead:=(Role.Status=rsOnlyRead);
      GlobalEditSpr.EnablePopupMenu:=Role.SystemAdmin;

      try
        if dmBase.SvidSeria.RecordCount=0 then begin
          dmBase.SvidSeria.Append;
          dmBase.SvidSeria.FieldByName('SERIA').AsString := 'I-АЛ';
          dmBase.SvidSeria.Post;
        end;
      except
      end;

      if Copy(GlobalTask.ParamAsString('KOD'),2,1)='4'
        then LoadOpisFromSOATO('KEY_RNGOR', Copy(GlobalTask.ParamAsString('KOD'),1,4),'substr(kod,5,3)<>''000'' and substr(kod,7,1)<>''0'' ')
        else ClearOpis('KEY_RNGOR');
{
      Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_RNGOR');
      Opis.Items.Clear;
      Opis.KeyList.Clear;
      // для ввода района города, сделаем пока только для Бреста потом, нужно брать из справочника СОАТО
      if Copy(GlobalTask.ParamAsString('KOD'),1,4)='1401' then begin
        Opis.Items.Add('Ленинский');
        Opis.Items.Add('Московский');
        Opis.KeyList.Add('365');
        Opis.KeyList.Add('368');
      end;
}
      // для ввода старых значений об образовании
      Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_OBRAZ');
      Opis.Items.Add('**********************');
      Opis.Items.Add('незаконченное высшее');
      Opis.Items.Add('среднее общее');
      Opis.Items.Add('неполное среднее');
      Opis.Items.Add('начальное');
      Opis.KeyList.Add('20');
      Opis.KeyList.Add('21');
      Opis.KeyList.Add('22');
      Opis.KeyList.Add('23');
      Opis.KeyList.Add('24');

      //-------------- ЖЕСы -------------------------------------
      Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_GES');
      Opis.Items.Clear;
      Opis.KeyList.Clear;
      dmBase.SprGES.IndexFieldNames:='PARENT;ID_BASE';
      dmBase.SprGES.SetRange([Globaltask.ParamAsInteger('ID')],[Globaltask.ParamAsInteger('ID')]);
      try
        while not dmBase.SprGES.Eof do begin
          Opis.Items.Add(dmBase.SprGES.FieldByName('name').AsString);
          Opis.KeyList.Add(dmBase.SprGES.FieldByName('id_base').AsString);
          dmBase.SprGES.Next;
        end;
      finally
        dmBase.SprGES.CancelRange;
      end;
      if dmBase.SprGES.Locate('ID', Globaltask.ParamAsInteger('ID'), []) then begin
        Opis.Items.Add(dmBase.SprGES.FieldByName('name').AsString);
        Opis.KeyList.Add('0');
      end;
      //---------------------------------------------------

      fmMain.CreateParamsOpisEditSpr;
//      dmBase.CheckBaseAfterOpen;
      if not Role.SystemAdmin
        then CheckRegistry(dmBase.IsMainComputer);
//       CheckRegistry(dmBase.IsMainComputer);
      if GlobalTask.ParamAsString('SHTAMP_ZAGS')='' then begin
        try
          GlobalTask.WriteParamAsString('SHTAMP_ZAGS', GlobalTask.ParamAsString('SHTAMP'));
          GlobalTask.SaveParameters;
        except
        end;
      end;
      Application.ProcessMessages;
    end else begin
      CheckSystemAdmin;  // uProject.pas
    end;
//    ShowMessage(GetNameComp+'  '+GetNameUser);
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
    MemoWrite(NameFromExe('close'),s);
  end;

  dmBase.FullClose;
  dmBase.SimpleDisconnect;
  dmBase.Free;
  dmBase:=nil;
  fmMain.Free;
  fmMain:=nil;
  end;
end.
