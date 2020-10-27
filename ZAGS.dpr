program ZAGS;

{%ToDo 'ZAGS.todo'}

{$I Task.inc}

uses
  FastMM4,
  ExceptionLog,
  RKP,
  uAddKey,
  uTypes,
  SysUtils,
  Windows,
  Dialogs,
  Forms,
  Controls,
  fmProgress,
  ROPasScript,
  ImgList,
  Graphics,
  MetaTask,
  mPermit,
  OpisEdit,
  mDRecInt,
  FuncPr,
  ShellApi,
  Variants,
  frxRes,
  mTemplS,
  ifp_Variant,
  SasaDbGrid,
  mAdsObj,
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
  fAddSprName in 'fAddSprName.pas' {fmAddSprName},
  fSimpleD in 'fSimpleD.pas' {fmSimpleD},
  fOperFind in 'fOperFind.pas' {fmOperFind},
  ifp_SelSovet in 'ifp_SelSovet.pas',
  fZapisBrakV in 'fZapisBrakV.pas' {fmZapisBrakV},
  uFilter in 'uFilter.pas',
  fPrintGrid in 'fPrintGrid.pas' {fmPrintGrid},
  fGurnZRast in 'fGurnZRast.pas' {fmGurnZRast},
  fZapisAdopt in 'fZapisAdopt.pas' {fmZapisAdopt},
  fGurnZRogd in 'fGurnZRogd.pas' {fmGurnZRogd},
  fGurnUZUstOtc in 'fGurnUZUstOtc.pas' {fmGurnUZUstOtc},
  fSetPassword in 'fSetPassword.pas' {fmSetPassword},
  fZapisRogdV in 'fZapisRogdV.pas' {fmZapisRogdV},
  fZapisSmertV in 'fZapisSmertV.pas' {fmZapisSmertV},
  fGurnZUstMat in 'fGurnZUstMat.pas' {fmGurnZUstMat},
  fOpisTables in 'fOpisTables.pas' {fmOpisTables},
  uDate in 'uDate.pas',
  fZapisRogd in 'fZapisRogd.pas' {fmZapisRogd},
  fGurnDChName in 'fGurnDChName.pas' {fmGurnDChName},
  fZapisUstMat in 'fZapisUstMat.pas' {fmZapisUstMat},
  fGurnNakl in 'fGurnNakl.pas' {fmGurnNakl},
  fDeclBrak in 'fDeclBrak.pas' {fmDeclBrak},
  fGurnZAdopt in 'fGurnZAdopt.pas' {fmGurnZAdopt},
  fZAGS_DeclSvid in 'fZAGS_DeclSvid.pas' {fmZAGS_DeclSvid},
  fChoiceZAGS2 in 'fChoiceZAGS2.pas' {fmChoiceZAGS2},
  fChVigrAlfavitZags in 'fChVigrAlfavitZags.pas' {fmChVigrAlfavitZags},
  fChZagrZags in 'fChZagrZags.pas' {fmChZagrZags},
  uObjectsScript in 'uObjectsScript.pas',
  mRtf in 'mRtf.pas',
  uPadegFIO in 'uPadegFIO.pas',
  fRunObrab in 'fRunObrab.pas' {fmRunObrab},
  fHist in 'fHist.pas' {fmHist},
  fWarning in 'fWarning.pas' {fmWarning},
  fUlPunkt in 'fUlPunkt.pas' {fmULPunkt},
  fEditPerevod in 'fEditPerevod.pas' {fmEditPerevod},
  fArxivZAGS in 'fArxivZAGS.pas' {fmArxivZAGS},
  uCheckBase in 'uCheckBase.pas',
  fAccountSvid in 'fAccountSvid.pas' {fmAccountSvid},
  fShablon in 'fShablon.pas' {fmShablon},
  fSimpleDialog in 'fSimpleDialog.pas' {fmSimpleDialog},
  fChoiceNasel in 'fChoiceNasel.pas' {fmChoiceNasel},
  fParamsAlfavit in 'fParamsAlfavit.pas' {fmParamsAlfavit},
  fTableGurnal in 'fTableGurnal.pas' {fmTableGurnal},
  fListSvid in 'fListSvid.pas' {fmListSvid},
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
  fAddAkt in 'fAddAkt.pas' {fmAddAkt},
  fLoadAlfavitZags in 'fLoadAlfavitZags.pas' {fmLoadAlfavitZags},
  fClearZakl in 'fClearZakl.pas' {fmClearZakl},
  fZapisBrak in 'fZapisBrak.pas' {fmZapisBrak},
  fGurnZBrak in 'fGurnZBrak.pas' {fmGurnZBrak},
  fEnterDokument in 'fEnterDokument.pas' {fmEnterDokument},
  fZapisUstOtc in 'fZapisUstOtc.pas' {fmZapisUstOtc},
  fGurnZUstOtc in 'fGurnZUstOtc.pas' {fmGurnZUstOtc},
  fInitField in 'fInitField.pas' {fmInitField},
  fCopyData in 'fCopyData.pas' {fmCopyData},
  fSeekSobstv in 'fSeekSobstv.pas' {fmSeekSobstv},
  fActions in 'fActions.pas' {fmActions},
  fRunSprav in 'fRunSprav.pas' {fmRunSprav},
  fRunSprav_EditZ in 'fRunSprav_EditZ.pas' {fmRunSprav_EditZ},
  fZapisSmert in 'fZapisSmert.pas' {fmZapisSmert},
  fGurnDRast in 'fGurnDRast.pas' {fmGurnDRast},
  fZAGS_IzvOtsut in 'fZAGS_IzvOtsut.pas' {fmZAGS_IzvOtsut},
  fZAGS_ZaklIzmAkt in 'fZAGS_ZaklIzmAkt.pas' {fmZAGS_ZaklIzmAkt},
  fZAGS_SprSmert in 'fZAGS_SprSmert.pas' {fmZAGS_SprSmert},
  fRegGISUN in 'fRegGISUN.pas' {fmRegGISUN},
  fGetGISUN1 in 'fGetGISUN1.pas' {fmGetGISUN1},
  fGetGISUNR in 'fGetGISUNR.pas' {fmGetGISUNR},
  fDeclRegAkt in 'fDeclRegAkt.pas' {fmDeclRegAkt},
  fZAGS_SprChName in 'fZAGS_SprChName.pas' {fmZAGS_SprChName},
  fZAGS_SprRogd in 'fZAGS_SprRogd.pas' {fmZAGS_SprRogd},
  fZAGS_SprBrak in 'fZAGS_SprBrak.pas' {fmZAGS_SprBrak},
  fZAGS_SprRast in 'fZAGS_SprRast.pas' {fmZAGS_SprRast},
  fZAGS_ZaklAddIN in 'fZAGS_ZaklAddIN.pas' {fmZAGS_ZaklAddIN},
  fSeekAkt in 'fSeekAkt.pas' {fmSeekAkt},
  fLookUp in 'fLookUp.pas' {fmLookUp},
  fChoiceGIS_Class in 'fChoiceGIS_Class.pas' {fmChoiceGIS_Class},
  fCurDokFR in 'fCurDokFR.pas' {fmCurDokFR},
  fNewNomerAkt in 'fNewNomerAkt.pas' {fmNewNomerAkt},
  fRasxodSvidNakl in 'fRasxodSvidNakl.pas' {fmRasxodSvidNakl},
  fGurnAddDokZAGS in 'fGurnAddDokZAGS.pas' {fmGurnAddDokZAGS},
  fSimpleSeekAkt in 'fSimpleSeekAkt.pas' {fmSimpleSeekAkt},
  fPovtorSvid in 'fPovtorSvid.pas' {fmPovtorSvid},
  fZAGS_SprOtsut in 'fZAGS_SprOtsut.pas' {fmZAGS_SprOtsut},
  fDeclRast in 'fDeclRast.pas' {fmDeclRast},
  fRastBrak in 'fRastBrak.pas' {fmRastBrak},
  fGurnDBrak in 'fGurnDBrak.pas' {fmGurnDBrak},
  AddEvents in 'AddEvents.pas',
  fGurnUZSmert in 'fGurnUZSmert.pas' {fmGurnUZSmert},
  fDeclRegUstOtc in 'fDeclRegUstOtc.pas' {fmDeclRegUstOtc},
  uGisun in 'uGisun.pas',
  fGurnZSmert in 'fGurnZSmert.pas' {fmGurnZSmert},
  fDeclRegRogd in 'fDeclRegRogd.pas' {fmDeclRegRogd},
  fGurnUZRogd in 'fGurnUZRogd.pas' {fmGurnUZRogd},
  fZAGS_ZaklChName in 'fZAGS_ZaklChName.pas' {fmZAGS_ZaklChName},
  fChoiceAkt in 'fChoiceAkt.pas' {fmChoiceAkt},
  fGurnal in 'fGurnal.pas' {fmGurnal},
  fPredZapis in 'fPredZapis.pas' {fmPredZapis},
  fPredZapis_Edit in 'fPredZapis_Edit.pas' {fmPredZapis_Edit},
  fPredZapis_Month in 'fPredZapis_Month.pas' {fmPredZapis_Month},
  fPredZapis_Perenos in 'fPredZapis_Perenos.pas' {fmPredZapis_Perenos},
  uProjectAll in 'uProjectAll.pas',
  fPredZapis_Params in 'fPredZapis_Params.pas' {fmPredZapis_Params},
  frxPreview in 'frxPreview.pas' {frxPreviewForm},
  fEditSpr in 'fEditSpr.pas' {fmEditSpr},
  fZapisChName in 'fZapisChName.pas' {fmZapisChName},
  uFunc in 'uFunc.pas',
  fZAGS_SprAkt in 'fZAGS_SprAkt.pas' {fmZAGS_SprAkt},
  fCheckAkt in 'fCheckAkt.pas' {fmCheckAkt},
  fDeclChName in 'fDeclChName.pas' {fmDeclChName},
  fDeclIzm in 'fDeclIzm.pas' {fmDeclIzm},
  fGurnUZAdopt in 'fGurnUZAdopt.pas' {fmGurnUZAdopt},
  fGurnDIzm in 'fGurnDIzm.pas' {fmGurnDIzm},
  fChVigrZags in 'fChVigrZags.pas' {fmChVigrZags};

{$R *.RES}

{TODO 1: Важные замечания }
{
  дата фиксации задачи               :  fmMain.DateFiks
  текущий год показа реестров        :  fmMain.YearFiks
  значение для текущей даты фиксации :  dmBase.GetDateCurrentSost


}
{$DEFINE CHECK_KEY}
{$DEFINE CHECK_THIS}

var
  lExit, lOk : Boolean;
  s, strUser, strPassword, strPIN, strParam : String;
  strErr : String;
  i,n : Integer;
  lRestore : Boolean;
  Opis : TOpisEdit;
//  cur:TCursor;
{$IFDEF CHECK_KEY}
//  CurKey : String;
{$ENDIF}
begin
  SetThreadLocale(1049);
  strParam := 'VCBOUS_ZAGS';
//  ShowMessage('before CheckThis');
  {$IFDEF CHECK_THIS}
  if not CheckThis1(strParam) then begin //or lDebug then begin
  {$ELSE}
  if true then begin //or lDebug then begin
  {$ENDIF}
//  ShowMessage('after CheckThis');

  GlobalTask.NameFileReportsIni:='reportsZAGS.ini';

  Application.Title := 'ЗАГС';
  GlobalTask.DemoVersion := false;

  {$IFDEF ENABLE_MEMCHECK}
  MemCheckLogFileName := 'F:\Projects\SelSovet\MemLog.txt';
  MemChk;
  {$ENDIF}
//  GlobalTask.LogFile.MaxSize:=1000000;
  GlobalTask.LogFile.IncDateTime := true;
  GlobalTask.LogFile.DateTimeFormatStr := 'dd.mm.yyyy hh:nn  ';
  GlobalTask.LogFile.LoggingActive := GlobalTask.ParamAsBoolean('LOG_ACTIVE');
  GlobalTask.LogFile.LogFileName   := CheckSleshN(GlobalTask.PathWorkDir)+'LogFile.txt';
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
  fmMain.TBItemRegisterProg.Visible := GlobalTask.DemoVersion;

  fmMain.IDProg := 'ZAGS';
  GlobalTask.SetWorkParam('TYPEBASE','ZAGS');

  fmMain.Log_WriteException        := GlobalTask.ParamAsBoolean('LOG_EXCEPTION');
  fmMain.Log_WriteOwner            := GlobalTask.ParamAsBoolean('LOG_OWNER');

  Application.OnException := fmMain.MyHandleException;
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

  if not dmBase.CheckPathBase then begin
    lOk := false;
    lExit := true;
  end else begin
    lExit := false;
    lOk := true;
  end;
//  ShowMessage('After Check Path Base');

  GlobalTask.LogFile.LoggingActive := dmBase.LogActive; //  !!!
  GlobalTask.LogFile.LogFileName   := CheckSleshN(GlobalTask.PathWorkDir)+'LogFile.txt';
  while lOk do begin
    {$IFDEF OCHERED}
      i:=fmSplash.Left+120;
      n:=fmSplash.Top+180;
    {$ELSE}
      i:=fmSplash.Left-8;
      n:=fmSplash.Top+170;
    {$ENDIF}
    {$IFDEF GKH}
      i:=fmSplash.Left+120;
      n:=fmSplash.Top+180;
    {$ENDIF}
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
          GlobalTask.WriteToLogFile('Ошибка подключения к базе, пользователь '+strUser+' :'+Replace_CRLF(strErr,true));
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

  Screen.HintFont.Size:=GlobalTask.ParamAsInteger('FONT_SIZE');
  if Screen.HintFont.Size<8 then Screen.HintFont.Size:=8;

  GlobalTask.TypeSaveLookUpSpr := SAVE_VERYSMALL2;
  GlobalTask.SetWorkParam('DATEFIKS', dmBase.GetDateCurrentSost);
  fmMain.Log_WriteException        := GlobalTask.ParamAsBoolean('LOG_EXCEPTION');
  fmMain.Log_WriteOwner            := GlobalTask.ParamAsBoolean('LOG_OWNER');
  fmMain.YearFiks:=GlobalTask.GetLastValueAsInteger('YEARFIKS'); //GlobalTask.ParamAsInteger('YEARFIKS');
  MemoRead(NameFromExe('yearfiks'), s);
  n:=StrToIntDef(s,0);
  if n>0 then
    fmMain.YearFiks:=n;
//  ShowMessage(inttostr(fmMain.YearFiks));
// см.выше GlobalTask.LogFile.LoggingActive := GlobalTask.ParamAsBoolean('LOG_ACTIVE');
//  GlobalTask.LogFile.LogFileName   := CheckSleshN(GlobalTask.PathWorkDir)+'LogFile.txt';

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
    GlobalTask.WriteToLogFile('Начат сеанс пользователя '+strUser);
    {$IFDEF USE_TEMPLATE}
      fmMain.TemplateInterface.DefaultScript := GlobalTask.Script;
      fmMain.TemplateInterface.DefaultDatabaseName := 'dmBase.AdsConnection';
//      fmMain.TemplateInterface.OutputDir   := GlobalTask.PathWorkDir+'\'; // GetFolderMyDocument+'\';
      fmMain.TemplateInterface.OutputDir := GetFolderMyDocument+'\';
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

      try
        if dmBase.SvidSeria.RecordCount=0 then begin
          dmBase.SvidSeria.Append;
          dmBase.SvidSeria.FieldByName('SERIA').AsString := 'I-АЛ';
          dmBase.SvidSeria.Post;
        end;
      except
      end;
         // для ввода старых значений об образовании
         Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_OBRAZ');
         Opis.Items.Add('**********************');  // 20
         Opis.Items.Add('незаконченное высшее');  // 21
         Opis.Items.Add('среднее общее');         // 22
         Opis.Items.Add('неполное среднее');      // 23
         Opis.Items.Add('начальное');             // 24
      {$IFDEF ZAGS}
         Opis.Items.Add('нет графы');   // 29
      {$ENDIF}
         Opis.KeyList.Add('20');
         Opis.KeyList.Add('21');
         Opis.KeyList.Add('22');
         Opis.KeyList.Add('23');
         Opis.KeyList.Add('24');
      {$IFDEF ZAGS}
         Opis.KeyList.Add('29');
      {$ENDIF}

       // для ввода старых значений смерть последовала
//       Opis := GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SMERT_POSL');
//       Opis.Items.Add('**********************');
//       Opis.Items.Add('в стационаре');
//       Opis.KeyList.Add('20');
//       Opis.KeyList.Add('21');

      fmMain.CreateParamsOpisEditSpr;
      fmMain.CheckMenu24(GlobalTask.GetLastValueAsBoolean('MAIN_MENU_24'));


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
      if not FileExists(NameFromExe('shtamp-bel.doc')) and FileExists(NameFromExe('shtamp.doc'))
        then CopyFile(PChar(NameFromExe('shtamp.doc')), PChar(NameFromExe('shtamp-bel.doc')), false);
                           
    {  fmMain.ImageList.Clear;       так не работает
      fmMain.ImageList.FileLoad(rtBitmap, 'E:\444.bmp', clNone);
      fmMain.ImageList.BkColor:=clNone;
      fmMain.ImageList.BlendColor:=clNone;
      fmMain.ImageList.ImageType:=itImage;
      fmMain.ImageList.DrawingStyle:=dsNormal;
      fmMain.ImageList.Masked:=true;  }

      if dmBase.GetTypeBase<>_TypeObj_ZRogd then begin
        PutError('ОШИБКА: Неверный тип базы данных');
      end;

      Application.ProcessMessages;
    {
      s:=fmMain.CheckUpdate(false, false, 0, false, s);
      if s<>'' then begin
        ShowMessage('Доступно обновление "'+s+'"');
      end;
    }

     if FileExists(NameFromExe('anynews')) then begin
       DeleteFile(PChar(NameFromExe('anynews')));
       Application.ProcessMessages;
       ShellExecute(Application.Handle, nil, PChar(NameFromExe('\Doc\Доработки ЗАГС.doc')), nil, nil, SW_SHOWMAXIMIZED);
       Application.ProcessMessages;
     end;
    end else begin
      CheckSystemAdmin;  // uProject.pas
      fmMain.CheckMenu24(GlobalTask.GetLastValueAsBoolean('MAIN_MENU_24'));
    end;
    Application.Run;
  end else begin
    fmSplash.Free;
  end;
  if (fmMain<>nil) and (ListGurnal<>nil) then begin
    if ListGurnal.Count>0 then begin
      s:='begin close ('+InttoStr(ListGurnal.Count)+')'#13#10;
      while ListGurnal.Count>0 do begin
        s:=s+'  '+TWinControl(ListGurnal.Objects[0]).Name+#13#10;
        ListGurnal.Objects[0].Free;   // внутри вызывается ListGurnal.Delete(i)
      end;
      s:=s+'end close'#13#10;
      MemoWrite(NameFromExe('close'),s);
    end;
  end;

  dmBase.FullClose;
  dmBase.SimpleDisconnect;
  dmBase.Free;
  dmBase:=nil;
  fmMain.Free;
  fmMain:=nil;
  end;
end.
