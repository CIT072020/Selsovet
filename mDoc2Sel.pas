unit mDoc2Sel;
{$I Task.inc}
interface
uses
   DBGridEh;

type
   // Интерфейс с общим модулем
   TDoc2Sel=class(TObject)
   private
      FSignId: Integer;
      FSignName: string;
      FSignAdresId: Integer;
      FSignAdres: string;
      FSignTelefon: string;
      FSignPlaceId: Integer;
      FAdrPlace: string;
      FAdrIn: Boolean;
      // документ, удостоверяющий личность
      FProvType: Integer;
      FProvSer: string;
      FProvNum: string;
      FProvDate: TDateTime;
      FProvOrg: string;
      FPersonId: string;
      // лицевой счет
      FAccId: Integer;
      FAccNum: Integer;
   private
      // установить значения полей документа, удостоверяющего личность
      procedure SetProvDoc(DocType: Integer; DocSer, DocNum: string; DocDate: TDateTime; DocOrg, PersonId: string);
      // копирование значение полей документа, удостоверяющего личность
      procedure CopyPasport(Id: Integer);
   public
      constructor Create;
      destructor Destroy; override;
      //ТАБЛИЦЫ:
      // создать таблицы подсистемы в модуле dBase
      procedure CreateDocTable;
      //ВЫБОР:
      // выбор человека из базы населения
      function SelectMan: Boolean;
      // выбор адреса из базы адресов
      function SelectAdres: Boolean;
      // выбор организации
      function SelectOrg: Boolean;
      //ФАЙЛЫ И ПАПКИ:
      // метаинформация
      function GetMetaFileName: string;
      // настройки поиска
      function GetFindFileName: string;
      // настройки расположения форм
      function GetLayoutFileName: string;
      // настройки вида таблиц
      function GetViewFileName: string;
      // папка, в которую сохраняются фильтры
      function GetFilterDirName: string;
      // папка, в которую сохраняются выгружаемые файлы
      function GetExportDirName: string;
      // папка, в которой хранятся прикрепленные файлы
      function GetAttachDir: string;
      //ОТЧЕТЫ
      function ShowReport(FileName: string): Boolean;
      //ПАРАМЕТРЫ:
      function ParamAsString(ParamName: string): string;
      function ParamAsFloat(ParamName: string): Extended;
      function ParamAsInteger(ParamName: string): Integer;
      function ParamAsBoolean(ParamName: string): Boolean;
      //ЖУРНАЛЫ:
      procedure AddGurnal(GurnalName: string; Form: TObject);
      procedure DeleteGurnal(GurnalName: string);
      procedure ShowGurnal(GurnalName: string);
      //АДМИНИСТРИРОВАНИЕ:
      function IsSystemAdmin: Boolean;
      //ВЕРНУТЬ:
      // наименование населенного пункта с типом населенного пункта
      function GetAdresPunkt(Id: Integer): string;
      //РАЗНОЕ:
      // вызвать диалог установки фильтра
      function SetFilter(Column: TColumnEh; OldFilter: string): Boolean;
   public
      property SignId: Integer read FSignId write FSignId;
      property SignName: string read FSignName write FSignName;
      property SignAdresId: Integer read FSignAdresId write FSignAdresId;
      property SignAdres: string read FSignAdres write FSignAdres;
      property SignTelefon: string read FSignTelefon write FSignTelefon;
      property SignPlaceId: Integer read FSignPlaceId write FSignPlaceId;
      property AdrPlace: string read FAdrPlace write FAdrPlace;
      property AdrIn: Boolean read FAdrIn write FAdrIn;
      // документ, удостоверяющий личность
      property ProvType: Integer read FProvType write FProvType;
      property ProvSer: string read FProvSer write FProvSer;
      property ProvNum: string read FProvNum write FProvNum;
      property ProvDate: TDateTime read FProvDate write FProvDate;
      property ProvOrg: string read FProvOrg write FProvOrg;
      property PersonId: string read FPersonId write FPersonId;
      // лицевой счет
      property AccId: Integer read FAccId write FAccId;
      property AccNum: Integer read FAccNum write FAccNum;
   end;

var
   //NB: ??? нужно вынести создание этого объекта в общий интерфейс
   Doc2Sel: TDoc2Sel;

implementation
uses
   SysUtils, Forms, Dialogs,
{$IFDEF in_sel}
   Classes, Controls, Variants, DB, dBase, FuncPr, uProjectAll,
   fChoiceNasel, fChoiceAdres, MetaTask, DBFunc, OpisEdit, fMain, mPermit,
   fmStringSeek, uProject, uTypes,
{$ENDIF}
   mDRecInt, fTblEdit, mFindInt;

{ TDoc2Sel }

constructor TDoc2Sel.Create;
begin

end;

procedure TDoc2Sel.DeleteGurnal(GurnalName: string);
begin
   {$IFDEF in_sel}
   if fmMain<>nil then begin
      fmMain.DeleteFromListGurnal(GurnalName);
   end;
   {$ENDIF}
end;

destructor TDoc2Sel.Destroy;
begin
   inherited;
end;

function TDoc2Sel.GetMetaFileName: string;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.PathService+'doc_meta.ini';
   {$ELSE}
   Result:=ExtractFilePath(Application.ExeName)+'doc_meta.ini';
   {$ENDIF}
end;

function TDoc2Sel.ParamAsBoolean(ParamName: string): Boolean;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.ParamAsBoolean(ParamName);
   {$ELSE}
   Result:=False;
   if SameText(ParamName, 'DR_SHOW_INFO') then Result:=True;
   if SameText(ParamName, 'DR_SHOW_WIN') then Result:=False;
   if SameText(ParamName, 'DR_PRINT_IND') then Result:=False;
   if SameText(ParamName, 'DR_ID_BY_GROUP') then Result:=True;
   if SameText(ParamName, 'DR_RKK_A5') then Result:=True;
   if SameText(ParamName, 'DR_RKK_A4V1') then Result:=True;
   if SameText(ParamName, 'DR_RKK_A4V2') then Result:=True;
   if SameText(ParamName, 'DR_RKK_A4V3') then Result:=True;
   {$ENDIF}
end;

function TDoc2Sel.ParamAsFloat(ParamName: string): Extended;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.ParamAsFloat(ParamName);
   {$ELSE}
   Result:=0;
   {$ENDIF}
end;

function TDoc2Sel.ParamAsInteger(ParamName: string): Integer;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.ParamAsInteger(ParamName);
   {$ELSE}
   Result:=4;
   if SameText(ParamName, 'DR_STORE_KIND') then Result:=stOnlyLink;
   {$ENDIF}
end;

function TDoc2Sel.ParamAsString(ParamName: string): string;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.ParamAsString(ParamName);
   {$ELSE}
   Result:='';
   {$ENDIF}
end;

function TDoc2Sel.SelectAdres: Boolean;
begin
   {$IFDEF in_sel}
   Result:=False;
   if fmChoiceAdres=nil then begin
      fmChoiceAdres:=TfmChoiceAdres.Create(nil);
   end;
   fmChoiceAdres.DateFiks:=dmBase.GetDateCurrentSost ;
   fmChoiceAdres.ChoiceLich:=False;
   if fmChoiceAdres.ShowModal=mrOk then begin
      if fmChoiceAdres.IdAdres>0 then begin
         FSignAdresId:=fmChoiceAdres.IdAdres;
         FSignAdres:=dmBase.AdresFromId(dmBase.GetDateCurrentSost, IntToStr(FSignAdresId),false);
         FSignPlaceId:=dmBase.Adres_PunktKod;
         FAdrPlace:=dmBase.Adres_Punkt;
         FAdrIn:=True;
         Result:=True;
      end;
   end;
   {$ELSE}
   Result:=True;
   FSignAdresId:=1;
   FSignAdres:='Адрес из базы адресов';
   FSignPlaceId:=1;
   FAdrPlace:='д. Деревня';
   FAdrIn:=True;
   {$ENDIF}
end;

function TDoc2Sel.SelectMan: Boolean;
{$IFDEF in_sel}
var
   arrRec: TCurrentRecord;
{$ENDIF}
begin
   {$IFDEF in_sel}
   Result:=False;
//   if fChoiceNasel.ChoiceMen(nil, '', 'Empty(DATES)', arrRec) then begin   исправлено 10.02.2016 vadim
   if fChoiceNasel.ChoiceMen(nil, '', '', arrRec) then begin
      FSignId:=GetValueField(arrRec, 'ID');
      FSignAdresId:=GetValueField(arrRec, 'ADRES_ID');
      if FSignAdresId=0 then begin
         FSignAdres:=Trim(dmBase.ReadOneProp(dmBase.GetDateCurrentSost, FSignId, 'ADRES_PROP', ftMemo));
         FSignPlaceId:=-1;
         FSignAdresId:=-1;
         FAdrPlace:=Trim(dmBase.ReadOneProp(dmBase.GetDateCurrentSost, FSignId, 'APROP_PN', ftMemo));
         FAdrIn:=False;
      end
      else begin
         FSignAdres:=dmBase.AdresFromId(dmBase.GetDateCurrentSost, IntToStr(FSignAdresId),false);
         FSignPlaceId:=dmBase.Adres_PunktKod;
         FAdrPlace:=dmBase.Adres_Punkt;
         FAdrIn:=True;
      end;
      FSignName:=Trim(GetValueFieldEx(arrRec, 'FAMILIA', '')+' '+GetValueFieldEx(arrRec, 'NAME', '')+' '+GetValueFieldEx(arrRec, 'OTCH', ''));
      FSignTelefon:=Trim(GetValueFieldEx(arrRec, 'TELEFON', ''));
      CopyPasport(FSignId);
      FAccId:=GetValueField(arrRec, 'LIC_ID');
      if (FAccId<>0) and dmBase.tbLich.Locate('DATE_FIKS;ID', VarArrayOf([dmBase.GetDateCurrentSost, FAccId]), []) then begin
         FAccNum:=dmBase.tbLich.FieldByName('NOMER').AsInteger;
      end
      else begin
         FAccId:=-1;
         FAccNum:=-1;
      end;
      Result:=True;
   end;
   {$ELSE}
   Result:=True;
   FSignId:=1;
   FSignName:='Фамилия Имя Отчество';
   FSignTelefon:='1-1-1';
   FSignAdresId:=1;
   FSignAdres:='Адрес человека';
   FSignPlaceId:=1;
   FAdrPlace:='д.Деревня';
   FAdrIn:=True;
   SetProvDoc(1, 'AB', '1231231', Now, 'Орган выдачи', '12212121111222');
   FAccId:=1;
   FAccNum:=1;
   {$ENDIF}
end;

function TDoc2Sel.SelectOrg: Boolean;
{$IFDEF in_sel}
var
   Opis: TOpisEdit;
   v: Variant;
   arrRec: TCurrentRecord;
{$ENDIF}
begin
   {$IFDEF in_sel}
   Result:=False;
   Opis:=GlobalTask.CurrentOpisEdit.GetSprOpisA('LOOKUP_WORK');
   if Opis<>nil then begin
      try
         Opis.DataSet.Filter:='IS_KORR=True';
         Opis.DataSet.Filtered:=True;
         v:=FSignId;
         SetLength(arrRec, 1);
         if Opis.ChoiceFromSprEx(nil, v, arrRec, nil) and (v<>null) then begin
            Result:=True;
            FSignName:=Trim(GetValueFieldEx(arrRec, 'NAME', '')); // NB: !!! FNAME
            FSignAdresId:=-1;
            FSignAdres:=Trim(GetValueFieldEx(arrRec, 'ADRES', ''));
            FSignTelefon:=Trim(GetValueFieldEx(arrRec, 'TELEFON', ''));
            FSignPlaceId:=-1;
            FAdrPlace:='';
            FAdrIn:=GetValueFieldEx(arrRec, 'TER_SS', False);
            FSignId:=v;
            SetProvDoc(-1, '', '', 0, '', '');
            FAccId:=-1;
            FAccNum:=-1;
         end;
      finally
         Opis.DataSet.Filtered:=False;
         Opis.DataSet.Filter:='';
      end;
   end;
   {$ELSE}
   Result:=True;
   FSignId:=1;
   FSignName:='Организация';
   FSignAdresId:=-1;
   FSignAdres:='Адрес организации';
   FSignTelefon:='2-2-2';
   FSignPlaceId:=-1;
   FAdrPlace:='';
   FAdrIn:=True;
   SetProvDoc(-1, '', '', 0, '', '');
   {$ENDIF}
end;

procedure TDoc2Sel.AddGurnal(GurnalName: string; Form: TObject);
begin
   {$IFDEF in_sel}
   ListGurnal.AddObject(GurnalName, Form);
   fmMain.SetRole;
   {$ENDIF}
end;

function TDoc2Sel.GetFindFileName: string;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.PathService+'doc_find.ini';
   {$ELSE}
   Result:=ExtractFilePath(Application.ExeName)+'doc_find.ini';
   {$ENDIF}
end;

function TDoc2Sel.GetLayoutFileName: string;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.PathService+'doc_layout.ini';
   {$ELSE}
   Result:=ExtractFilePath(Application.ExeName)+'doc_layout.ini';
   {$ENDIF}
end;

function TDoc2Sel.GetViewFileName: string;
begin
   {$IFDEF in_sel}
   Result:=GlobalTask.PathService+'doc_view.ini';
   {$ELSE}
   Result:=ExtractFilePath(Application.ExeName)+'doc_view.ini';
   {$ENDIF}
end;

function TDoc2Sel.GetFilterDirName: string;
begin
   {$IFDEF in_sel}
   Result:=NameFromExe('Filters\');
   {$ELSE}
   Result:=ExtractFilePath(Application.ExeName)+'Filters\';
   {$ENDIF}
end;

function TDoc2Sel.IsSystemAdmin: Boolean;
begin
   {$IFDEF in_sel}
   Result:=Role.SystemAdmin;
   {$ELSE}
   Result:=True;
   {$ENDIF}
end;

function TDoc2Sel.GetExportDirName: string;
begin
   {$IFDEF in_sel}
   Result:=GetFolderMyDocument;
   {$ELSE}
   Result:=ExtractFilePath(Application.ExeName)+'output\';
   {$ENDIF}
end;

procedure TDoc2Sel.CreateDocTable;
begin
   {$IFDEF in_sel}
   //динамическое создание таблиц подсистемы "06 Обращения граждан"
   with dmBase do begin
      //ТАБЛИЦЫ:
      // Регистрация документов
      DocMain:=CreateAddTable('DocMain','DocMain','AdsConnection');
      // Связи между документами
      DocLink:=CreateAddTable('DocLink','DocLink','AdsConnection');
      // Ход рассмотрения документа
      DocWork:=CreateAddTable('DocWork','DocWork','AdsConnection');
      // Прикрепленные файлы
      DocFile:=CreateAddTable('DocFile','DocFile','AdsConnection');
      //СПРАВОЧНИКИ:
      // Номенклатура дел
      SprDocFileList:=CreateAddTable('SprDocFileList','SprDocFileList','AdsConnection');
      // Папки документов
      SprDocFolder:=CreateAddTable('SprDocFolder','SprDocFolder','AdsConnection');
      // Группы документов
      SprDocGroup:=CreateAddTable('SprDocGroup','SprDocGroup','AdsConnection');
      // Социальные группы/категории населения
      SprDocManGroup:=CreateAddTable('SprDocManGroup','SprDocManGroup','AdsConnection');
      // Должностные лица
      //SprDocOfficial:=CreateAddTable('SprDocOfficial','SprDocOfficial','AdsConnection');
      // Тематики обращений граждан
      SprDocSubj:=CreateAddTable('SprDocSubj','SprDocSubj','AdsConnection');
      // Административные процедуры для граждан
      SprDocAdmProc:=CreateAddTable('SprDocAdmProc','SprDocAdmProc','AdsConnection');{+}
      // Административные процедуры для организаций
      SprDocAdmProcU:=CreateAddTable('SprDocAdmProcU','SprDocAdmProcU','AdsConnection');{+}
      //\\
   end;
   {$ENDIF}
end;

procedure TDoc2Sel.ShowGurnal(GurnalName: string);
{$IFDEF in_sel}
var
   I: Integer;
   fmTblEdit: TfmTblEdit;
{$ENDIF}
begin
   {$IFDEF in_sel}
   for I:=0 to Pred(ListGurnal.Count) do begin
      if (ListGurnal.Objects[i] is TfmTblEdit) and SameText(ListGurnal.Strings[I], GurnalName) then begin
         fmTblEdit:=TfmTblEdit(ListGurnal.Objects[I]);
         fmTblEdit.BringToFront;
         fmTblEdit.Show;
         fmMain.SetRole;
         Break;
      end;
   end;
   {$ENDIF}
end;

function TDoc2Sel.GetAdresPunkt(Id: Integer): string;
{$IFDEF in_sel}
var
   Adres_PunktTN: string;
{$ENDIF}
begin
   {$IFDEF in_sel}
   Result:='';
   if dmBase.SprPunkt.Locate('ID', Id, []) then begin
      dmBase.GetTypePunkt(dmBase.SprPunkt.FieldByName('TYPEPUNKT').AsString, 'R', Adres_PunktTN);
      Result:=dmBase.SprPunkt.FieldByName('NAME').AsString;
      if Adres_PunktTN<>'' then begin
         Result:=Adres_PunktTN+' '+Result;
      end;
   end;
   {$ELSE}
   Result:='г. Город';
   {$ENDIF}
end;

procedure TDoc2Sel.CopyPasport(Id: Integer);
{$IFDEF in_sel}
var
   Pasport: TPassport;
{$ENDIF}
begin
   {$IFDEF in_sel}
   Pasport:=dmBase.PasportMen(dmBase.GetDateCurrentSost, IntToStr(Id));
   if (Pasport.Nomer<>'') or (Pasport.LichNomer<>'') then begin
     SetProvDoc(
        Pasport.UdostKod,
        Pasport.Seria,
        Pasport.Nomer,
        Pasport.Date,
        Pasport.Organ,
        Pasport.LichNomer
     );
   end else begin
     SetProvDoc( 0, '', '', 0, '', '');
   end;
   //--Result:=dmBase.PasportToText(Pasport, 0);
   {$ELSE}
   SetProvDoc(1, 'AB', '1231231', Now, 'Орган выдачи', '12212121111222');
   {$ENDIF}
end;

procedure TDoc2Sel.SetProvDoc(DocType: Integer; DocSer, DocNum: string; DocDate: TDateTime; DocOrg, PersonId: string);
begin
   FProvType:=DocType;
   FProvSer:=DocSer;
   FProvNum:=DocNum;
   FProvDate:=DocDate;
   FProvOrg:=DocOrg;
   FPersonId:=PersonId;
end;

function TDoc2Sel.SetFilter(Column: TColumnEh; OldFilter: string): Boolean;
{$IFDEF in_sel}
var
   lReopen: Boolean;
{$ENDIF}
begin
   {$IFDEF in_sel}
   Result:=SetGridSeekColumn(Column, true, OldFilter, lReopen, nil);
   {$ELSE}
   Result:=False;
   {$ENDIF}
end;

function TDoc2Sel.ShowReport(FileName: string): Boolean;
begin
   Result:=False;
   if FileExists(FileName) then begin
      if SameText(ExtractFileExt(FileName), '.FRP') then begin
         Result:=True;
         {$IFDEF in_sel}
         fmMain.frReport.LoadPreparedReport(FileName);
         fmMain.frReport.ShowPreparedReport;
         {$ENDIF}
      end
      else if SameText(ExtractFileExt(FileName), '.FP3') then begin
         Result:=True;
         {$IFDEF in_sel}
         {$IFDEF USE_FR3}
         fmMain.frxReport.Report.PreviewPages.LoadFromFile(FileName);
         fmMain.frxReport.Report.ShowPreparedReport;
         {$ENDIF}
         {$ENDIF}
      end;
   end;
end;

function TDoc2Sel.GetAttachDir: string;
{$IFDEF in_sel}
var
   Err: string;
{$ENDIF}
begin
   {$IFDEF in_sel}
   Result:=GetDocArxivFolder(Err);
   if Result='' then begin
      MessageDlgR(Err, mtError, [mbCancel], 0);
   end;
   {$ELSE}
   Result:=ExtractFilePath(Application.ExeName)+'docums\';
   {$ENDIF}
end;

initialization
   Doc2Sel:=TDoc2Sel.Create;

finalization
   Doc2Sel.Free;

end.
