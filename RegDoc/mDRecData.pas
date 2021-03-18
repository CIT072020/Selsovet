unit mDRecData;
interface
{$I Task.inc}

uses
   Classes, Forms, SysUtils, IniFiles, DB, TypInfo, kbmMemTable,
   kbmMemCSVStreamFormat, mDRecInt, mAdsObj, mDoc2Sel, mFindInt,
   uProjectAll;

type
   //� ������ ����������� ������ ������ ��������������
   TDBItemLoader=class(TObject)
   private
      //���� - ������/������
      FIsOpen: Boolean;
      //������ ������/������
      FLoadFormat: TkbmCSVStreamFormat;
      //�������
      FdsTable: TkbmMemTable;
      FdsoTable: TDataSource;
      //����
      FdsField: TkbmMemTable;
      FdsoField: TDataSource;
      //�������� ������
      FdsFindOper: TkbmMemTable;
      FdsoFindOper: TDataSource;
   public
      //�������/�������
      constructor Create;
      destructor Destroy; override;
      //�������/�������
      procedure Open;
      procedure Close;
      //���������/���������
      function LoadFromIni(IniFileName: string): Boolean;
      function SaveToIni(IniFileName: string): Boolean;
      //��������� ������ �����
      function FillFieldList(TableName: string; FieldList: TFieldList): Boolean;
      //������������� �������� ��������� ������
      function InitTableView(TableName: string; TableView: TTableView): Boolean;
      //��������� ������ �������� ������
      function FillFindOperList(OperList: TOperList): Boolean;
   public
      //�������
      property dsTable: TkbmMemTable read FdsTable;
      property dsoTable: TDataSource read FdsoTable;
      //����
      property dsField: TkbmMemTable read FdsField;
      property dsoField: TDataSource read FdsoField;
      //�����
      property dsFindOper: TkbmMemTable read FdsFindOper;
      property dsoFindOper: TDataSource read FdsoFindOper;
   end;

// NB: !!! ���������� ��� � ������ ����� (�����������, ������������ ����) !!!
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
      DocFile:=Doc.DetailList.AddItem('DOC_FILE', 'DocFile', 'f', '������������� �����', '������������� �����', '������ ������������� � ��������� ������', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'FILE_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocFile.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;FILE_ID', [isPrimary, isUnique]);
      DocFile.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_FILE', DocFile.FieldList);
      // ������������� ���� <�� ���������>
      DocFile.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_FILE', DocFile.TableView);
      DocFile.TableView.IncludeStyle(tsMultiTitle);
   end;

   procedure AddDocWork(Doc: TDBItem);
   var
      DocWork: TDBItem;
   begin
      DocWork:=Doc.DetailList.AddItem('DOC_WORK', 'DocWork', 'w', '��� ������������', '��� ������������ ���������', '��� ������������ ���������', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'WORK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocWork.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;WORK_ID', [isPrimary, isUnique]);
      DocWork.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_WORK', DocWork.FieldList);
      // ������������� ���� <�� ���������>
      DocWork.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_WORK', DocWork.TableView);
      DocWork.TableView.IncludeStyle(tsMultiTitle);
   end;

   procedure AddDocLink(Doc: TDBItem);
   var
      DocLink: TDBItem;
   begin
      DocLink:=Doc.DetailList.AddItem('DOC_LINK', 'DocLink', 'l', '�����', '����� ����� �����������', 'C����� ������ � ������� �����������', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'LINK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocLink.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;LINK_ID', [isPrimary, isUnique]);
      DocLink.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_LINK', DocLink.FieldList);
      // ������������� ���� <�� ���������>
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
   //������������ ����:
   //===========================================================================
   Enum:=EnumList.AddItem('DOC_TYPE', '��� ���������', '', '');
   Enum.Add(dtPetition, '��������� �������');
   Enum.Add(dtInfo, '�������');
   Enum.Add(gtIncoming, '�������� ���������');
   Enum.Add(gtOutgoing, '��������� ���������');
   Enum.Add(gtAdmProc, '���������������� ���������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('GROUP_KIND', '������ ����������', '������� ������, ������������ ��� ��������', '');
   Enum.Add(gkIncoming, '��������');
   Enum.Add(gkOutgoing, '���������');
   //--Enum.Add(gkInternal, '����������');
   Enum.Add(gkPetition, '��������� �������');
   Enum.Add(gkAdmProc, '���������������� ���������');
   Enum.Add(gkInfo, '�������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('APP_FORM', '����� ����������� ���������', '', '');
   Enum.Add(stWriting, '���������');
   Enum.Add(stVerbal, '�����');
   Enum.Add(stElect, '�����������');  //  20.10.2016 vadim
   //--Enum.Add(stVisit, '� ������� ������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('APP_KIND', '��� ��������', '', '');
   Enum.Add(dcProposal, '�����������');
   Enum.Add(dcClaim, '���������');
   Enum.Add(dcComplaint, '������');
   Enum.Add(dcConsultant, '������������');
   // ��� ���������������� ��������
   Enum:=EnumList.AddItem('APP_KIND1', '��� ���������', '', '');
   //Enum.Add(dcProposal, '�����������');
   Enum.Add(dcClaim, '���������');
   Enum.Add(dcComplaint, '������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('SIGN_TYPE', '��� �������', '', '');
   Enum.Add(stIndividual, '��������������');
   //--Enum.Add(skUL, '��������������: ��');
   //--Enum.Add(skIP, '��������������: ��');
   Enum.Add(stGroup, '������������');
   //--Enum.Add(stGroup30, '30 � ����� �������');
   Enum.Add(stAnonym, '���������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('COVER_TYPE', '��� ����������������� ������', '', '');
   Enum.Add(ctCover, '������');
   Enum.Add(ctJob, '���������');
   Enum.Add(ctDirect, '�����������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('CORR_TYPE', '��� �������������� ����������������� ������', '', '');
   Enum.Add(tcHigh, '����������� �����'); //����������� ��������������� �����
   Enum.Add(tcMedia, '���');
   Enum.Add(tcOther, '������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('ANS_KIND', '��� ��������� �������', '', '');
   Enum.Add(rtSatisfy, '�������������');  // 1
   Enum.Add(rtRefuse, '��������');        // 2
   Enum.Add(rtExplain, '����������');     // 3
   Enum.Add(rtReturn, '����������');      // 4
//   Enum.Add(rtPerform, '������������ ��');  5
   Enum.Add(6, '����������� �� ��������');     //+ vadim 12.02.2019
   Enum.Add(7, '��������� ��� ������������ �� ��������');   //+ 
   Enum.Add(8, '���������� �� �����������');   //+ 
   Enum.Add(9, '��������� ����������');        //+
   Enum.Add(10,'������� � ��������');          //+
   Enum.Add(11,'������� � ���� ��� ������������'); //+

   // ��� ���������������� ��������
   Enum:=EnumList.AddItem('ANS_KIND1', '��� ��������� �������', '', '');
   Enum.Add(rtSatisfy, '�������������');
   Enum.Add(rtRefuse, '��������');
   Enum.Add(rtExplain, '����������');
   Enum.Add(rtReturn, '����������');
   Enum.Add(rtPerform, '������������ ��');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('LINK_TYPE', '���� ������ ����� �����������', '', '');
   Enum.Add(ltRepeat, '���������� -> ���������');
   Enum.Add(ltFirst, '������ -> ���������');
   //Enum.Add(ltAnswer, '������/�����');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('LINK_KIND', '��� �����', '��� ����� ����� �����������', '');
   Enum.Add(IntToStr(lkDirect), '������');
   Enum.Add(IntToStr(lkBack), '��������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('LOGICAL', '���������� �������� (��/���)', '', '');
   Enum.Add(lYes, '��');
   Enum.Add(lNo, '���');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('STATUS', '������ ��������� (�������)', '', '');
   Enum.Add(cdIzm, '�������');
//   Enum.Add(lNo, '���');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('CHECK', '�������� ������ ����������', '�������� ������ ����������', '');
   Enum.Add(chNo, '���');
   Enum.Add(chYes, '��');
   Enum.Add(chOk, '����');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('SIGN_KIND', '��� ���������', '��� ���������', '');
   Enum.Add(skMan, '���������');
   Enum.Add(skUL, '����������� ����');
   Enum.Add(skIP, '�������������� ���������������');
   //��� ���������������� ��������
   Enum:=EnumList.AddItem('SIGN_KIND1', '��� ���������', '��� ���������', '');
   Enum.Add(skMan, '���������');
   Enum.Add(skUL, '����������� ����');
   //Enum.Add(skIP, '�������������� ���������������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('STORE_KIND', '������ �������� ������', '������ �������� ������', '');
   Enum.Add(stOnlyLink, '������ ������ �� ����');
   Enum.Add(stInFolder, '� ����������� �����');
   {+}//--Enum.Add(stInBase, '� ���� ������');
   //---------------------------------------------------------------------------
   {Enum:=}EnumList.AddItem('PROV_TYPE', '���� ����������', '���� ����������, �������������� ��������', '');
   // ������������� ����������� ��� �������� ����
   // �� ��������� ���������� ����������� SprTypeDok
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('DELIV_KIND', '������� ��������', '������� �������� ���������', '');
   Enum.Add(dkPost, '�����');
   Enum.Add(dkFax, '����');
   Enum.Add(dkMailgov, 'mailgov');
   Enum.Add(dkSMDO, '����');
   Enum.Add(dkEmail, 'email');
   Enum.Add(dkTelegram, '��������');
   Enum.Add(dkNone, '������');
   // ��� ���������������� ��������
   Enum:=EnumList.AddItem('DELIV_KIND1', '������� ��������', '������� �������� ���������', '');
   Enum.Add(dkPerson, '������ �����');
   Enum.Add(dkPost, '�� �����');
   Enum.Add(dkEmail, '�� ����������� �����');
   Enum.Add(dkCourier, '�������� (��������)');
   Enum.Add(dkNone, '������ ������');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('DOC_KIND', '���� ����������', '���� ����������', '');
   Enum.Add(dk9, '���');
   Enum.Add(21,  '���������������� ���������');  // !!!
   Enum.Add(38,  '������������� ������');
   Enum.Add(39,  '������');
   Enum.Add(56,  '������ ���������� ���������� ��������');
   Enum.Add(dk19,'�������');
   Enum.Add(dk10,'��������� �������');
   Enum.Add(23,  '����������� ����������');
   Enum.Add(41,  '�������������� ���������');
   Enum.Add(dk12,'������'); 
   Enum.Add(dk20,'���������');
   Enum.Add(42,  '������');
   Enum.Add(43,  '������ �� ��������� ������ ���������� ���������� ������� ��������');
   Enum.Add(44,  '��������� � ��������� � ������');
   Enum.Add(45,  '��������� � �������� (������) ���� ��������� ��������');
   Enum.Add(46,  '��������� �� ������������� ����� �������� �������������');
   Enum.Add(dk18,'���������');       // !!!
   Enum.Add(47,  '������� ���������');
   Enum.Add(24,  '����������');
   Enum.Add(dk14,'����������');      // !!!
   Enum.Add(48,  '������������ ������');
   Enum.Add(28,  '��������� ������� � ����������� ���');
   Enum.Add(40,  '����� �� ������������� ������');
   Enum.Add(49,  '�����');
   Enum.Add(29,  '�������������� �������');
   Enum.Add(50,  '��������� �� ���������� �������');
   Enum.Add(dk6, '������');
   Enum.Add(32,  '����');
   Enum.Add(33,  '���������');
   Enum.Add(dk7, '���������');
   Enum.Add(dk2, '�������������');
   Enum.Add(34,  '�������');
   Enum.Add(dk16,'�������������');
   Enum.Add(51,  '���������');
   Enum.Add(dk1, '������');
   Enum.Add(dk5, '��������');
   Enum.Add(58,  '������');
   Enum.Add(dk3, '������������');
   Enum.Add(dk4, '�������');
   Enum.Add(35,  '��������� �������');  // !!!
   Enum.Add(dk11,'�������');
   Enum.Add(52,  '��������� � ������� �����������');
   Enum.Add(36,  '����������');
   Enum.Add(dk13,'��������������');    // !!!
   Enum.Add(dk17,'�����������');  
   Enum.Add(53,  '�����������');
   Enum.Add(dk15,'���� ���������� ���������� ��������');
   Enum.Add(dk8, '��������');
   Enum.Add(54,  '�����');
   Enum.Add(55,  '������� ����������');
   Enum.Add(dk99, '������');
// max=58
//   Enum.Add(26, '������ �����');
//   Enum.Add(37, '����');
   //---------------------------------------------------------------------------
   Enum:=EnumList.AddItem('PROC_RES', '��� ��������� ���������������� ���������', '��� ��������� ���������������� ���������', '');
   Enum.Add(prInfo, '������ �������');
   Enum.Add(prDecision, '�������� �������');
   Enum.Add(prNone, '������');
   //---------------------------------------------------------------------------
//   Enum:=EnumList.AddItem('', '', '', '');
//   Enum.Add(, '');
   //===========================================================================
   //�����������:
   //===========================================================================
   Spr:=SprList.AddItem('SP_FOLDER', 'SprDocFolder', 'sp', '�����', '����� ����������', '������� �����, � ������� ������������ ����� �������� ���������', 'N_ORDER', '', 'ID', 'SHORT', 'ID', [bsSpr, bsPickList, bsOrder]);
   Spr.ExcludeStyle(bsConfirmSave);
   //--Spr.OrderFieldName:='N_ORDER';
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'N_ORDER', [isOrder]);
   Spr.FieldList.AddItem('ID', 'ID', '', '�������������', '������������� �����', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� �����', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������ ������������ �����', '', '', '', 3, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('SHORT', 'SHORT', '', '����������', '������� ������������ �����', '', '', '', 4, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', '����������', '', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_USER', 'IS_USER', '', '����� ������������', '������� ����� ������������', '', '', 'LOGICAL', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsReadOnly, fsNotNull], lsLinkEnum, ssPickList, dkNumber);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,N_ORDER', True);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(250);
   Spr.TableView.ByFieldName('SHORT').Width:=UpdatePerInch(150);
   Spr.TableView.ByFieldName('NOTE').Width:=UpdatePerInch(250);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_CORR', '�������������', 'sp', '��������������', '��������������', '', 'NAME_KEY', '', 'ID', 'NAME', 'ID', [bsSpr]);
   Spr.IndexList.AddItem('NAME_KEY', 'NAME_KEY', 'NAME', [isOrder]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.TableFilter:='IS_KORR=True';
   Spr.FieldList.AddItem('ID', 'ID', '', '�������������', '������������� �����', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������� ������������ ��������������', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FNAME', 'FNAME', '', '������ ������������', '������ ������������ ��������������', '', '', '', 3, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('CORR_TYPE', 'CORR_TYPE', '', '��� ��������������', '��� �������������� ����������������� ������', '', '', 'CORR_TYPE', 4, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('TELEFON', 'TELEFON', '', '�������', '�������', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DIRECTOR', 'DIRECTOR', '', '������������', '������������', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('ADR_TEXT', 'ADR_TEXT', '', '�����', '����� ��������������', '', '', '', 7, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(250);
   Spr.TableView.ByFieldName('FNAME').Width:=UpdatePerInch(250);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_OFFICIAL', 'SprDocOfficial', 'sp', '����������� ����', '����������� ����', '', 'N_ORDER', '', 'ID', 'NAME', 'ID', [bsSpr, bsPickList, bsOrder, bsClearFilter]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'N_ORDER', [isOrder]);
//   Spr.TableFilter:='IS_ACTUAL=True'; !!!
   Spr.TableFilter:='';
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ������������ ����', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� ���������', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkNumber);
   {$IF Defined(ZAGS) or Defined(OPEKA) }
     Spr.FieldList.AddItem('POST', 'POST', '', '���������', '���������', '', '', '', 3, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('POST_B', 'POST_B', '', '��������� (���.)', '��������� (���.)', '', '', '', 4, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIO', 'FIO', '', '�.�.�.', '�.�.�. ������������ ����', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIO_B', 'FIO_B', '', '�.�.�.(���.)', '�.�.�. ������������ ���� (���.)', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIOF', 'FIOF', '', '������� ��� ��������', '������� ��� ��������', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('NAME', 'NAME', '', '����������� ���� - ���������', '����������� ���� - ���������', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   {$ELSE}
     Spr.FieldList.AddItem('FIO', 'FIO', '', '�.�.�.', '�.�.�. ������������ ����', '', '', '', 3, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('FIOF', 'FIOF', '', '������� ��� ��������', '������� ��� ��������', '', '', '', 4, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('POST', 'POST', '', '���������', '���������', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     Spr.FieldList.AddItem('NAME', 'NAME', '', '����������� ���� - ���������', '����������� ���� - ���������', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
     {$IFDEF LAIS}
       Spr.FieldList.AddItem('IS_CHIEF', 'IS_CHIEF', '', '������������', '������������', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
     {$ELSE}
       Spr.FieldList.AddItem('IS_CHIEF', 'IS_CHIEF', '', '���������', '���������', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
     {$ENDIF}
     Spr.FieldList.AddItem('IS_SPEC', 'IS_SPEC', '', '����������', '����������', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
   {$IFEND}
   Spr.FieldList.AddItem('IS_ACTUAL', 'IS_ACTUAL', '', '���������� ������', '���������� ������', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkBoolean);
   Spr.FieldList.AddItem('TELEFON', 'TELEFON', '', '�������', '������� �������', '', '', '', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('TEL_MOB', 'TEL_MOB', '', '���. �������', '��������� �������', '', '', '', 11, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
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
   Spr:=SprList.AddItem('SP_FILELIST', 'SprDocFileList', 'sp', '������������ ���', '������������ ���', '', 'CODE', '', 'ID', 'NAME', 'ID', [bsSpr, {����}bsTree]);
   Spr.ExcludeStyle(bsConfirmSave);
   {����}Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   {����}Spr.IndexList.AddItem('CODE', 'CODE', 'FILE_IND', []);
   Spr.TableFilterCh:='empty(date_end)';
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ����', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������������� ������������� ���� (���� 0, �� ��� ��������)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������� ��������� ���� (����� ������), �.�. �������� ����, ������� ����� ���� ��������� ���������� (2 - ���� ������, 1 - ����)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� �������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('FILE_IND', 'FILE_IND', '', '������', '������ ����', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '��������� ����', '��������� ����', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('ARTICLE', 'ARTICLE', '', '���� �������� ����', '���� �������� ���� � � ������� (������) �� �������', '', '', '', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', '����������', '����������', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DATE_BEGIN', 'DATE_BEGIN', '', '���� ������', '���� ������', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);
   Spr.FieldList.AddItem('DATE_END', 'DATE_END', '', '���� ����������', '���� ����������', '', '', '', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);

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
   Spr:=SprList.AddItem('SP_FILELIST2', 'SprDocFileList', 'sp', '��������� ���', '��������� ���', '', 'CODE', '', 'ID', 'FILE_IND', 'ID', [bsSpr]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('CODE', 'CODE', 'FILE_IND', []);
   Spr.TableFilter:=Format('IS_NODE=%d', [iLeaf]);
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ����', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������������� ������������� ���� (���� 0, �� ��� ��������)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������� ��������� ���� (����� ������), �.�. �������� ����, ������� ����� ���� ��������� ���������� (2 - ���� ������, 1 - ����)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� �������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('FILE_IND', 'FILE_IND', '', '������ ����', '������ ����', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '��������� ����', '��������� ����', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('ARTICLE', 'ARTICLE', '', '���� �������� ����', '���� �������� ���� � � ������� (������) �� �������', '', '', '', 7, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', '����������', '����������', '', '', '', 8, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DATE_BEGIN', 'DATE_BEGIN', '', '���� ������', '���� ������', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);
   Spr.FieldList.AddItem('DATE_END', 'DATE_END', '', '���� ����������', '���� ����������', '', '', '', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkDate);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(300);
   Spr.TableView.ByFieldName('DATE_BEGIN').Width:=UpdatePerInch(100);
   Spr.TableView.ByFieldName('DATE_END').Width:=UpdatePerInch(100);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_SUBJ', 'SprDocSubj', 'sp', '��������', '�������� ��������� �������', '', 'CODE', '', 'ID', 'NAME', 'ID', [bsSpr, {����}bsTree, bsAllSelable]);
   Spr.ExcludeStyle(bsConfirmSave);
   {����}Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   {����}Spr.IndexList.AddItem('CODE', 'CODE', 'CODE', []);
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ��������', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������������� ������������ �������� (���� 0, �� ��� ��������)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������� ��������� ���� (����� ������), �.�. �������� ��������, ������� ����� ���� ��������� ���������� (2 - ���� ������, 1 - ����)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� �������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('CODE', 'CODE', '', '���', '��� ��������', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ��������', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('CODE').Width:=UpdatePerInch(50);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(550);
   Spr.TableView.ByFieldName('NAME').RowNum:=2;
   //-------15.08.2018 vadim --------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_SUBJG', 'SprDocSubjG', 'sp', '��������', '�������� ��������� ������� (��������������� �������������)', '', 'CODE', '', 'ID', 'NAME', 'ID', [bsSpr, bsTree, bsAllSelable]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('CODE', 'CODE', 'CODE', []);
//   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ��������', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ��������', '', '', '', '', 1, [ fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������������� ������������ �������� (���� 0, �� ��� ��������)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������� ��������� ���� (����� ������), �.�. �������� ��������, ������� ����� ���� ��������� ���������� (2 - ���� ������, 1 - ����)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� �������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('CODE', 'CODE', '', '���', '��� ��������', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ��������', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('DATEIZM', 'DATEIZM', '', '���� ��������', '���� ��������', '', '', '', 7, [], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('HANDLED', 'HANDLED', '', '��������� �������', '��������� �������', '', '', '', 8, [], lsNone, ssNone, dkString);

   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
//     Spr.TableView.ExcludeOper([toAdd, toAddFolder, toDelete, toEdit]);
   Spr.TableView.ExcludeByFieldName('ID,PARENT_ID,IS_NODE,N_ORDER', True);
   Spr.TableView.ByFieldName('CODE').Width:=UpdatePerInch(50);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(550);
   Spr.TableView.ByFieldName('NAME').RowNum:=2;
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_MANGROUP', 'SprDocManGroup', 'sp', '���������� ������/��������� ���������', '���������� ������/��������� ���������', '', 'N_ORDER', '', 'ID', 'NAME', 'ID', [bsSpr,bsPickList,bsOrder]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'N_ORDER', [isOrder]);
   Spr.FieldList.AddItem('ID', 'ID', '', '�������������', '������������� ���������� ������', '', '', '', 1, [fsServerSide, fsReadOnly, fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ���������� ������', '', '', '', 2, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� ���������', '', '', '', 3, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.TableView.SetDefaultColView;
   Spr.TableView.IncludeStyle(tsAutoCreateControl);
   Spr.TableView.ExcludeByFieldName('ID,N_ORDER', True);
   Spr.TableView.ByFieldName('NAME').Width:=UpdatePerInch(250);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_PLACE', '�������������', 'sp', '���������� ������', '���������� ���������� �������', '', '', '', 'ID', 'NAME', 'ID', [bsSpr,bsReadOnly]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.FieldList.AddItem('ID', 'ID', '', '�������������', '������������� ����������� ������', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ����������� ������', '', '', '', 2, [fsViewVisible], lsNone, ssNone, dkString);
   //---------------------------------------------------------------------------
   Spr:=SprList.AddItem('SP_DOCGROUP', 'SprDocGroup', 'sp', '������ ����������', '������ ����������', '', 'N_ORDER', '', 'ID', 'NAME', 'ID', [bsSpr, bsPickList, bsOrder, bsTree]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.ShortFieldName:='SHORT';
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('N_ORDER', 'N_ORDER', 'PARENT_ID;N_ORDER', [isOrder]);
   //-
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ������', '', '', '', '', 1, [fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������������� ������������ ������ (���� 0, �� ��� ��������)', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������� ��������� ���� (����� ������), �.�. �������� �����, ������� ����� ���� ��������� ���������� (2 - ���� ������, 1 - ����)', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('N_ORDER', 'N_ORDER', '', '�������', '������� �����', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������ ������������', '', '', '', 5, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('SHORT', 'SHORT', '', '����������', '������� ������������', '', '', '', 6, [fsViewVisible, fsFindVisible, fsEditVisible, fsNotNull], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('KIND', 'KIND', '', '��� ���', '������� ������ ���������������', '', '', 'GROUP_KIND', 7, [fsViewVisible, fsFindVisible, fsEditVisible, fsReadOnly, fsNotForFolder, fsNotNull], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('NOTE', 'NOTE', '', '����������', '', '', '', '', 8, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IND', 'IND', '', '������� ��� �������', '', '', '', '', 9, [fsViewVisible, fsFindVisible, fsEditVisible], lsNone, ssNone, dkString);
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
   Spr:=SprList.AddItem('SP_ADMPROC', 'SprDocAdmProc', 'sp', '���������������� ��������� ��� �������', '�������� ���������������� �������� ��� �������', '', 'HI_CODE', '', 'ID', 'NAME', 'ID', [bsSpr, bsTree, bsClearFilter]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.TableFilter:=Format('IS_SELECT=%d', [lYes]);
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ���������', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������ �� ������������ ������ � ������', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������ �������� ����� ������', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', '������� � ��������', '������� � ��������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', '�����', '����� ���������', '', '', '', 5, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ���������������� ���������', '', '', '', 6, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', '����������', '���������� ��� ������ �� �����������', '', '', 'LOGICAL', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', '���', '������������� ���', '', '', '', 8, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', '������ ������������', '������ ������������ ���������������� ���������', '', '', '', 9, [fsViewVisible, {fsFindVisible,} fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', '������', '����� ���� �������� ������ � ������ ������', '', '', 'LOGICAL', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', '���������', '��� ���������� ���������������� ���������', '', '', 'PROC_RES', 11, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', '���� ����������', '���� ���������� ���������������� ���������', '', '', '', 12, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkDate);

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
   Spr:=SprList.AddItem('SP_ADMPROC2', 'SprDocAdmProc', 'sp', '���������������� ��������� ��� �������', '�������� ���������������� �������� ��� �������', '', 'HI_CODE', '', 'ID', 'FULL_NAME', 'ID', [bsSpr, bsReadOnly, bsPickList]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.PickFieldNames:='PROC_NO,FULL_NAME';
   Spr.TableFilter:=Format('IS_SELECT=%d AND IS_NODE=%d', [lYes, iLeaf]);
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ���������', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������ �� ������������ ������ � ������', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������ �������� ����� ������', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', '������� � ��������', '������� � ��������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', '�����', '����� ���������', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ���������������� ���������', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', '����������', '���������� ��� ������ �� �����������', '', '', 'LOGICAL', 7, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', '���', '������������� ���', '', '', '', 8, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', '������ ������������', '������ ������������ ���������������� ���������', '', '', '', 9, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', '������', '����� ���� �������� ������ � ������ ������', '', '', 'LOGICAL', 10, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', '���������', '��� ���������� ���������������� ���������', '', '', 'PROC_RES', 11, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', '���� ����������', '���� ���������� ���������������� ���������', '', '', '', 12, [fsViewVisible], lsNone, ssNone, dkDate);

   //---------------------------------------------------------------------------
   {+}
   Spr:=SprList.AddItem('SP_ADMPROC_U', 'SprDocAdmProcU', 'sp', '���������������� ��������� ��� �����������', '�������� ���������������� �������� ��� �����������', '', 'HI_CODE', '', 'ID', 'NAME', 'ID', [bsSpr, bsTree, bsClearFilter]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.TableFilter:=Format('IS_SELECT=%d', [lYes]);
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ���������', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������ �� ������������ ������ � ������', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������ �������� ����� ������', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', '������� � ��������', '������� � ��������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', '�����', '����� ���������', '', '', '', 5, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ���������������� ���������', '', '', '', 6, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', '����������', '���������� ��� ������ �� �����������', '', '', 'LOGICAL', 7, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', '���', '������������� ���', '', '', '', 8, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', '������ ������������', '������ ������������ ���������������� ���������', '', '', '', 9, [fsViewVisible, {fsFindVisible,} fsReadOnly], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', '������', '����� ���� �������� ������ � ������ ������', '', '', 'LOGICAL', 10, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', '���������', '��� ���������� ���������������� ���������', '', '', 'PROC_RES', 11, [fsViewVisible, fsFindVisible, fsEditVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', '���� ����������', '���� ���������� ���������������� ���������', '', '', '', 12, [fsViewVisible, fsFindVisible, fsReadOnly], lsNone, ssNone, dkDate);

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
   Spr:=SprList.AddItem('SP_ADMPROC_U2', 'SprDocAdmProcU', 'sp', '���������������� ��������� ��� �����������', '�������� ���������������� �������� ��� �����������', '', 'HI_CODE', '', 'ID', 'FULL_NAME', 'ID', [bsSpr, bsReadOnly, bsPickList]);
   Spr.ExcludeStyle(bsConfirmSave);
   Spr.IndexList.AddItem('PR_KEY', 'PR_KEY', 'ID', [isPrimary]);
   Spr.IndexList.AddItem('HI_CODE', 'HI_CODE', 'HI_CODE', []);
   Spr.PickFieldNames:='PROC_NO,FULL_NAME';
   Spr.TableFilter:=Format('IS_SELECT=%d AND IS_NODE=%d', [lYes, iLeaf]);
   Spr.FieldList.AddItem('ID', 'ID', '�������������', '������������� ���������', '', '', '', '', 1, [fsServerSide, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PARENT_ID', 'PARENT_ID', '', '��������', '������ �� ������������ ������ � ������', '', '', '', 2, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('IS_NODE', 'IS_NODE', '', '������� ����', '������ �������� ����� ������', '', '', '', 3, [fsViewVisible, fsReadOnly], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('HI_LEVEL', 'HI_LEVEL', '', '������� � ��������', '������� � ��������', '', '', '', 4, [fsViewVisible], lsNone, ssNone, dkNumber);
   Spr.FieldList.AddItem('PROC_NO', 'PROC_NO', '', '�����', '����� ���������', '', '', '', 5, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NAME', 'NAME', '', '������������', '������������ ���������������� ���������', '', '', '', 6, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('IS_SELECT', 'IS_SELECT', '', '����������', '���������� ��� ������ �� �����������', '', '', 'LOGICAL', 7, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('HI_CODE', 'HI_CODE', '', '���', '������������� ���', '', '', '', 8, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('FULL_NAME', 'FULL_NAME', '', '������ ������������', '������ ������������ ���������������� ���������', '', '', '', 9, [fsViewVisible], lsNone, ssNone, dkString);
   Spr.FieldList.AddItem('NEED_REQ', 'NEED_REQ', '', '������', '����� ���� �������� ������ � ������ ������', '', '', 'LOGICAL', 10, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('PROC_RES', 'PROC_RES', '', '���������', '��� ���������� ���������������� ���������', '', '', 'PROC_RES', 11, [fsViewVisible], lsLinkEnum, ssPickList, dkNumber);
   Spr.FieldList.AddItem('EXCL_DATE', 'EXCL_DATE', '', '���� ����������', '���� ���������� ���������������� ���������', '', '', '', 12, [fsViewVisible], lsNone, ssNone, dkDate);

   //---------------------------------------------------------------------------
   Loader:=TDBItemLoader.Create;
   try
      Loader.LoadFromIni(Doc2Sel.GetMetaFileName);
      //========================================================================
      //���������:
      //========================================================================
      DocItem:=DocList.AddItem('DOC_MAIN', 'DocMain', 'd', '���������', '������������������ ���������', '������������������ ���������', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
//      DocItem.on
      Loader.FillFieldList('DOC_MAIN', DocItem.FieldList);
      //NB: ??? - DocItem.FieldList.ByName('EXEC_TERM').SelectText:='isnull(ext_term, exec_term) as exec_term';
      //--DocItem.FieldList.ByName('REG_DATE').OrderBy:=1;
      //--DocItem.FieldList.ByName('REG_NUM').OrderBy:=2;
      DocItem.SQLOrder:='d.REG_DATE desc, d.REG_NUM desc';
      {++}DocItem.SQLWhere:=Format('d.DOC_TYPE=%d', [dtPetition]);
      // ������������� ���� <�� ���������>
      DocItem.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_MAIN', DocItem.TableView);
      DocItem.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsTopInfo, tsSysFilter, tsShowInfoWin]);
      //NB: !!! �������� ������� �� between ��� ���� - ��� �� ������ �������������
      DocItem.SysFilter.Add('year(d.REG_DATE)=year(curdate())');
      DocItem.SysFilter.Add('d.EXEC_FACT is null');
      //NB: !!! ��-������� ������� - ����� ��������������
      DocItem.TableView.ExcludeByFieldName('REQ_CHECK,FROM_VISIT,TEL_LINE,ADR_TEXT,LOOKUP_SUBJ_ID,IN_DATE,LOOKUP_SIGN_PLACE,IS_REPEAT,LOOKUP_COVER_CORR,COVER_DATE,COVER_IND,LOOKUP_EXEC_ORG,EXEC_DATE', False);
      //------------------------------------------------------------------------
      //{������}DocLink:=DocItem.DetailList.AddItem('DOC_LINK', 'DocLink', 'l', '�����', '����� ����� �����������', 'C����� ������ � ������� �����������', 'PR_KEY', 'DOC_ID', 'DOC_ID,LINK_ID', '', 'LINK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocLink:=DocItem.DetailList.AddItem('DOC_LINK', 'DocLink', 'l', '�����', '����� ����� �����������', 'C����� ������ � ������� �����������', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'LINK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocLink.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;LINK_ID', [isPrimary, isUnique]);
      {++}DocLink.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_LINK', DocLink.FieldList);
      // ������������� ���� <�� ���������>
      DocLink.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_LINK', DocLink.TableView);
      DocLink.TableView.IncludeStyle(tsMultiTitle);
      {++}DocLink.TableView.IncludeStyle(tsReadOnly);
      AddDocFile(DocItem);

      //------------------------------------------------------------------------
      //{������}DocWork:=DocItem.DetailList.AddItem('DOC_WORK', 'DocWork', 'w', '��� ������������', '��� ������������ ���������', '��� ������������ ���������', 'IND_KEY', 'DOC_ID', 'DOC_ID,WORK_ID', '', 'WORK_ID', [bsDetail, bsFindVisible]);
      DocWork:=DocItem.DetailList.AddItem('DOC_WORK', 'DocWork', 'w', '��� ������������', '��� ������������ ���������', '��� ������������ ���������', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'WORK_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocWork.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;WORK_ID', [isPrimary, isUnique]);
      {++}DocWork.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_WORK', DocWork.FieldList);
      // ������������� ���� <�� ���������>
      DocWork.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_WORK', DocWork.TableView);
      DocWork.TableView.IncludeStyle(tsMultiTitle);
      //------------------------------------------------------------------------
      //? ������ ����������� ������� ������ �������
      VisitItem:=DocList.AddItem('VISIT_BOOK', 'DocMain', 'v', '������', '������ ����� ������� ������ �������', '������ ����� ������� ������ �������', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('VISIT_BOOK', VisitItem.FieldList);
      VisitItem.SQLOrder:='v.VISIT_PLAN desc, v.VISIT_NUM desc';
      //--VisitItem.SQLWhere:=Format('v.APP_FORM in (%d, %d) and v.VISIT_NUM is not null and v.VISIT_NUM>0', [stVisit, stVerbal]);
      VisitItem.SQLWhere:=Format('v.APP_FORM=%d and v.VISIT_NUM is not null and v.VISIT_NUM>0', [{--stVisit,} stVerbal]);
      // ������������� ���� <�� ���������>
      VisitItem.TableView.SetDefaultColView;
      Loader.InitTableView('VISIT_BOOK', VisitItem.TableView);
      VisitItem.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      //NB: !!! ��-������� ������� - ����� ��������������
      VisitItem.TableView.ExcludeByFieldName('VISIT_PLAN,LOOKUP_SIGN_PLACE,ADR_PHONE,ADR_NOTE,EXEC_FACT', False);
      //NB: !!! �������� ������� �� between ��� ���� - ��� �� ������ �������������
      VisitItem.SysFilter.Add('year(v.VISIT_PLAN)=year(curdate())');
      //------------------------------------------------------------------------
      // ������ ����� �������� ������� � (���) ������ ����������, ���������� ���������
      InfoItem:=DocList.AddItem('INFO_BOOK', 'DocMain', 'i', '�������', '������ ����� �������� ������� (����������)', '������ ����� �������� ������� � (���) ������ ����������, ���������� ���������', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('INFO_BOOK', InfoItem.FieldList);
      InfoItem.SQLOrder:='i.REG_DATE desc, i.REG_NUM desc';
      InfoItem.SQLWhere:=Format('i.DOC_TYPE=%d', [dtInfo]);
      // ������������� ���� <�� ���������>
      InfoItem.TableView.SetDefaultColView;
      Loader.InitTableView('INFO_BOOK', InfoItem.TableView);
      InfoItem.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      InfoItem.SysFilter.Add('year(i.REG_DATE)=year(curdate())');
      //NB: !!! ��-������� ������� - ����� ��������������
      //VisitItem.TableView.ExcludeByFieldName('VISIT_PLAN,LOOKUP_SIGN_PLACE,ADR_PHONE,ADR_NOTE,EXEC_FACT', False);
      //DocItem.TableView.ExcludeByFieldName('REQ_CHECK,FROM_VISIT,ADR_TEXT,LOOKUP_SUBJ_ID,IN_DATE,LOOKUP_SIGN_PLACE,IS_REPEAT,LOOKUP_COVER_CORR,COVER_DATE,COVER_IND,LOOKUP_EXEC_ORG,EXEC_DATE', False);
      //------------------------------------------------------------------------
      DocFile:=InfoItem.DetailList.AddItem('DOC_FILE', 'DocFile', 'f', '������������� �����', '������������� �����', '������ ������������� � ��������� ������', 'IND_ORDER', 'DOC_ID', 'DOC_ID,N_ORDER', '', 'FILE_ID', [bsDetail, bsFindVisible, bsOrder]);
      DocFile.IndexList.AddItem('PR_KEY', 'PR_KEY', 'DOC_ID;FILE_ID', [isPrimary, isUnique]);
      DocFile.IndexList.AddItem('IND_ORDER', 'IND_ORDER', 'DOC_ID;N_ORDER', [isOrder]);
      Loader.FillFieldList('DOC_FILE', DocFile.FieldList);
      // ������������� ���� <�� ���������>
      DocFile.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_FILE', DocFile.TableView);
      DocFile.TableView.IncludeStyle(tsMultiTitle);
      //------------------------------------------------------------------------
      // ������ ����������� �������� ����������
      Doc:=DocList.AddItem('DOC_IN', 'DocMain', 'd', '��������', '������ ����������� �������� ����������', '������ ����������� �������� ����������', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('DOC_IN', Doc.FieldList);
      Doc.SQLOrder:='d.REG_DATE desc, d.REG_NUM desc';
      Doc.SQLWhere:=Format('d.DOC_TYPE=%d', [gtIncoming]);
      // ������������� ���� <�� ���������>
      Doc.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_IN', Doc.TableView);
      Doc.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      Doc.SysFilter.Add('year(d.REG_DATE)=year(curdate())');
      AddDocFile(Doc);
      //------------------------------------------------------------------------
      // ������ ����������� ��������� ����������
      Doc:=DocList.AddItem('DOC_OUT', 'DocMain', 'd', '���������', '������ ����������� ��������� ����������', '������ ����������� ��������� ����������', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('DOC_OUT', Doc.FieldList);
      Doc.SQLOrder:='d.REG_DATE desc, d.REG_NUM desc';
      Doc.SQLWhere:=Format('d.DOC_TYPE=%d', [gtOutgoing]);
      // ������������� ���� <�� ���������>
      Doc.TableView.SetDefaultColView;
      Loader.InitTableView('DOC_OUT', Doc.TableView);
      Doc.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter]);
      Doc.SysFilter.Add('year(d.REG_DATE)=year(curdate())');
      AddDocFile(Doc);
      //------------------------------------------------------------------------
      // ������ ����������� ���������������� ��������
      Doc:=DocList.AddItem('ADM_PROC', 'DocMain', 'p', '���������������� ���������', '������ ����������� ���������� �� ���������������� ����������', '������ ����������� ���������� �� ������������� ���������������� ��������', '', '', 'DOC_ID', '', 'DOC_ID', [bsMaster, bsView]);
      Loader.FillFieldList('ADM_PROC', Doc.FieldList);
      Doc.SQLOrder:='p.REG_DATE desc, p.REG_NUM desc';
      Doc.SQLWhere:=Format('p.DOC_TYPE=%d', [gtAdmProc]);
      // ������������� ���� <�� ���������>
      Doc.TableView.SetDefaultColView;
      Loader.InitTableView('ADM_PROC', Doc.TableView);
      Doc.TableView.IncludeStyle([tsMultiTitle, tsMDI, tsSysFilter, tsShowInfoWin]);
      Doc.SysFilter.Add('year(p.REG_DATE)=year(curdate())');
      AddDocWork(Doc);
      AddDocFile(Doc);
      AddDocLink(Doc);
      {+} //����� �������� ����� ��������� �� �������, ������� �������� �� �������
      //--Doc.FieldList.ByName('ADM_PROC_R').SelectText:='NameAdmProc(p.adm_proc, true)';
      Doc.FieldList.ByName('ADM_PROC_R').SelectText:='p.adm_proc';
      //========================================================================
      //�����:
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
   //������ ������/������
   FLoadFormat:=TkbmCSVStreamFormat.Create(nil);
   FLoadFormat.CSVQuote:=#0;
   FLoadFormat.CSVFieldDelimiter:=';';
   FLoadFormat.CSVRecordDelimiter:=#0;
   //�������
   FdsTable:=TkbmMemTable.Create(nil);
   FdsoTable:=TDataSource.Create(nil);
   FdsoTable.DataSet:=FdsTable;
   //����
   FdsField:=TkbmMemTable.Create(nil);
   FdsoField:=TDataSource.Create(nil);
   FdsoField.DataSet:=FdsField;
   FdsField.MasterSource:=FdsoTable;
   FdsField.MasterFields:='TABLE_ID';
   FdsField.IndexFieldNames:='TABLE_ID;ORDER';
   //�������� ������
   FdsFindOper:=TkbmMemTable.Create(nil);
   FdsoFindOper:=TDataSource.Create(nil);
   FdsoFindOper.DataSet:=FdsFindOper;
   FdsFindOper.IndexFieldNames:='ORDER';
   //������
   FIsOpen:=False;
end;

destructor TDBItemLoader.Destroy;
begin
   //������� ���
   Close;
   //����
   FdsoField.Free;
   FdsField.Free;
   //�������
   FdsoTable.Free;
   FdsTable.Free;
   //�������� ������
   FdsoFindOper.Free;
   FdsFindOper.Free;
   //����� ������/������
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
      //�������
      sl.Add(TableSection);
      FdsTable.SaveToStreamViaFormat(stream, FLoadFormat);
      sl.Add(stream.DataString);
      stream.Size:=0;
      //����
      sl.Add(FieldSection);
      FdsField.SaveToStreamViaFormat(stream, FLoadFormat);
      sl.Add(stream.DataString);
      stream.Size:=0;
      //�������� ������
      sl.Add(FindOperSection);
      FdsFindOper.SaveToStreamViaFormat(stream, FLoadFormat);
      sl.Add(stream.DataString);
      stream.Size:=0;
      //��������� ��
      sl.SaveToFile(IniFileName);
   finally
      sl.Free;
      stream.Free;
   end;
end;

end.
