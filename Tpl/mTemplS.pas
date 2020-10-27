unit mTemplS; // 21.09.2005
interface
uses
   Classes, SysUtils, mTempl, DB, uPSCompiler, uPSRunTime,
   Script, ROPasScript, adstable;

type
   // чтение значений параметров шаблона через скрипт (RemObjects Pascal Script)
   TROPScriptDataGetter=class(TDataGetter)
   private
      FConnection: string;
      FScript: TScript;
   public
      constructor Create(SourceName: string; SourceObject: TObject); override;
      destructor Destroy; override;
      function GetData(Template: TTemplate; ParameterList: TParameterList; Params: TStringList): Boolean; override;
   end;

procedure RegisterTemplateLibrary_C(S: TPSPascalCompiler);
procedure RegisterTemplateLibrary_R(S: TPSExec);

implementation

var
   CurrentConnection: string;
   CurrentTemplate: TTemplate;
   CurrentParameterList: TParameterList;

function GetTemplateParam(ParamName: string): string;
begin
   Result:='';
   if (CurrentTemplate<>nil) then begin
      Result:=CurrentTemplate.Params.Values[ParamName];
   end;
end;

function GetTemplateDataSet(DataSetName: string): TDataSet;
var
   I: Integer;
   Parameter: TParameter;
begin
   Result:=nil;
   //if (CurrentTemplate<>nil) and (CurrentParameterList<>nil) and (AnsiCompareText(TemplateName, CurrentTemplate.Name)=0) then begin
   if (CurrentTemplate<>nil) and (CurrentParameterList<>nil) then begin
      if AnsiCompareText(DataSetName, 'Main')=0 then begin
         if not CurrentTemplate.DataSet.Active then begin
            CurrentTemplate.DataSet.Open;
         end;
         Result:=CurrentTemplate.DataSet;
      end
      else begin
         for I:=0 to Pred(CurrentParameterList.Count) do begin
            Parameter:=CurrentParameterList[I];
            if (Parameter.ParameterType=ptTable) and (AnsiCompareText(Parameter.Name, DataSetName)=0) then begin
               if not Parameter.DataSet.Active then begin
                  Parameter.DataSet.Open;
               end;
               Result:=Parameter.DataSet;
            end;
         end;
      end;
   end;
end;

function GetTemplateFIO(DateFiks: TDateTime; PID: Word): string;
var
   Query: TAdsQuery;
   FAMILIA: TField;
   NAME: TField;
   OTCH: TField;
begin
   Result:='';
   Query:=TAdsQuery.Create(nil);
   try
      Query.DatabaseName:=CurrentConnection;
      Query.SQL.Text:=
         'select m.familia, m.name, m.otch '+
         'from Ќаселение m '+
         'where m.date_fiks='''+FormatDateTime('YYYY-MM-DD', DateFiks)+''' and m.id='+IntToStr(PID);
      Query.Open;
      FAMILIA:=Query.FindField('FAMILIA');
      NAME:=Query.FindField('NAME');
      OTCH:=Query.FindField('OTCH');
      Result:=Trim(FAMILIA.AsString)+' '+Trim(NAME.AsString)+' '+Trim(OTCH.AsString);
   finally
      Query.Free;
   end;
end;

function GetTemplateDateR(DateFiks: TDateTime; PID: Word): TDateTime;
var
   Query: TAdsQuery;
   DATER: TField;
begin
   Query:=TAdsQuery.Create(nil);
   try
      Query.DatabaseName:=CurrentConnection;
      Query.SQL.Text:=
         'select m.dater '+
         'from Ќаселение m '+
         'where m.date_fiks='''+FormatDateTime('YYYY-MM-DD', DateFiks)+''' and m.id='+IntToStr(PID);
      Query.Open;
      DATER:=Query.FindField('DATER');
      if DATER.IsNull then begin
         Result:=0;
      end
      else begin
         Result:=DATER.AsDateTime;
      end;
   finally
      Query.Free;
   end;
end;

function GetTemplateAdres(DateFiks: TDateTime; LicID, PID: Word): string;
var
   Query: TAdsQuery;
   PUNKT: TField;
   TUL: TField;
   UL: TField;
   DOM: TField;
   KORP: TField;
   KV: TField;
begin
   Result:='';
   Query:=TAdsQuery.Create(nil);
   try
      Query.DatabaseName:=CurrentConnection;
      Query.SQL.Text:=
         'select p.name as punkt, tu.name as tul, u.name as ul, d.dom, d.korp, d.kv '+
         'from Ћицевые—чета l '+
         '   left join Ѕазаƒомов d on d.date_fiks=l.date_fiks and d.id=l.adres_id '+
         '   left join —прЌасѕунктов p on p.id=d.punkt '+
         '   left join —пр”лиц u on u.id=d.ul '+
         '   left join —пр“ип”лиц tu on tu.id=u.tip '+
         'where l.date_fiks='''+FormatDateTime('YYYY-MM-DD', DateFiks)+''' and l.id='+IntToStr(LicID);
      Query.Open;
      PUNKT:=Query.FindField('PUNKT');
      TUL:=Query.FindField('TUL');
      UL:=Query.FindField('UL');
      DOM:=Query.FindField('DOM');
      KORP:=Query.FindField('KORP');
      KV:=Query.FindField('KV');
      Result:=Trim(PUNKT.AsString);
      if Trim(TUL.AsString)<>'' then begin
         Result:=Result+' '+TUL.AsString+'.';
      end;
      Result:=Result+' '+Trim(UL.AsString);
      if Trim(DOM.AsString)<>'' then begin
         Result:=Result+' дом'+Trim(DOM.AsString);
      end;
      if Trim(KORP.AsString)<>'' then begin
         Result:=Result+' корп.'+Trim(KORP.AsString);
      end;
      if Trim(KV.AsString)<>'' then begin
         Result:=Result+' кв.'+Trim(KV.AsString);
      end;
   finally
      Query.Free;
   end;
end;

function GetTemplateDateMigr(DateFiks: TDateTime; PID, Tip: Word): TDateTime;
var
   Query: TAdsQuery;
begin
   Query:=TAdsQuery.Create(nil);
   try
      Query.DatabaseName:=CurrentConnection;
      Query.SQL.Text:=
         'select max(date) '+
         'from Ќаселениеƒвижение d '+
         'where d.date_fiks='''+FormatDateTime('YYYY-MM-DD', DateFiks)+''' and d.id='+IntToStr(PID)+' and d.tip='+IntToStr(Tip);
      Query.Open;
      if Query.Fields[0].IsNull then begin
         Result:=0;
      end
      else begin
         Result:=Query.Fields[0].AsDateTime;
      end;
   finally
      Query.Free;
   end;
end;

function GetTemplateAdresProp(DateFiks: TDateTime; LicId: Word; PropName: string): string;
var
   Query: TAdsQuery;
begin
   Query:=TAdsQuery.Create(nil);
   try
      Query.DatabaseName:=CurrentConnection;
      Query.SQL.Text:=
         'select b.value '+
         'from Ћицевые—чета l '+
         '   left join Ѕаза—войствќбъектов b on b.date_fiks='''+FormatDateTime('YYYY-MM-DD', DateFiks)+''' and b.id=l.adres_id and b.pokaz='''+UpperCase(PropName)+''' '+
         'where l.date_fiks='''+FormatDateTime('YYYY-MM-DD', DateFiks)+''' and l.id='+IntToStr(LicID);
      Query.Open;
      Result:=Trim(Query.Fields[0].AsString);   
   finally
      Query.Free;
   end;
end;

procedure RegisterTemplateLibrary_C(S: TPSPascalCompiler);
begin
   S.AddDelphiFunction('function GetTemplateDataSet(DataSetName: string): TDataSet;');
   S.AddDelphiFunction('function GetTemplateParam(ParamName: string): string;');
   S.AddDelphiFunction('function GetTemplateFIO(DateFiks: TDateTime; PID: Word): string;');
   S.AddDelphiFunction('function GetTemplateDateR(DateFiks: TDateTime; PID: Word): TDateTime;');
   S.AddDelphiFunction('function GetTemplateAdres(DateFiks: TDateTime; LicID, PID: Word): string;');
   S.AddDelphiFunction('function GetTemplateDateMigr(DateFiks: TDateTime; PID, Tip: Word): TDateTime;');
   S.AddDelphiFunction('function GetTemplateAdresProp(DateFiks: TDateTime; LicId: Word; PropName: string): string;');
end;

procedure RegisterTemplateLibrary_R(S: TPSExec);
begin
   S.RegisterDelphiFunction(@GetTemplateDataSet, 'GETTEMPLATEDATASET', cdRegister);
   S.RegisterDelphiFunction(@GetTemplateParam, 'GETTEMPLATEPARAM', cdRegister);
   S.RegisterDelphiFunction(@GetTemplateFIO, 'GETTEMPLATEFIO', cdRegister);
   S.RegisterDelphiFunction(@GetTemplateDateR, 'GETTEMPLATEDATER', cdRegister);
   S.RegisterDelphiFunction(@GetTemplateAdres, 'GETTEMPLATEADRES', cdRegister);
   S.RegisterDelphiFunction(@GetTemplateDateMigr, 'GETTEMPLATEDATEMIGR', cdRegister);
   S.RegisterDelphiFunction(@GetTemplateAdresProp, 'GETTEMPLATEADRESPROP', cdRegister);
end;

{ TROPScriptDataGetter }

constructor TROPScriptDataGetter.Create(SourceName: string; SourceObject: TObject);
begin
   FConnection:=SourceName;
   FScript:=TScript(SourceObject);
end;

destructor TROPScriptDataGetter.Destroy;
begin
   inherited;
end;

function TROPScriptDataGetter.GetData(Template: TTemplate; ParameterList: TParameterList; Params: TStringList): Boolean;
var
   I: Integer;
   Parameter: TParameter;
   Field: TField;
   ScriptResult: Variant;
   DateFiks: TDateTime;
   LicID: Word;
   PID: Word;
   S: string;

   function StrToDateFmt(S: string): TDateTime;
   var
      OldDateSeparator: Char;
      OldShortDateFormat: string;
   begin
      OldDateSeparator:=DateSeparator;
      OldShortDateFormat:=ShortDateFormat;
      try
         DateSeparator:='-';
         ShortDateFormat:='yyyy.MM.dd';
         try
            Result:=StrToDate(S);
         except
            Result:=0;
         end;
      finally
         DateSeparator:=OldDateSeparator;
         ShortDateFormat:=OldShortDateFormat;
      end;
   end;

begin
   Result:=False;
   if (Template<>nil) and (ParameterList<>nil) and (Template.ScriptName<>'') and (FScript<>nil) then begin
      CurrentConnection:=FConnection;
      CurrentTemplate:=Template;
      CurrentParameterList:=ParameterList;
      try
         LicID:=StrToIntDef(Params.Values['LIC_ID'], 0);
         PID:=StrToIntDef(Params.Values['PID'], 0);
         DateFiks:=0;
         S:=Params.Values['DATE_FIKS'];
         if S<>'' then begin
            if S[1] in ['"', ''''] then begin
               Delete(S, 1, 1);
            end;
            if S[Length(S)] in ['"', ''''] then begin
               Delete(S, Length(S), 1);
            end;
            if S<>'' then begin
               DateFiks:=StrToDateFmt(S);
            end;
         end;
         ParameterList.ConfigMemTable(Template.DataSet);
         if FScript.RunEx(Template.ScriptName, [DateFiks, LicID, PID], ScriptResult) then begin
            for I:=0 to Pred(ParameterList.Count) do begin
               Parameter:=ParameterList[I];
               if Parameter.FieldName<>'' then begin
                  Field:=Template.DataSet.FindField(Parameter.FieldName);
                  if Field<>nil then begin
                     case Parameter.ParameterType of
                        ptString, ptMemo: Parameter.Value:=Field.AsString;
                        ptNumber: Parameter.Value:=Field.Value;
                        ptDate: Parameter.Value:=Field.Value;
                     end;
                  end;
               end;
            end;
            Result:=ScriptResult;
         end;
      finally
         CurrentTemplate:=nil;
         CurrentParameterList:=nil;
         CurrentConnection:='';
      end;
   end;
end;

end.
