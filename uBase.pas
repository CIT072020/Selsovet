unit uBase;

interface

{$I Task.inc}

uses Windows, SysUtils, Db, Classes, Graphics, Controls, Forms, Dialogs,
     adscnnct, RKP,
     FuncPr, dbFunc, SasaIniFile, FileCtrl, MetaTask, uProjectAll;


  function ConnectExecuteM(strSQL:String; var strErr:String; nLog:Integer): Boolean;
  function ConnectExecuteS(strSQL:String; var strErr:String; nLog:Integer): Boolean;
  function OpenWorkQuery(strSQL:String; var strErr:String; nLog:Integer): TDataSet;
  function ReadNotKeyProg(strSeek,strID:String; var strVal:String): Boolean;

  function FillListPunkt(dDateFiks:TDateTime; ItemsList,ValueList : TStrings; slPar:TStringList):Boolean;

implementation

uses fMain, dBase;

//--------------------------------------------------------------------------------------
function ReadNotKeyProg(strSeek,strID:String; var strVal:String): Boolean;
begin
  strVal:='';
  Result:=true;    
  try
    dmBase.WorkQueryS.SQL.text:='SELECT text FROM help WHERE kod='+QStr(strSeek);
    dmBase.WorkQueryS.Open;
    strVal:=XorDecode(PPP_CONST, trim(dmBase.WorkQueryS.Fields[0].AsString));
    dmBase.WorkQueryS.Close;
//  ShowMessage(s);
    if (Pos(','+strID+',',strVal)>0) or (Copy(strVal,1,6)<>'NOT=WW')
      then Result:=true
      else Result:=false;
  except
    //
  end;
end;
//--------------------------------------------------------------------------------------
function ConnectExecuteSQL_(Conn:TAdsConnection; strSQL:String; var strErr:String; nLog:Integer): Boolean;
var
  s:String;
begin
  Result:=true;
  strErr:='';
  s:='';
  try
    Conn.Execute(strSQL);
  except
    on E:Exception do begin
      Result:=false;
      strErr:=E.Message;
      s:=' =>';
    end;
  end;
  if (nLog=1) or ((Result=false) and (nLog=2))
    then GlobalTask.WriteToLogFile(StringReplace(strSQL, #13#10, ' ', [rfReplaceAll])+s+strErr);
end;
//--------------------------------------------------------------------------------------
function ConnectExecuteM(strSQL:String; var strErr:String; nLog:Integer): Boolean;
begin
  Result:=ConnectExecuteSQL_(dmBase.AdsConnection,strSQL,strErr,nLog);
end;
//--------------------------------------------------------------------------------------
function ConnectExecuteS(strSQL:String; var strErr:String; nLog:Integer): Boolean;
begin
  Result:=ConnectExecuteSQL_(dmBase.AdsSharedConnection,strSQL,strErr,nLog);
end;
//--------------------------------------------------------------------------------------
function OpenWorkQuery(strSQL:String; var strErr:String; nLog:Integer): TDataSet;
var
  s:String;
begin
  Result:=nil;
  strErr:='';
  s:='';
  try
    dmBase.WorkQuery.SQL.Text:=strSQL;
    dmBase.WorkQuery.Open;
    Result:=dmBase.WorkQuery;
  except
    on E:Exception do begin
      strErr:=E.Message;
      s:=' =>';
    end;
  end;
  if (nLog=1) or ((Result=nil) and (nLog=2))
    then GlobalTask.WriteToLogFile(StringReplace(strSQL, #13#10, ' ', [rfReplaceAll])+s+strErr);
end;
//----------------------------------------------------------------------------------
function FillListPunkt(dDateFiks:TDateTime; ItemsList,ValueList : TStrings; slPar:TStringList):Boolean;
var
  lCheckDate,lOk:Boolean;
  fldDeath, fldBirth:TField;
  n,nTypeKod:Integer;
begin
  Result:=false;
  nTypeKod:=0;
  if slPar<>nil then begin
    nTypeKod:=StrToIntDef(ValueFromParams(slPar, 'TYPE_KOD', '0'),0);  //   ID или ATE_ID
//    nTypeName:=StrToIntDef(ValueFromParams(slPar, 'TYPE_NAME', '0'),0);    д.Новоселки, деревня Новоселки, Новоселки деревня
//    if ValueFromParams(slPar, 'BEL', '0')='0' then lRus:=true else lRus:=false;
  end;
  lCheckDate:=(dDateFiks<>-1);
  with dmBase.WorkQuery do begin
    Close;
    SQL.Text:= 'select s.id, trim(tt.name)+'' ''+s.name name, trim(tt.name_b)+'' ''+s.name_b name_b, s.typepunkt, '+
               '       gorod, not_stat, soato, vxod, date_death, date_birth, s.kod '+
               '  from спрНасПунктов s '+
               '  left join SysSpr.TypePunkt tt on s.typepunkt=tt.id '+
               ' order by ';
    if GlobalTask.ParamAsInteger('CH_ADRES')=1
      then SQL.Text:=SQL.Text+'s.nomer'
      else SQL.Text:=SQL.Text+'s.id';
    Open;
    fldDeath:=FieldByName('DATE_DEATH');
    fldBirth:=FieldByName('DATE_BIRTH');
    while not Eof do begin
      lOk:=false;
      // в текущем состоянии видим все населенные пункты за исключением ликвидированных
      if lCheckDate then begin
        if dDateFiks=dmBase.GetDateCurrentSost then begin
          if fldDeath.IsNull then begin
            lOk:=true;
          end;
        end else begin
          if (fldDeath.IsNull or (fldDeath.AsDateTime >= dDateFiks)) and
             (fldBirth.IsNull or (fldBirth.AsDateTime <= dDateFiks)) then begin
            lOk:=true;
          end;
        end;
      end else begin
        lOk:=true;
      end;
      if nTypeKod=0
        then n:=FieldByName('ID').AsInteger
        else n:=FieldByName('ATE_ID').AsInteger;
      if lOk and (n>0) then begin
        Result:=true;
        ValueList.Add(IntToStr(n));
//      if TypeName=0 then s:=FieldByName('name').AsString;  !!!
        ItemsList.Add(FieldByName('name').AsString);
      end;
      Next;
    end;
    Close;
  end;
end;

begin

end.
