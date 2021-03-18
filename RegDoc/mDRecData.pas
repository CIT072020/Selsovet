unit mDRecData;
interface
{$I Task.inc}

uses
   Classes, Forms, SysUtils, IniFiles, DB, TypInfo, kbmMemTable,
   kbmMemCSVStreamFormat, mDRecInt, mAdsObj, mDoc2Sel, mFindInt,
   uProjectAll;

type
   //в классе реализованы методы чтения метаинформации
   TDBItemLoader=class(TObject)
   private
      //флаг - открыт/закрыт
      FIsOpen: Boolean;
      //формат чтения/записи
      FLoadFormat: TkbmCSVStreamFormat;
      //таблицы
      FdsTable: TkbmMemTable;
      FdsoTable: TDataSource;
      //поля
      FdsField: TkbmMemTable;
      FdsoField: TDataSource;
      //операции поиска
      FdsFindOper: TkbmMemTable;
      FdsoFindOper: TDataSource;
   public
      //создать/удалить
      constructor Create;
      destructor Destroy; override;
      //открыть/закрыть
      procedure Open;
      procedure Close;
      //прочитать/сохранить
      function LoadFromIni(IniFileName: string): Boolean;
      function SaveToIni(IniFileName: string): Boolean;
      //заполнить список полей
      function FillFieldList(TableName: string; FieldList: TFieldList): Boolean;
      //инициализация настроек просмотра таблиц
      function InitTableView(TableName: string; TableView: TTableView): Boolean;
      //заполнить список операций поиска
      function FillFindOperList(OperList: TOperList): Boolean;
   public
      //таблицы
      property dsTable: TkbmMemTable read FdsTable;
      property dsoTable: TDataSource read FdsoTable;
      //поля
      property dsField: TkbmMemTable read FdsField;
      property dsoField: TDataSource read FdsoField;
      //поиск
      property dsFindOper: TkbmMemTable read FdsFindOper;
      property dsoFindOper: TDataSource read FdsoFindOper;
   end;

// NB: !!! переделать все в едином стиле (справочники, перечислимые типы) !!!
procedure CreateDocRecordInterface(DocRecord: TDocRecordInterface);

implementation

procedure CreateDocRecordInterface(DocRecord: TDocRecordInterface);
var
   EnumList: TEnumList;
   Enum: TEnumItem;
   SprList: TDBItemList;
   Spr: TDBItem;
   DocList: TDBItemList;
   DocItem: TDBItem;
   DocLink: TDBItem;
   DocWork: TDBItem;
   DocFile: TDBItem;
   Loader: TDBItemLoader;
   VisitItem: TDBItem;
   TableView: TTableView;
   InfoItem: TDBItem;
   Doc: TDBItem;

   procedure AddDocFile(Doc: TDBItem);
   var
      DocFile: TDBItem;
   begin
      DocFile:=Doc.DetailList.AddItem('DOC_FILE', 'DocFile', 'f', 'Прикрепленные файлы', 'Прикрепленные файлы', 'Список прикрепленных к документу файлов', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'FILE_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocFile.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;FILE_ID', [isPrimary, isUnique]);
      DocFile.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_FILE', DocFile.FieldList);
      // инициализация вида <по умолчанию>
      DocFile.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_FILE', DocFile.TableView);
      DocFile.TableView.IncludeStyle(tsMultiTitle);
   end;

   procedure AddDocWork(Doc: TDBItem);
   var
      DocWork: TDBItem;
   begin
      DocWork:=Doc.DetailList.AddItem('DOC_WORK', 'DocWork', 'w', 'Ход рассмотрения', 'Ход рассмотрения документа', 'Ход рассмотрения документа', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'WORK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocWork.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;WORK_ID', [isPrimary, isUnique]);
      DocWork.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_WORK', DocWork.FieldList);
      // инициализация вида <по умолчанию>
      DocWork.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_WORK', DocWork.TableView);
      DocWork.TableView.IncludeStyle(tsMultiTitle);
   end;

   procedure AddDocLink(Doc: TDBItem);
   var
      DocLink: TDBItem;
   begin
      DocLink:=Doc.DetailList.AddItem('DOC_LINK', 'DocLink', 'l', 'Связи', 'Связи между документами', 'Cписок связей с другими документами', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'LINK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocLink.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;LINK_ID', [isPrimary, isUnique]);
      DocLink.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_LINK', DocLink.FieldList);
      // инициализация вида <по умолчанию>
      DocLink.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_LINK', DocLink.TableView);
      DocLink.TableView.IncludeStyle(tsMultiTitle);
      DocLink.TableView.IncludeStyle(tsReadOnly);
   end;

begin
   SprList:=DocRecord.SprDBItems;
   DocList:=DocRecord.DocDBItems;
   EnumList:=DocRecord.EnumList;
   //===========================================================================
   //ПЕРЕЧИСЛИМЫЕ ТИПЫ:
   //===========================================================================
   Enum:=EnumList.AddItem('DOC_TYPE', 'Тип документа', '', '');
   Enum.Add(dtPetition, 'обращения граждан');
   Enum.Add(dtInfo, 'справки');
   Enum.Add(gtIncoming, 'входящие документы');
   Enum.Add(gtOutgoing, 'исходящие документы');
   Enum.Add(gtAdmProc, 'административные процедуры');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('GROUP_KIND', 'Группа документов', 'Базовая группа, определяющая вид карточки', '');
   Enum.Add(gkIncoming, 'входящие');
   Enum.Add(gkOutgoing, 'исходяшие');
   //--Enum.Add(gkInternal, 'внутренние');
   Enum.Add(gkPetition, 'обращения граждан');
   Enum.Add(gkAdmProc, 'административные процедуры');
   Enum.Add(gkInfo, 'справки');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('APP_FORM', 'Форма поступления обращения', '', '');
   Enum.Add(stWriting, 'письменно');
   Enum.Add(stVerbal, 'устно');
   Enum.Add(stElect, 'электронное');  //  20.10.2016 vadim
   //--Enum.Add(stVisit, 'с личного приема');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('APP_KIND', 'Вид обращеня', '', '');
   Enum.Add(dcProposal, 'предложение');
   Enum.Add(dcClaim, 'заявление');
   Enum.Add(dcComplaint, 'жалоба');
   Enum.Add(dcConsultant, 'консультация');
   // для административных процедур
   Enum:=EnumList.AddItem('APP_KIND1', 'Вид обращения', '', '');
   //Enum.Add(dcProposal, 'предложение');
   Enum.Add(dcClaim, 'заявление');
   Enum.Add(dcComplaint, 'жалоба');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('SIGN_TYPE', 'Вид подписи', '', '');
   Enum.Add(stIndividual, 'индивидуальное');
   //--Enum.Add(skUL, 'индивидуальное: ЮЛ');
   //--Enum.Add(skIP, 'индивидуальное: ИП');
   Enum.Add(stGroup, 'коллективное');
   //--Enum.Add(stGroup30, '30 и более граждан');
   Enum.Add(stAnonym, 'анонимное');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('COVER_TYPE', 'Вид сопроводительного письма', '', '');
   Enum.Add(ctCover, 'письмо');
   Enum.Add(ctJob, 'поручение');
   Enum.Add(ctDirect, 'предписание');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('CORR_TYPE', 'Тип корреспондента сопроводительного письма', '', '');
   Enum.Add(tcHigh, 'вышестоящий орган'); //вышестоящий государственный орган
   Enum.Add(tcMedia, 'СМИ');
   Enum.Add(tcOther, 'прочие');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('ANS_KIND', 'Вид принятого решения', '', '');
   Enum.Add(rtSatisfy, 'удовлетворено');  // 1
   Enum.Add(rtRefuse, 'отказано');        // 2
   Enum.Add(rtExplain, 'разъяснено');     // 3
   Enum.Add(rtReturn, 'возвращено');      // 4
//   Enum.Add(rtPerform, 'осуществлена АП');  5
   Enum.Add(6, 'рассмотрено по существу');     //+ vadim 12.02.2019
   Enum.Add(7, 'оставлено без рассмотрения по существу');   //+ 
   Enum.Add(8, 'направлено по компетенции');   //+ 
   Enum.Add(9, 'переписка прекращена');        //+
   Enum.Add(10,'принято к сведению');          //+
   Enum.Add(11,'списано в дело без рассмотрения'); //+

   // для административных процедур
   Enum:=EnumList.AddItem('ANS_KIND1', 'Вид принятого решения', '', '');
   Enum.Add(rtSatisfy, 'удовлетворено');
   Enum.Add(rtRefuse, 'отказано');
   Enum.Add(rtExplain, 'разъяснено');
   Enum.Add(rtReturn, 'возвращено');
   Enum.Add(rtPerform, 'осуществлена АП');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('LINK_TYPE', 'Типы связей между документами', '', '');
   Enum.Add(ltRepeat, 'предыдущее -> повторное');
   Enum.Add(ltFirst, 'первое -> повторное');
   //Enum.Add(ltAnswer, 'вопрос/ответ');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('LINK_KIND', 'Вид связи', 'Вид связи между документами', '');
   Enum.Add(IntToStr(lkDirect), 'прямая');
   Enum.Add(IntToStr(lkBack), 'обратная');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('LOGICAL', 'Логическое значение (да/нет)', '', '');
   Enum.Add(lYes, 'да');
   Enum.Add(lNo, 'нет');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('STATUS', 'Статус документа (изменен)', '', '');
   Enum.Add(cdIzm, 'изменен');
//   Enum.Add(lNo, 'нет');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('CHECK', 'Контроль сроков исполнения', 'Контроль сроков исполнения', '');
   Enum.Add(chNo, 'нет');
   Enum.Add(chYes, 'да');
   Enum.Add(chOk, 'снят');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('SIGN_KIND', 'Вид заявителя', 'Вид заявителя', '');
   Enum.Add(skMan, 'гражданин');
   Enum.Add(skUL, 'юридическое лицо');
   Enum.Add(skIP, 'индивидуальный предприниматель');
   //для административных процедур
   Enum:=EnumList.AddItem('SIGN_KIND1', 'Вид заявителя', 'Вид заявителя', '');
   Enum.Add(skMan, 'гражданин');
   Enum.Add(skUL, 'юридическое лицо');
   //Enum.Add(skIP, 'индивидуальный предприниматель');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('STORE_KIND', 'Способ хранения файлов', 'Способ хранения файлов', '');
   Enum.Add(stOnlyLink, 'только ссылка на файл');
   Enum.Add(stInFolder, 'в специальной папке');
   {+}//--Enum.Add(stInBase, 'в базе данных');
   //---------------------------------------------------------------------------
   {Enum:=}EnumList.AddItem('PROV_TYPE', 'Типы документов', 'Типы документов, удостоверяющих личность', '');
   // автоматически заполняется при открытии базы
   // на основании системного справочника SprTypeDok
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('DELIV_KIND', 'Способы доставки', 'Способы доставки документа', '');
   Enum.Add(dkPost, 'почта');
   Enum.Add(dkFax, 'факс');
   Enum.Add(dkMailgov, 'mailgov');
   Enum.Add(dkSMDO, 'СМДО');
   Enum.Add(dkEmail, 'email');
   Enum.Add(dkTelegram, 'телеграф');
   Enum.Add(dkNone, 'другой');
   // для административных процедур
   Enum:=EnumList.AddItem('DELIV_KIND1', 'Способы доставки', 'Способы доставки документа', '');
   Enum.Add(dkPerson, 'выдано лично');
   Enum.Add(dkPost, 'по почте');
   Enum.Add(dkEmail, 'по электронной почте');
   Enum.Add(dkCourier, 'нарочным (курьером)');
   Enum.Add(dkNone, 'другой способ');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('DOC_KIND', 'Виды документов', 'Виды документов', '');
   Enum.Add(dk9, 'Акт');
   Enum.Add(21,  'Административная процедура');  // !!!
   Enum.Add(38,  'Апелляционная жалоба');
   Enum.Add(39,  'График');
   Enum.Add(56,  'Декрет Президента Республики Беларусь');
   Enum.Add(dk19,'Договор');
   Enum.Add(dk10,'Докладная записка');
   Enum.Add(23,  'Должностная инструкция');
   Enum.Add(41,  'Дополнительные материалы');
   Enum.Add(dk12,'Запрос'); 
   Enum.Add(dk20,'Заявление');
   Enum.Add(42,  'Заявка');
   Enum.Add(43,  'Заявка на получение данных таможенной статистики внешней торговли');
   Enum.Add(44,  'Заявление о включении в реестр');
   Enum.Add(45,  'Заявление о возврате (зачете) сумм авансовых платежей');
   Enum.Add(46,  'Заявление об удостоверении формы внешнего представления');
   Enum.Add(dk18,'Извещение');       // !!!
   Enum.Add(47,  'Исковое заявление');
   Enum.Add(24,  'Инструкция');
   Enum.Add(dk14,'Информация');      // !!!
   Enum.Add(48,  'Кассационная жалоба');
   Enum.Add(28,  'Обращения граждан и юридических лиц');
   Enum.Add(40,  'Отзыв на апелляционную жалобу');
   Enum.Add(49,  'Отчет');
   Enum.Add(29,  'Объяснительная записка');
   Enum.Add(50,  'Переписка по обращениям граждан');
   Enum.Add(dk6, 'Письмо');
   Enum.Add(32,  'План');
   Enum.Add(33,  'Положение');
   Enum.Add(dk7, 'Поручение');
   Enum.Add(dk2, 'Постановление');
   Enum.Add(34,  'Правила');
   Enum.Add(dk16,'Представление');
   Enum.Add(51,  'Претензия');
   Enum.Add(dk1, 'Приказ');
   Enum.Add(dk5, 'Протокол');
   Enum.Add(58,  'Рапорт');
   Enum.Add(dk3, 'Распоряжение');
   Enum.Add(dk4, 'Решение');
   Enum.Add(35,  'Служебная записка');  // !!!
   Enum.Add(dk11,'Справка');
   Enum.Add(52,  'Структура и штатная численность');
   Enum.Add(36,  'Телеграмма');
   Enum.Add(dk13,'Характеристика');    // !!!
   Enum.Add(dk17,'Ходатайство');  
   Enum.Add(53,  'Уведомление');
   Enum.Add(dk15,'Указ Президента Республики Беларусь');
   Enum.Add(dk8, 'Указание');
   Enum.Add(54,  'Устав');
   Enum.Add(55,  'Штатное расписание');
   Enum.Add(dk99, 'другой');
// max=58
//   Enum.Add(26, 'личный прием');
//   Enum.Add(37, 'факс');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('PROC_RES', 'Вид результат административной процедуры', 'Вид результат административной процедуры', '');
   Enum.Add(prInfo, 'выдача справки');
   Enum.Add(prDecision, 'принятие решения');
   Enum.Add(prNone, 'другое');
   //---------------------------------------------------------------------------
//   Enum:=EnumList.AddItem('', '', '', '');
//   Enum.Add(, '');
   //===========================================================================
   //СПРАВОЧНИКИ:
   //===========================================================================
   Spr:=SprList.AddItem('SP_FOLDER', 'SprDocFolder', 'sp', 'Папки', 'Папки документов', 'Рабочие папки, в которые пользователь может помещать документы', 'N_ORDER', '', 'ID', 'SHORT', 'ID', [bsSpr, bsPickList, bsOrder]);
   Spr.ExcludeStyle(bsConfirmSave);
   //--Spr.OrderFieldName:='N_ORDER';
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'N_ORDER', [isOrder]);
   Spr.FieldList.AddItem('ID', 'ID', '', 'Идентификатор', 'Идентификатор папки', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок папок', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Полное наименование папки', '', '', '', 3, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('SHORT', 'SHORT', '', 'Сокращение', 'Краткое наименование папки', '', '', '', 4, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', 'Примечание', '', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_USER', 'IS_USER', '', 'Папка пользователя', 'Признак папки пользователя', '', '', 'LOGICAL', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsReadOnly, fsNotNull], lsLinkEnum, ssPickList, dkNumber);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,N_ORDER', True);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(250);
   Spr.TableView.ByFieldName('SHORT').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('NOTE').Width:=UpdatePerInch(250);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_CORR', 'СпрМестРаботы', 'sp', 'Корреспонденты', 'Корреспонденты', '', 'NAME_KEY', '', 'ID', 'NAME', 'ID', [bsSpr]);
   Spr.IndexList.AddItem('NAME_KEY', 'NAME_KEY', 'NAME', [isOrder]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.TableFilter:='IS_KORR=True';
   Spr.FieldList.AddItem('ID', 'ID', '', 'Идентификатор', 'Идентификатор папки', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Краткое наименование корреспондента', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FNAME', 'FNAME', '', 'Полное наименование', 'Полное наименование корреспондента', '', '', '', 3, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('CORR_TYPE', 'CORR_TYPE', '', 'Тип корреспондента', 'Тип корреспондента сопроводительного письма', '', '', 'CORR_TYPE', 4, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('TELEFON', 'TELEFON', '', 'Телефон', 'Телефон', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DIRECTOR', 'DIRECTOR', '', 'Руководитель', 'Руководитель', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('ADR_TEXT', 'ADR_TEXT', '', 'Адрес', 'Адрес корреспондента', '', '', '', 7, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(250);
   Spr.TableView.ByFieldName('FNAME').Width:=UpdatePerInch(250);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_OFFICIAL', 'SprDocOfficial', 'sp', 'Должностные лица', 'Должностные лица', '', 'N_ORDER', '', 'ID', 'NAME', 'ID', [bsSpr, bsPickList, bsOrder, bsClearFilter]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'N_ORDER', [isOrder]);
//   Spr.TableFilter:='IS_ACTUAL=True'; !!!
   Spr.TableFilter:='';
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор должностного лица', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок просмотра', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkNumber);
   {$IF Defined(ZAGS) or Defined(OPEKA) }
     Spr.FieldList.AddItem('POST', 'POST', '', 'Должность', 'Должность', '', '', '', 3, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('POST_B', 'POST_B', '', 'Должность (бел.)', 'Должность (бел.)', '', '', '', 4, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIO', 'FIO', '', 'Ф.И.О.', 'Ф.И.О. должностного лица', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIO_B', 'FIO_B', '', 'Ф.И.О.(бел.)', 'Ф.И.О. должностного лица (бел.)', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIOF', 'FIOF', '', 'Фамилия Имя Отчество', 'Фамилия Имя Отчество', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('NAME', 'NAME', '', 'Должностное лицо - должность', 'Должностное лицо - должность', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   {$ELSE}
     Spr.FieldList.AddItem('FIO', 'FIO', '', 'Ф.И.О.', 'Ф.И.О. должностного лица', '', '', '', 3, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIOF', 'FIOF', '', 'Фамилия Имя Отчество', 'Фамилия Имя Отчество', '', '', '', 4, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('POST', 'POST', '', 'Должность', 'Должность', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('NAME', 'NAME', '', 'Должностное лицо - должность', 'Должностное лицо - должность', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     {$IFDEF LAIS}
       Spr.FieldList.AddItem('IS_CHIEF', 'IS_CHIEF', '', 'Председатель', 'Председатель', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
     {$ELSE}
       Spr.FieldList.AddItem('IS_CHIEF', 'IS_CHIEF', '', 'Начальник', 'Начальник', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
     {$ENDIF}
     Spr.FieldList.AddItem('IS_SPEC', 'IS_SPEC', '', 'Специалист', 'Специалист', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
   {$IFEND}
   Spr.FieldList.AddItem('IS_ACTUAL', 'IS_ACTUAL', '', 'Актуальная запись', 'Актуальная запись', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
   Spr.FieldList.AddItem('TELEFON', 'TELEFON', '', 'Телефон', 'Рабочий телефон', '', '', '', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('TEL_MOB', 'TEL_MOB', '', 'Моб. телефон', 'Мобильный телефон', '', '', '', 11, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,N_ORDER', True);
   {$IFDEF ZAGS}
     Spr.TableView.ByFieldName('FIO_B').Width:=UpdatePerInch(150);
     Spr.TableView.ByFieldName('POST_B').Width:=UpdatePerInch(250);
   {$ELSE}
     Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(250);
   {$ENDIF}
   Spr.TableView.ByFieldName('FIO').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('FIOF').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('POST').Width:=UpdatePerInch(250);
   Spr.TableView.ByFieldName('TELEFON').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('TEL_MOB').Width:=UpdatePerInch(150);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_FILELIST', 'SprDocFileList', 'sp', 'Номенклатура дел', 'Номенклатура дел', '', 'CODE', '', 'ID', 'NAME', 'ID', [bsSpr, {тест}bsTree]);
   Spr.ExcludeStyle(bsConfirmSave);
   {тест}Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   {тест}Spr.IndexList.AddItem('CODE', 'CODE', 'FILE_IND', []);
   Spr.TableFilterCh:='empty(date_end)';
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор дела', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Идентификатор родительского дела (если 0, то нет родителя)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Признак конечного узла (листа дерева), т.е. значения дела, которые могут быть присвоены документам (2 - лист дерева, 1 - узел)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок тематик', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('FILE_IND', 'FILE_IND', '', 'Индекс', 'Индекс дела', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Заголовок дела', 'Заголовок дела', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('ARTICLE', 'ARTICLE', '', 'Срок хранения дела', 'Срок хранения дела и № пунктов (статей) по перечню', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', 'Примечание', 'Примечание', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DATE_BEGIN', 'DATE_BEGIN', '', 'Дата начала', 'Дата начала', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);
   Spr.FieldList.AddItem('DATE_END', 'DATE_END', '', 'Дата завершения', 'Дата завершения', '', '', '', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);

   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('FILE_IND').Width:=UpdatePerInch(50);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(450);
   Spr.TableView.ByFieldName('NAME').RowNum:=2;
   Spr.TableView.ByFieldName('ARTICLE').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('NOTE').Width:=UpdatePerInch(450);
   Spr.TableView.ByFieldName('DATE_BEGIN').Width:=UpdatePerInch(100);
   Spr.TableView.ByFieldName('DATE_END').Width:=UpdatePerInch(100);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_FILELIST2', 'SprDocFileList', 'sp', 'Заголовки дел', 'Заголовки дел', '', 'CODE', '', 'ID', 'FILE_IND', 'ID', [bsSpr]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('CODE', 'CODE', 'FILE_IND', []);
   Spr.TableFilter:=Format('IS_NODE=%d', [iLeaf]);
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор дела', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Идентификатор родительского дела (если 0, то нет родителя)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Признак конечного узла (листа дерева), т.е. значения дела, которые могут быть присвоены документам (2 - лист дерева, 1 - узел)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок тематик', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('FILE_IND', 'FILE_IND', '', 'Индекс дела', 'Индекс дела', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Заголовок дела', 'Заголовок дела', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('ARTICLE', 'ARTICLE', '', 'Срок хранения дела', 'Срок хранения дела и № пунктов (статей) по перечню', '', '', '', 7, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', 'Примечание', 'Примечание', '', '', '', 8, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DATE_BEGIN', 'DATE_BEGIN', '', 'Дата начала', 'Дата начала', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);
   Spr.FieldList.AddItem('DATE_END', 'DATE_END', '', 'Дата завершения', 'Дата завершения', '', '', '', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(300);
   Spr.TableView.ByFieldName('DATE_BEGIN').Width:=UpdatePerInch(100);
   Spr.TableView.ByFieldName('DATE_END').Width:=UpdatePerInch(100);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_SUBJ', 'SprDocSubj', 'sp', 'Тематики', 'Тематики обращений граждан', '', 'CODE', '', 'ID', 'NAME', 'ID', [bsSpr, {тест}bsTree, bsAllSelable]);
   Spr.ExcludeStyle(bsConfirmSave);
   {тест}Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   {тест}Spr.IndexList.AddItem('CODE', 'CODE', 'CODE', []);
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор тематики', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Идентификатор родительской тематики (если 0, то нет родителя)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Признак конечного узла (листа дерева), т.е. значения тематики, которые могут быть присвоены документам (2 - лист дерева, 1 - узел)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок тематик', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('CODE', 'CODE', '', 'Код', 'Код тематики', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование тематики', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('CODE').Width:=UpdatePerInch(50);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(550);
   Spr.TableView.ByFieldName('NAME').RowNum:=2;
   //-------15.08.2018 vadim --------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_SUBJG', 'SprDocSubjG', 'sp', 'Тематики', 'Тематики обращений граждан (Государственный классификатор)', '', 'CODE', '', 'ID', 'NAME', 'ID', [bsSpr, bsTree, bsAllSelable]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('CODE', 'CODE', 'CODE', []);
//   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор тематики', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор тематики', '', '', '', '', 1, [ fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Идентификатор родительской тематики (если 0, то нет родителя)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Признак конечного узла (листа дерева), т.е. значения тематики, которые могут быть присвоены документам (2 - лист дерева, 1 - узел)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок тематик', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('CODE', 'CODE', '', 'Код', 'Код тематики', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование тематики', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DATEIZM', 'DATEIZM', '', 'Дата создания', 'Дата создания', '', '', '', 7, [], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('HANDLED', 'HANDLED', '', 'Добавлено вручную', 'Добавлено вручную', '', '', '', 8, [], lsNone, ssNone, dkString);

   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
//     Spr.TableView.ExcludeOper([toAdd, toAddFolder, toDelete, toEdit]);
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('CODE').Width:=UpdatePerInch(50);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(550);
   Spr.TableView.ByFieldName('NAME').RowNum:=2;
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_MANGROUP', 'SprDocManGroup', 'sp', 'Социальные группы/категории населения', 'Социальные группы/категории населения', '', 'N_ORDER', '', 'ID', 'NAME', 'ID', [bsSpr,bsPickList,bsOrder]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'N_ORDER', [isOrder]);
   Spr.FieldList.AddItem('ID', 'ID', '', 'Идентификатор', 'Идентификатор социальной группы', '', '', '', 1, [fsServerSide, fsReadOnly, fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование социальной группы', '', '', '', 2, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок просмотра', '', '', '', 3, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,N_ORDER', True);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(250);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_PLACE', 'СпрНасПунктов', 'sp', 'Населенные пункты', 'Справочник населенных пунктов', '', '', '', 'ID', 'NAME', 'ID', [bsSpr,bsReadOnly]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.FieldList.AddItem('ID', 'ID', '', 'Идентификатор', 'Идентификатор населенного пункта', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование населенного пункта', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkString);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_DOCGROUP', 'SprDocGroup', 'sp', 'Группы документов', 'Группы документов', '', 'N_ORDER', '', 'ID', 'NAME', 'ID', [bsSpr, bsPickList, bsOrder, bsTree]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.ShortFieldName:='SHORT';
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'PARENT_ID;N_ORDER', [isOrder]);
   //-
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор группы', '', '', '', '', 1, [fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Идентификатор родительской группы (если 0, то нет родителя)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Признак конечного узла (листа дерева), т.е. значения групп, которые могут быть присвоены документам (2 - лист дерева, 1 - узел)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', 'Порядок', 'Порядок групп', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Полное наименование', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('SHORT', 'SHORT', '', 'Сокращение', 'Краткое наименование', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('KIND', 'KIND', '', 'Вид РКК', 'Базовая группа документовгрупп', '', '', 'GROUP_KIND', 7, [fsViewVisible, fsFindVisible, fsEditVisible, fsReadOnly, fsNotForFolder, fsNotNull], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', 'Примечание', '', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IND', 'IND', '', 'Формула для индекса', '', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   //-
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(350);
   Spr.TableView.ByFieldName('SHORT').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('KIND').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('NOTE').Width:=UpdatePerInch(350);
   //-
   TableView:=Spr.TableView.Clone;
   TableView.Name:=CSprSelectTableView;
   Spr.ViewList.Add(TableView);
   TableView.ExcludeByFieldName('SHORT,NOTE,KIND', True);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_ADMPROC', 'SprDocAdmProc', 'sp', 'Административные процедуры для граждан', 'Перечень административных процедур для граждан', '', 'HI_CODE', '', 'ID', 'NAME', 'ID', [bsSpr, bsTree, bsClearFilter]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.TableFilter:=Format('IS_SELECT=%d', [lYes]);
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор процедуры', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Ссылка на родительскую запись в дереве', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Запись является узлом дерева', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', 'Уровень в иерархии', 'Уровень в иерархии', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', 'Номер', 'Номер процедуры', '', '', '', 5, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование административной процедуры', '', '', '', 6, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', 'Показывать', 'Показывать при выборе из справочника', '', '', 'LOGICAL', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', 'Код', 'Иерархический код', '', '', '', 8, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', 'Полное наименование', 'Полное наименование административной процедуры', '', '', '', 9, [fsViewVisible, {fsFindVisible,} fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', 'Запрос', 'Может быть выполнен запрос в другие органы', '', '', 'LOGICAL', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', 'Результат', 'Вид результата административной процедуры', '', '', 'PROC_RES', 11, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', 'Дата исключения', 'Дата исключения административной процедуры', '', '', '', 12, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkDate);

   Spr.TableView.SetDefaultColView;
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,HI_LEVEL,HI_CODE', True);
   Spr.TableView.IncludeStyle([tsMultiTitle]);
   Spr.TableView.ExcludeOper([toAdd, toAddFolder, toDelete]);
   Spr.TableView.ByFieldName('PROC_NO').Width:=UpdatePerInch(50);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(500);
   Spr.TableView.ByFieldName('IS_SELECT').Width:=UpdatePerInch(70);
   Spr.TableView.ByFieldName('HI_CODE').Width:=UpdatePerInch(60);
   Spr.TableView.ByFieldName('FULL_NAME').Width:=UpdatePerInch(450);
   TableView:=Spr.TableView.Clone;
   TableView.Name:=CSprSelectTableView;
   Spr.ViewList.Add(TableView);
   TableView.ExcludeByFieldName('IS_SELECT,HI_CODE,NEED_REQ,PROC_RES', True);
   TableView:=Spr.TableView.Clone;
   TableView.Name:=CSprEditTableView;
   Spr.ViewList.Add(TableView);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_ADMPROC2', 'SprDocAdmProc', 'sp', 'Административные процедуры для граждан', 'Перечень административных процедур для граждан', '', 'HI_CODE', '', 'ID', 'FULL_NAME', 'ID', [bsSpr, bsReadOnly, bsPickList]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.PickFieldNames:='PROC_NO,FULL_NAME';
   Spr.TableFilter:=Format('IS_SELECT=%d AND IS_NODE=%d', [lYes, iLeaf]);
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор процедуры', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Ссылка на родительскую запись в дереве', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Запись является узлом дерева', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', 'Уровень в иерархии', 'Уровень в иерархии', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', 'Номер', 'Номер процедуры', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование административной процедуры', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', 'Показывать', 'Показывать при выборе из справочника', '', '', 'LOGICAL', 7, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', 'Код', 'Иерархический код', '', '', '', 8, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', 'Полное наименование', 'Полное наименование административной процедуры', '', '', '', 9, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', 'Запрос', 'Может быть выполнен запрос в другие органы', '', '', 'LOGICAL', 10, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', 'Результат', 'Вид результата административной процедуры', '', '', 'PROC_RES', 11, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', 'Дата исключения', 'Дата исключения административной процедуры', '', '', '', 12, [fsViewVisible], lsNone, ssNone, dkDate);

   //---------------------------------------------------------------------------
   {+}
   Spr:=SprList.AddItem('SP_ADMPROC_U', 'SprDocAdmProcU', 'sp', 'Административные процедуры для организаций', 'Перечень административных процедур для организаций', '', 'HI_CODE', '', 'ID', 'NAME', 'ID', [bsSpr, bsTree, bsClearFilter]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.TableFilter:=Format('IS_SELECT=%d', [lYes]);
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор процедуры', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Ссылка на родительскую запись в дереве', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Запись является узлом дерева', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', 'Уровень в иерархии', 'Уровень в иерархии', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', 'Номер', 'Номер процедуры', '', '', '', 5, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование административной процедуры', '', '', '', 6, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', 'Показывать', 'Показывать при выборе из справочника', '', '', 'LOGICAL', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', 'Код', 'Иерархический код', '', '', '', 8, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', 'Полное наименование', 'Полное наименование административной процедуры', '', '', '', 9, [fsViewVisible, {fsFindVisible,} fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', 'Запрос', 'Может быть выполнен запрос в другие органы', '', '', 'LOGICAL', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', 'Результат', 'Вид результата административной процедуры', '', '', 'PROC_RES', 11, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', 'Дата исключения', 'Дата исключения административной процедуры', '', '', '', 12, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkDate);

   Spr.TableView.SetDefaultColView;
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,HI_LEVEL,HI_CODE', True);
   Spr.TableView.IncludeStyle([tsMultiTitle]);
   Spr.TableView.ExcludeOper([toAdd, toAddFolder, toDelete]);
   Spr.TableView.ByFieldName('PROC_NO').Width:=UpdatePerInch(50);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(500);
   Spr.TableView.ByFieldName('IS_SELECT').Width:=UpdatePerInch(70);
   Spr.TableView.ByFieldName('HI_CODE').Width:=UpdatePerInch(60);
   Spr.TableView.ByFieldName('FULL_NAME').Width:=UpdatePerInch(450);
   TableView:=Spr.TableView.Clone;
   TableView.Name:=CSprSelectTableView;
   Spr.ViewList.Add(TableView);
   TableView.ExcludeByFieldName('IS_SELECT,HI_CODE,NEED_REQ,PROC_RES', True);
   TableView:=Spr.TableView.Clone;
   TableView.Name:=CSprEditTableView;
   Spr.ViewList.Add(TableView);
   //---------------------------------------------------------------------------
   {+}
   Spr:=SprList.AddItem('SP_ADMPROC_U2', 'SprDocAdmProcU', 'sp', 'Административные процедуры для организаций', 'Перечень административных процедур для организаций', '', 'HI_CODE', '', 'ID', 'FULL_NAME', 'ID', [bsSpr, bsReadOnly, bsPickList]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.PickFieldNames:='PROC_NO,FULL_NAME';
   Spr.TableFilter:=Format('IS_SELECT=%d AND IS_NODE=%d', [lYes, iLeaf]);
   Spr.FieldList.AddItem('ID', 'ID', 'Идентификатор', 'Идентификатор процедуры', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', 'Родитель', 'Ссылка на родительскую запись в дереве', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', 'Признак узла', 'Запись является узлом дерева', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', 'Уровень в иерархии', 'Уровень в иерархии', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', 'Номер', 'Номер процедуры', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', 'Наименование', 'Наименование административной процедуры', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', 'Показывать', 'Показывать при выборе из справочника', '', '', 'LOGICAL', 7, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', 'Код', 'Иерархический код', '', '', '', 8, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', 'Полное наименование', 'Полное наименование административной процедуры', '', '', '', 9, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', 'Запрос', 'Может быть выполнен запрос в другие органы', '', '', 'LOGICAL', 10, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', 'Результат', 'Вид результата административной процедуры', '', '', 'PROC_RES', 11, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', 'Дата исключения', 'Дата исключения административной процедуры', '', '', '', 12, [fsViewVisible], lsNone, ssNone, dkDate);

   //---------------------------------------------------------------------------
   Loader:=TDBItemLoader.Create;
   try
      Loader.LoadFromIni(Doc2Sel.GetMetaFileName);
      //========================================================================
      //ДОКУМЕНТЫ:
      //========================================================================
      DocItem:=DocList.AddItem('DOC_MAIN', 'DocMain', 'd', 'Документы', 'Зарегистрированные обращения', 'Зарегистрированные обращения', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
//      DocItem.on
      Loader.FillFieldList('DOC_MAIN', DocItem.FieldList);
      //NB: ??? - DocItem.FieldList.ByName('EXEC_TERM').SelectText:='isnull(ext_term, exec_term) as exec_term';
      //--DocItem.FieldList.ByName('REG_DATE').OrderBy:=1;
      //--DocItem.FieldList.ByName('REG_NUM').OrderBy:=2;
      DocItem.SQLOrder:='d.REG_DATE desc, d.REG_NUM desc';
      {++}DocItem.SQLWhere:=Format('d.DOC_TYPE=%d', [dtPetition]);
      // инициализация вида <по умолчанию>
      DocItem.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_MAIN', DocItem.TableView);
      DocItem.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsTopInfo, tsSysFilter, tsShowInfoWin]);
      //NB: !!! заменить условие на between две даты - что бы индекс использовался
      DocItem.SysFilter.Add('year(d.REG_DATE)=year(curdate())');
      DocItem.SysFilter.Add('d.EXEC_FACT is null');
      //NB: !!! по-другому сделать - через метаинформацию
      DocItem.TableView.ExcludeByFieldName('REQ_CHECK,FROM_VISIT,TEL_LINE,ADR_TEXT,LOOKUP_SUBJ_ID,IN_DATE,LOOKUP_SIGN_PLACE,IS_REPEAT,LOOKUP_COVER_CORR,COVER_DATE,COVER_IND,LOOKUP_EXEC_ORG,EXEC_DATE', False);
      //------------------------------------------------------------------------
      //{старое}DocLink:=DocItem.DetailList.AddItem('DOC_LINK', 'DocLink', 'l', 'Связи', 'Связи между документами', 'Cписок связей с другими документами', 'PR_KEY', 'DOC_ID', 'DOC_ID,LINK_ID', '', 'LINK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocLink:=DocItem.DetailList.AddItem('DOC_LINK', 'DocLink', 'l', 'Связи', 'Связи между документами', 'Cписок связей с другими документами', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'LINK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocLink.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;LINK_ID', [isPrimary, isUnique]);
      {++}DocLink.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_LINK', DocLink.FieldList);
      // инициализация вида <по умолчанию>
      DocLink.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_LINK', DocLink.TableView);
      DocLink.TableView.IncludeStyle(tsMultiTitle);
      {++}DocLink.TableView.IncludeStyle(tsReadOnly);
      AddDocFile(DocItem);

      //------------------------------------------------------------------------
      //{старое}DocWork:=DocItem.DetailList.AddItem('DOC_WORK', 'DocWork', 'w', 'Ход рассмотрения', 'Ход рассмотрения документа', 'Ход рассмотрения документа', 'IND_KEY', 'DOC_ID', 'DOC_ID,WORK_ID', '', 'WORK_ID', [bsDetail, bsFindVisible]);
      DocWork:=DocItem.DetailList.AddItem('DOC_WORK', 'DocWork', 'w', 'Ход рассмотрения', 'Ход рассмотрения документа', 'Ход рассмотрения документа', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'WORK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocWork.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;WORK_ID', [isPrimary, isUnique]);
      {++}DocWork.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_WORK', DocWork.FieldList);
      // инициализация вида <по умолчанию>
      DocWork.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_WORK', DocWork.TableView);
      DocWork.TableView.IncludeStyle(tsMultiTitle);
      //------------------------------------------------------------------------
      //? Журнал регистрации личного приема граждан
      VisitItem:=DocList.AddItem('VISIT_BOOK', 'DocMain', 'v', 'Журнал', 'Журнал учета личного приема граждан', 'Журнал учета личного приема граждан', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('VISIT_BOOK', VisitItem.FieldList);
      VisitItem.SQLOrder:='v.VISIT_PLAN desc, v.VISIT_NUM desc';
      //--VisitItem.SQLWhere:=Format('v.APP_FORM in (%d, %d) and v.VISIT_NUM is not null and v.VISIT_NUM>0', [stVisit, stVerbal]);
      VisitItem.SQLWhere:=Format('v.APP_FORM=%d and v.VISIT_NUM is not null and v.VISIT_NUM>0', [{--stVisit,} stVerbal]);
      // инициализация вида <по умолчанию>
      VisitItem.TableView.SetDefaultColView;
      Loader.InitTableView('VISIT_BOOK', VisitItem.TableView);
      VisitItem.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      //NB: !!! по-другому сделать - через метаинформацию
      VisitItem.TableView.ExcludeByFieldName('VISIT_PLAN,LOOKUP_SIGN_PLACE,ADR_PHONE,ADR_NOTE,EXEC_FACT', False);
      //NB: !!! заменить условие на between две даты - что бы индекс использовался
      VisitItem.SysFilter.Add('year(v.VISIT_PLAN)=year(curdate())');
      //------------------------------------------------------------------------
      // Журнал учета выданных справок и (или) других документов, выдаваемых гражданам
      InfoItem:=DocList.AddItem('INFO_BOOK', 'DocMain', 'i', 'Справки', 'Журнал учета выданных справок (документов)', 'Журнал учета выданных справок и (или) других документов, выдаваемых гражданам', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('INFO_BOOK', InfoItem.FieldList);
      InfoItem.SQLOrder:='i.REG_DATE desc, i.REG_NUM desc';
      InfoItem.SQLWhere:=Format('i.DOC_TYPE=%d', [dtInfo]);
      // инициализация вида <по умолчанию>
      InfoItem.TableView.SetDefaultColView;
      Loader.InitTableView('INFO_BOOK', InfoItem.TableView);
      InfoItem.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      InfoItem.SysFilter.Add('year(i.REG_DATE)=year(curdate())');
      //NB: !!! по-другому сделать - через метаинформацию
      //VisitItem.TableView.ExcludeByFieldName('VISIT_PLAN,LOOKUP_SIGN_PLACE,ADR_PHONE,ADR_NOTE,EXEC_FACT', False);
      //DocItem.TableView.ExcludeByFieldName('REQ_CHECK,FROM_VISIT,ADR_TEXT,LOOKUP_SUBJ_ID,IN_DATE,LOOKUP_SIGN_PLACE,IS_REPEAT,LOOKUP_COVER_CORR,COVER_DATE,COVER_IND,LOOKUP_EXEC_ORG,EXEC_DATE', False);
      //------------------------------------------------------------------------
      DocFile:=InfoItem.DetailList.AddItem('DOC_FILE', 'DocFile', 'f', 'Прикрепленные файлы', 'Прикрепленные файлы', 'Список прикрепленных к документу файлов', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'FILE_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocFile.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;FILE_ID', [isPrimary, isUnique]);
      DocFile.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_FILE', DocFile.FieldList);
      // инициализация вида <по умолчанию>
      DocFile.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_FILE', DocFile.TableView);
      DocFile.TableView.IncludeStyle(tsMultiTitle);
      //------------------------------------------------------------------------
      // Журнал регистрации входящих документов
      Doc:=DocList.AddItem('DOC_IN', 'DocMain', 'd', 'Входящие', 'Журнал регистрации входящих документов', 'Журнал регистрации входящих документов', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('DOC_IN', Doc.FieldList);
      Doc.SQLOrder:='d.REG_DATE desc, d.REG_NUM desc';
      Doc.SQLWhere:=Format('d.DOC_TYPE=%d', [gtIncoming]);
      // инициализация вида <по умолчанию>
      Doc.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_IN', Doc.TableView);
      Doc.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      Doc.SysFilter.Add('year(d.REG_DATE)=year(curdate())');
      AddDocFile(Doc);
      //------------------------------------------------------------------------
      // Журнал регистрации исходящих документов
      Doc:=DocList.AddItem('DOC_OUT', 'DocMain', 'd', 'Исходящие', 'Журнал регистрации исходящих документов', 'Журнал регистрации исходящих документов', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('DOC_OUT', Doc.FieldList);
      Doc.SQLOrder:='d.REG_DATE desc, d.REG_NUM desc';
      Doc.SQLWhere:=Format('d.DOC_TYPE=%d', [gtOutgoing]);
      // инициализация вида <по умолчанию>
      Doc.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_OUT', Doc.TableView);
      Doc.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      Doc.SysFilter.Add('year(d.REG_DATE)=year(curdate())');
      AddDocFile(Doc);
      //------------------------------------------------------------------------
      // Журнал регистрации административных процедур
      Doc:=DocList.AddItem('ADM_PROC', 'DocMain', 'p', 'Административные процедуры', 'Журнал регистрации документов по административным процедурам', 'Журнал регистрации документов по осуществлению административных процедур', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('ADM_PROC', Doc.FieldList);
      Doc.SQLOrder:='p.REG_DATE desc, p.REG_NUM desc';
      Doc.SQLWhere:=Format('p.DOC_TYPE=%d', [gtAdmProc]);
      // инициализация вида <по умолчанию>
      Doc.TableView.SetDefaultColView;
      Loader.InitTableView('ADM_PROC', Doc.TableView);
      Doc.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter, tsShowInfoWin]);
      Doc.SysFilter.Add('year(p.REG_DATE)=year(curdate())');
      AddDocWork(Doc);
      AddDocFile(Doc);
      AddDocLink(Doc);
      {+} //долго работает вызов процедуры из словаря, поэтому заменили на событие
      //--Doc.FieldList.ByName('ADM_PROC_R').SelectText:='NameAdmProc(p.adm_proc, true)';
      Doc.FieldList.ByName('ADM_PROC_R').SelectText:='p.adm_proc';
      //========================================================================
      //ПОИСК:
      //========================================================================
      Loader.FillFindOperList(DocRecord.FindOperList);
   finally
      Loader.Free;
   end;
end;

{ TDBItemLoader }

procedure TDBItemLoader.Close;
begin
   FdsField.Close;
   FdsTable.Close;
   FdsFindOper.Close;
   FIsOpen:=False;
end;

constructor TDBItemLoader.Create;
begin
   //формат чтения/записи
   FLoadFormat:=TkbmCSVStreamFormat.Create(nil);
   FLoadFormat.CSVQuote:=#0;
   FLoadFormat.CSVFieldDelimiter:=';';
   FLoadFormat.CSVRecordDelimiter:=#0;
   //таблицы
   FdsTable:=TkbmMemTable.Create(nil);
   FdsoTable:=TDataSource.Create(nil);
   FdsoTable.DataSet:=FdsTable;
   //поля
   FdsField:=TkbmMemTable.Create(nil);
   FdsoField:=TDataSource.Create(nil);
   FdsoField.DataSet:=FdsField;
   FdsField.MasterSource:=FdsoTable;
   FdsField.MasterFields:='TABLE_ID';
   FdsField.IndexFieldNames:='TABLE_ID;ORDER';
   //операции поиска
   FdsFindOper:=TkbmMemTable.Create(nil);
   FdsoFindOper:=TDataSource.Create(nil);
   FdsoFindOper.DataSet:=FdsFindOper;
   FdsFindOper.IndexFieldNames:='ORDER';
   //закрыт
   FIsOpen:=False;
end;

destructor TDBItemLoader.Destroy;
begin
   //закрыть все
   Close;
   //поля
   FdsoField.Free;
   FdsField.Free;
   //таблицы
   FdsoTable.Free;
   FdsTable.Free;
   //операции поиска
   FdsoFindOper.Free;
   FdsFindOper.Free;
   //форма чтения/записи
   FLoadFormat.Free;
   inherited;
end;

function TDBItemLoader.FillFieldList(TableName: string; FieldList: TFieldList): Boolean;

   function GetFieldStyle(Style: string): TFieldStyle;
   var
      I: Integer;
      sl: TStringList;
   begin
      Result:=[];
      sl:=TStringList.Create;
      try
         sl.CommaText:=Style;
         for I:=0 to Pred(sl.Count) do begin
            if sl[I]<>'' then begin
               Include(Result, TFieldStyles(GetEnumValue(TypeInfo(TFieldStyles), Trim(sl[I]))));
            end;
         end;
      finally
         sl.Free;
      end;
   end;

begin
   Result:=False;
   //--Open;
   try
      if FdsTable.Locate('NAME', TableName, [loCaseInsensitive]) then begin
         FdsField.First;
         while not FdsField.Eof do begin
            FieldList.AddItem(
               FdsField.FieldByName('NAME').AsString,
               FdsField.FieldByName('FIELD_NAME').AsString,
               FdsField.FieldByName('SYNONIM').AsString,
               FdsField.FieldByName('CAPTION').AsString,
               FdsField.FieldByName('COMM').AsString,
               FdsField.FieldByName('GROUP').AsString,
               FdsField.FieldByName('SPR_NAME').AsString,
               FdsField.FieldByName('ENUM_NAME').AsString,
               FdsField.FieldByName('ORDER').AsInteger,
               GetFieldStyle(FdsField.FieldByName('STYLE').AsString),
               TValueLinkStyle(GetEnumValue(TypeInfo(TValueLinkStyle), FdsField.FieldByName('LINK_STYLE').AsString)),
               TSelectValueStyle(GetEnumValue(TypeInfo(TSelectValueStyle), FdsField.FieldByName('SEL_STYLE').AsString)),
               TFieldDataKind(GetEnumValue(TypeInfo(TFieldDataKind), FdsField.FieldByName('DATA_KIND').AsString))
            ).LookupFieldName:=FdsField.FieldByName('LOOKUP').AsString;
            FdsField.Next;
         end;
         Result:=True;
      end;
   finally
      //--Close;
   end;
end;

const
   TableSection='[TABLE]';
   FieldSection='[FIELD]';
   FindOperSection='[FIND_OPER]';

function TDBItemLoader.FillFindOperList(OperList: TOperList): Boolean;
begin
   Result:=True;
   OperList.Clear;
   FdsFindOper.First;
   while not FdsFindOper.Eof do begin
      if FdsFindOper.FieldByName('VISIBLE').AsBoolean then begin
         OperList.AddNew(
            FdsFindOper.FieldByName('NAME').AsString,
            FdsFindOper.FieldByName('CAPTION').AsString,
            FdsFindOper.FieldByName('SQL').AsString,
            FdsFindOper.FieldByName('FIELDKINDS').AsString,
            FdsFindOper.FieldByName('NEEDVALUE').AsBoolean,
            FdsFindOper.FieldByName('TWOVALUE').AsBoolean,
            FdsFindOper.FieldByName('IGNORECASE').AsBoolean,
            FdsFindOper.FieldByName('MULTISEL').AsBoolean,
            FdsFindOper.FieldByName('MULTIOR').AsBoolean,
            FdsFindOper.FieldByName('OWNVALUE').AsBoolean,
            FdsFindOper.FieldByName('OWNVALNAME').AsString,
            FdsFindOper.FieldByName('OWNVALKIND').AsString,
            FdsFindOper.FieldByName('SPRNAME').AsString
         ).Order:=FdsFindOper.FieldByName('ORDER').AsInteger;
      end;
      FdsFindOper.Next;
   end;
   OperList.Reorder;
end;

function TDBItemLoader.InitTableView(TableName: string; TableView: TTableView): Boolean;
var
   ColView: TColView;

   function GetViewStyle(Style: string): TColViewStyle;
   var
      I: Integer;
      sl: TStringList;
   begin
      Result:=[];
      sl:=TStringList.Create;
      try
         sl.CommaText:=Style;
         for I:=0 to Pred(sl.Count) do begin
            if sl[I]<>'' then begin
               Include(Result, TColViewStyles(GetEnumValue(TypeInfo(TColViewStyles), Trim(sl[I]))));
            end;
         end;
      finally
         sl.Free;
      end;
   end;

begin
   Result:=False;
   //--Open;
   try
      if FdsTable.Locate('NAME', TableName, [loCaseInsensitive]) then begin
         FdsField.First;
         while not FdsField.Eof do begin
            ColView:=TableView.ByFieldName(FdsField.FieldByName('FIELD_NAME').AsString);
            if ColView<>nil then begin
               if not FdsField.FieldByName('EXCLUDE').IsNull and FdsField.FieldByName('EXCLUDE').AsBoolean then begin
                  TableView.ExcludeByFieldName(FdsField.FieldByName('FIELD_NAME').AsString, True);
               end;
               if not FdsField.FieldByName('WIDTH').IsNull then begin
                  ColView.Width:=UpdatePerInch(FdsField.FieldByName('WIDTH').AsInteger);
               end;
               if not FdsField.FieldByName('TITLE').IsNull then begin
                  ColView.Title:=FdsField.FieldByName('TITLE').AsString;
               end;
               if not FdsField.FieldByName('EXCLUDE_STYLE').IsNull then begin
                  ColView.ExcludeStyle(GetViewStyle(FdsField.FieldByName('EXCLUDE_STYLE').AsString));
               end;
               if not FdsField.FieldByName('INCLUDE_STYLE').IsNull then begin
                  ColView.IncludeStyle(GetViewStyle(FdsField.FieldByName('INCLUDE_STYLE').AsString));
               end;
               if not FdsField.FieldByName('FIELD_MODE').IsNull then begin
                  ColView.NameFieldMode:=TNameFieldMode(GetEnumValue(TypeInfo(TNameFieldMode), FdsField.FieldByName('FIELD_MODE').AsString));
               end;
               if not FdsField.FieldByName('FIELD_KIND').IsNull then begin
                  ColView.NameFieldKind:=TNameFieldKind(GetEnumValue(TypeInfo(TNameFieldKind), FdsField.FieldByName('FIELD_KIND').AsString));
               end;
            end;
            FdsField.Next;
         end;
         Result:=True;
      end;
   finally
      //--Close;
   end;
end;

function TDBItemLoader.LoadFromIni(IniFileName: string): Boolean;
var
   sl: TStringList;
   stream: TStringStream;
   TableInd: Integer;
   FieldInd: Integer;
   FindOperInd: Integer;
begin
   Result:=False;
   if FileExists(IniFileName) then begin
      sl:=TStringList.Create;
      stream:=TStringStream.Create('');
      try
         Close;
         sl.LoadFromFile(IniFileName);
         TableInd:=Pos(TableSection, sl.Text);
         FieldInd:=Pos(FieldSection, sl.Text);
         FindOperInd:=Pos(FindOperSection, sl.Text);
         stream.WriteString(Copy(sl.Text, TableInd+Length(TableSection)+2, FieldInd-TableInd-Length(TableSection)-4));
         FdsTable.LoadFromStreamViaFormat(stream, FLoadFormat);
         stream.Size:=0;
         stream.WriteString(Copy(sl.Text, FieldInd+Length(FieldSection)+2, FindOperInd-FieldInd-Length(FieldSection)-4));
         FdsField.LoadFromStreamViaFormat(stream, FLoadFormat);
         stream.Size:=0;
         stream.WriteString(Copy(sl.Text, FindOperInd+Length(FindOperSection)+2, Length(sl.Text)-FindOperInd-Length(FindOperSection)-3));
         FdsFindOper.LoadFromStreamViaFormat(stream, FLoadFormat);
         Result:=True;
      finally
         sl.Free;
         stream.Free;
      end;
   end;
end;

procedure TDBItemLoader.Open;
begin
   if not FIsOpen then begin
      FdsTable.Open;
      FdsTable.First;
      FdsField.Open;
      FdsFindOper.Open;
      FIsOpen:=True;
   end;
end;

function TDBItemLoader.SaveToIni(IniFileName: string): Boolean;
var
   sl: TStringList;
   stream: TStringStream;
begin
   Result:=False;
   sl:=TStringList.Create;
   stream:=TStringStream.Create('');
   try
      //таблицы
      sl.Add(TableSection);
      FdsTable.SaveToStreamViaFormat(stream, FLoadFormat);
      sl.Add(stream.DataString);
      stream.Size:=0;
      //поля
      sl.Add(FieldSection);
      FdsField.SaveToStreamViaFormat(stream, FLoadFormat);
      sl.Add(stream.DataString);
      stream.Size:=0;
      //операции поиска
      sl.Add(FindOperSection);
      FdsFindOper.SaveToStreamViaFormat(stream, FLoadFormat);
      sl.Add(stream.DataString);
      stream.Size:=0;
      //сохранить всё
      sl.SaveToFile(IniFileName);
   finally
      sl.Free;
      stream.Free;
   end;
end;

end.
