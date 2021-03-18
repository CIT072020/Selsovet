const
  TYPE_DATE_IZV=5;       // 
  TYPE_DATE_SPRAV=6;     // тип даты прописью в справках Word

  //------- для функции DatePropis -------------------
  DP_D_MP_Y=0;        // 11 июля 2011
  DP_DK_MP_Y=1;       // "11" июля 2011
  DP_DK_MP_YP_160=2;  // "11" июля 2011   +chr(160)
  DP_MAIN=3;          // 11.07.2011
  DP_D_MP_YP=4;       // 11 июля 2011 г.
  DP_D_MP_YPF=5;      // 11 июля 2011 года
  DP_D_MP_YP_160=6;   // 11 июля 2011 г.  +chr(160)
  DP_YEAR=7;          // 2011
  //--------------------------------------------------
  TYPEOBJ_NASEL=3;

  dkSMDO=7; // документ из СМДО

//---------------------------------------------------------------
function CreateFIO(ds:TDataSet):String;
begin
  Result:=ds.Fld('FAMILIA').AsString+' '+ds.Fld('NAME').AsString+' '+ds.Fld('OTCH').AsString;
end;
//--пустой ИН для з/а и свидетельств -------------------------------------
function getEmptyIN(sLang:String):String;
begin
  sLang:=AnsiUpperCase(Copy(sLang,1,1));
  if (sLang='R') or (sLang='Р') or (sLang='')
    then Result:='сведения отсутствуют'
    else Result:='звесткі адсутнічаюць';
end;
//---------------------------------------------------------------------
// код организации СМДО ПК "Одно окно"
function AdresatOW:String;
begin
  Result:='s_window';
end;
//---------------------------------------------------------------------
function SortPunkt(nType:Integer; lStat:Boolean):String;
begin
  if nType=0 then begin
    if ParamAsInteger('CH_ADRES')=0 
      then Result:='d.punkt'
      else Result:='s.nomer';
  end else begin
    if ParamAsInteger('CH_ADRES')=0 
      then Result:='s.name'
      else Result:='s.nomer';
  end;
end;
//---------------------------------------------------------------------
function TypeArxiv:String;
begin
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5'   // г.Минск
    then Result:='городской'
    else Result:='областной';
end;
//---------------------------------------------------------------------
function GetOrganResh(nID:Integer):String;
begin
  if nID<=0 
    then Result:=GlobalTask.ParamAsString('NAME')
    else Result:=fmMain.SprNameOrg(nID,'','');
end;
//---------------------------------------------------------------------
function CRLF:String;
begin
  Result:=chr(13)+chr(10);
end;
//---------------------------------------------------------------------
procedure WriteDebug_(v:Variant);
begin
  writedebug(v);
end;
//---------------------------------------------------------------------
function IsRnGorod:Boolean;
begin
  Result:=true;
end;

function CreateChr13(s:String):String;
begin
  Result:=StringReplace(s,'#',chr(13));
end;

function IdNom(lFull:Boolean):String;
begin
  if lFull
    then Result:='идентификационный номер'
    else Result:='номер идент.';
end;

function CountTablesZAGS:Integer;
begin
  Result:=11;
end;
function GetNameTableZAGS(n:Integer):String;
begin
  case n of
    1:Result:='АктыРождений';
    2:Result:='АктыСмертей';
    3:Result:='ЗаключениеБраков';
    4:Result:='AktAdopt';
    5:Result:='AktChangeName';
    6:Result:='AktTermMarriage';
    7:Result:='АктыУстОтцовства';
    8:Result:='АктыУстМатеринства';
    9:Result:='ListSvid';
   10:Result:='AddDokZAGS';
   11:Result:='AlfavitZAGS';
  end;
end;
//------------------------------------------------------------------
function GetNameTableFromTypeObj(nTypeObj:Integer):String;
begin
  case nTypeObj of
    6:Result:='АктыРождений';
    7:Result:='АктыСмертей';
    5:Result:='ЗаключениеБраков';
    12:Result:='AktAdopt';
    13:Result:='AktChangeName';
    11:Result:='AktTermMarriage';
    8:Result:='АктыУстОтцовства';
    18:Result:='АктыУстМатеринства';
  end;
end;
//------------------------------------------------------------------
function _FIO(ds:TDokZags;sPar:String):String;
var
 sName,sOtch,sFam:String;
begin
  sName:='NAME';
  sOtch:='OTCH';
  sFam:='FAMILIA';
  if sPar<>'' then begin
    sName:=sPar+'NAME';
    sOtch:=sPar+'OTCH';
    sFam:=sPar+'FAMILIA';
  end;
  Result:=Trim(ds.Fld(sFam).AsString)+'~'+Trim(ds.Fld(sName).AsString)+'~'+
         Trim(ds.Fld(sOtch).AsString);
end;
//------------------------------------------------------------------
function _FIO_B(ds:TDokZags;sPar:String):String;
var
 sName,sOtch,sFam:String;
begin
  sName:='NAME_B';
  sOtch:='OTCH_B';
  sFam:='FAMILIA_B';
  if sPar<>'' then begin
    sName:=sPar+'NAME_B';
    sOtch:=sPar+'OTCH_B';
    sFam:=sPar+'FAMILIA_B';
  end;
  Result:=Trim(ds.Fld(sFam).AsString)+'~'+Trim(ds.Fld(sName).AsString)+'~'+
         Trim(ds.Fld(sOtch).AsString);
end;

//------------------------------------------------------------------
// номер очереди
function GetNomerOch(ds:TDataSet):String;
begin  
  if Globaltask.ParamAsBoolean('RESH_ADD_NOMER')
    then Result:=Trim(ds.Fld('NOMER_OCH').Asstring)
    else Result:='';   
  if Result='0' then Result:='';
end;
//------------------------------------------------------------------
// номер дела
function GetNomerDelo(sDelo:String):String;
begin  
  if Globaltask.ParamAsBoolean('RESH_ADD_DELO')
    then Result:=Trim(sDelo)
    else Result:='';   
  if Result='0' then Result:='';
end;
//------------------------------------------------------------------
// основание постановки на очередь
function GetOsnovOchered_(nTypeSpr:Integer; sPrich:String; nTypeResult:Integer):String;
var
  s,sSpr,sDok,sPunkt:String;
begin
//  Result:=' п.'+SeekValueSpr('SprPostOch','ID',s,'PUNKT')+' Указа Президента Республики Беларусь №';
//  Result:=' п.'+SeekValueSpr('SprPostOch','ID',s,'PUNKT')+' Указа Президента Республики Беларусь №';
  if nTypeSpr=2  then sSpr:='SprSnOch'  else sSpr:='SprPostOch';
  sDok:=SeekValueSpr(sSpr,'ID',sPrich,'UKAZ');
  sPunkt:=SeekValueSpr(sSpr,'ID',sPrich,'PUNKT')
//writedebug('GetOsnovOchered_   punkt='+sPunkt+' Spr='+sSpr+'  TypeResult='+IntToStr(nTypeResult));
  if (sPunkt='') and (sDok='') then begin  // простая причина без указа и номера пункта из него
    Result:=SeekValueSpr(sSpr,'ID',sPrich,'NAME');
  end else begin
    if sDok='' then sDok:='ЖК';
    if sDok='ЖК' then begin  // Жилищный кодекс
      s:=' согласно';
      sDok:=' Жилищного кодекса Республики Беларусь';
      if nTypeResult=OCH_OSN_FULL then begin             // 1  полное наименование
        Result:=sPunkt+' '+SeekValueSpr(sSpr,'ID',sPrich,'FNAME');
      end else if nTypeResult=OCH_OSN_FULL2 then begin   // 6  полное наименование + наз.документа
        Result:=sPunkt+' '+SeekValueSpr(sSpr,'ID',sPrich,'FNAME')+s+sDok;
      end else if nTypeResult=OCH_OSN_KRAT then begin    // 2  краткое + наз.документа
        Result:=SeekValueSpr(sSpr,'ID',sPrich,'NAME')+s+sDok;
      end else if (nTypeResult=OCH_OSN_UKAZ) or (nTypeResult=OCH_OSN_POLOG) then begin    // 3,4 пункт + наз.документа
        Result:=sPunkt+sDok;
      end else if nTypeResult=OCH_OSN_PUNKT then begin   // 5 только номер пункта
        Result:=sPunkt;
      end;
    end else begin
      sDok:=' положения согласно Указу Президента Республики Беларусь №'+sDok;
      if nTypeResult=OCH_OSN_FULL then begin             // 1  полное наименование
        Result:=' п.'+sPunkt+' '+SeekValueSpr(sSpr,'ID',sPrich,'FNAME');
      end else if nTypeResult=OCH_OSN_FULL2 then begin   // 6  полное наименование + наименование указа           
        Result:=' п.'+sPunkt+' '+SeekValueSpr(sSpr,'ID',sPrich,'FNAME')+sDok;
      end else if nTypeResult=OCH_OSN_KRAT then begin    // 2  краткое + наименование указа
        Result:=' п. '+SeekValueSpr(sSpr,'ID',sPrich,'NAME')+sDok;
      end else if nTypeResult=OCH_OSN_UKAZ then begin    // 3 пункт + наименование указа
        Result:=' п.'+sPunkt+sDok;
      end else if nTypeResult=OCH_OSN_POLOG then begin   // 4 пункт + положение
        Result:=' п.'+sPunkt+' Положения об учете граждан, нуждающихся в улучшении жилищных условий, и о порядке предоставления жилых помещений государственного жилищного фонда';
      end else if nTypeResult=OCH_OSN_PUNKT then begin   // 5 только номер пункта
        Result:=' п.'+sPunkt;
      end;
    end;
  end;
//writedebug('GetOsnovOchered_ '+result);
end;

function GetOsnovOchered(sTypeSpr:String;ds:TDataSet;nType:Integer):String;
var
  s1,s2,sField:String;
  nTypeSpr,n:Integer;
begin
  Result:='';
  n:=Pos(';',sTypeSpr);   // например 'TIP;ISK_', 'POST;REG_', 'SN;ISK_'
  if n>0 then begin // м.б. допол. часть к имени поля
    sField:=Copy(sTypeSpr,n+1,Length(sTypeSpr))+'OSNOV';  
  end else begin
    sField:='OSNOV';
  end;
  if (Copy(sTypeSpr,1,3)='TIP') then begin    // определить по полю тип из ds
    if ds.Fld('TIP').AsInteger=OCH_RESH_SN then nTypeSpr:=2 else nTypeSpr:=1;   // !!!!
  end else begin
    if (Copy(sTypeSpr,1,1)='P') or (Copy(sTypeSpr,1,1)='П')  then nTypeSpr:=1 else nTypeSpr:=2;
  end;
  s1:='';
  s2:='';
  if (ds.Fld(sField).AsString='') or (ds.Fld(sField).AsString='0')
    then s1:=ds.Fld(sField+'_TEXT').AsString
    else s1:=GetOsnovOchered_(nTypeSpr,ds.Fld(sField).AsString,nType);
  if (ds.Fld(sField+'2').AsString='') or (ds.Fld(sField+'2').AsString='0')
    then s2:=ds.Fld(sField+'_TEXT2').AsString
    else s2:=GetOsnovOchered_(nTypeSpr,ds.Fld(sField+'2').AsString,nType);
  if s1<>'' 
    then Result:=s1;
  if (s2<>'') then begin
    if Result='' 
     then Result:=s2
     else Result:=Result+', '+s2;
  end;
end;

{
function GetOsnovOcheredR(resh:TReshOchMen;nType:Integer;lAdd):String;
var
  s1,s2,sField:String;
  nTypeSpr,n:Integer;
begin
  Result:='';
  if resh.TIP=OCH_OSN_SN then nTypeSpr=2 else nTypeSpr=1; // (Copy(sTypeSpr,1,1)='P') or (Copy(sTypeSpr,1,1)='П')  then nTypeSpr:=1 else nTypeSpr:=2;
  s1:='';
  s2:='';
  if resh.Osnov=0
    then s1:=resh.OsnovText
    else s1:=GetOsnovOchered_(nTypeSpr,IntToStr(resh.Osnov),nType);
  if resh.Osnov2=0
    then s2:=resh.OsnovText2
    else s2:=GetOsnovOchered_(nTypeSpr,IntToStr(resh.Osnov2),nType);
  if s1<>'' 
    then Result:=s1;
  if (s2<>'') then begin
    if Result='' 
     then Result:=s2
     else Result:=Result+', '+s2;
  end;
end;
}

// если строковое поле не пустое, то составить строку из значений
function CreateStrFromStr(sAdd:String;fld:TField;sAdd2:String):String;
begin
  if fld.AsString=''
    then Result:=''
    else Result:=sAdd+fld.AsString+sAdd2;
end;

// если поле с датой не пустое, то составить строку из значений
function CreateStrFromDate(sAdd:String;fld:TField;nType:Integer):String;
begin
  if fld.IsNull
    then Result:=''
    else Result:=sAdd+DatePropis(fld.AsDateTime,nType);
end;
//---------------------------------------------------
function GetPos(s:String;arrS:array of string;var nNewPos:Integer):Integer;
var
  i,n:Integer;
begin
  Result:=0;
  nNewPos:=0;
  for i:=0 to GetArrayLength(arrS)-1 do begin
    n:=Length(arrS[i]);
    Result:=Pos(arrS[i],ANSILowercase(s));
    if Result>0 then begin 
      break;
    end;
  end;
  nNewPos:=Result+n;
end;

//-------------------------------------------------------
procedure ChangeID_ZAGS2;
var
  f  : TfmParamQuest;
  n,i  : Integer;
  ds : TDataSet;
  sNewID,sOldID:String;
  sNewNAME,sOldNAME,sSQL,sss:String;
  dDo:TDateTime;
  nYear,nMonth,nDay : Word;
begin
  ds:=dmBase.GetDataSet('SprNames');
  sOldID:=ds.Fld('ID').AsString;
  sOldName:=ds.Fld('NAME').AsString;
  sTmpWHERE:='ID<>'+sOldID;         // исп-ся в GetLookUpZAGS см. ниже
  f := TfmParamQuest.Create(nil);
  f.Caption := 'Выберите новый ЗАГС';
  f.AddParamEx(0,'ЗАГС', 'ZAGS','TYPE=LOOKUP~DESC=LOOKUP_SPRNAMES2~WIDTH=250');
  f.AddParamEx(Date,'до даты', 'DATE_DO','TYPE=DATE');
  f.AddButtons('Выполнить~Отказ',0);
  n:=f.ShowQuest;
  sNewID:='';
  if n = 1 then begin
    sNewID:=IntToStr(f.GetValue('ZAGS','N'));
    dDo:=f.GetValue('DATE_DO','D');
  end;
  f.Free;
  sTmpWHERE:='';
  if (sNewID<>'') and (sNewID<>'0') and (sNewID<>'-1') then begin
//    writedebug(DatePropis(dDo,0)+'  '+DatePropis(Now,0));
    if (dDo>0) and (dDo<Date) then begin
      sss:='для з/а выписанных по '+DatePropis(dDo,0)+Chr(13);
    end else begin
      sss:='';
    end;
    sNewName:=SeekValueSpr('SprNames','ID',sNewID,'NAME');
    if OkWarning('Если Вы хотите изменить орган регистрации:           '+Chr(13)+
                 '"'+sOldName+'"  '+Chr(13)+
                 ' на'+Chr(13)+
                 '"'+sNewName+'"  '+Chr(13)+sss+
                 'введите в поле ввода слово "ДА" ') then begin
      OpenMessage('Изменение ...','',10);
      n:=CountTablesZAGS;
      for i:=1 to n do begin
        sSQL:='';
        sss:='';
        if (dDo>0) and (dDo<Date) then begin
          if (UpperCase(GetNameTableZAGS(i))='ALFAVITZAGS') then begin
            DecodeDate(dDo,nYear,nMonth,nDay);
            sss:='and isnull(dayz,0)>0 and isnull(monthz,0)>0 and isnull(yearz,0)>0 and '+
                 'cast(trim(cast(yearz as SQL_CHAR))+''-''+right(''0''+trim(cast(monthz as SQL_CHAR)),2)+''-''+right(''0''+trim(cast(dayz as SQL_CHAR)),2) as SQL_DATE)<='+DateToSQL(dDo);
            sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+sss+';';
          end else if (UpperCase(GetNameTableZAGS(i))='LISTSVID') then begin

          end else begin
            sss:=' and datez<='+DateToSQL(dDo);
            sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+sss+';';
          end;
        end else begin
          sSQL:='update '+GetNameTableZAGS(i)+' set id_zags='+sNewID+' where id_zags='+sOldID+';';
        end;
        if sSQL<>'' then begin
//          writedebug(sSQL);
          dbExecuteSQL(sSQL);
          if dbLastError()<>'' then begin
//            writedebug(dbLastError());
            PutError( 'Ошибка выполнения: '+dbLastError() );
          end;
        end;
      end;
      CloseMessage();
    end;
  end;
end;


