unit uFilter;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Math, uTypes,
  {$IFDEF VER150} Variants, {$ENDIF}
  MetaTask,OpisEdit, kbmMemTable,mFindInt, AdsFunc, Ace, FuncPr, db, uProjectAll;


const
  AliasVUS              = 'v';
  AliasLichSchet        = 'l';
  AliasLichSchetPriznak = 'lp';
  AliasLichSchetDok     = 'ld';
  AliasMens             = 'n';
  AliasMens2            = 'n2';
  AliasMensLgot         = 'nl';
  AliasMensAdd          = 'd';
  AliasMensPriznak      = 'np';
  AliasMensDvig         = 'nd';
  AliasMensDeti         = 'nc';
  AliasMensFamiliaHist  = 'hf';
  AliasMensSobstv       = 'ns';
  AliasAdres            = 'a';
  AliasBigHouse         = 'bh';
  AliasAdresPriznak     = 'ap';
  AliasAdresOwners      = 'ao';
  AliasProperty         = 'ppp';
  AliasLargeStr         = 'sss';
  AliasBaseProp         = 'pr';
  AliasPassport         = 'p';
  AliasZBrak            = 'b';
  AliasZRogd            = 'ar';
  AliasZSmert           = 'sm';
  AliasZUstOtc          = 'uo';
  AliasZUstMat          = 'um';
  AliasZAdopt           = 'aa';
  AliasZRast            = 'rz';
  AliasZChName          = 'cn';
  AliasDBrak            = 'b';
  AliasDRast            = 'b';
  AliasDChName          = 'dch';
  AliasDIzm             = 'di';

  AliasUZRogd           = 'uzr';
  AliasUZAdopt          = 'uza';

  AliasTalonPrib        = 'tp';
  AliasTalonUbit        = 'tu';

  AliasOchered          = 'oc';
  AliasOcheredResh      = 'ocr';
  AliasDeclRegistr      = 'dr';
  AliasAddDokZAGS       = 'ad';
  AliasSostavSem        = 'ssm';
  AliasNewAdres         = 'na';

  AliasZah         = 'zh';
  AliasOpeka       = 'op';
  AliasSMDO        = 'smd';
  AliasQueryGis    = 'qg';
  AliasRegDogN     = 'rd';

type
  TParamFieldFlt = record
    strFieldName  : String;
    strSprName    : String;
    Kind          : TFindFieldKinds;
    lCS           : Boolean;
    SprEditKind   : TSprEditKind;
    nFieldType    : Integer;
    strAddCaption : String;
    nOrder        : Integer;
  end;

  function GetKindFromAdsType( nType : Integer) : TFindFieldKinds;
  function GetKindFromString( strType : String) : TFindFieldKinds;
  procedure CreateSprList( SprList : TSprList );
  procedure CreateOpList( OpList : TOperList);
  procedure CreateRelList( RelList : TRelList; nTypeObj : Integer );
  procedure CreateFilterProperty(FindFieldList : TFindFieldList; Field : TFindFieldItem;
                               strRelP : String; strRelL : String;
                               TypeObj : Integer; strRazdel : String;
                               strProp : String; strGrup : String; nOrder:Integer=0 );
  procedure LoadFields(FindFieldList : TFindFieldList; nType : Integer);
  function NameFileOpisFilter( nType : Integer ) : String;
  procedure DropFileOpisFilter;

implementation

uses fMain, dBase;


procedure CreateOpList( OpList : TOperlist);
begin
  fmMain.GetTable_FindOper;
  fmMain.mtOperFind.First;
  OpList.Clear;
  while not fmMain.mtOperFind.Eof do begin
    if fmMain.mtOperFindVisible.AsBoolean then begin
      OpList.AddNew(fmMain.mtOperFindName.AsString,
                    fmMain.mtOperFindCaption.AsString,
                    fmMain.mtOperFindSQL.AsString,
                    fmMain.mtOperFindFieldKinds.AsString,
                    fmMain.mtOperFindNeedValue.AsBoolean,
                    fmMain.mtOperFindTwoValue.AsBoolean,
                    not fmMain.mtOperFindIgnoreCase.AsBoolean,
                    fmMain.mtOperFindMultiSel.AsBoolean,
                    fmMain.mtOperFindMultiOr.AsBoolean,
                    fmMain.mtOperFindOwnValue.AsBoolean,
                    fmMain.mtOperFindOwnValName.AsString,
                    fmMain.mtOperFindOwnValKind.AsString,
                    fmMain.mtOperFindSprName.AsString
                    );
    end;
    fmMain.mtOperFind.Next;
  end;
  fmMain.mtOperFind.First;
end;

function GetKindFromAdsType( nType : Integer) : TFindFieldKinds;
begin
  // ffkList, ffkProp, ffkRel
   case ( nType ) of
      ADS_LOGICAL     :  Result := [ffkBoolean];
      ADS_NUMERIC     :  Result := [ffkFloat];
      ADS_DATE        :  Result := [ffkDate];
      ADS_STRING      :  Result := [ffkString];
      ADS_CISTRING    :  Result := [ffkString];
      ADS_MEMO        :  Result := [ffkText];
      ADS_BINARY      :  Result := [ffkNumber];
      ADS_IMAGE       :  Result := [ffkNumber];
      ADS_VARCHAR     :  Result := [ffkString];
      ADS_COMPACTDATE :  Result := [ffkDate];
      ADS_DOUBLE      :  Result := [ffkFloat];
      ADS_CURDOUBLE   :  Result := [ffkFloat];
      ADS_INTEGER     :  Result := [ffkNumber];
      ADS_SHORTINT    :  Result := [ffkNumber];
      ADS_TIME        :  Result := [ffkDate];
      ADS_TIMESTAMP   :  Result := [ffkDate];
      ADS_AUTOINC     :  Result := [ffkNumber];
      ADS_RAW         :  Result := [ffkString];
      ADS_MONEY       :  Result := [ffkFloat];
   end;
end;
function GetKindFromString( strType : String) : TFindFieldKinds;
begin
   Result := [ffkString];
   strType := Trim(ANSIUpperCase(strType));
   if Copy(strType,1,1)='L' then begin
     Result := [ffkBoolean];
   end else if Copy(strType,1,1)='C' then begin
     Result := [ffkString];
   end else if Copy(strType,1,1)='N' then begin
     Result := [ffkFloat];
   end else if Copy(strType,1,1)='I' then begin
     Result := [ffkNumber];
   end else if Copy(strType,1,1)='D' then begin
     Result := [ffkDate];
   end;
end;

//-----------------------------------------------------------------------
//  ОЧЕНЬ ВАЖНАЯ ФУНКЦИЯ, вызывается один раз при сиарте программы в DPR
//-----------------------------------------------------------------------
procedure CreateSprList( SprList : TSprList );
var
  slItems, slKeys : TstringList;
  arr : TArrStrings;
  i : Integer;
  Opis : TOpisEdit;
  Kind : TSprEditKind;
  sKod,sName,sNot : String;
begin
//  SprList.AddNew('SPR_OTNOSH', 'Отношения', skDataSet, dmBase.SprOtnosh , nil, nil, 'ID', 'NAME', 'ID=Код,NAME=Наименование');
  sNot:=','+GlobalTask.CurrentOpisEdit.GetNotLoadOpis('LOOKUP', DIR_UPDATE)+',';
  StrToArr(fmMain.GetAllLookupNamesForFilter,arr,';',true);
//  StrToArr(GlobalTask.CurrentOpisEdit.GetAllLookupNames,arr,';',true);  все lookup_ нам не нужны
  for i:=Low(arr) to High(arr) do begin
    if Pos(','+arr[i]+',', sNot)=0 then begin
      Opis := GlobalTask.CurrentOpisEdit.GetSprOpis(arr[i], [osTable], false);
      if Opis<>nil then begin
        Kind := sekDefault;      
        if Opis.TypeSeekSpr=tssListBox then begin
          Kind := sekCheckList;
        end else if Opis.TypeSeekSpr=tssComboBox then begin
          Kind := sekLookup;
        end else if Opis.TypeSeekSpr=tssGrid then begin
          Kind := sekGrid;
        end else if Opis.TypeSeekSpr=tssGrid2 then begin
          Kind := sekGrid2;
        end;
        if (arr[i]='LOOKUP_SPRNAMES') then begin
          Kind := sekGrid;
        end;
  //      if (arr[i]='LOOKUP_SPRSMDO_NAME') then begin
  //        Kind := sekGrid2;
  //        Kind := sekGrid;
  //      end;
        sName:=Opis.FieldForNaim;
        if (arr[i]='LOOKUP_UL') then begin
          sName:='NAME2';
        end;
        SprList.AddNew(arr[i], Opis.Caption, skDataSet, Opis.DataSet, nil, nil, Opis.ResultField, sName, '', Kind,'');
      end;
    end;
  end;
  sNot:=','+GlobalTask.CurrentOpisEdit.GetNotLoadOpis('KEY', DIR_UPDATE)+',';
  slItems := TStringList.Create;
  slKeys  := TStringList.Create;
  StrToArr(fmMain.GetAllListNamesForFilter,arr,';',true);
  SetLength(arr,Length(arr)+1);
  arr[Length(arr)-1]:='KEY_RN_OCH';
  SetLength(arr,Length(arr)+1);
  arr[Length(arr)-1]:='KEY_ROGD_TORG';
//  StrToArr(GlobalTask.CurrentOpisEdit.GetAllListNames,arr,';',true); все key_ нам не нужны
  for i:=Low(arr) to High(arr) do begin
    if Pos(','+arr[i]+',', sNot)=0 then begin
      slItems.Clear;
      slKeys.Clear;
      GlobalTask.CurrentOpisEdit.GetListOpis(arr[i],slItems, slKeys);
      Opis := GlobalTask.CurrentOpisEdit.CurrentOpis;
      if Opis <> nil then begin
        Kind := sekDefault;
        if Opis.TypeSeekSpr=tssListBox then begin
          Kind := sekCheckList;
        end else if Opis.TypeSeekSpr=tssComboBox then begin
          Kind := sekComboBox;
        end;
        SprList.AddNew(arr[i], arr[i], skStringList, nil, slKeys, slItems, '', '', '',Kind,'');
      end;
    end;
  end;
  slItems.Free;
  slKeys.Free;
end;


//--------------------------------------------------------------------
// Отношения для лицевых счетов
//--------------------------------------------------------------------
procedure CreateRelList_Lich( RelList : TRelList );
begin
  RelList.AddNew('ЛицевыеСчетаПризнаки',
      AliasLichSchetPriznak,
      'LICHSCHET_PRIZNAK',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasLichSchet,AliasLichSchetPriznak]),
      '', rk1M );

  RelList.AddNew('Dokuments',
      AliasLichSchetDok,
      'LICHSCHET_DOK',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasLichSchet,AliasLichSchetDok]),
      '', rk1M );

  RelList.AddNew('Население',
      AliasMens,
      'LICHSCHET_MENS',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.lic_id',[AliasLichSchet,AliasMens]),
      Format('%0:s.date_fiks,%0:s.lic_id',[AliasMens]), rk1M );

  RelList.AddNew('НаселениеЛьготы',
      AliasMensLgot,
      'MENS_LGOT',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasMensLgot]),
      Format('%0:s.date_fiks,%0:s.id',[AliasMensLgot]), rk1M );

  RelList.AddNew('НаселениеПризнаки',
      AliasMensPriznak,
      'MENS_PRIZNAK',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasMensPriznak]),
      Format('%0:s.date_fiks,%0:s.id',[AliasMensPriznak]), rk1M );

  RelList.AddNew('НаселениеДвижение',
      AliasMensDvig,
      'MENS_DVIG',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasMensDvig]),
      Format('%0:s.date_fiks,%0:s.id',[AliasMensDvig]), rk1M );

  RelList.AddNew('БазаДомов',
      AliasAdres,
      'LICHSCHET_ADRES',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.adres_id=%1:s.id',[AliasLichSchet,AliasAdres]),
      '', rkM1 );

  RelList.AddNew('BigHouse',
      AliasBigHouse,
      'ADRES_BIGHOUSE',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.punkt=%1:s.punkt and ifnull(%0:s.ul,0)=%1:s.ul and ifnull(%0:s.dom,'+QStr('#')+')=%1:s.dom and ifnull(%0:s.korp,'+QStr('#')+')=%1:s.korp',[AliasAdres,AliasBigHouse]),
      Format('%0:s.date_fiks,%0:s.punkt,%0:s.ul,%0:s.dom,%0:s.korp',[AliasBigHouse]), rkM1 );


  //-------------------------------
  RelList.AddNew('БазаСвойствОбъектов',
      AliasProperty,
      'PROPERTY',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasLichSchet,AliasProperty]),
      '', rk11 );
  RelList.AddNew('БазаСтрок',
      AliasLargeStr,
      'LARGESTR',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasLichSchet,AliasLargeStr]),
      '', rk11 );
  RelList.AddNew('БазаСвойствОбъектов',
      AliasProperty,
      'PROPERTY_ADRES',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.adres_id=%1:s.id',[AliasLichSchet,AliasProperty]),
      '', rk11 );

  RelList.AddNew('БазаСтрок',
      AliasLargeStr,
      'LARGESTR_ADRES',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.adres_id=%1:s.id',[AliasLichSchet,AliasLargeStr]),
      '', rk11 );
end;

//--------------------------------------------------------------------
// Отношения для населения
//--------------------------------------------------------------------
procedure CreateRelList_Nasel( RelList : TRelList );
begin

  RelList.AddNew('НаселениеДоп',
      AliasMensAdd,
      'MENS_ADD',
      Format('%0:s.id=%1:s.id',[AliasMens,AliasMensAdd]),
      '', rkM1 );

  RelList.AddNew('Ochered',
      AliasOchered,
      'MENS_OCH',
      Format('%0:s.id=%1:s.id',[AliasMens,AliasOchered]),
      '', rkM1 );

  RelList.AddNew('OcheredResh',
      AliasOcheredResh,
      'MENS_OCH_RESH',
      Format('%0:s.id=%1:s.id',[AliasMens,AliasOcheredResh]),
      '', rkM1 );

  RelList.AddNew('VUS',
      AliasVUS,
      'MENS_VUS',
      Format('%0:s.id=%1:s.id',[AliasMens,AliasVUS]),
      '', rkM1 );

  RelList.AddNew('БазаДомов',
      AliasAdres,
      'MENS_ADRES',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.adres_id=%1:s.id',[AliasMens,AliasAdres]),
      '', rkM1 );

  RelList.AddNew('НаселениеЛьготы',
      AliasMensLgot,
      'MENS_LGOT',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasMensLgot]),
      Format('%0:s.date_fiks,%0:s.id',[AliasMensLgot]), rk1M );

  RelList.AddNew('НаселениеПризнаки',
      AliasMensPriznak,
      'MENS_PRIZNAK',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasMensPriznak]),
      Format('%0:s.date_fiks,%0:s.id',[AliasMensPriznak]), rk1M );

  RelList.AddNew('НаселениеДвижение',
      AliasMensDvig,
      'MENS_DVIG',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasMensDvig]),
      Format('%0:s.date_fiks,%0:s.id',[AliasMensDvig]), rk1M );

  RelList.AddNew('HistoryZAGS',
      AliasMensFamiliaHist,
      'MENS_HIST_FAMILIA',
      Format('%0:s.id=%1:s.id and typeobj=3 and fieldname='+QStr('FAMILIA'),[AliasMens,AliasMensFamiliaHist]),
      Format('%0:s.id',[AliasMensFamiliaHist]), rk1M );

  RelList.AddNew('Население',
      AliasMensDeti,
      'MENS_DETI',
      Format('(%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.pa_id) or (%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.ma_id)',[AliasMens,AliasMensDeti]),
      '', rk1M );

  RelList.AddNew('ЛицевыеСчета',
      AliasLichSchet,
      'MENS_LICHSCHET',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.lic_id=%1:s.id',[AliasMens,AliasLichSchet]),
      '', rkM1 );
//???
  RelList.AddNew('ЛицевыеСчетаПризнаки',
      AliasLichSchetPriznak,
      'LICHSCHET_PRIZNAK',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasLichSchet,AliasLichSchetPriznak]),
      '', rk1M );

  RelList.AddNew('Население',
      AliasMens2,
      'LICHSCHET_MENS',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.lic_id',[AliasLichSchet,AliasMens2]),
      Format('%0:s.date_fiks,%0:s.lic_id',[AliasMens2]), rk1M );

  RelList.AddNew('БазаДомов',
      AliasAdres,
      'LICHSCHET_ADRES',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.adres_id=%1:s.id',[AliasLichSchet,AliasAdres]),
      '', rkM1 );

  // !!!
  RelList.AddNew('HouseOwners',
      AliasAdresOwners,
      'MENS_OWNERS',
//      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasAdres,AliasAdresOwners]),
//      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.kod and '+AliasAdresOwners+'.typekod=1',[AliasMens,AliasAdresOwners]),
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.kod and %1:s.typekod=1',[AliasMens,AliasAdresOwners]),
      Format('%0:s.date_fiks,%0:s.id',[AliasAdresOwners]), rk1M );

  //-------------------------------
  RelList.AddNew('БазаСвойствОбъектов',                          
      AliasProperty,                               
      'PROPERTY',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasProperty]),
      '', rk11 );

  RelList.AddNew('БазаСтрок',
      AliasLargeStr,
      'LARGESTR',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasMens,AliasLargeStr]),
      '', rk11 );

  RelList.AddNew('BigHouse',
      AliasBigHouse,
      'ADRES_BIGHOUSE',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.punkt=%1:s.punkt and ifnull(%0:s.ul,0)=%1:s.ul and ifnull(%0:s.dom,'+QStr('#')+')=%1:s.dom and ifnull(%0:s.korp,'+QStr('#')+')=%1:s.korp',[AliasAdres,AliasBigHouse]),
      Format('%0:s.date_fiks,%0:s.punkt,%0:s.ul,%0:s.dom,%0:s.korp',[AliasBigHouse]), rkM1 );

  RelList.AddNew('SostavSem',
      AliasSostavSem,
      'MENS_SOSTAV',
      Format('%0:s.id=%1:s.id',[AliasMens,AliasSostavSem]),
      '', rkM1 );

end;



//--------------------------------------------------------------------
// Отношения для адресов
//--------------------------------------------------------------------
procedure CreateRelList_Adres( RelList : TRelList );
begin

  RelList.AddNew('ЛицевыеСчета',
      AliasLichSchet,
      'ADRES_LICHSCHET',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.adres_id',[AliasAdres,AliasLichSchet]),
      Format('%0:s.date_fiks,%0:s.adres_id',[AliasLichSchet]), rk1M );

  RelList.AddNew('Население',
      AliasMens,
      'LICHSCHET_MENS',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.lic_id',[AliasLichSchet,AliasMens]),
      Format('%0:s.date_fiks,%0:s.lic_id',[AliasMens]), rk1M );

  RelList.AddNew('Население',
      AliasMens2,
      'ADRES_MENS',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.adres_id',[AliasAdres,AliasMens2]),
      Format('%0:s.date_fiks,%0:s.adres_id',[AliasMens2]), rk1M );

  RelList.AddNew('HouseProps',
      AliasAdresPriznak,
      'ADRES_PRIZNAK',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasAdres,AliasAdresPriznak]),
      Format('%0:s.date_fiks,%0:s.id',[AliasAdresPriznak]), rk1M );

  RelList.AddNew('HouseOwners',
      AliasAdresOwners,
      'ADRES_OWNERS',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasAdres,AliasAdresOwners]),
      Format('%0:s.date_fiks,%0:s.id',[AliasAdresOwners]), rk1M );

  RelList.AddNew('BigHouse',
      AliasBigHouse,
      'ADRES_BIGHOUSE',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.punkt=%1:s.punkt and ifnull(%0:s.ul,0)=%1:s.ul and ifnull(%0:s.dom,'+QStr('#')+')=%1:s.dom and ifnull(%0:s.korp,'+QStr('#')+')=%1:s.korp',[AliasAdres,AliasBigHouse]),
      Format('%0:s.date_fiks,%0:s.punkt,%0:s.ul,%0:s.dom,%0:s.korp',[AliasBigHouse]), rkM1 );

  //-------------------------------
  RelList.AddNew('БазаСвойствОбъектов',
      AliasProperty,
      'PROPERTY',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasAdres,AliasProperty]),
      '', rk11 );
  RelList.AddNew('БазаСтрок',
      AliasLargeStr,
      'LARGESTR',
      Format('%0:s.date_fiks=%1:s.date_fiks and %0:s.id=%1:s.id',[AliasAdres,AliasLargeStr]),
      '', rk11 );
end;

//--------------------------------------------------------------------
// Отношения для ZRogd
//--------------------------------------------------------------------
procedure CreateRelList_ZRogd( RelList : TRelList );
begin
  RelList.AddNew('BASEPROP',
      AliasBaseProp,
      'BASEPROP',
      Format('typeobj=6 and %0:s.id=%1:s.id',[AliasZRogd,AliasBaseProp]),
      '', rk11 );
end;

//------------------------------------------------------------------
procedure CreateRelList( RelList : TRelList; nTypeObj : Integer );
begin
  if nTypeObj = dmBase.TypeObj_Lich then begin
    CreateRelList_Lich( RelList  );
  end else if nTypeObj = dmBase.TypeObj_Nasel then begin
    CreateRelList_Nasel( RelList  );
  end else if nTypeObj = dmBase.TypeObj_Adres then begin
    CreateRelList_Adres( RelList  );
  end else if nTypeObj = _TypeObj_ZRogd then begin
    CreateRelList_ZRogd( RelList  );
  end;
end;


procedure CreateFilterProperty(FindFieldList : TFindFieldList; Field : TFindFieldItem;
                               strRelP : String; strRelL : String;
                               TypeObj : Integer; strRazdel : String;
                               strProp : String; strGrup : String; nOrder:Integer );
var
  FindFieldItem : TFindFieldItem;
  idRazdel : Integer;
  vKeyValues : Variant;
  strFieldName,
  strSprName,
  strGroupDef, strVid,
  strGroupCur, strSourceField,
  strRelName : String;
  Kind : TFindFieldKinds;
  lCS : Boolean;
  strAddCaption : String;
  strAliasName  : String;
  SprEditKind : TSprEditKind;
  nUr,nNomer : Integer;
  arrGroup : TArrStrings;
  fld : TField;
//  Field1 : TFindFieldItem;
  function StrTypeAsKind( sType : String) : TFindFieldKind;
  begin
  // C=Строка I=Целое число N=Число L=Логический D=Дата M=Текст
    Result := ffkString;
    if sType = 'I' then begin
      Result := ffkNumber;
    end else if sType = 'N' then begin
      Result := ffkFloat;
    end else if sType = 'L' then begin
      Result := ffkBoolean;
    end else if sType = 'D' then begin
      Result := ffkDate;
    end;
  end;
  function GetCaption(lTrim : Boolean=true) : String;
  begin
    Result := dmBase.SprProperty.FieldByName('NAME_FLT').AsString;
    if lTrim then Result := Trim(Result);
    if Result = '' then begin
      Result := dmBase.SprProperty.FieldByName('NAME').AsString;
      if lTrim then Result := Trim(Result);
    end;
  end;
  function GetNameGroup : String;
  var
    i : Integer;
  begin
    Result := '';
    for i:=0 to Length(arrGroup)-1 do begin
      Result := Result + arrGroup[i] + '\';
    end;
    Result := Copy(Result, 1, Length(Result)-1);
  end;
begin
  vKeyValues := VarArrayCreate( [0, 1], varOleStr );
  vKeyValues[0] := TypeObj;
  vKeyValues[1] := StrToInt(strRazdel);
  if dmBase.SprRazdel.Locate('TYPEOBJ;NOMER', vKeyValues, []) then begin
    idRazdel := dmBase.SprRazdel.FieldByName('ID').AsInteger;
    dmBase.SprProperty.IndexName := 'KEY_VIEW';
    dmBase.SprProperty.SetRange([TypeObj,idRazdel],[TypeObj,idRazdel]);
    strGroupDef := Trim(dmBase.SprRazdel.FieldByName('NAME').AsString);
    SetLength(arrGroup,1);
    arrGroup[0] := strGroupDef;
    strGroupCur := strGroupDef;
    try
      with dmBase.SprProperty do begin
        First;
        while not Eof do begin
          if FieldByName('VISIBLE').IsNull or FieldByName('VISIBLE').AsBoolean then begin
            nNomer:=FieldByName('NOMER').AsInteger;
            if FieldByName('UROV').IsNull
              then nUr := 0
              else nUr := FieldByName('UROV').AsInteger;
            strVid := FieldByName('VID').AsString;
            if nUr = 1 then begin           //  Корень  (перейти в корень раздела)
              SetLength(arrGroup,1);
              strGroupCur := GetNameGroup;
            end else if nUr = 2 then begin  //  Добавить   (добавить уровень)
              SetLength(arrGroup,Length(arrGroup)+1);
              arrGroup[Length(arrGroup)-1] := GetCaption;
              strGroupCur := GetNameGroup;
            end else if nUr = 3 then begin  //  Предыдущий (перейти на предыдущий уровень)
              if Length(arrGroup)>1 then begin
                SetLength(arrGroup,Length(arrGroup)-1);
                strGroupCur := GetNameGroup;
              end;
            end else if nUr = 4 then begin  //  Новый+ (начать с раздела и добавить уровень)
              SetLength(arrGroup,2);
              arrGroup[1] := GetCaption;
              strGroupCur := GetNameGroup;
            end;
            if strVid = '3' then begin   // константа
              {
              if Copy(GetCaption(false),1,1)=' ' then begin  // продолжение вложенности
                strGroupCur := strGroupCur + '\' + GetCaption;
              end else begin                                 // начало вложенности
                strGroupCur := strGroupDef + '\' + GetCaption;
              end;
              }
            end else if (strVid='1') or (strVid='2') then begin // значение или название значения
              Kind := [ StrTypeAsKind( FieldByName('TIP').AsString) ];
              strSourceField := 'VALUE';
              if (Kind = [ffkNumber]) or (Kind = [ffkFloat]) then begin
                strSourceField := 'NVALUE';
              end;
              if FieldByName('TIP').AsString='M' then begin // длинные строки (Memo)
                strRelName := strRelL; //'LARGESTR';
                strAliasName := AliasLargeStr;
              end else begin
                strRelName := strRelP; //'PROPERTY';
                strAliasName := AliasProperty;
              end;
              lCS  := false;
              SprEditKind := sekDefault;
              strSprName  := FieldByName('OPISEDIT').AsString;
              if strSprName <> '' then begin
                Kind := Kind + [ffkSpr];
                SprEditKind := sekDefault;
                {
                if Copy(strSprName,1,4)='KEY_' then begin
                  SprEditKind := sekCheckList;// sekComboBox;
                end else begin
                  SprEditKind := sekLookup;
                end;
                }
              end;
//              nOrder := 0;
              strAddCaption := Trim(FieldByName('ADD_FLT').AsString);
              strFieldName := FieldByName('KOD').AsString;
              Kind := Kind + [ffkProp];
              if strRazdel='0' then begin
                lCS  := true;
                strGroupCur := '';
                FindFieldItem := FindFieldList.InsertNew(FieldByName('FIELD_FLT').AsString,
                   strFieldName, strSourceField, GetCaption(false), strAddCaption,
                   strAliasName, Kind, true, lCS, false, strSprName, Field, 1000, strGroupCur,
                   FieldByName('DEFAULT_OP').AsString, strRelName, SprEditKind);
              end else begin
                FindFieldItem := FindFieldList.AddNew(strFieldName, strSourceField, GetCaption(false), strAddCaption,
                   strAliasName, Kind, true, lCS, false, strSprName, Field, nOrder+nNomer, strGroupCur,
                   FieldByName('DEFAULT_OP').AsString, strRelName, SprEditKind);
              end;
            end;
          end;
          Next;
        end;
      end;
    finally
      dmBase.SprProperty.CancelRange;
    end;
  end;
end;

//----------------------------------------------------------------------
function GetComment(strComment :String) : String;
//var
//  s : String;
begin
  Result := strComment;
//  s := StringReplace(strComment,Chr(13),'',[rfReplaceAll]);
//  s := StringReplace(s,Chr(10),'',[rfReplaceAll]);
//  Result := StringReplace(s,'#',Chr(13)+Chr(10),[rfReplaceAll]);
end;
//----------------------------------------------------------------------
function CheckField(sField:String; sTable:String):Boolean;
begin
  Result:=true;
  {$IFDEF LAIS}
    if Pos(UpperCase(sField)+';', 'ID_BASE;')>0 then begin
      Result:=false;
    end;
  {$ENDIF}
end;
//----------------------------------------------------------------------
function CheckSubSystem(sSub:String):Boolean;
//var
//  i,j:Integer;
//  s:String;
begin
  Result:=true;
//  i:=Pos('{', sSub);
//  j:=Pos('}', sSub);
//  if (i>0) and (j>0) then begin
  if (sSub<>'') then begin
    if (Pos('{',sSub)>0) then begin
      if Pos('{'+fmMain.IDProg+'}', sSub)=0    // в скобках {...} подсистемы для которых реквизит ВКЛЮЧЕН, например ЗАГС: {ZAGS}
        then Result:=false
    end;
    if (Pos('[',sSub)>0) then begin
      if Pos('['+fmMain.IDProg+']', sSub)>0    // в скобках [...] подсистемы для которых реквизит ОТКЛЮЧЕН
        then Result:=false
    end;
  end;
end;
//----------------------------------------------------------------------
function CalcEnabled(sCalc,sTable,sField:String):Boolean;
var
  v:Variant;
  l:Boolean;
begin
  Result:=true;
  if Trim(sCalc)<>'' then begin
    if Copy(sCalc,1,1)='&' then begin
      RunFuncScript(Copy(sCalc,2,100),[sTable,sField],v,l);
    end;
  end;
end;
//----------------------------------------------------------------------
function LoadFilterTable(strTableName : String; strAliasTable : String; FindFieldList : TFindFieldList;  Field : TFindFieldItem;
         strRelName : String; strGruppa : String; nAddOrder : Integer=0; sIsklFields:String='') : TFindFieldItem;
var
  FindFieldItem : TFindFieldItem;
  fld : TField;
  strFieldName,
  strSprName : String;
  Kind : TFindFieldKinds;
  lCS : Boolean;
  SprEditKind : TSprEditKind;
  nFieldType : Integer;
  strAddCaption : String;
  nOrder,i : Integer;
  s,ss,sTable,sCalc : String;
  strDefaultOp : String;
  arrTb,arrAl:TArrStrings;
  lOk,lEnabled:Boolean;
begin
  Result := nil;
  fmMain.mtTablesFields.IndexFieldNames:='TableName;FieldName';

  arrTb:=StrToArr(strTableName,';',true);
  arrAl:=StrToArr(strAliasTable,';',true);

  for i:=0 to Length(arrTb)-1 do begin
    strTableName:=arrTb[i];
    strAliasTable:=arrAl[i];

    with dmBase.WorkQuery do begin
      Close;
      SQL.Text := 'SELECT name, field_type, field_length, comment, parent '+
                  'FROM '+dmBase.SysQuery('System.columns')+' WHERE parent=' +QStr(arrTb[i]);
      Open;
   //-------------------------------------
      while not Eof do begin
        if (sIsklFields='') or (Pos(';'+UpperCase(Fields[0].AsString)+';',sIsklFields)=0) then begin
          if fmMain.mtTablesFields.FindKey([ strTableName, Fields[0].AsString ]) then begin
            sCalc:=Trim(fmMain.mtTablesFieldsCalc.AsString);
//            lEnabled:=CalcEnabled(fmMain.mtTablesFieldsCalc.AsString, strTableName, Fields[0].AsString);
            if fmMain.mtTablesFieldsEnableF.AsBoolean and CheckField(Fields[0].AsString, strTableName) and CheckSubSystem(sCalc)  then begin
              strAddCaption := '';
              nFieldType    := FieldByName('Field_Type').AsInteger;
              Kind          := GetKindFromAdsType( nFieldType );
              lCS           := not ( nFieldType = ADS_CISTRING );
              SprEditKind   := sekDefault;
              strSprName    := fmMain.mtTablesFieldsSpr_Filter.AsString;
              nOrder := nAddOrder+fmMain.mtTablesFieldsNomer.AsInteger;
              if not fmMain.mtTablesFieldsFTS.IsNull and
                 fmMain.mtTablesFieldsFTS.AsBoolean then begin
                Kind := Kind + [ffkFTS];
              end;       
              if nFieldType=ADS_TIMESTAMP
                then Kind := Kind + [ffkStamp];
              if strSprName <> '' then begin
                Kind := Kind + [ffkSpr];
                SprEditKind := sekDefault;
    //          if Copy(strSprName,1,4)='KEY_' then begin
    //            SprEditKind := sekCheckList;// sekComboBox;
    //          end else begin
    //            SprEditKind := sekLookup;
    //          end;
              end;
              strFieldName := FieldByName('NAME').AsString;
              //--- дом корпус квартира (перед сравнением будут обрезаться все пробелы)----------
              if (Pos('TRIM;',sCalc)>0) or (strFieldName='DOM') or (strFieldName='KORP') or (strFieldName='KV') or (strFieldName='DELO') then begin
                Kind := Kind + [ffkDoTrim];
              end;
              if (Pos('AGE;',sCalc)>0)  then begin
                Kind := Kind + [ffkAge];
              end;  
              //---------------------------------------------------------------------------------
              strDefaultOp := '';
              ss := fmMain.mtTablesFieldsGruppa.AsString;
              if strGruppa='' then begin
                s := ss;
              end else begin
                if ss=''
                  then s := strGruppa
                  else s := strGruppa + '\' + ss;
              end;
              if strRelName<>'' then begin
                Kind := Kind + [ffkRel];
              end;
              FindFieldItem := FindFieldList.AddNew('FLD_'+strFieldName, strFieldName,
                   fmMain.mtTablesFieldsCaption.AsString, strAddCaption,
                   strAliasTable, Kind,true,lCS,false,strSprName,Field,nOrder,s,
                   strDefaultOp, strRelName ,SprEditKind);
              // поле доступно или нет для группировок
              fld := fmMain.mtTablesFieldsNotGroupBy;
              if not fld.IsNull and fld.AsBoolean then begin
                FindFieldItem.NotGroupBy := true;
              end;
            end;
          end;
        end;
        Next;
      end;
      Close;
     // !!! TfmGurnal.OnUserOper  !!
     //====================== Добавление специальных обработок =======================
      sTable:=ANSIUpperCase(arrTb[i]);
      if sTable='НАСЕЛЕНИЕ' then begin
      //  AddRekv('Трудоспособность',FindFieldList,nil, 11, 'Trud(curDate(), '+AliasMens+'.dater, '+AliasMens+'.pol)', 'KEY_TRUD','', 1320, '', '');  // // 11-ADS_INTEGER
// с учетом даты смерти   FindFieldItem := FindFieldList.AddNew('FLD_IS_TRUD', 'Trud(ifnull('+AliasMens+'dates,curDate()), '+AliasMens+'.dater, '+AliasMens+'.pol)',
//        FindFieldItem := FindFieldList.AddNew('FLD_IS_TRUD', 'Trud(curDate(), '+AliasMens+'.dater, '+AliasMens+'.pol)',

        // см. также fGurnal.pas  TfmGurnal.TBItemGrupOneClick(Sender: TObject);   !!! FLD_IS_TRUD !!!
        FindFieldItem := FindFieldList.AddNew('FLD_IS_TRUD', 'Trud(curDate(), '+strAliasTable+'.dater, '+strAliasTable+'.pol)',
                         'Трудоспособность', '', strAliasTable, [ffkNumber,ffkSpr],true,false,false,'KEY_TRUD',Field,1352,'Рождение и смерть',
                          '', '' ,sekDefault);
        FindFieldItem.NotGroupBy:=false;


      end else if sTable='SMDOPOST' then begin    // почта СМДО  SMDO
        FindFieldItem := FindFieldList.AddNew('FLD_DATEPOST_VIRT', 'CAST(datepost AS SQL_DATE)',
             'Дата получения вх. (отправки исх.)', '', '', [ffkDate],true,false,false,'',Field,25,'', '', '' ,sekDefault);
        FindFieldItem := FindFieldList.AddNew('FLD_DTSTAMP_VIRT', 'CAST(dtstamp AS SQL_DATE)',
             'Дата создания', '', '', [ffkDate],true,false,false,'',Field,26,'', '', '' ,sekDefault);
      end else if sTable='AKTOPEK' then begin    //
        FindFieldItem := FindFieldList.AddNew('FLD_DATE_EDIT_GIS_D', 'CAST(date_edit_gis AS SQL_DATE)',
             'Дата корректировки рекв. ГИС РН', '', '', [ffkDate],true,false,false,'',Field,25,'', '', '' ,sekDefault);
        FindFieldItem := FindFieldList.AddNew('FLD_DATE_POST_GIS_D', 'CAST(date_post_gis AS SQL_DATE)',
             'Дата отправки в ГИС РН', '', '', [ffkDate],true,false,false,'',Field,25,'', '', '' ,sekDefault);
      end else if sTable='ЗАКЛЮЧЕНИЕБРАКОВ' then begin
        FindFieldItem := FindFieldList.AddNew('FLD_VOZR_VIRT_ON', 'GetVozrast(datez,on_dater)',
                         'Возраст', '', '', [ffkNumber],true,false,false,'',Field,52,'ОН',
                          '', '' ,sekDefault);
        FindFieldItem := FindFieldList.AddNew('FLD_VOZR_VIRT_ONA', 'GetVozrast(datez,ona_dater)',
                         'Возраст', '', '', [ffkNumber],true,false,false,'',Field,152,'ОНА',
                         '', '' ,sekDefault);
      end else if sTable='АКТЫРОЖДЕНИЙ' then begin
        FindFieldItem := FindFieldList.AddNew('FLD_VOZR_VIRT_ON', 'GetVozrast(datez,on_dater)',
                         'Возраст', '', '', [ffkNumber],true,false,false,'',Field,177,'Отец',
                          '', '' ,sekDefault);
        FindFieldItem := FindFieldList.AddNew('FLD_VOZR_VIRT_ONA', 'GetVozrast(datez,ona_dater)',
                         'Возраст', '', '', [ffkNumber],true,false,false,'',Field,252,'Мать',
                         '', '' ,sekDefault);
        FindFieldItem := FindFieldList.AddNew('FLD_TORGESTV', 'IIF(vosstan=false, dayofyear(sud_date), null)',
                         'Торжеств. обстановка', '', '', [ffkNUmber,ffkSpr],true,false,false,'KEY_ROGD_TORG',Field,253,'',
                         '', '' ,sekCheckList);

        // заключнеие о призваоении ИН
        FindFieldItem := FindFieldList.AddNew('ZAKL_IN_NOMER', 'VALUE', 'Заключение ИН', '',
                         AliasBaseProp, [ffkString,ffkProp], true, false, false, strSprName, Field, 1000, '', //'Дополнительно',
                         '', 'BASEPROP', sekDefault);
        FindFieldItem := FindFieldList.AddNew('ZAKL_IN_DATE', 'VALUE', 'Дата дополнения ИН', '',
                         AliasBaseProp, [ffkDate,ffkProp], true, false, false, strSprName, Field, 1001, '', //'Дополнительно',
                         '', 'BASEPROP', sekDefault);

      end else if sTable='АКТЫСМЕРТЕЙ' then begin
        FindFieldItem := FindFieldList.AddNew('FLD_IS_TRUD', 'Trud('+strAliasTable+'.dates, '+strAliasTable+'.dater, '+strAliasTable+'.pol)',
                         'Трудоспособность', '', strAliasTable, [ffkNumber,ffkSpr],true,false,false,'KEY_TRUD',Field,1352,'',
                          '', '' ,sekDefault);
        FindFieldItem.NotGroupBy:=false;
      end else if sTable='AKTTERMMARRIAGE' then begin
        FindFieldItem := FindFieldList.AddNew('FLD_VOZR_VIRT_ON', 'GetVozrast(datez,on_dater)',
                         'Возраст', '', '', [ffkNumber],true,false,false,'',Field,28,'ОН',
                          '', '' ,sekDefault);
        FindFieldItem := FindFieldList.AddNew('FLD_VOZR_VIRT_ONA', 'GetVozrast(datez,ona_dater)',
                         'Возраст', '', '', [ffkNumber],true,false,false,'',Field,71,'ОНА',
                         '', '' ,sekDefault);
      end;
      //============== end ======== Добавление специальных обработок =======================

    end;

  end;

end;

//--------------------------------------------------------------------------
{
function LoadFilterTable1(strTableName : String; strAliasTable : String;
          FindFieldList : TFindFieldList;  Field : TFindFieldItem;
          strRelName : String; strGruppa : String='') : TFindFieldItem;
var
  sl : TStringList;
  strFieldName,
  strSprName : String;
  Kind : TFindFieldKinds;
  lCS : Boolean;
  SprEditKind : TSprEditKind;
  nFieldType : Integer;
  strAddCaption : String;
  nOrder : Integer;
  s,ss : String;
  procedure GetParamField;
  begin
    with dmBase.WorkQuery do begin
      nFieldType := FieldByName('Field_Type').AsInteger;
      Kind := GetKindFromAdsType( nFieldType );
      lCS  := not ( nFieldType = ADS_CISTRING );
      SprEditKind := sekDefault;
      strSprName  := sl.Values['SPR_FILTER'];
      nOrder := 0;
      if strSprName <> '' then begin
        Kind := Kind + [ffkSpr];
        SprEditKind := sekDefault;
//        if Copy(strSprName,1,4)='KEY_' then begin
//          SprEditKind := sekCheckList;// sekComboBox;
//        end else begin
//          SprEditKind := sekLookup;
//        end;
      end;
      strFieldName := FieldByName('NAME').AsString;
    end;
  end;
begin
  Result := nil;
  strAddCaption := '';
//  fmMain.mtTablesFields.IndexFieldNames:='TableName;FieldName';
  with dmBase.WorkQuery do begin
    Close;
    SQL.Text := 'SELECT name, field_type, field_length, comment '+
                'FROM System.columns WHERE parent=' +QStr(strTableName);
    Open;
    sl := TStringList.Create;
    while not Eof do begin
      sl.Text := GetComment(FieldByName('COMMENT').AsString);
      if (sl.Values['ENABLEF']='1') or (sl.Values['ENABLEF']='') then begin
        GetParamField;
        ss := Trim(sl.Values['GRUPPA']);
        if strGruppa='' then begin
          s := ss;
        end else begin
          if ss=''
            then s := strGruppa
            else s := strGruppa + '\' + sl.Values['GRUPPA'];
        end;
        if strRelName<>'' then begin
          Kind := Kind + [ffkRel];
        end;
        FindFieldList.AddNew('FLD_'+strFieldName, strFieldName, sl.Values['CAPTION'], strAddCaption,
          strAliasTable, Kind,true,lCS,false,strSprName,Field,nOrder,s,
          sl.Values['DEFAULT_OP'], strRelName ,SprEditKind);
      end;
      Next;
    end;
    Close;
  end;
end;
}
//-----------------------------------------------------------------
procedure AddRekv(sCaption:String;FindFieldList:TFindFieldList; Field:TFindFieldItem; nFieldType:Integer; sFieldName:String;
                  sSprName:String; sAlias:String; nOrder:Integer; sOption:String;sGruppa:String);
var
  FindFieldItem : TFindFieldItem;
  fld : TField;
  Kind : TFindFieldKinds;
  lCS : Boolean;
  SprEditKind : TSprEditKind;
  strAddCaption : String;
  s,ss : String;
  strDefaultOp : String;
  strRelName:String;
begin
  strAddCaption := '';
  Kind := GetKindFromAdsType( nFieldType );
  lCS  := not ( nFieldType = ADS_CISTRING );
  SprEditKind   := sekDefault;
{          if not fmMain.mtTablesFieldsFTS.IsNull and
             fmMain.mtTablesFieldsFTS.AsBoolean then begin
            Kind := Kind + [ffkFTS];
          end;     }
  if nFieldType=ADS_TIMESTAMP
    then Kind := Kind + [ffkStamp];
  if sSprName <> '' then begin
    Kind := Kind + [ffkSpr];
//          if Copy(strSprName,1,4)='KEY_' then begin
//            SprEditKind := sekCheckList;// sekComboBox;
//          end else begin
//            SprEditKind := sekLookup;
//          end;
   end;
  //--- дом корпус квартира (перед сравнением будут обрезаться все пробелы)----------
  if Pos('TRIM;',sOption)>0  then begin
    Kind := Kind + [ffkDoTrim];
  end;
  //---------------------------------------------------------------------------------
  strDefaultOp := '';
  strRelName:='';
  if strRelName<>'' then begin
    Kind := Kind + [ffkRel];
  end;
  FindFieldItem := FindFieldList.AddNew('FLD_'+sFieldName, sFieldName,
                      sCaption, strAddCaption, sAlias, Kind,true,lCS,false,sSprName,Field,nOrder,sGruppa,
                      strDefaultOp, strRelName,SprEditKind);
end;

//----------------------------------------------------------------
procedure LoadLichSchet(FindFieldList : TFindFieldList);
var
  Field, Field1 : TFindFieldItem;
  nOrder : Integer;
begin
  LoadFilterTable('ЛицевыеСчета',AliasLichSchet,FindFieldList,nil,'','');
  nOrder := 0;

  //------- признаки лицевых счетов --------------------------------
  Field:=FindFieldList.AddNew('LIST_PRIZNAK', 'ЛицевыеСчетаПризнаки', 'Признаки', '', AliasLichSchetPriznak, [ffkList],
         True, false, false, '', nil, nOrder, '', '', 'LICHSCHET_PRIZNAK', sekDefault);

  LoadFilterTable('ЛицевыеСчетаПризнаки',AliasLichSchetPriznak,FindFieldList,Field,'','');

  //------- документы лицевых счетов --------------------------------
  Field:=FindFieldList.AddNew('LIST_DOKUM', 'Dokuments', 'Документы', '', AliasLichSchetDok, [ffkList],
         True, false, false, '', nil, nOrder, '', '', 'LICHSCHET_DOK', sekDefault);

  LoadFilterTable('Dokuments',AliasLichSchetDok,FindFieldList,Field,'','');

  //--------------------------- адреса -------------------------------------
//  LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'LICHSCHET_ADRES','Адрес');
  LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'','Адрес');   //!!! есть сохраненные фильтры !!!

  Field:=FindFieldList.ByRealName(nil,'DOM1');
  if Field<>nil then begin
    Field.Kinds:=Field.Kinds-[ffkString];
    Field.Kinds:=Field.Kinds+[ffkNumber];
  end;       

  //--------------------------- люди -------------------------------------
  Field:=FindFieldList.AddNew('LIST_MENS', 'Население', 'Люди', '', AliasMens, [ffkList],
         True, false, false, '', nil, 2, '', '', 'LICHSCHET_MENS', sekDefault);

  LoadFilterTable('Население',AliasMens,FindFieldList,Field,'','');

  CreateFilterProperty(FindFieldList, Field, 'PROPERTY','LARGESTR', dmBase.TypeObj_Nasel, '0','','');

  //------------ льготы у людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_LGOT', 'НаселениеЛьготы', 'Льготы', '', AliasMensLgot, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_LGOT', sekDefault);

  LoadFilterTable('НаселениеЛьготы',AliasMensLgot,FindFieldList,Field1,'','');

 //------------ признаки у людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_PRIZNAK', 'НаселениеПризнаки', 'Признаки', '', AliasMensPriznak, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_PRIZNAK', sekDefault);

  LoadFilterTable('НаселениеПризнаки',AliasMensPriznak,FindFieldList,Field1,'','');

  //------------ движение  людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_DVIG', 'НаселениеДвижение', 'Движение', '', AliasMensDvig, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_DVIG', sekDefault);

  LoadFilterTable('НаселениеДвижение',AliasMensDvig,FindFieldList,Field1,'','');

  CreateFilterProperty(FindFieldList, nil, 'PROPERTY','LARGESTR', dmBase.TypeObj_Lich, '11','','',1000);
//  CreateFilterProperty(FindFieldList, nil, 'PROPERTY','LARGESTR', dmBase.TypeObj_Lich, '2','','',1001);
  CreateFilterProperty(FindFieldList, nil, 'PROPERTY_ADRES','LARGESTR_ADRES', dmBase.TypeObj_Adres, '1','','',1002);

  //------------ здание у адреса ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_ADRES_BIGHOUSE', 'BigHouse', 'Здание', '',
          AliasBigHouse, [ffkList],
          True, false, false, '', nil, nOrder, '', '', 'ADRES_BIGHOUSE', sekDefault);

  LoadFilterTable('BigHouse',AliasBigHouse,FindFieldList,Field1,'','');
end;


//-------------------------------------------------------------------------
procedure LoadNasel(FindFieldList : TFindFieldList);
var
  Field, Field1 : TFindFieldItem;
  nOrder : Integer;
begin

  LoadFilterTable('Население',AliasMens,FindFieldList,nil,'','');

//  AddRekv('Трудоспособность',FindFieldList,nil, 11, 'Trud(curDate(), '+AliasMens+'.dater, '+AliasMens+'.pol)', 'KEY_TRUD','', 1320, '', '');  // // 11-ADS_INTEGER

  // вставка для возможности поиска по выражению  "case fieldname is null or fieldname=0 then false else true end"
  // см. также TfmGurnal.OnUserOper  (модуль fGurnal)
  Field:=FindFieldList.ByRealName(nil,'LIC_ID');
  if Field<>nil
    then Field.Kinds:=[ffkBoolean,ffkNotNull];
  Field:=FindFieldList.ByRealName(nil,'ADRES_ID');
  if Field<>nil
    then Field.Kinds:=[ffkBoolean,ffkNotNull];
  Field:=FindFieldList.ByRealName(nil,'ADRES_ID_GIT');
  if Field<>nil
    then Field.Kinds:=[ffkBoolean,ffkNotNull];
  //--------------------------------------------------------------------------------------------------------------

  {$IFDEF LAIS}
  CreateFilterProperty(FindFieldList, nil, 'PROPERTY','LARGESTR', dmBase.TypeObj_Nasel, '0','','');
  {$ENDIF}

  Field:=nil;
  {$IFDEF LAIS}
    nOrder:=0;
  {$ELSE}
    nOrder:=1001;
  {$ENDIF}

  //------------ льготы у людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_LGOT', 'НаселениеЛьготы', 'Льготы', '',
          AliasMensLgot, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_LGOT', sekDefault);

  LoadFilterTable('НаселениеЛьготы',AliasMensLgot,FindFieldList,Field1,'','');

  //------------ признаки у людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_PRIZNAK', 'НаселениеПризнаки', 'Признаки', '',
          AliasMensPriznak, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_PRIZNAK', sekDefault);

  LoadFilterTable('НаселениеПризнаки',AliasMensPriznak,FindFieldList,Field1,'','');

  {$IFDEF LAIS}
  //------------ движение  людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_DVIG', 'НаселениеДвижение', 'Движение', '',
          AliasMensDvig, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_DVIG', sekDefault);

  LoadFilterTable('НаселениеДвижение',AliasMensDvig,FindFieldList,Field1,'','');
  {$ENDIF}

  //------------ история фамилий ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_HIST_FAM', 'HistoryZAGS', 'История фамилий', '',
          AliasMensFamiliaHist, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_HIST_FAMILIA', sekDefault);

  LoadFilterTable('HistoryZAGS',AliasMensFamiliaHist,FindFieldList,Field1,'','');

  {$IFDEF LAIS}
    //------------ дети  людей ----------------------------------
    Field1:=FindFieldList.AddNew('LIST_MENS_DETI', 'Население', 'Дети', '',
            AliasMensDeti, [ffkList],
            True, false, false, '', Field, nOrder, '', '', 'MENS_DETI', sekDefault);

    LoadFilterTable('Население',AliasMensDeti,FindFieldList,Field1,'','');

    //------------ дополнение к человеку -------------------------
  //  LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,Field,'MENS_ADRES','Адрес');

    LoadFilterTable('НаселениеДоп',AliasMensAdd,FindFieldList,nil,'','Дополнительно',0);

    LoadFilterTable('Ochered',AliasOchered,FindFieldList,nil,'','Очередь на жильё',0);
    Field1:=FindFieldList.ByRealName(nil,'NEW_ADRES_ID');
    if Field1<>nil
      then Field1.Kinds:=[ffkBoolean,ffkNotNull];
    AddRekv('Основание',FindFieldList,nil, 11, 'OSNOV', 'LOOKUP_SPR_SN_POST_OCH','ocr', 195, '', 'Последнее решение');  // 11-ADS_INTEGER
    AddRekv('Основание(дополнительно)',FindFieldList,nil, 11, 'OSNOV2', 'LOOKUP_SPR_SN_POST_OCH','ocr', 195, '', 'Последнее решение');  // 11-ADS_INTEGER
    AddRekv('Дата',FindFieldList,nil, 3, 'DATER', '','ocr', 196, '', 'Последнее решение');  // 3-ADS_DATE

//    AddRekv('Последнее основание из решений',FindFieldList,nil, 11, 'OSNOV', 'LOOKUP_SPR_SN_POST_OCH','ocr', 195, '', '');  // 11-ADS_INTEGER
//    AddRekv('Основание (дополнитнльно)',FindFieldList,nil, 11, 'OSNOV2', 'LOOKUP_SPR_SN_POST_OCH','ocr', 196, '', '');  // 11-ADS_INTEGER

    Field1:=FindFieldList.AddNew('LIST_MENS_OCH_RESH', 'OcheredResh', 'Решения по очереди', '',
          AliasOcheredResh, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_OCH_RESH', sekDefault);
    LoadFilterTable('OcheredResh',AliasOcheredResh,FindFieldList,Field1,'','',0);

    LoadFilterTable('VUS',AliasVUS,FindFieldList,nil,'','ВУС',0);
  {$ELSE}
    Field1:=LoadFilterTable('Ochered',AliasOchered,FindFieldList,nil,'','реквизиты очереди',0);

    AddRekv('Основание',FindFieldList,nil, 11, 'OSNOV', 'LOOKUP_SPR_SN_POST_OCH','ocr', 195, '', 'Последнее решение');  // 11-ADS_INTEGER
    AddRekv('Основание (дополнительно)',FindFieldList,nil, 11, 'OSNOV2', 'LOOKUP_SPR_SN_POST_OCH','ocr', 195, '', 'Последнее решение');  // 11-ADS_INTEGER
    AddRekv('Дата',FindFieldList,nil, 3, 'DATER', '','ocr', 196, '', 'Последнее решение');  // 3-ADS_DATE

//    AddRekv('Последнее основание из решений',FindFieldList,nil, 11, 'OSNOV', 'LOOKUP_SPR_SN_POST_OCH','ocr', 0, '', '');  // 11-ADS_INTEGER
//    AddRekv('Основание (дополнитнльно)',FindFieldList,nil, 11, 'OSNOV2', 'LOOKUP_SPR_SN_POST_OCH','ocr', 0, '', '');  // 11-ADS_INTEGER

    Field1:=FindFieldList.AddNew('LIST_MENS_OCH_RESH', 'OcheredResh', 'Решения по очереди', '',
          AliasOcheredResh, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_OCH_RESH', sekDefault);
    LoadFilterTable('OcheredResh',AliasOcheredResh,FindFieldList,Field1,'','',0);
  {$ENDIF}


  //------------ адрес к человеку -------------------------
//  LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,Field,'MENS_ADRES','Адрес');

  {$IFDEF LAIS}
    LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'','Адрес',0);
  {$ELSE}
    LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'','Адрес',999);
  {$ENDIF}

  Field:=FindFieldList.ByRealName(nil,'DOM1');
  if Field<>nil then begin
    Field.Kinds:=Field.Kinds-[ffkString];
    Field.Kinds:=Field.Kinds+[ffkNumber];
  end;

  // !!!
  Field1:=FindFieldList.AddNew('MENS_ADRES_OWNERS', 'HouseOwners', 'Cобственность', '',
          AliasAdresOwners, [ffkList],
          True, false, false, '', nil, nOrder, '', '', 'MENS_OWNERS', sekDefault);
//          True, false, false, '', Field, nOrder, '', '', 'MENS_OWNERS', sekDefault);
  LoadFilterTable('HouseOwners',AliasAdresOwners,FindFieldList,Field1,'','',0,';TYPEKOD;KOD;');

  {$IFDEF LAIS}
  //--------------------------- лицевой счет -------------------------------------
  Field:=FindFieldList.AddNew('LIST_LICHSCHET', 'ЛицевыеСчета', 'Лицевой счет', '',
         AliasLichSchet, [ffkList],
         True, false, false, '', nil, 999, '', '', 'MENS_LICHSCHET', sekDefault);

  LoadFilterTable('ЛицевыеСчета',AliasLichSchet,FindFieldList,Field,'','');

  //------- признаки лицевых счетов --------------------------------
  Field1:=FindFieldList.AddNew('LIST_PRIZNAK', 'ЛицевыеСчетаПризнаки', 'Признаки', '', AliasLichSchetPriznak, [ffkList],
         True, false, false, '', Field, 999, '', '', 'LICHSCHET_PRIZNAK', sekDefault);

  LoadFilterTable('ЛицевыеСчетаПризнаки',AliasLichSchetPriznak,FindFieldList,Field1,'','');

  //------------ адрес ------------------------- vadim
  LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,Field,'LICHSCHET_ADRES','Адрес',0);

  //------- население лицевых счетов --------------------------------

  Field1:=FindFieldList.AddNew('LIST_MENS', 'Население', 'Люди', '', AliasMens2, [ffkList],
         True, false, false, '', Field, 999, '', '', 'LICHSCHET_MENS', sekDefault);

  LoadFilterTable('Население',AliasMens2,FindFieldList,Field1,'','');

  //------------ здание у адреса ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_ADRES_BIGHOUSE', 'BigHouse', 'Здание', '',
          AliasBigHouse, [ffkList],
          True, false, false, '', nil, 999, '', '', 'ADRES_BIGHOUSE', sekDefault);

  LoadFilterTable('BigHouse',AliasBigHouse,FindFieldList,Field1,'','');
  {$ENDIF}

end;

//-------------------------------------------------------------------------
procedure LoadNaselOch(FindFieldList : TFindFieldList);
var
  Field, Field1 : TFindFieldItem;
  nOrder,i,nMax : Integer;
begin

//  LoadFilterTable('Население',AliasMens,FindFieldList,nil,'','');

//  Field1:=LoadFilterTable('Население;Ochered',AliasMens+';'+AliasOchered,FindFieldList,nil,'','',0);
  Field:=nil;
  Field1:=nil;

//  LoadFilterTable('Население',AliasMens,FindFieldList,nil,'','',0,';ADRES_ID;');
  LoadFilterTable('Население',AliasMens,FindFieldList,nil,'','',0,'');
  LoadFilterTable('Ochered',AliasOchered,FindFieldList,nil,'','',0);
  nMax:=0;
  for i:=0 to FindFieldList.Count-1 do begin
    nMax:=Max(nMax,FindFieldList.Item[i].Order);
  end;
  nOrder:=nMax+1;

  AddRekv('Основание последнего решения',FindFieldList,Field1, 11, 'OSNOV', 'LOOKUP_SPR_SN_POST_OCH','ocr', nOrder, '', '');  // 11-ADS_INTEGER
  AddRekv('Основание (дополнительно)',FindFieldList,Field1, 11, 'OSNOV2', 'LOOKUP_SPR_SN_POST_OCH','ocr', nOrder+1, '', '');  // 11-ADS_INTEGER

  nOrder:=nOrder+5;
  Field1:=FindFieldList.AddNew('LIST_MENS_OCH_RESH', 'OcheredResh', 'Решения по очереди', '',
        AliasOcheredResh, [ffkList],
        True, false, false, '', Field, nOrder, '', '', 'MENS_OCH_RESH', sekDefault);

  LoadFilterTable('OcheredResh',AliasOcheredResh,FindFieldList,Field1,'','',nOrder);

  // вставка для возможности поиска по выражению  "case fieldname is null or fieldname=0 then false else true end"
  // см. также TfmGurnal.OnUserOper  (модуль fGurnal)
  Field:=FindFieldList.ByRealName(nil,'ADRES_ID');
  if Field<>nil then begin
    Field.Kinds:=[ffkBoolean,ffkNotNull];
  end;
  //--------------------------------------------------------------------------------------------------------------

  Field:=nil;
  nOrder:=1001;

  //------------ состав семьи ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_SOSTAV', 'SostavSem', 'Состав семьи', '',
          AliasSostavSem, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_SOSTAV', sekDefault);
  LoadFilterTable('SostavSem',AliasSostavSem,FindFieldList,Field1,'','');
  nOrder:=1011;

  //------------ льготы у людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_LGOT', 'НаселениеЛьготы', 'Льготы', '',
          AliasMensLgot, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_LGOT', sekDefault);

  LoadFilterTable('НаселениеЛьготы',AliasMensLgot,FindFieldList,Field1,'','');

  //------------ признаки у людей ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_PRIZNAK', 'НаселениеПризнаки', 'Признаки', '',
          AliasMensPriznak, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_PRIZNAK', sekDefault);

  LoadFilterTable('НаселениеПризнаки',AliasMensPriznak,FindFieldList,Field1,'','');

  //------------ история фамилий ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS_HIST_FAM', 'HistoryZAGS', 'История фамилий', '',
          AliasMensFamiliaHist, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_HIST_FAMILIA', sekDefault);

  LoadFilterTable('HistoryZAGS',AliasMensFamiliaHist,FindFieldList,Field1,'','');


  //------------ собственность----------------------------------
  {
  Field1:=FindFieldList.AddNew('LIST_MENS_SOBSTV', 'НаселениеСобств', 'Собственность БТИ', '',
          AliasMensSobstv, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'MENS_SOBSTV', sekDefault);
  LoadFilterTable('НаселениеСобств',AliasMensSobstv,FindFieldList,Field1,'','');
  }
//  nOrder:=1011;

  //------------ адрес к человеку -------------------------
//  LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,Field,'MENS_ADRES','Адрес');

  if dmBase.OblBASE then begin
    LoadFilterTable('НаселениеДоп',AliasMensAdd,FindFieldList,nil,'','Адрес',1300);
    AddRekv('Территория',FindFieldList,nil, 4, 'substring(sn.soato,1,4)', 'KEY_RN_OCH','', 1320, '', '');  // 4-ADS_STRING
  end else begin
    LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'','Адрес',999);

    Field:=FindFieldList.ByRealName(nil,'DOM1');
    if Field<>nil then begin
      Field.Kinds:=Field.Kinds-[ffkString];
      Field.Kinds:=Field.Kinds+[ffkNumber];
    end;

   // LoadFilterTable('БазаДомов',AliasNewAdres,FindFieldList,nil,'','Новый адрес',1000);  // NEW_ADRES_ID
    LoadFilterTable('НаселениеДоп',AliasMensAdd,FindFieldList,nil,'','Адрес для загруженных',1300);
  end;


end;

//-------------------------------------------------------------------------
procedure LoadAdres(FindFieldList : TFindFieldList);
var
  Field, Field1 : TFindFieldItem;
  nOrder : Integer;
begin

  LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'','');

  Field:=FindFieldList.ByRealName(nil,'DOM1');
  if Field<>nil then begin
    Field.Kinds:=Field.Kinds-[ffkString];
    Field.Kinds:=Field.Kinds+[ffkNumber];
  end;
                               
  CreateFilterProperty(FindFieldList, nil, 'PROPERTY','LARGESTR', dmBase.TypeObj_Adres, '0','','');

  nOrder := 999;
  //--------------------------- люди -------------------------------------
  Field1:=FindFieldList.AddNew('LIST_ADRES_MENS', 'Население', 'Люди на адресе', '', AliasMens2, [ffkList],
          True, false, false, '', nil, nOrder, '', '', 'ADRES_MENS', sekDefault);

  LoadFilterTable('Население',AliasMens2,FindFieldList,Field1,'','');

  nOrder := 1;
  //--------------------------- лицевой счет -------------------------------------
  Field:=FindFieldList.AddNew('LIST_LICHSCHET', 'ЛицевыеСчета', 'Лицевой счет', '',
         AliasLichSchet, [ffkList],
         True, false, false, '', nil, nOrder, '', '', 'ADRES_LICHSCHET', sekDefault);

  LoadFilterTable('ЛицевыеСчета',AliasLichSchet,FindFieldList,Field,'','');

  //--------------------------- люди -------------------------------------
  Field1:=FindFieldList.AddNew('LIST_MENS', 'Население', 'Люди', '', AliasMens, [ffkList],
          True, false, false, '', Field, nOrder, '', '', 'LICHSCHET_MENS', sekDefault);

  LoadFilterTable('Население',AliasMens,FindFieldList,Field1,'','');

  //------------ признаки у адреса ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_ADRES_PRIZNAK', 'HouseProps', 'Признаки', '',
          AliasAdresPriznak, [ffkList],
          True, false, false, '', nil, nOrder, '', '', 'ADRES_PRIZNAK', sekDefault);

  LoadFilterTable('HouseProps',AliasAdresPriznak,FindFieldList,Field1,'','');
  //----------------------------------------------------------------------------------------------

  //------------ собственники у адреса -----------------------------------------------------------
  Field1:=FindFieldList.AddNew('LIST_ADRES_OWNERS', 'HouseOwners', 'Собственники', '',
          AliasAdresOwners, [ffkList],
          True, false, false, '', nil, nOrder, '', '', 'ADRES_OWNERS', sekDefault);

  LoadFilterTable('HouseOwners',AliasAdresOwners,FindFieldList,Field1,'','');
  //----------------------------------------------------------------------------------------------

  CreateFilterProperty(FindFieldList, nil, 'PROPERTY','LARGESTR', dmBase.TypeObj_Adres, '1','','');

  //------------ здание у адреса ----------------------------------
  Field1:=FindFieldList.AddNew('LIST_ADRES_BIGHOUSE', 'BigHouse', 'Здание', '',
          AliasBigHouse, [ffkList],
          True, false, false, '', nil, nOrder, '', '', 'ADRES_BIGHOUSE', sekDefault);

  LoadFilterTable('BigHouse',AliasBigHouse,FindFieldList,Field1,'','');


end;
                                    

procedure LoadPassport(FindFieldList : TFindFieldList);
begin
  LoadFilterTable('Паспорт',AliasPassport,FindFieldList,nil,'','');
end;

//-------------------------------------------------------------------------
{
procedure LoadPassport(FindFieldList : TFindFieldList);
var
  sl : TStringList;
  strFieldName,
  strSprName : String;
  Kind : TFindFieldKinds;
  lCS : Boolean;
  SprEditKind : TSprEditKind;
//  Field, Field1 : TFindFieldItem;
  nFieldType : Integer;
  strAddCaption : String;
  nOrder : Integer;
  procedure GetParamField;
  begin
    with dmBase.WorkQuery do begin
      nFieldType := FieldByName('Field_Type').AsInteger;
      Kind := GetKindFromAdsType( nFieldType );
      lCS  := not ( nFieldType = ADS_CISTRING );
      SprEditKind := sekDefault;
      nOrder := 0;
      strSprName  := sl.Values['SPR_FILTER'];
      if strSprName <> '' then begin
        Kind := Kind + [ffkSpr];
        SprEditKind := sekDefault;
      end;
      strFieldName := FieldByName('NAME').AsString;
    end;
  end;
begin
  strAddCaption := '';
  sl := TStringList.Create;
  with dmBase.WorkQuery do begin
    Close;
    SQL.Text := 'SELECT name, field_type, field_length, comment '+
                'FROM System.columns WHERE parent=''Паспорт''';
    Open;
    sl.Clear;
    while not Eof do begin
      sl.Text := GetComment(FieldByName('COMMENT').AsString);
      if (sl.Values['ENABLEF']='1') or (sl.Values['ENABLEF']='') then begin
        GetParamField;
        FindFieldList.AddNew('FLD_'+strFieldName, strFieldName, sl.Values['CAPTION'], strAddCaption,
          AliasPassport, Kind, true, lCS, false, strSprName, nil, nOrder, sl.Values['GRUPPA'],
          sl.Values['DEFAULT_OP'], '', SprEditKind);
      end;
      Next;
    end;
    Close;

//    CreateFilterProperty(FindFieldList, nil, 'PROPERTY','LARGESTR', dmBase.TypeObj_Adres, '0','','');


  end;
  sl.Free;
end;
}
{
//----------------------------------------------------
function GetParamFieldFlt( sl : TStringList ) : TParamFieldFlt;
begin
  with dmBase.WorkQuery do begin
    Result.nFieldType := FieldByName('Field_Type').AsInteger;
    Result.Kind := GetKindFromAdsType( Result.nFieldType );
    Result.lCS  := not ( Result.nFieldType = ADS_CISTRING );
    Result.SprEditKind := sekDefault;
    Result.nOrder := 0;
    Result.strSprName  := sl.Values['SPR_FILTER'];
    if Result.strSprName <> '' then begin
      Result.Kind := Result.Kind + [ffkSpr];
      Result.SprEditKind := sekDefault;
    end;
    Result.strFieldName := FieldByName('NAME').AsString;
  end;
end;
}
//-------------------------------------------------------------------------
procedure LoadTalonPrib(FindFieldList : TFindFieldList);
begin
  LoadFilterTable('ТалоныПрибытия',AliasTalonPrib,FindFieldList,nil,'','');
end;

procedure LoadDeclRegistr(FindFieldList : TFindFieldList);
begin
  LoadFilterTable('DeclareRegistr',AliasDeclRegistr,FindFieldList,nil,'','');
end;

procedure LoadAddDokZAGS(FindFieldList : TFindFieldList);
begin
  LoadFilterTable('AddDokZAGS',AliasAddDokZAGS,FindFieldList,nil,'','');
end;

//-------------------------------------------------------------------------
procedure LoadTalonUbit(FindFieldList : TFindFieldList);
begin
  LoadFilterTable('ТалоныУбытия',AliasTalonUbit,FindFieldList,nil,'','');
end;

//-------------------------------------------------------------------------
procedure LoadFields(FindFieldList : TFindFieldList; nType : Integer);
var
  Field : TFindFieldItem;
begin
  if nType = dmBase.TypeObj_Lich then begin
    LoadLichSchet(FindFieldList);
  end else if nType = dmBase.TypeObj_Nasel then begin
    {$IFDEF OCHERED}
      LoadNaselOch(FindFieldList);
    {$ELSE}
      LoadNasel(FindFieldList);
    {$ENDIF}
  end else if nType = dmBase.TypeObj_Adres then begin
    LoadAdres(FindFieldList);
  end else if nType = dmBase.TypeObj_ZBrak then begin
//    LoadSimple(FindFieldList, 'ЗаключениеБраков', AliasZBrak);
    LoadFilterTable('ЗаключениеБраков', AliasZBrak, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_DBrak then begin
    LoadFilterTable('DeclareMarriage', AliasDBrak, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_DRast then begin
    LoadFilterTable('DeclareTermMarriage', AliasDRast, FindFieldList,  nil, '','');
  end else if nType = _TypeObj_DChName then begin
    LoadFilterTable('DeclareChName', AliasDChName, FindFieldList,  nil, '','');
  end else if nType = _TypeObj_DIzm then begin
    LoadFilterTable('DeclareIzm', AliasDIzm, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_ZRogd then begin
//    LoadSimple(FindFieldList, 'АктыРождений', AliasZRogd);
    LoadFilterTable('АктыРождений', AliasZRogd, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_ZSmert then begin
//    LoadSimple(FindFieldList, 'АктыСмертей', AliasZSmert);
    LoadFilterTable('АктыСмертей', AliasZSmert, FindFieldList,  nil, '','');
  end else if nType = _TypeObj_AktZAH then begin
    LoadFilterTable('AktZ', AliasZah, FindFieldList,  nil, '','');
  end else if nType = _TypeObj_Opeka then begin
    LoadFilterTable('AktOpek', AliasOpeka, FindFieldList,  nil, '','');
    AddRekv('Зарегистрирован в ГИС РН',FindFieldList,nil, ADS_LOGICAL, 'iif(pole_grn>=3000,true,false)', '','', 1, '', '');
  end else if nType = _TypeObj_SMDOPost then begin
    LoadFilterTable('SMDOPost', AliasSMDO, FindFieldList,  nil, '','');
  end else if nType = _TypeObj_QueryGIS then begin
    LoadFilterTable('QueryGIS', AliasQueryGis, FindFieldList,  nil, '','');
  end else if nType = _TypeObj_RegDogN then begin
    LoadFilterTable('RegDogN', AliasRegDogN, FindFieldList,  nil, '','');
    LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'','Адрес домовладения',5);
    Field:=FindFieldList.ByRealName(nil,'DOM1');
    if Field<>nil then begin
      Field.Kinds:=Field.Kinds-[ffkString];
      Field.Kinds:=Field.Kinds+[ffkNumber];
    end;
    AddRekv('Договор закончился',FindFieldList,nil, ADS_LOGICAL, 'iif((dater2 is not null and curdate()>=dater2) or (date_cancel is not null and curdate()>=date_cancel),true,false)', '','', 1320, '', '');
  end else if nType = _TypeObj_RegDogN2 then begin
    LoadFilterTable('RegDogN', AliasRegDogN, FindFieldList,  nil, '','');
    LoadFilterTable('БазаДомов',AliasAdres,FindFieldList,nil,'','Адрес домовладения',5);
    Field:=FindFieldList.ByRealName(nil,'DOM1');
    if Field<>nil then begin
      Field.Kinds:=Field.Kinds-[ffkString];
      Field.Kinds:=Field.Kinds+[ffkNumber];
    end;
    AddRekv('Договор закончился',FindFieldList,nil, ADS_LOGICAL, 'iif((dater2 is not null and curdate()>=dater2) or (date_cancel is not null and curdate()>=date_cancel),true,false)', '','', 1320, '', '');
  end else if nType = dmBase.TypeObj_ZUstOtc then begin
    LoadFilterTable('АктыУстОтцовства', AliasZUstOtc, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_ZUstMat then begin
    LoadFilterTable('АктыУстМатеринства', AliasZUstMat, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_ZRast then begin
    LoadFilterTable('AktTermMarriage', AliasZRast, FindFieldList,  nil, '','');
    AddRekv('ОН сменил фамилию',FindFieldList,nil, ADS_LOGICAL, 'iif(ON_familia<>ON_familiap,true,false)', '','', 1320, '', '');
    AddRekv('ОНА сменила фамилию',FindFieldList,nil, ADS_LOGICAL, 'iif(ONA_familia<>ONA_familiap,true,false)', '','', 1340, '', '');
  end else if nType = dmBase.TypeObj_ZAdopt then begin
    LoadFilterTable('AktAdopt', AliasZAdopt, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_ZChName then begin
    LoadFilterTable('AktChangeName', AliasZChName, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_UZRogd then begin
    LoadFilterTable('GurnalRegistr', AliasUZRogd, FindFieldList,  nil, '','');
  end else if nType = _TypeObj_UZAdopt then begin
    LoadFilterTable('GurnalRegistr', AliasUZAdopt, FindFieldList,  nil, '','');
  end else if nType = dmBase.TypeObj_Passport then begin
    LoadPassport(FindFieldList);
  end else if nType = dmBase.TypeObj_TalonPrib then begin
    LoadTalonPrib(FindFieldList);
  end else if nType = dmBase.TypeObj_TalonUbit then begin
    LoadTalonUbit(FindFieldList);
  end else if nType = dmBase.TypeObj_DeclareRegistr then begin
    LoadDeclRegistr(FindFieldList);
  end else if nType = dmBase.TypeObj_ZAGS_AddDok then begin
    LoadAddDokZAGS(FindFieldList);
  end;
end;

function NameFileOpisFilter( nType : Integer ) : String;
begin
  {$IFDEF OCHERED}
    if dmBase.OblBASE
      then Result:=GlobalTask.PathService+'OpisFilterOchObl'+IntToStr(nType)+'.ini'
      else Result:=GlobalTask.PathService+'OpisFilterOch'+IntToStr(nType)+'.ini';
  {$ELSE}
    Result:=GlobalTask.PathService+'OpisFilter'+IntToStr(nType)+'.ini';
  {$ENDIF}
end;

//---------------------------------------------
procedure DropFileOpisFilter;
var
  sr : TSearchRec;
  FileAttrs : Integer;
begin
 FileAttrs := faArchive + faAnyFile;
 if FindFirst(GlobalTask.PathService+'OpisFilter*.ini', FileAttrs, sr) = 0 then begin
   DeleteFile(GlobalTask.PathService+sr.Name);
   while FindNext(sr) = 0 do begin
     DeleteFile(GlobalTask.PathService+sr.Name);
   end;
   FindClose(sr);
 end;
end;

end.
