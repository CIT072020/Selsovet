// 0-ok  1-сделать недоступным  2-исключить из видимости
function EnabledBelSpr(sUserProp:String; sCaption:String; sFile:String):Integer;
begin if ParamAsBoolean('SPRAV_BEL') then Result:=0 else Result:=2; end;

//----------------------------------------------------------
function FR_GetBrakRast_Bel:String;
var
  s1,s2,s3:String;
begin
  s1:=FirstUpper(DokZAGS.Fld('ON_FamiliaP_B').AsString+' '+DokZAGS.Fld('ON_Name_B').AsString+' '+DokZAGS.Fld('ON_Otch_B').AsString);
  s2:=FirstUpper(DokZAGS.Fld('ONA_FamiliaP_B').AsString+' '+DokZAGS.Fld('ONA_Name_B').AsString+' '+DokZAGS.Fld('ONA_Otch_B').AsString);
  if DokZAGS.ActiveON then s3:='жонкі' else s3:='мужа';
  Result:=GetBrakRast_Bel(DokZags.getTable('Dokument'),s1,s2,s3);
end;

//----------------------------------------------------------
// Архивная справка о браке 
function SPR_ARXIV_brak_Bel(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
  ds, spruch,dsDeti: TDataSet;      
  s,m,j,s3 : String;
  n,nType:Integer;
  sBel:String;
begin
   result:=true;
//   if DokZags.ActiveON then showmessage('ON') else showmessage('ONA');
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=1;  // 1-бел. 0-рус.
     ds.Edit;
     CreateTitle(ds,nType,6,true);
     if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
       if DokZAGS.ActiveON=true then begin
         ds.Fld('FIOP_R').AsString := GetPadegFIO3(DokZAGS.Fld('ON_FamiliaP_B').AsString,DokZAGS.Fld('ON_Name_B').AsString,DokZAGS.Fld('ON_Otch_B').AsString,'м','И');
         ds.Fld('MESTOJ').AsString := DokZAGS.GetAdres2('ON_M_GOSUD,FName;ON_M_OBL,ON_M_B_OBL;ON_M_RAION,ON_M_RNGOROD;ON_M_GOROD,ON_M_B_GOROD;ON_M_GOROD_R,ON_M_*',3);
       end else begin 
         ds.Fld('FIOP_R').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FamiliaP_B').AsString,DokZAGS.Fld('ONA_Name_B').AsString,DokZAGS.Fld('ONA_Otch_B').AsString,'ж','И');
         ds.Fld('MESTOJ').AsString := DokZAGS.GetAdres2('ONA_M_GOSUD,FName;ONA_M_OBL,ONA_M_B_OBL;ONA_M_RAION,ONA_M_RNGOROD;ONA_M_GOROD,ONA_M_B_GOROD;ONA_M_GOROD_R,ONA_M_*',3);
       end; 
     end else begin
       ds.Fld('FIOP_R').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
       ds.Fld('MESTOJ').AsString := '';
     end;
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
     ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia_B').AsString,DokZAGS.Fld('ON_Name_B').AsString,DokZAGS.Fld('ON_Otch_B').AsString,'м','И');
     ds.Fld('FIOP_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_Familia_B').AsString,DokZAGS.Fld('ONA_Name_B').AsString,DokZAGS.Fld('ONA_Otch_B').AsString,'ж','И');
     ds.Fld('ARX_DATE').AsString := DatePropisBel(NOW,4);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('Б','');
     ds.Fld('FIO_ON').AsString := GetPadegFIO(DokZAGS.Fld('ON_FamiliaP_B').AsString,'м','И');
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(DokZAGS.Fld('ONA_FamiliaP_B').AsString,'ж','И');
     // padeg_nation
     ds.Fld('ON_NATION').AsString:=NationForSprav_Bel(DokZAGS.Fld('ON_NATION').AsString,'NAME_M_B',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav_Bel(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G_B',', ');

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
     m:= FirstUpper(DokZAGS.Fld('ON_FamiliaP_B').AsString+' '+DokZAGS.Fld('ON_Name_B').AsString+' '+DokZAGS.Fld('ON_Otch_B').AsString);
     j:= FirstUpper(DokZAGS.Fld('ONA_FamiliaP_B').AsString+' '+DokZAGS.Fld('ONA_Name_B').AsString+' '+DokZAGS.Fld('ONA_Otch_B').AsString);
     n:=0;
// дополнительный текст для 4 видов справок
     if GetTemplateParam('PAR2')='0' then begin
       if DokZAGS.ActiveON then s3:='жонкі' else s3:='мужа';
       s:=GetBrakRast_Bel(DokZAGS.getTable('Dokument'), m,j, s3);
       ds.Fld('ADD_TEXT').AsString := s;
       n:=2;
     end;
     if GetTemplateParam('PAR2')='4' then begin
       if DokZAGS.Fld('BRAK_RAST').AsBoolean then begin
         if DokZAGS.Fld('TYPE_RAST').AsInteger=1 then s:='прекращен' else s:='расторгнут';
         PutError(' Брак '+s+'!');
         result:=false;
       end else begin
         if (DokZAGS.Fld('ON_SEM').AsString='2') and (DokZAGS.Fld('ONA_SEM').AsString='2') then begin
           ds.Fld('ADD_TEXT').AsString := getResource('SPR_BRAK_B1',nType); 
           ds.Fld('ADD_TEXT2').AsString := chr(13)+getResource('SPR_FOR_OCH',nType);
           n:=3;
         end else  begin
           PutError(' Справка выдается только для вступивших в брак впервые!');
           result:=false;
         end;
       end;
     end;
     s:='ADD_TEXT';
     if n>1 then s:=s+IntToStr(n);
     if DokZags.Fld('IZMEN').AsString=''
       then ds.Fld(s).AsString := chr(13)+getResource('SPR_BRAK_IZM',nType)
       else ds.Fld(s).AsString := chr(13)+DokZags.Fld('IZMEN').AsString+'.';
     ds.Post;
   end;
end;

//---------- begin рождение-------------------------------------
// Архивная справка о рождении  (ф1, ф2, для постановки на учет по жилью)
function SPR_ARXIV_ROGD_BEL(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds: TDataSet;
   s,par1 : String;      
   fldAdr:TField;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=1;  // 1-бел. 0-рус.
     ds.Edit;
     CreateTitle(ds,nType,5,true);
     ds.Fld('NAME').AsString :=GlobalTask.ParamAsString('NAME_B');
     ds.Fld('FIOP').AsString :=GetPadegFIO3(DokZAGS.Fld('FAMILIA_B').AsString,DokZAGS.Fld('NAME_B').AsString,DokZAGS.Fld('OTCH_B').AsString,DokZAGS.Fld('POL').AsString,'');
     ds.Fld('DATER').AsString:=GetNameAsPolBel('які нарадзіўся',DokZAGS.Fld('POL').AsString)+' '+DatePropisBel(DokZAGS.Fld('DATER').AsDateTime,TYPE_DATE_SPRAV);
     PAR1:=GetTemplateParam('PAR1');
     //------ !!! -----------
     fldAdr:=DokZAGS.Fld('ADRESAT'); 
     if fldAdr=nil then begin      // если справка из акта
       ds.Fld('ARX_DATE').AsString  := DatePropisBel(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
       ds.Fld('DATEZ').AsString     := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('NOMER').AsString     := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('Б','');
       if DokZAGS.Fld('ARX_ADRESAT').AsString='' then begin
         if (DokZAGS.Fld('SVED').AsString='1') then begin
           ds.Fld('FIO_adr').AsString := '' ;
           ds.Fld('FIO_adr2').AsString := '' ;
         end else begin
           ds.Fld('FIO_adr').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FAMILIA_B').AsString,DokZAGS.Fld('ONA_NAME_B').AsString,DokZAGS.Fld('ONA_OTCH_B').AsString,'ж','');
           ds.Fld('FIO_adr2').AsString := DokZAGS.GetAdres2(';;ONA_RAION;ONA_GOROD,ONA_B_GOROD;ONA_GOROD_R,ONA_*',3);
         end;
       end else begin
         ds.Fld('FIO_adr').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
         ds.Fld('FIO_adr2').AsString := '' ;
       end;
     end else begin                // если отдельная справка не из акта
       ds.Fld('ARX_DATE').AsString  := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString     := DatePropisBel(DokZAGS.Fld('ZAP_DATE').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('NOMER').AsString     := DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('FIO_adr').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
       ds.Fld('ORGAN_ZAGS').AsString:= DokZAGS.Fld('NAME_ZAGS').AsString;
     end;
     //----------------------
     // NameZAGS('БК','Р')      1-белорусски,краткое   2-падеж   

//     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('+GOSUD,FNAME;+OBL,;RAION;GOROD,B_GOROD;',3);     
//     ds.Fld('MESTOR1').AsString := '';     
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('<B>GOSUD,FNAME_B;+OBL_B,B_OBL;RAION_B;GOROD_B,B_GOROD;',3);     
     ds.Fld('FIO_ON').AsString := GetPadegFIO3(DokZAGS.Fld('ON_Familia_B').AsString,DokZAGS.Fld('ON_Name_B').AsString,DokZAGS.Fld('ON_Otch_B').AsString,'м','И');     
     ds.Fld('FIO_ONA').AsString := GetPadegFIO3(DokZAGS.Fld('ONA_FAMILIA_B').AsString,DokZAGS.Fld('ONA_NAME_B').AsString,DokZAGS.Fld('ONA_OTCH_B').AsString,'ж','И');
     ds.Fld('ON_NATION').AsString:=NationForSprav(DokZAGS.Fld('ON_NATION').AsString,'NAME_M_B',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G_B',', ');
     if fldAdr=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;
//     if (DokZAGS.Fld('SVED').AsString<>'3') and (PAR1<>'1') then begin // на основании заявления матери
     if not IsZvMat_(DokZAGS) and (PAR1<>'1') then begin // на основании заявления матери
       PutError(' Справка выдается при регистрации ребенка по заявлению матери (без отца) !');
       result:=false;
     end;
     s:=Trim(DokZags.Fld('IZMEN').AsString);
     if s='' then s:=getResource('SPR_ROGD_IZM',nType) else s:=s+'.';
     if PAR1='1' then begin
       ds.Fld('ADD_TEXT').AsString := s;
     end else if PAR1='2' then begin                                               
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_ROGD1',nType);
       ds.Fld('ADD_TEXT2').AsString := chr(13)+s;
     end else if PAR1='3' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_ROGD1',nType); 
       if (fldAdr=nil) or (DokZAGS.Fld('IZMEN').AsString='') then begin      // если справка из акта или изменения пусто
         ds.Fld('ADD_TEXT2').AsString := chr(13)+getResource('SPR_ROGD2',nType); 
       end else begin
         ds.Fld('ADD_TEXT2').AsString := chr(13)+s;
       end;
       ds.Fld('ADD_TEXT3').AsString := chr(13)+getResource('SPR_FOR_OCH',nType); 
     end;
     ds.Post;
   end;
end;
// Справка о рождении (ф1, ф2, для постановки на учет по жилью) и Ф1 в восстановленной з/а о рождении
function SPR_ROGD_POS_BEL(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,sPar : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=1;
     ds.Edit;
     CreateTitle(ds,nType,1,false);
     ds.Fld('ROD').AsString:=GetNameAsPolBel('нарадзіўся',DokZAGS.Fld('POL').AsString);
// ds.Fld('NAME').AsString := GetPadeg(GlobalTask.ParamAsString('NAME'),'Р'); 
     ds.Fld('FIOP').AsString   := GetPadegFIO3(DokZAGS.Fld('FAMILIA_B').AsString,DokZAGS.Fld('NAME_B').AsString,DokZAGS.Fld('OTCH_B').AsString,DokZAGS.Fld('POL').AsString,'И');
     if (YearOf(NOW)>2015) and (DokZAGS.Fld('IDENTIF').AsString<>'') then begin
       ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+', '+getResource('IN',nType)+': '+DokZAGS.Fld('IDENTIF').AsString+', ';
     end;
     if DokZAGS.Fld('ONLYGOD').AsBoolean
       then ds.Fld('DATER').AsString := DatePropisBel(DokZAGS.Fld('DATER').AsDateTime,7)+'г.'
       else ds.Fld('DATER').AsString := DatePropisBel(DokZAGS.Fld('DATER').AsDateTime,6);

     ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,6);
// ds.Fld('DATEZ').AsString := FormatDateTime('YYYY',DokZAGS.Fld('DATEZ').AsDateTime);
     ds.Fld('SPRAV_DATE').AsString := DatePropisBel(NOW,TYPE_DATE_SPRAV);
     if DokZAGS.Fld('VOSSTAN').AsBoolean then begin
       ds.Fld('SPRAV_NOMER').AsString:='';
     end else begin
//       ds.Fld('SPRAV_DATE').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('SPRAV_NOMER').AsString:=DokZAGS.Fld('SPRAV_NOMER').AsString;
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('B','');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('<B>GOSUD,FNAME_B;+OBL_B,B_OBL;RAION_B;GOROD_B,B_GOROD;',3);     
     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO_B(DokZAGS,'ON_'),'М','И');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO_B(DokZAGS,'ONA_'),'Ж','И'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
//     if (DokZAGS.Fld('SVED').AsString<>'3') and (GetTemplateParam('PAR1')<>'1') then begin // на основании заявления матери
     if not IsZvMat_(DokZAGS) and (GetTemplateParam('PAR1')<>'1') then begin // на основании заявления матери
       PutError(' Справка выдается при регистрации ребенка по заявлению матери (без отца) !');
       result:=false;
     end;
     sPar:=GetTemplateParam('PAR1');
     if sPar='1' then begin
       ds.Fld('ADD_TEXT5').AsString := getResource('SPR_ROGD_FOR2',nType);
     end else if sPAR='2' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_ROGD1',nType);
       ds.Fld('ADD_TEXT5').AsString := getResource('SPR_ROGD_FOR2',nType);
     end else if sPAR='3' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_ROGD1',nType);
       ds.Fld('ADD_TEXT2').AsString :=chr(13)+getResource('SPR_ROGD2',nType);
       ds.Fld('ADD_TEXT3').AsString := chr(13)+getResource('SPR_FOR_OCH',nType);
       ds.Fld('ADD_TEXT5').AsString := getResource('SPR_ROGD_FOR1',nType);
     end;
     if DokZAGS.Fld('ARX_ADRESAT').AsString<>''
       then ds.Fld('ADD_TEXT5').AsString:=DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Post;
   end;
end;
// Справка о рождении мертворожденного и умершего на первой неделе жизни
function SPR_ROGD_UM_BEL(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=1;
     ds.Edit;
     ds.Fld('PRIL').AsString:=getPril(-1,'POST_ZAGS_SPR',4);
     ds.Fld('SHTAMP').AsString := GetShtampSprEx(nType);
//     ds.Fld('KOLON_N').AsString:=CreateKolonN(nType);
     SetSrokDv(ds,nType); // !!!
     ds.Fld('ROD').AsString:=GetNameAsPolBel('які нарадзіўся',DokZAGS.Fld('POL').AsString);
     ds.Fld('FIOP').AsString   := GetPadegFIO( _FIO_B(DokZAGS,''), DokZAGS.Fld('POL').AsString,'И');
     ds.Fld('DATER').AsString := DatePropisBel(DokZAGS.Fld('DATER').AsDateTime,6);
     ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('SPRAV_DATE').AsString := DatePropisBel(NOW,TYPE_DATE_SPRAV);
     if DokZAGS.Fld('VOSSTAN').AsBoolean then begin
       ds.Fld('SPRAV_NOMER').AsString:='';
     end else begin
//       ds.Fld('SPRAV_DATE').AsString:=DatePropis(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
       ds.Fld('SPRAV_NOMER').AsString:=DokZAGS.Fld('SPRAV_NOMER').AsString;
     end;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('Б','');
     ds.Fld('MESTOR').AsString := DokZAGS.GetAdres2('<B>GOSUD,FNAME_B;+OBL_B,B_OBL;RAION_B;GOROD_B,B_GOROD;',3);     

     ds.Fld('FIO_ON').AsString := GetPadegFIO(_FIO_B(DokZAGS,'ON_'),'М','И');//.Fld('ON_FAMILIA').AsString+' '+DokZAGS.Fld('ON_NAME').AsString+' '+DokZAGS.Fld('ON_OTCH').AsString;
     ds.Fld('FIO_ONA').AsString := GetPadegFIO(_FIO_B(DokZAGS,'ONA_'),'Ж','И'); //DokZAGS.Fld('ONA_FAMILIA').AsString+' '+DokZAGS.Fld('ONA_NAME').AsString+' '+DokZAGS.Fld('ONA_OTCH').AsString;

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
     if GetTemplateParam('PAR1')='1' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_MROGD1',nType);  //'о записи акта о рождении мертворожденного ребенка';
       ds.Fld('ADD_TEXT2').AsString := getResource('SPR_MROGD2',nType)+'.'; //'Ребенок родился мертвым.';
     end;
     if GetTemplateParam('PAR1')='2' then begin
       ds.Fld('ADD_TEXT').AsString := getResource('SPR_UROGD1',nType); // 'о записи акта о рождении ребенка, умершего в течение первых шести дней жизни';
       ds.Fld('ADD_TEXT2').AsString := getResource('SPR_UROGD2',nType)+' (' + DatePropis(DokZAGS.Fld('DATES').AsDateTime,6) + ').';
     end;
     ds.Post;
   end;
end;
//--end рождение-------------------------------------

//-----------------------------------------------------
// Справка о смерти (запрос имени файла)
function SPR_SMERT_BEL_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5' then begin  // для МИНСКА отдельная справка
    Result:='Справка о смерти5_БЕЛ.doc';
  end;
end;
// Справка о смерти
function SPR_SMERT_BEL(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   n:Integer;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=1;
     ds.Edit;
     CreateTitle(ds,nType,2,false);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
     ds.Fld('FIOP').AsString := FirstUpper(DokZAGS.Fld('FAMILIA_B').AsString+' '+DokZAGS.Fld('NAME_B').AsString+' '+DokZAGS.Fld('OTCH_B').AsString);
     if (YearOf(NOW)>2015) then begin
       ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+', '+getResource('IN',nType)+': ';
       if DokZAGS.Fld('LICH_NOMER').AsString=''
         then ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+getResource('NONE',nType)+', '
         else ds.Fld('FIOP').AsString:=ds.Fld('FIOP').AsString+DokZAGS.Fld('LICH_NOMER').AsString+', ';
     end;

     ds.Fld('DateS').AsString := DatePropisExBel(DokZAGS.Fld('DateS').AsDateTime,6,DokZAGS.Fld('ONLYGOD').AsInteger);
     ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('SPRAV_DATE').AsString := DatePropisBel(NOW,TYPE_DATE_SPRAV);
     ds.Fld('SPRAV_NOMER').AsString := DokZAGS.Fld('SPRAV_NOMER').AsString;
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
//     ds.Fld('GetVozrast').AsString := GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);


  if  DokZAGS.Fld('DATES').IsNull or DokZAGS.Fld('DATER').IsNull then begin
    if DokZAGS.Fld('TEXT_VOZR').AsString<>'' then begin
      n:=Pos('/',DokZAGS.Fld('TEXT_VOZR').AsString);
      if n=0
        then ds.Fld('GetVozrast').AsString:=DokZAGS.Fld('TEXT_VOZR').AsString
        else ds.Fld('GetVozrast').AsString:=Copy(DokZAGS.Fld('TEXT_VOZR').AsString,1,n-1);
    end else begin
      ds.Fld('GetVozrast').AsString:='';
    end;
  end else begin
    if SubDateYear(DokZAGS.Fld('DateS').AsDateTime,DokZAGS.Fld('DateR').AsDateTime)<1 then begin
      if DokZAGS.Fld('DateS').AsDateTime=DokZAGS.Fld('DateR').AsDateTime then begin
        ds.Fld('GetVozrast').AsString:=' ва ўзросте менш за суткі';
      end else begin
        ds.Fld('GetVozrast').AsString:=' ва ўзросте '+SubDatePropisB(DokZAGS.Fld('DateS').AsDateTime,DokZAGS.Fld('DateR').AsDateTime,0);
      end;
    end else begin
      ds.Fld('GetVozrast').AsString := ' ва ўзросте '+GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);
    end;
  end;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
    ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('Б','');
    ds.Fld('MESTOS').AsString := DokZAGS.GetAdres2('SM_GOSUD,FNAME_B;+SM_OBL_B,SM_B_OBL;SM_RAION_B;SM_GOROD_B,SM_B_GOROD;',3);
//     ds.Fld('MESTOS1').AsString := DokZAGS.GetAdres(';;SM_RAION;SM_GOROD,SM_B_GOROD;',1);     

    if DokZAGS.Fld('POL').AsString='М' then ds.Fld('ROD').AsString:='памёр' else ds.Fld('ROD').AsString:='памерла';

  //   ds.Fld('RUKOV').AsString := GlobalTask.ParamAsString('РУК_ЗАГС');
  //   ds.Fld('DOLG_RUK_ZAGS').AsString := GlobalTask.ParamAsString('DOLG_RUK_ZAGS');
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(nType);
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(nType);
     ds.Post;
   end;
end;
// Архивная справка о смерти (запрос имени файла)
function SPR_ARXIV_SMERT_BEL_FILE(sUserProp:String; sCaption:String; sFile:String):String;
begin
  Result:='';
  if Copy(GlobalTask.ParamAsString('KOD'),1,1)='5' then begin  // для МИНСКА отдельная справка
    Result:='Арх справка о смерти5_БЕЛ.doc';
  end;
end;
// Архивная справка о смерти
function SPR_ARXIV_SMERT_BEL(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   n,nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     nType:=1;
     ds.Edit;
     CreateTitle(ds,nType,9,true);
     if DokZAGS.Fld('ADRESAT')=nil then begin
       ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
       ds.Fld('ARX_DATE').AsString  := DatePropisBel(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
       ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('Б','');
       if  DokZAGS.Fld('DATES').IsNull or DokZAGS.Fld('DATER').IsNull then begin
         if DokZAGS.Fld('TEXT_VOZR').AsString<>'' then begin
           n:=Pos('/',DokZAGS.Fld('TEXT_VOZR').AsString);
           if n=0
             then ds.Fld('GetVozrast').AsString:=DokZAGS.Fld('TEXT_VOZR').AsString
             else ds.Fld('GetVozrast').AsString:=Copy(DokZAGS.Fld('TEXT_VOZR').AsString,1,n-1);
         end else begin
           ds.Fld('GetVozrast').AsString:='';
         end;
       end else begin
         ds.Fld('GetVozrast').AsString := ' ва ўзросте '+GetVozrast(GetCountYear(DokZAGS.Fld('DATES').AsDateTime,DokZAGS.Fld('DATER').AsDateTime),false);
       end;
     end else begin
       ds.Fld('ARX_ADRESAT').AsString   := CreateChr13(DokZAGS.Fld('ADRESAT').AsString);
       ds.Fld('ARX_DATE').AsString  := DatePropisBel(NOW,TYPE_DATE_SPRAV);
       ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
       ds.Fld('NOMER').AsString := DokZAGS.Fld('ZAP_NOMER').AsString;
       ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('ZAP_DATE').AsDateTime,6);
       ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.Fld('NAME_ZAGS').AsString;
       ds.Fld('GetVozrast').AsString := ' ва ўзросте '+DokZAGS.Fld('VOZR').AsString;
     end;
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
     ds.Fld('FIOP').AsString := FirstUpper(DokZAGS.Fld('FAMILIA_B').AsString+' '+DokZAGS.Fld('NAME_B').AsString+' '+DokZAGS.Fld('OTCH_B').AsString);

     ds.Fld('DateS').AsString := DatePropisExBel(DokZAGS.Fld('DateS').AsDateTime,6,DokZAGS.Fld('ONLYGOD').AsInteger);
     if ds.Fld('DateS').AsString='' then ds.Fld('DateS').AsString:='дата смерці невядомая';
     s:=GetNameAsPol('які памёр',DokZags.Fld('POL').AsString+'+');
     ds.Fld('DateS').AsString := s+' '+ds.Fld('DateS').AsString; 

     ds.Fld('MESTOS').AsString := DokZAGS.GetAdres2('<B>SM_GOSUD,FNAME_B;SM_OBL_B,SM_B_OBL;SM_RAION_B;SM_GOROD_B,SM_B_GOROD;',3);     

     if DokZAGS.Fld('POL').AsString='М' then s:='M' else s:='G';
     if (DokZAGS.Fld('NATION').AsString<>'') and (Copy(DokZAGS.Fld('NATION').AsString,1,2)<>'19')
       then ds.Fld('NATION').AsString:=NationForSprav_Bel(DokZAGS.Fld('NATION').AsString,'NAME_'+s+'_B',', ');

     if DokZags.Fld('IZMEN').AsString=''
       then ds.Fld('ADD_TEXT').AsString := getResource('SPR_SMERT_IZM',nType)+chr(13)
       else ds.Fld('ADD_TEXT').AsString := DokZags.Fld('IZMEN').AsString+'.'+chr(13);

     if DokZAGS.Fld('ADRESAT')=nil then begin   // из акта
       ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
       ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
     end else begin
       ds.Fld('DOLG_RUK_ZAGS').AsString :=DokZAGS.Fld('DOLG_RUKOV').AsString;
       ds.Fld('RUKOV').AsString :=DokZAGS.Fld('RUKOV').AsString;
     end;

     ds.Post;
   end;
end;

// Архивная справка о расторжении брака 
function SPR_ARXIV_rast_Bel(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;      
   s,m,j : String;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     nType:=1;
     CreateTitle(ds,nType,7,true);

     ds.Fld('ARX_ADRESAT').AsString := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
     ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP_ON').AsString := FirstUpper(DokZAGS.Fld('ON_Familia_B').AsString+' '+DokZAGS.Fld('ON_Name_B').AsString+' '+DokZAGS.Fld('ON_Otch_B').AsString);
     ds.Fld('FIOP_ONA').AsString := FirstUpper(DokZAGS.Fld('ONA_Familia_B').AsString+' '+DokZAGS.Fld('ONA_Name_B').AsString+' '+DokZAGS.Fld('ONA_Otch_B').AsString);
     ds.Fld('ARX_DATE').AsString  := DatePropisBel(NOW,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('Б','');

     ds.Fld('FIO_ON').AsString := FirstUpper(DokZAGS.Fld('ON_FamiliaP_B').AsString); //DokZAGS.Fld('ON_FamiliaP').AsString;
     ds.Fld('FIO_ONA').AsString := FirstUpper(DokZAGS.Fld('ONA_FamiliaP_B').AsString);//DokZAGS.Fld('ONA_FamiliaP').AsString;

     ds.Fld('ON_NATION').AsString:=NationForSprav_Bel(DokZAGS.Fld('ON_NATION').AsString,'NAME_M_B',', ');
     ds.Fld('ONA_NATION').AsString:=NationForSprav_Bel(DokZAGS.Fld('ONA_NATION').AsString,'NAME_G_B',', ');

     if DokZags.Fld('IZMEN').AsString=''
       then ds.Fld('ADD_TEXT').AsString := getResource('SPR_RAST_IZM',nType)
       else ds.Fld('ADD_TEXT').AsString := DokZags.Fld('IZMEN').AsString+'.';

     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
     ds.Post;
   end;
end;

// Извещение о регистрации расторжения брака 
function IZV_RB1_BEL(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s,m,j : String;
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     if not ds.Active then ds.Open;
     ds.Edit;
     nType:=1;
     CreateTitle(ds,nType,11,false);
     ds.Fld('ADRESAT').AsString :=GetAdresat('ADRES_IZVECH_B');
     ds.Fld('KOLON_N').AsString:=CreateKolonNIzv(nType);
     ds.Fld('TEKU_DATE').AsString  := DatePropisBel(NOW,TYPE_DATE_SPRAV);
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
     ds.Fld('FIOP_ON').AsString := FirstUpper(DokZAGS.Fld('ON_Familia_B').AsString+' '+DokZAGS.Fld('ON_Name_B').AsString+' '+DokZAGS.Fld('ON_Otch_B').AsString);
     ds.Fld('FIOP_ONA').AsString := FirstUpper(DokZAGS.Fld('ONA_Familia_B').AsString+' '+DokZAGS.Fld('ONA_Name_B').AsString+' '+DokZAGS.Fld('ONA_Otch_B').AsString);
     ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,6);
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     ds.Fld('BRAK').AsString := Trim(DokZAGS.Fld('BRAK_ZAKL_B').AsString);
     if DokZAGS.Fld('BRAK_NOMER').AsString<>'' then begin
       ds.Fld('BRAK').AsString:=ds.Fld('BRAK').AsString+' '+DatePropisBel(DokZAGS.Fld('BRAK_DATE').AsDateTime,TYPE_DATE_SPRAV)+' за № '+DokZAGS.Fld('BRAK_NOMER').AsString+'.';
     end;            
     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
     ds.Post;
   end;
end;

// Архивная справка о перемене ФИО  
function SPR_ARXIV_IM_BEL(DateFiks: TDateTime; LicID, PID: Word):boolean;
var
   ds, spruch,dsDeti: TDataSet;
   s : String;      
   nType:Integer;
begin
   result:=true;
   ds:=GetTemplateDataSet('MAIN');
   if ds<>nil then begin
     nType:=1;
     if not ds.Active then ds.Open;
     ds.Edit;
     CreateTitle(ds,nType,8,true);

     ds.Fld('ARX_ADRESAT').AsString   := DokZAGS.Fld('ARX_ADRESAT').AsString;
     ds.Fld('NAME').AsString := GlobalTask.ParamAsString('NAME_B');
     ds.Fld('DATEZ').AsString := DatePropisBel(DokZAGS.Fld('DATEZ').AsDateTime,TYPE_DATE_SPRAV);
     ds.Fld('FIOP').AsString   := FirstUpper(DokZAGS.Fld('FAMILIAdo_B').AsString+' '+DokZAGS.Fld('NAMEdo_B').AsString+' '+DokZAGS.Fld('OTCHdo_B').AsString);
     ds.Fld('ARX_DATE').AsString  := DatePropisBel(NOW,TYPE_DATE_SPRAV);
     ds.Fld('ARX_NOMER').AsString := DokZAGS.Fld('ARX_NOMER').AsString;
     ds.Fld('NOMER').AsString := DokZAGS.Fld('NOMER').AsString;
     // 1-белорусски,краткое   2-падеж    NameZAGS('БК','Р')
     ds.Fld('ORGAN_ZAGS').AsString := DokZAGS.NameZAGS2('Б','И');
     ds.Fld('F').AsString := FirstUpper(DokZAGS.Fld('FAMILIAposle_B').AsString);
     ds.Fld('I').AsString := FirstUpper(DokZAGS.Fld('NAMEposle_B').AsString);
     ds.Fld('O').AsString := FirstUpper(DokZAGS.Fld('OTCHposle_B').AsString);
     if DokZAGS.Fld('POL').AsString='М' then s:='M' else s:='G';
     ds.Fld('NATION').AsString := NationForSprav_Bel(DokZAGS.Fld('NATION').AsString,'NAME_'+s+'_B',', ');

//     ds.Fld('DOLG_RUK_ZAGS').AsString :=Zags_Sprav_DolgEx(1);
//     ds.Fld('RUKOV').AsString :=Zags_Sprav_FIOEx(1);
     if DokZags.Fld('IZMEN').AsString=''
       then ds.Fld('ADD_TEXT').AsString := getResource('SPR_CHNAME_IZM',1)
       else ds.Fld('ADD_TEXT').AsString := DokZags.Fld('IZMEN').AsString+'.';

     ds.Post;
   end;
end;

