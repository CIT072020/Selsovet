unit uFunc;

interface

{$I Task.inc}

uses Windows, SysUtils, Db, ifpii_dbfunc, dbFunc, Classes, Graphics, Controls, Forms, Dialogs, FuncPr, SasaIniFile, FileCtrl, MetaTask, SasaUtils;

procedure SavePosForm( f : TForm; sSect:String='' );
procedure LoadPosForm( f : TForm; sSect:String='' );

{$IFDEF ZAGS}
  procedure CheckDublicateAkt;
{$ENDIF}


implementation

{$IFDEF ZAGS}
uses dBase;
{$ENDIF}

procedure SavePosForm( f : TForm; sSect:String );
begin
  if sSect='' then sSect:=f.Name;
  if (f.BorderStyle=bsSizeable) then
    CompToIni(f,GlobalTask.IniFile('FORM'),sSect,GlobalTask.PropForm,true);
end;

procedure LoadPosForm( f : TForm; sSect:String );
begin
  if sSect='' then sSect:=f.Name;
  if (f.BorderStyle=bsSizeable) then
  CompFromIni(f,GlobalTask.IniFile('FORM'),sSect,GlobalTask.PropForm);
end;

procedure WriteDebug(s:String);
begin
//
end;

{$IFDEF ZAGS}
// begin ZAGS

procedure CheckZapis_(nType:Integer; lCheckOrg:Boolean);
var
  ds,dsZ,dsSvid,dsApp : TDataSet;
  sSQL,ss,s,sID:String;
  d:TDateTime;
  i,j:Integer;
  sl,slSvid:TStringList;
  arr:TArrVariant;
begin
  s:=dmBase.NameTableFromTypeObj(nType);
  if lCheckOrg then begin
    sSQL:='SELECT DATEZ, NOMER, ID_ZAGS, COUNT(*) KOLVO FROM '+s+' GROUP BY 1,2,3 HAVING Count(*)>1';
  end else begin
    sSQL:='SELECT DATEZ, NOMER, COUNT(*) KOLVO FROM '+s+' GROUP BY 1,2 HAVING Count(*)>1';
  end;
  ds:=dbOpenSQL(sSQL,'');
  dsSvid:=dbOpenSQL('SELECT TOP 1 * FROM SvidPovtor','');
  dsApp:=dmBase.SvidPovtor;
  dsZ:=dmBase.GetDataSet(s);
  dsZ.First;
  i:=1;
  sl:=TStringList.Create;
  slSvid:=TStringList.Create;
  dbSetIndex(dsZ,'NOMER');
  dbSetIndex(dsApp,'PR_KEY');   //SVID_TYPE;AKT_ID;SVID_DATE;SVID_NOMER
  while not ds.Eof do begin
    SetLength(arr,2);
    arr[0]:=ds.FieldByName('NOMER').AsInteger;
    arr[1]:=ds.FieldByName('DATEZ').AsDateTime;
    dbSetRange(dsZ,arr);
    sl.Clear;
    slSvid.Clear;
    s:='';
    sID:='';
    while not dsZ.Eof do begin
      // не пров. ЗАГС  или  загсы равны
      if not lCheckOrg  or  (dsZ.FieldByName('ID_ZAGS').AsInteger=ds.FieldByName('ID_ZAGS').AsInteger) then begin
        //-------------------------------------------------
//        if nType=_TypeObj_
        // соберем все свидетельства
        if (Trim(dsZ.FieldByName('SVID_NOMER').AsString)<>'') and not dsZ.FieldByName('DATESV').IsNUll then begin
          ss:=DTOS(dsZ.FieldByName('DATESV').AsDateTime, tdClipper)+PadLStr(Trim(dsZ.FieldByName('SVID_NOMER').AsString),10,' ')+PadLStr(Trim(dsZ.FieldByName('SVID_SERIA').AsString),10,' ');
          if slSvid.IndexOf(ss)=-1
            then slSvid.Add(ss);
        end;
        dbChangeSQL(dsSvid, 'SELECT * FROM SvidPovtor WHERE SVID_TYPE='+InttoStr(nType)+' and AKT_ID='+dsZ.FieldByName('ID').AsString, true);
        while not dsSvid.Eof do begin
          if (Trim(dsSvid.FieldByName('SVID_NOMER').AsString)<>'') and not dsSvid.FieldByName('SVID_DATE').IsNUll then begin
            ss:=DTOS(dsSvid.FieldByName('SVID_DATE').AsDateTime,tdClipper)+PadLStr(Trim(dsSvid.FieldByName('SVID_NOMER').AsString),10,' ')+PadLStr(Trim(dsSvid.FieldByName('SVID_SERIA').AsString),10,' ');
            if slSvid.IndexOf(ss)=-1
              then slSvid.Add(ss);
          end;
          dsSvid.Next;
        end;
        //------------------------------------------------
        // определим какую запись оставлять
        if sID=''
          then sID:=dsZ.FieldByName('ID').AsString;
        if dsZ.FieldByName('PODR').AsInteger=9 then begin
          sID:=dsZ.FieldByName('ID').AsString;
        end;
        sl.Add(dsZ.FieldByName('ID').AsString);
        s:=s+dsZ.FieldByName('ID').AsString+','
        //------------------------------------------------
      end;
      dsZ.Next;
    end;
    dbCancelRange(dsZ);
//    writeDebug('------------------------------------------------------');
//    writeDebug(inttostr(i)+'  '+ds.FieldByName('NOMER').AsString+'  '+ds.FieldByName('DATEZ').AsString+' === '+s+' === '+slSvid.CommaText);
    // удаление
    if sl.Count>0 then begin
      for j:=0 to sl.Count-1 do begin
        ss:=sl.Strings[j];
        if ss<>sID then begin
          SetLength(arr,1);
          arr[0]:=ss;
          if dbLocate(dsZ,'ID',arr,'') then begin
 //           WriteDebug('DELETE '+ss);
//            dmBase.DeleteDokument(dsZ,nType,true);
          end else begin
//            WriteDebug('???????????????????');
          end;
        end;
      end;
    end;
    // добавление свид.
    SetLength(arr,1);
    arr[0]:=sID;
    if dbLocate(dsZ,'ID',arr,'') then begin
      if slSvid.Count>0 then begin
        for j:=0 to slSvid.Count-1 do begin
          d:=STOD(copy(slSvid.Strings[j],1,8),tdClipper);
          s:=Trim(copy(slSvid.Strings[j],9,10));
          ss:=Trim(copy(slSvid.Strings[j],19,10));
          if (dsZ.FieldByName('SVID_NOMER').AsString='') or (dsZ.FieldByName('SVID_NOMER').AsString<>s) then begin
            SetLength(arr,4);
            arr[0]:=nType;
            arr[1]:=sID;
            arr[2]:=s;
            arr[3]:=d;
            if not dbLocate(dsApp, 'SVID_TYPE;AKT_ID;SVID_NOMER;SVID_DATE', arr, '') then begin
              writeDebug('APPEND '+sID+ '   '+ss+'|'+s+'|'+DatePropis(d,3));
              try
                dsApp.Append;
                dsApp.FieldByName('SVID_TYPE').AsInteger:=nType;
                dsApp.FieldByName('AKT_ID').AsString:=sID;
                dsApp.FieldByName('SVID_SERIA').AsString:=ss;
                dsApp.FieldByName('SVID_NOMER').AsString:=s;
                dsApp.FieldByName('SVID_DATE').AsDateTime:=d;
                dsApp.Post;
              except
                dsApp.Cancel;
                writeDebug('ERROR APPEND '+sID+ '   '+ss+' '+s+' '+DatePropis(d,3));
              end;
            end else begin
              writeDebug('FIND APPEND '+sID+ '   '+ss+' '+s+' '+DatePropis(d,3));
            end;
          end;
        end;
      end;
    end else begin
      WriteDebug('APPEND ???????????????????');
    end;
    ds.Next;
    i:=i+1;
  end;
  dbClose(ds);
  dbClose(dsSvid);
  sl.Free;
  slSvid.Free;
end;
//--------------------------------------------------------------------------
procedure CheckDublicateAkt;
begin
//  CheckZapis_(_TypeObj_ZRogd);
//  CheckZapis_(_TypeObj_ZBrak);
end;
// end ZAGS
{$ENDIF}


begin

end.
