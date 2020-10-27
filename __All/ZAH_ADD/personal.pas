//----------------------------------------------------------------
procedure CreateSprZAH;
var
  XL:Variant;
  lSS,lWrite,lOk:Boolean;
  ds:TDataSet;
  sNameExcel,sNameExcel2,s,ss:String;
  i,j,n:Integer;
  sName,sKodObl, sKodRn,sObl,sRn,sSS,sNP,sKod:String;
  nATE:Integer;
  sl,slA:TStringList;
begin
  XL:=GetOfficeObject('Excel',lOk);
  if lOk then begin
    sNameExcel:='E:\projects\Selsovet7\__All\ZAH\cur.xls';
//    sNameExcel2:='E:\projects\Selsovet7\__All\ZAH\cur_new.xls';
    XL.WorkBooks.Add(sNameExcel);
    dbSetCurrentConnect(idConnShared);
    ds:=dbOpen('Gisun_SprZAH','EXCLUSIVE=FALSE');
    if ds=nil then exit;
    sl:=TStringList.Create;
    slA:=TStringList.Create;
    sKodObl:='';
    sKodRn:='';
//    dbZap(ds);
    try
//      OpenMessage('Формирование ... ','',10);
      lWrite:=true;
//      for i:=5 to 2754 do begin // могилев
//      for i:=4 to 27 do begin  // минск
      for i:=4 to 2258 do begin  // гомель
        s:=IntToStr(i);
        //Гродно   Витебск
//        ss:=Trim(XL.Range['A'+s].Value);
        //Брест Минская Могилевчкая Минск
        ss:=Trim(XL.Range['B'+s].Value);
        if (ss<>'') and IsAllDigit(ss) then begin
          //Гродно  Витебск Минск
           {
           sObl:=Trim(XL.Range['B'+s].Value);
           sRn:=Trim(XL.Range['C'+s].Value);
           sSS:=Trim(XL.Range['D'+s].Value);
           sNP:=Trim(XL.Range['E'+s].Value);
           sKod:=Q_DelChars(Trim(XL.Range['H'+s].Value),'-'); 
           sNAME:=Trim(XL.Range['G'+s].Value);      }
          //Брест Минская Гомельская
          sObl:=Trim(XL.Range['C'+s].Value);
          sRn:=Trim(XL.Range['D'+s].Value);
          sSS:=Trim(XL.Range['E'+s].Value);               
          n:=Pos(' ',sSS);
          if n>0 then sSS:=Trim(Copy(sSS,1,n-1));
          sNP:=Trim(XL.Range['F'+s].Value);
          sKod:=Q_DelChars(Trim(XL.Range['I'+s].Value),'-');

          if not dbLocate(ds,'ID',[sKod],'') then begin  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

          sName:=Trim(XL.Range['H'+s].Value);
          sName:=Replace_CRLF(sName); //,Chr(13)+Chr(10),' ');
          lSS:=false;
          writedebug(ss+')   '+sObl+', '+sRn+', '+sSS+', '+sNP+'   >'+sName);
          nATE:=dmBase.getATEsys(sl,sObl,sRn,sSS,sNP,'+');   // # - не выдавть запрос если более 2 нас.пунктов, + - тип определять из названия
          if nATE=0  
            then nATE:=dmBase.getATEsys(sl,sObl,sRn,'',sNP,'+');
          if nATE=0 then begin
            writedebug(ss+')   '+sObl+', '+sRn+', '+sNP+' -> '+InttoStr(nATE)+'  ->  '+sKod + '<<<<<<<<<<<<<<<<<<<<<');
            XL.Range['A'+s].Value:='1';
            if (sSS<>'') and (sSS<>'-')
              then nATE:=dmBase.getATEsys(sl,sObl,sRn,sSS,'','');  // определим сельский совет
            if nATE>0 then begin 
              XL.Range['A'+s].Value:='2';
              nATE:=0;
            end;
          end;
          if slA.IndexOf(sKod)>-1  // код уже есть
            then writedebug(sKod+'*******************************')
            else slA.Add(sKod);
          if lWrite then begin
            ds.Append;
            ds.Fld('NAME').AsString:=sName;
            if (sSS='') or (sSS='-') then ss:=sNP else ss:=sSS+', '+sNP;
            ds.Fld('NAME_PATH').AsString:=sObl+', '+sRn+', '+ss;
            ds.Fld('ID').AsString:=sKod;
            ds.Fld('ATE_OBL').AsString:=Trim(sl.Values['OBL']);
            ds.Fld('ATE_RN').AsString:=sl.Values['RN'];
            ds.Fld('ATE_SS').AsString:=sl.Values['SS'];

            if nATE>0 then begin
              sKodRn:=ds.Fld('ATE_RN').AsString;
            end else begin
              ds.Fld('CHECK').AsBoolean:=true;
            end;
            ds.Fld('ATE_PUNKT').AsString:=IntToStr(nATE);
            ds.Fld('CHECK').AsBoolean:=false;
            ds.Post;
          end;

          end;   // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        end else begin
          writedebug(inttostr(i)+'  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@')
        end;
      end;
    finally
//      CloseMessage();
      sl.Free;
      slA.Free;
      dbSetCurrentConnect(idConn);
      dbClose(ds);
    end;
//    XL.ActiveWorkBook.SaveAs(sNameExcel2);
    XL.Visible:=true;
    XL:=null;
  end;
end;


