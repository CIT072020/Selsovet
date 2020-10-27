unit fAbout; // About form

interface

{$I Task.inc}

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, FileCtrl, Dialogs, uProjectAll, Metatask, Funcpr, SasaIniFile,
   {$IFDEF SMDO}  uSMDO, {$ENDIF}
   {$IFDEF AVEST_GISUN} uAvest, {$ENDIF}
   StdCtrls, ExtCtrls, ShellApi, {mContext,} mSysInfo{, mClasses}, mVerInfo;

type
   TfmAbout = class(TForm)
      gbAdres: TGroupBox;
      imLogo: TImage;
      lbAdres: TLabel;
      lbTel: TLabel;
      lbFax: TLabel;
      lbMail: TLabel;
      paBottom: TPanel;
      btOk: TButton;
      paInfo: TPanel;
      lbOS: TLabel;
      lbMemory: TLabel;
      lbOracleServer: TLabel;
      paAll: TPanel;
      lbCopyright: TLabel;
      lbVersion: TLabel;
      lbEgr: TLabel;
      lbEmail: TLabel;
      lbAdr: TLabel;
      lbTelCaption: TLabel;
      lbFaxCaption: TLabel;
      bvLogo: TBevel;
    lbBase: TLabel;
    Label1: TLabel;
    lbWWW: TLabel;
    lbBuild: TLabel;
    lbFull: TLabel;
    lbFolder: TLabel;
    lbTelNameM1: TLabel;
    lbTelM1: TLabel;
    lbTelNameM2: TLabel;
    lbTelM2: TLabel;
    lbFolder2: TLabel;
    lbSMDO: TLabel;
    lbAvest: TLabel;
    procedure lbMailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbWWWClick(Sender: TObject);
    procedure lbFolder2Click(Sender: TObject);
    procedure lbAvestClick(Sender: TObject);
   end;

procedure ShowAbout(EngineVersion : String; DataBaseVersion : String; NameProg : String; Full : String; slPar:TstringList=nil);

implementation

uses dBase;

{$R *.DFM}
{$R logo.res}

procedure ShowAbout(EngineVersion : String; DataBaseVersion : String; NameProg : String; Full : String; slPar:TstringList);
var
   VerInfo: TVerInfo;
   s : String;
   n:Integer;
   sFile:String;
   INI : TSasaIniFile;
   lAvest:Boolean;
begin
   with TfmAbout.Create(nil) do begin
      if NameProg<>'' then begin
        lbEgr.Caption := NameProg;
      end;            
      {$IFDEF POST}
        lbTel.Caption:='(0162)-53-52-83, (0162)-20-85-80';
        lbTelM1.Caption:='+375-29-3089296';
        lbTelM2.Caption:='+375-29-5245984  (Viber)';
      {$ENDIF}
      sFile:=NameFromExe('about.ini');
      if FileExists(sFile) then begin
        INI:=nil;
        try
          try
            INI:=TSasaIniFile.Create(sFile);
            s:=Trim(INI.ReadString('REKVIZIT','TEL_WORK', ''));
            if s<>'' then lbTel.Caption:=s;
            s:=Trim(INI.ReadString('REKVIZIT','TELNAME_M1', ''));
            if s<>'' then lbTelNameM1.Caption:=s;
            s:=Trim(INI.ReadString('REKVIZIT','TELNAME_M2', ''));
            if s<>'' then lbTelNameM2.Caption:=s;
            s:=Trim(INI.ReadString('REKVIZIT','TEL_M1', ''));
            if s<>'' then lbTelM1.Caption:=s;
            s:=Trim(INI.ReadString('REKVIZIT','TEL_M2', ''));
            if s<>'' then lbTelM2.Caption:=s;
            s:=Trim(INI.ReadString('REKVIZIT','EMAIL', ''));
            if s<>'' then lbMail.Caption:=s;
          except
          end
        finally
          FreeAndNil(INI);
        end;
      end;

      VerInfo:=TVerInfo.Create(Application.ExeName);
      try
         if slPar<>nil then begin
           n:=StrToInt(ValueFromParams(slPar,'FONT_NAMEPROG','0'));
           if n>0 then lbEgr.Font.Size:=n;
         end;
         lbVersion.Caption:={Context.}VerInfo.Replace(lbVersion.Caption);
         lbBuild.Caption := VerInfo.Replace(lbBuild.Caption);
         lbMemory.Caption:=mSysInfo.GetMemoryInfo;
         lbCopyright.Caption:={Context.}VerInfo.Replace(lbCopyright.Caption);
         lbOS.Caption:=mSysInfo.GetPlatformInfo;
         if EngineVersion='' then begin
           lbOracleServer.Visible:=false;
         end else begin
           lbOracleServer.Caption:=EngineVersion;
         end;
         if DataBaseVersion='' then begin
           lbBase.Visible:=false;
         end else begin
           lbBase.Caption:=DataBaseVersion;
         end;
         s:=ExtractFilePath(Application.ExeName);
 //        lbFolder.Caption:='Папка запуска: '+Copy(s,1,Length(s)-1);
         lbFolder2.Caption:=Copy(s,1,Length(s)-1);
         if Full='' then begin
           lbFull.Visible:=false;
         end else begin
           lbFull.Caption:=Full;
         end;
         //----- для ЛАИС и ЛАИС.СМДО ------------------------------------
         {$IFDEF SMDO}
           if SMDO=nil then begin
             lbSMDO.Caption:='СМДО не активно';
             lbAvest.Caption:='Авест не загружен';
             lbAvest.Hint:='';
             lbAvest.OnClick:=nil;
             lAvest:=false;
           end else begin
             lbSMDO.Caption:=SMDO.Info(1);
             lbAvest.Caption:=SMDO.Info(2);
             lbAvest.Hint:=SMDO.AvestDLL;
             lAvest:=true;
//           lbAvest.OnClick:=lbAvestClick;
           end;
           {$IFDEF AVEST_GISUN}
           if not lAvest then begin
             if (Avest=nil) or not Avest.IsActive then begin
               s:='Авест (не загружен)';
             end else begin
               s:='Авест ('+Avest.Version+')';
             end;
             lbAvest.Caption:=s;
             lbAvest.Hint:=Avest.PathDLL+NAME_AVEST_DLL;
             lbAvest.OnClick:=lbAvestClick;
           end;
           {$ENDIF}
         //---- для остальных программ ------------------------------
         {$ELSE}
           lbSMDO.Caption:='';
           lbSMDO.Visible:=false;
           lbAvest.Top:=lbSMDO.Top;
           {$IFDEF AVEST_GISUN}
             if (Avest=nil) or not Avest.IsActive then begin
               s:='Авест (не загружен)';
             end else begin
               s:='Авест ('+Avest.Version+')';
             end;
             lbAvest.Caption:=s;
             lbAvest.Hint:=Avest.PathDLL+NAME_AVEST_DLL;
             lbAvest.OnClick:=lbAvestClick;
           {$ELSE}
             lbAvest.Caption:='';
             lbAvest.OnClick:=nil;
           {$ENDIF}
         {$ENDIF}
         ShowModal;
      finally
         Free;
         VerInfo.Free;                         
      end;
   end;
end;

procedure TfmAbout.lbMailClick(Sender: TObject);
var
   S: string;
begin
   S:=Format('mailto:%s', [lbMail.Caption]);
   ShellExecute(Application.Handle, 'Open', PChar(S), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmAbout.FormCreate(Sender: TObject);
{var
   Module: THandle;}
begin
   {Module:=LoadLibrary(PChar(AddAppPath(ResFileName)));
   if Module<>0 then begin}
      try
         imLogo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO_BMP');
      finally
         {FreeLibrary(Module);}
      end;
   {end;}
end;

procedure TfmAbout.lbWWWClick(Sender: TObject);
var
   S: string;
begin
   S:=Format('%s', [lbWWW.Caption]);
   ShellExecute(Application.Handle, 'Open', PChar(S), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmAbout.lbFolder2Click(Sender: TObject);
var
  s:String;
begin
  s:=lbFolder2.Caption;
  if s<>'' then
    ShellExecute(Application.Handle, PChar('explore'), PChar(s), nil, nil, SW_SHOWNORMAL);
end;

procedure TfmAbout.lbAvestClick(Sender: TObject);
var
  s:String;
begin
  s:=lbAvest.Hint;
  if s<>'' then begin
    ShellExecute(Application.Handle, PChar('explore'), PChar(ExtractFilePath(s)), nil, nil, SW_SHOWNORMAL);
  end else begin
    if SelectDirectory('Выберите папку c AvCryptMail.dll', '', s) then begin
      if FileExists(CheckSleshN(s)+'AvCryptMail.dll') then begin
        dmBase.IniSysParams.WriteString('PATH','AVEST',s);
        dmBase.IniSysParams.UpdateFile;
        ShowMessage('Необходимо перезапустить программу.');
      end else begin
        PutError('В выбранной папке отсутствует файл: AvCryptMail.dll');
      end;
    end;
  end;
end;

end.
