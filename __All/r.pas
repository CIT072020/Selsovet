var
  ds:TfrxDataSet;                                 
  sTelefon,s,sOwnName,dom,korp,kv,sMens:String;
  strUseGilfond:String;                                              
  a1:array of string;                                          
  a2:array of string;
  a3:array of string;
  a4:array of string;
  a5:array of string;
  a6:array of string;
  i,nTypeDate,nTypeDateGrid:Integer;
  lAdd:Boolean;
  dsMen:TDataSet;                                  
const
  nMax=21;
    
procedure Page1OnBeforePrint(Sender: TfrxComponent);
begin
//  nTypeDate:=ParamAsInteger('TYPE_DATE');
//  if nTypeDate=0 then nTypeDate:=4;                                                                  
//  nTypeDateGrid:=ParamAsInteger('TYPE_DATE_GRID');
//  if nTypeDateGrid=0 then nTypeDateGrid:=3;
  
  strUseGilfond:=Adres.UseGilfond;
//  if strUseGilfond=''
//    then strUseGilfond:=Parameters('DEFAULT_GES');
  
  sTelefon:=<Adres_LicSchet."TELEFON">;  
    
  dom:='';
  korp:='';
  kv:='';
  if <Adres."NOT_DOM">=false then begin
    dom:=<Adres."DOM">;
    korp:=<Adres."KORP">;
    kv:=<Adres."KV">;                
  end;                         
//-----------собственники--------------------------------------                                                                                                                          
  sOwnName:='';
  ds:=Report.GetDataSet('Adres_Owners');
  if ds.recordCount<4 then s:=chr(13)+chr(10) else s:=', ';                                        
  ds.First;
  while not ds.Eof do begin
    // может у собственника заполнен телефон                                                                                         
    if (sTelefon='') and (ds.Value('TYPEKOD')=1) then begin
      dsMen:=dbGetMen(CurrentSost(), ds.Value('KOD'));
      if dsMen<>nil then begin
        sTelefon:=dsMen.FieldByName('TELEFON').AsString;
      end;                
    end;              
    sOwnName:=sOwnName+ds.Value('NAME')+s;  
    ds.Next;                    
  end;            
  if ds.recordCount>3 then begin
    sOwnName:=Copy(sOwnName,1,Length(sOwnName)-2);
  end;             
  ds.First;
//-----------люди по адресу------------------------------------------------                                                                                                                          
  SetLength(a1,nMax);
  SetLength(a2,nMax);
  SetLength(a3,nMax);
  SetLength(a4,nMax);
  SetLength(a5,nMax);
  SetLength(a6,nMax);
  ds:=Report.GetDataSet('Mens');
  ds.First;
  i:=0;
  sMens:=GetBookmarkMen;
  while not ds.Eof and (i<nMax-1)and  do begin
    lAdd:=false;
    if sMens='' then begin                                                     
      if ds.Value('CANDELETE')=False then lAdd:=true;
    end else begin
      if Pos(Str(ds.Value('ID_INTERNAL'))+';',sMens)>0 then lAdd:=true                                                             
    end;              
    if lAdd then begin
      // если телефон до сих пор не заполнен, берем телефон первого человека у которого он есть                                                                                                                                                                                                    
      if (sTelefon='') and (ds.Value('TELEFON')<>'') then begin
        sTelefon:=ds.Value('TELEFON');
      end;                  
      a1[i]:=IntToStr(i+1);
      a2[i]:= '';
      if ds.Value('OTNOSH')<>null then begin                                                        
        a2[i]:= ValueSpr('dmBase.SprOtnosh->ID',ds.Value('OTNOSH'),'NAME');
      end else begin
        if (ds.Value('FIRST')<>null) and ds.Value('FIRST') then 
          a2[i]:= '';
      end;                  
      a3[i]:=ds.Value('FAMILIA')+' '+ds.Value('NAME')+' '+ds.Value('OTCH');
      if ds.Value('DATER')<>null then a4[i]:=DatePropis(ds.Value('DATER'),4);
      if ds.Value('DATEP')<>null then a5[i]:=DatePropis(ds.Value('DATEP'),3);
      if ds.value('PROPIS')=False then                                                          
        if ds.Value('DATEV')<>null then a6[i]:=DatePropis(ds.Value('DATEV'),3);
      i:=i+1;
    end;              
    ds.Next;
  end;              
  ds.First;
//-----------------------------------------------------------                                                                                                                          
  
end;

begin
end.