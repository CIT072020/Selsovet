unit fShablon;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,SasaDbGrid, FuncPr, fmStringSeek,
  DbGrids, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, dBase, Db, fMain, fRecordGrid, Metatask, OpisEdit, uTypes,
  mFindInt,
  TB2Item, TB2Dock, TB2Toolbar;

const

  {$IFDEF POST}
    SHABLON_OTKAZ_REG=1;
    SHABLON_RES=2;
    SHABLON_MAX=2;

    // �� ������������
      SHABLON_NOT_DOK=2222;       // ������� �� �������������� ���������
      SHABLON_NAME_ZAGS=1111;
      SHABLON_DOKUMENT = 101;  //�������� �������������� ��������
      SHABLON_NATION   = 102;  //������� � ��������������
      SHABLON_OTEC     = 103;  //������ �������� �� ����
      SHABLON_ISPRAV   = 104;  //�����������,���������
      SHABLON_SP_SM    = 105;  //����� �������� ��������, �������������� ���� ������
      SHABLON_REG      = 106;  //����� �����������
      SHABLON_SUD      = 107;  //������� ����

      SHABLON_OCH      = 108;  //������� ��� �������
      SHABLON_ISPOLN   = 108;  //��� ���� ������� �� ����������

      SHABLON_ROVD     = 109;  //����
      SHABLON_ZAJAVIT  =10;  //���������

      SHABLON_DOK_ROGD  =11; //�������� ����� ���� ��������

      SHABLON_DRUG_PR  =12;  //������ ������� � ������ ��������(������)
      SHABLON_ADRESAT  =12;  //������� ����

      SHABLON_OSNOV_PRED =13;  //����� ��������� ������������� �� ���������  ���
      SHABLON_SPEC       =13;  //���� ����������� ������ �������

      SHABLON_PRICH_PASP =14;  //������� ������ ��������
      SHABLON_SPEC_DOLG  =14;  //���� ��������� ������������ ������ �������

      SHABLON_INOSTR_PASP=15;  //����������� ����.
      SHABLON_PRICH_PER  =15;  //���� ������� �������� ���    !!! KeyList.ini KEY_FIO_PRICH  filter=kod=15 !!!

      SHABLON_ROVD_BEL   =16;  //���� �� ����������
      SHABLON_ZAKL_ROVD  =16;  //���� ���������� ���� � �������� �����

      SHABLON_POLAG      =17;  //���� ������� � �������� �����

      SHABLON_BANK       =18;  //����� ��� ����������
      SHABLON_ADD_GRAG   =19;  //�������������� �����������

      SHABLON_DOK_SEMPOL =20;  //�������� �������������� �������� ���������

      SHABLON_OTM_PASP   =21;  //��������� ������� � ��������� �� �������
      SHABLON_SVID_Z     =21;  //��������� ��� ����
  {$ENDIF}

  {$IFDEF OPEKA}
    SHABLON_KEM=1;
    SHABLON_PRICH_DOK=2;
    SHABLON_PRICH_OTM=3;
    SHABLON_MAX=3;


    // �� ������������
      SHABLON_NOT_DOK=2222;       // ������� �� �������������� ���������
      SHABLON_DOKUMENT = 101;  //�������� �������������� ��������
      SHABLON_NATION   = 102;  //������� � ��������������
      SHABLON_OTEC     = 3;  //������ �������� �� ����
      SHABLON_ISPRAV   = 4;  //�����������,���������
      SHABLON_SP_SM    = 5;  //����� �������� ��������, �������������� ���� ������
      SHABLON_REG      = 6;  //����� �����������
      SHABLON_SUD      = 7;  //������� ����

      SHABLON_OCH      = 8;  //������� ��� �������
      SHABLON_ISPOLN   = 8;  //��� ���� ������� �� ����������

      SHABLON_ROVD     = 9;  //����
      SHABLON_ZAJAVIT  =10;  //���������

      SHABLON_DOK_ROGD  =11; //�������� ����� ���� ��������

      SHABLON_DRUG_PR  =12;  //������ ������� � ������ ��������(������)
      SHABLON_ADRESAT  =12;  //������� ����

      SHABLON_OSNOV_PRED =13;  //����� ��������� ������������� �� ���������  ���
      SHABLON_SPEC       =13;  //���� ����������� ������ �������

      SHABLON_PRICH_PASP =14;  //������� ������ ��������
      SHABLON_SPEC_DOLG  =14;  //���� ��������� ������������ ������ �������

      SHABLON_INOSTR_PASP=15;  //����������� ����.
      SHABLON_PRICH_PER  =15;  //���� ������� �������� ���    !!! KeyList.ini KEY_FIO_PRICH  filter=kod=15 !!!

      SHABLON_ROVD_BEL   =16;  //���� �� ����������
      SHABLON_ZAKL_ROVD  =16;  //���� ���������� ���� � �������� �����

      SHABLON_POLAG      =17;  //���� ������� � �������� �����

      SHABLON_BANK       =18;  //����� ��� ����������
      SHABLON_ADD_GRAG   =19;  //�������������� �����������

      SHABLON_DOK_SEMPOL =20;  //�������� �������������� �������� ���������

      SHABLON_OTM_PASP   =21;  //��������� ������� � ��������� �� �������
      SHABLON_SVID_Z     =21;  //��������� ��� ����

      SHABLON_RES=22;  //���������

//      SHABLON_MESTO_Z=22;  //����� ����������� ��� ����
  {$ENDIF}
//  {$ELSE}

  {$IF Defined(ZAGS) or Defined(LAIS) or Defined(OCHERED) or Defined(ZAH) or Defined(GKH) }

  {$IFDEF ZAH}
    SHABLON_NAME_ZAGS=1;
    SHABLON_TRAN=2;
    SHABLON_USLUG=3;
    SHABLON_DOK_SMERT=4;  //�������� ����� ���� ������
    SHABLON_RAZR_ORGAN=5; //����� ������ ���������� �� �����.
    SHABLON_ZH_PRICH=6;  //������� �����������
    SHABLON_SM_PRICH=7;  //������� ������ (���� �� �� �����������)
    SHABLON_MAX=7;

  // �� ������������
    SHABLON_NOT_DOK=2222;       // ������� �� �������������� ���������
    SHABLON_DOKUMENT = 101;  //�������� �������������� ��������
    SHABLON_NATION   = 102;  //������� � ��������������
    SHABLON_OTEC     = 3;  //������ �������� �� ����
    SHABLON_ISPRAV   = 4;  //�����������,���������
    SHABLON_SP_SM    = 5;  //����� �������� ��������, �������������� ���� ������
    SHABLON_REG      = 6;  //����� �����������
    SHABLON_SUD      = 7;  //������� ����

    SHABLON_OCH      = 8;  //������� ��� �������
    SHABLON_ISPOLN   = 8;  //��� ���� ������� �� ����������

    SHABLON_ROVD     = 9;  //����
    SHABLON_ZAJAVIT  =10;  //���������

    SHABLON_DOK_ROGD  =11; //�������� ����� ���� ��������

    SHABLON_DRUG_PR  =12;  //������ ������� � ������ ��������(������)
    SHABLON_ADRESAT  =12;  //������� ����

    SHABLON_OSNOV_PRED =13;  //����� ��������� ������������� �� ���������  ���
    SHABLON_SPEC       =13;  //���� ����������� ������ �������

    SHABLON_PRICH_PASP =14;  //������� ������ ��������
    SHABLON_SPEC_DOLG  =14;  //���� ��������� ������������ ������ �������

    SHABLON_INOSTR_PASP=15;  //����������� ����.
    SHABLON_PRICH_PER  =15;  //���� ������� �������� ���  !!! KeyList.ini KEY_FIO_PRICH  filter=kod=15 !!!

    SHABLON_ROVD_BEL   =16;  //���� �� ����������
    SHABLON_ZAKL_ROVD  =16;  //���� ���������� ���� � �������� �����

    SHABLON_POLAG      =17;  //���� ������� � �������� �����

    SHABLON_BANK       =18;  //����� ��� ����������
    SHABLON_ADD_GRAG   =19;  //�������������� �����������

    SHABLON_DOK_SEMPOL =20;  //�������� �������������� �������� ���������

    SHABLON_OTM_PASP   =21;  //��������� ������� � ��������� �� �������
    SHABLON_SVID_Z     =21;  //��������� ��� ����

    SHABLON_RES=22;  //���������


  {$ELSE}
      SHABLON_DOKUMENT = 1;  //�������� �������������� ��������
      SHABLON_NATION   = 2;  //������� � ��������������
      SHABLON_OTEC     = 3;  //������ �������� �� ����
      SHABLON_ISPRAV   = 4;  //�����������,���������
      SHABLON_SP_SM    = 5;  //����� �������� ��������, �������������� ���� ������
      SHABLON_REG      = 6;  //����� �����������
      SHABLON_SUD      = 7;  //������� ����

      SHABLON_OCH      = 8;  //������� ��� �������
      SHABLON_ISPOLN   = 8;  //��� ���� ������� �� ����������

      SHABLON_ROVD     = 9;  //����
      SHABLON_ZAJAVIT  =10;  //���������

      SHABLON_DOK_ROGD  =11; //�������� ����� ���� ��������

      SHABLON_DRUG_PR  =12;  //������ ������� � ������ ��������(������)
      SHABLON_ADRESAT  =12;  //������� ����

      SHABLON_OSNOV_PRED =13;  //����� ��������� ������������� �� ���������  ���
      SHABLON_SPEC       =13;  //���� ����������� ������ �������

      SHABLON_PRICH_PASP =14;  //������� ������ ��������
      SHABLON_SPEC_DOLG  =14;  //���� ��������� ������������ ������ �������

      SHABLON_INOSTR_PASP=15;  //����������� ����.
      SHABLON_PRICH_PER  =15;  //���� ������� �������� ���    !!! KeyList.ini KEY_FIO_PRICH  filter=kod=15 !!!

      SHABLON_ROVD_BEL   =16;  //���� �� ����������
      SHABLON_ZAKL_ROVD  =16;  //���� ���������� ���� � �������� �����

      SHABLON_NAME_ZAGS  =17;  //������ ���� ��� �������������
      SHABLON_POLAG      =17;  //���� ������� � �������� �����

      SHABLON_BANK       =18;  //����� ��� ����������
      SHABLON_ADD_GRAG   =19;  //�������������� �����������

      SHABLON_DOK_SEMPOL =20;  //�������� �������������� �������� ���������

      SHABLON_OTM_PASP   =21;  //��������� ������� � ��������� �� �������
      SHABLON_SVID_Z     =21;  //��������� ��� ����

      {$IFDEF ZAGS}
        SHABLON_ISP_DECL_BRAK=22;
        SHABLON_DOCS=23;
        SHABLON_DECL_ROGD=24;
        SHABLON_SM_PIS_PRICH=25;  // !!! KeyList.ini KEY_SM_PIS_PRICH  filter=kod=@SHABLON_SM_PIS_PRICH !!!
        SHABLON_NOT_DOK=26;       // ������� �� �������������� ���������
        SHABLON_MAX=26;

        SHABLON_RES=55;  //���������
      {$ELSE}         // ����  ���
        SHABLON_RES=22;  //���������
        SHABLON_TRAN=23;
        SHABLON_USLUG=24;
        SHABLON_ISP_DECL_BRAK=25;
        SHABLON_OTKAZ_REG=26;
        SHABLON_SM_PIS_PRICH=27;  // !!! KeyList.ini KEY_SM_PIS_PRICH  filter=kod=@SHABLON_SM_PIS_PRICH !!!
        SHABLON_NOT_DOK=28;       // ������� �� �������������� ���������
        SHABLON_DOK_LIC=29;       // ���. ��������� �������� ����� + KEY_LIC_TYPEDOK
        SHABLON_MAX=29;
      {$ENDIF}

    {$ENDIF}
    {$IFEND}

type

  TRecShablon=record
    Name:String;
    Kod:Integer;
    Modify:Boolean;
  end;

  TfmShablon = class(TForm)
    Grid: TDBGridEh;
    DataSource: TDataSource;
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBItemOk: TTBItem;
    TBItemCancel: TTBItem;
    TBItemDel: TTBItem;
    TBItemAdd: TTBItem;
    TBItemClearFlt: TTBItem;
    TBItemEdit: TTBItem;
    TBToolbarCh: TTBToolbar;
    TBControlItem1: TTBControlItem;
    edNameShablon: TComboBox;
    TBItemSetFlt: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure edNameShablonChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShablonBeforePost(DataSet: TDataSet);
    procedure TBItemOkClick(Sender: TObject);
    procedure TBItemCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure TBItemAddClick(Sender: TObject);
    procedure TBItemDelClick(Sender: TObject);
    procedure TBItemClearFltClick(Sender: TObject);
    procedure TBItemEditClick(Sender: TObject);
    procedure TBItemSetFltClick(Sender: TObject);
  private
    { Private declarations }
    FCurKod : Integer;
  public
    arrShablon : array[1..SHABLON_MAX] of TRecShablon;
    FChoice : Boolean;
    function GetKod(nInd:Integer)  : Integer;
    function GetIndex(nKod:Integer): Integer;
    function GetName(nKod:Integer) : String;
    procedure CheckModify;
    procedure CreateChoice;
  end;
  procedure EditShablon;
//  function _ChoiceFromShablon(nID : Integer; var lClear:Boolean; var nResult:Integer; strValue:String='') : String;
  function ChoiceFromShablon(nID : Integer; strValue:String='' ) : String;
  function ChoiceFromShablonEx( ed:TDbEditEh; nID : Integer; lClear:Boolean; strValue:String='' ) : Integer;

  function CheckTypeShablon(s:String):String;
  function ShablonToList(nKod:Integer; ItemsList,ValueList : TStrings):Boolean;

var
  ModifyShablon:Boolean;

implementation

{$R *.DFM}

function ShablonToList(nKod:Integer; ItemsList,ValueList : TStrings):Boolean;
begin
  Result:=true;
  with dmBase.Shablon do begin
    SetRange([nKod],[nKod]);
    while not Eof do begin
      ItemsList.Add(FieldByName('NAME').AsString);
      ValueList.Add(FieldByName('ID').AsString);
      Next;
    end;
    CancelRange;
  end;
end;

function CheckTypeShablon(s:String):String;
begin             
  {$IF Defined(ZAGS) or Defined(LAIS) or Defined(GKH) }
  if s<>'' then begin
    Result:=StringReplace(s, '@SHABLON_SM_PIS_PRICH', inttostr(SHABLON_SM_PIS_PRICH), [rfReplaceAll, rfIgnoreCase]);
    Result:=StringReplace(Result, '@SHABLON_PRICH_PER', inttostr(SHABLON_PRICH_PER), [rfReplaceAll, rfIgnoreCase]);
    {$IF Defined(LAIS) or Defined(GKH) }
      Result:=StringReplace(Result, '@SHABLON_DOK_LIC', inttostr(SHABLON_DOK_LIC), [rfReplaceAll, rfIgnoreCase]);
    {$ELSE}
      Result:=StringReplace(Result, '@SHABLON_DOK_LIC', '0' , [rfReplaceAll, rfIgnoreCase]);
    {$IFEND}
  end;
  {$ELSE}
  if s<>'' then begin
    Result:=StringReplace(s, '@SHABLON_SM_PIS_PRICH', '0', [rfReplaceAll, rfIgnoreCase]);
    Result:=StringReplace(Result, '@SHABLON_PRICH_PER', '0', [rfReplaceAll, rfIgnoreCase]);
    Result:=StringReplace(Result, '@SHABLON_DOK_LIC', '0' , [rfReplaceAll, rfIgnoreCase]);
  end;
  {$IFEND}
end;

procedure EditShablon;
var
  fmShablon: TfmShablon;
begin
  fmShablon:=TfmShablon.Create(nil);
  fmShablon.FChoice := false;
  fmShablon.TBItemClearFlt.Visible := false;
  fmShablon.TBItemCancel.Visible := false;
  fmShablon.TBItemOk.Caption := '�����';
  fmShablon.ShowModal;
  fmShablon.CheckModify;
  fmShablon.Free;
end;
//------------------------------------------------------------------------------------------
function _ChoiceFromShablon( nID : Integer; var lClear:Boolean; var nResult:Integer; strValue:String; var lModify:Boolean ) : String;
var
  fmShablon: TfmShablon;
  i,nInd:Integer;
begin
  lModify:=false;
  lClear:=false;
  fmShablon:=TfmShablon.Create(nil);
  fmShablon.FChoice := true;

  nInd:=fmShablon.GetIndex(nID);
  fmShablon.edNameShablon.ItemIndex:=nInd;
//����    fmShablon.edNameShablon.ItemIndex:=nID-1;

  fmShablon.FCurKod := nID;
  nResult:=0;
  try
    dmBase.Shablon.SetRange( [fmShablon.FCurKod], [fmShablon.FCurKod] );
    fmShablon.edNameShablon.Visible:=false;
    fmShablon.Grid.ReadOnly:=true;
    fmShablon.Grid.Columns[1].Visible:=false;
    fmShablon.Grid.Options := fmShablon.Grid.Options - [dgTitles];
    fmShablon.TBItemClearFlt.Visible := false;
    fmShablon.TBToolbarCh.Visible := false;
    fmShablon.Caption:=fmShablon.GetName(fmShablon.FCurKod);
    if (Trim(strValue)<>'') then begin
      dmBase.Shablon.Filter:=QStr(strValue)+'$ name';
      dmBase.Shablon.Filtered:=true;
      dmBase.Shablon.First;
      if dmBase.Shablon.eof and dmBase.Shablon.bof then begin
        dmBase.Shablon.Filter:='';
        dmBase.Shablon.Filtered:=false;
      end else begin
        fmShablon.TBItemClearFlt.Visible := true;
      end;
    end;
    Result := '';
    if fmShablon.ShowModal=mrOk then begin
      Result := dmBase.Shablon.FieldByName('NAME').AsString;
      nResult:= dmBase.Shablon.FieldByName('ID').AsInteger;
    end;
    if fmShablon.arrShablon[nInd+1].Modify then begin
      lModify:=true;
      fmShablon.CheckModify;
    end;
  finally
    fmShablon.Free;
  end;
end;

//------------------------------------------------------------------------------------------
function ChoiceFromShablonEx( ed:TDbEditEh; nID : Integer; lClear:Boolean; strValue:String='' ) : Integer;
var
  s,s1,s2:String;
  nResult,n:Integer;
  lModify,l:Boolean;
begin
  ModifyShablon:=false;
  Result:=0;
  l:=lClear;
  s:=_ChoiceFromShablon(nID,lClear,nResult,strValue,lModify);
  if lModify
    then ModifyShablon:=true;
  if s<>'' then begin
    Result:=nResult;
    if ed<>nil then begin
      if ed.Field.DataType in [ftInteger,ftSmallint,ftWord,ftLargeint,ftBCD] then begin
        ed.Value:=nResult;
      end else begin
        if l then begin
          ed.Text:=s;
        end else begin
          n:=ed.SelStart;
          ed.SelStart:=0;
          ed.SelLength:=0;
          s1:=Copy(ed.Text,1,n);
          s2:=Copy(ed.Text,n+1,Length(ed.Text));
          ed.Text := s1+s+s2;
          ed.SelStart:=Length(s1+s);
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------------------
function ChoiceFromShablon( nID : Integer; strValue:String) : String;
var
  lModify,lClear:Boolean;
  nResult:Integer;
begin
  ModifyShablon:=false;
  Result:=_ChoiceFromShablon( nID,lClear,nResult,strValue,lModify);
  if lModify
    then ModifyShablon:=true;
end;
//------------------------------------------------------------------------------------------
procedure TfmShablon.CheckModify;
var
  i:Integer;
  Opis:TOpisEdit;
  opSpr : TSprItem;
begin
  for i:=Low(arrShablon) to High(arrShablon) do begin
    if arrShablon[i].Modify then begin
      {$IF Defined(ZAGS) or Defined(LAIS) }
        if arrShablon[i].Kod=SHABLON_SM_PIS_PRICH then begin
          Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_SM_PIS_PRICH');
          if Opis<>nil then Opis.KeyListFromDataSet:=true;
        end;
      {$IFEND}
      {$IF Defined(LAIS) or Defined(GKH) }
        if arrShablon[i].Kod=SHABLON_DOK_LIC then begin
          opSpr:=fmMain.FltSprList.ByName('KEY_LIC_TYPEDOK');
          Opis:=GlobalTask.CurrentOpisEdit.GetListOpisA('KEY_LIC_TYPEDOK');
          GlobalTask.CurrentOpisEdit.ReloadOpis(Opis);
          opSpr.KeyList.Assign( Opis.KeyList );
          opSpr.NameList.Assign( Opis.Items );
        end;
     {$IFEND}
    end;
  end;
end;
//------------------------------------------------------------------------------------------
procedure TfmShablon.FormCreate(Sender: TObject);
var
  i:Integer;
  s:String;
begin
  dmBase.Shablon.BeforePost := ShablonBeforePost;
  DataSource.DataSet := dmBase.Shablon;

  edNameShablon.Items.Clear;

  CreateChoice;
  i:=GlobalTask.GetLastValueAsInteger('INDEX_SHABLON');
  if (i<0) or (i>=edNameShablon.Items.Count)
    then i:=0;
  try
    edNameShablon.ItemIndex:=i;
  except
    edNameShablon.ItemIndex:=0;
  end;
  FCurKod:=GetKod(edNameShablon.ItemIndex+1);
//  edNameShablon.ItemIndex := 0;
//  FCurKod := 1;
  dmBase.Shablon.SetRange( [FCurKod],[FCurKod] );

//  {$IFDEF ZAGS}
//    edNameShablon.Items[SHABLON_ADRESAT-1]:=getName(SHABLON_ADRESAT);
//  {$ENDIF}
end;

procedure TfmShablon.FormDestroy(Sender: TObject);
begin
  GlobalTask.SetLastValueAsInteger('INDEX_SHABLON', edNameShablon.ItemIndex);
  dmBase.Shablon.CheckBrowseMode;
  dmBase.Shablon.Filter:='';
  dmBase.Shablon.Filtered:=false;
  dmBase.Shablon.CancelRange;
  dmBase.Shablon.BeforePost := nil;
end;

procedure TfmShablon.edNameShablonChange(Sender: TObject);
begin
  dmBase.Shablon.CheckBrowseMode;
  FCurKod:=GetKod( edNameShablon.ItemIndex+1 );
  dmBase.Shablon.SetRange( [FCurKod],[FCurKod] );
  ActiveControl:=Grid;
end;

procedure TfmShablon.ShablonBeforePost(DataSet: TDataSet);
begin
  dmBase.Shablon.FieldByName('KOD').AsInteger:=FCurKod;
  if edNameShablon.ItemIndex>-1 then begin
    arrShablon[edNameShablon.ItemIndex+1].Modify:=true;
  end;
end;

procedure TfmShablon.CreateChoice;
var
  i:Integer;
begin
  for i:=1 to SHABLON_MAX do begin
    arrShablon[i].Kod:=-1;
    arrShablon[i].Modify:=false;
  end;
  i:=1;
  {$IFDEF POST}
    arrShablon[i].Kod:=SHABLON_OTKAZ_REG;  arrShablon[i].Name:='�������������� ����� ��� �����������';    Inc(i,1);
    arrShablon[i].Kod:=SHABLON_RES;        arrShablon[i].Name:='���������';  Inc(i,1);     // 2
  {$ENDIF}
  {$IFDEF OPEKA}
    arrShablon[i].Kod:=SHABLON_KEM;        arrShablon[i].Name:='��� ��������';    Inc(i,1);
    arrShablon[i].Kod:=SHABLON_PRICH_OTM;  arrShablon[i].Name:='������� ������';  Inc(i,1);
    arrShablon[i].Kod:=SHABLON_KEM;        arrShablon[i].Name:='�������������� ���������';    Inc(i,1);
  {$ENDIF}

  {$IF Defined(ZAGS) or Defined(LAIS) or Defined(ZAH) or Defined(GKH) }
    {$IFDEF ZAH}
      arrShablon[i].Kod:=SHABLON_NAME_ZAGS;  arrShablon[i].Name:='������ ����';   Inc(i,1);//1
      arrShablon[i].Kod:=SHABLON_TRAN;       arrShablon[i].Name:='���������';     Inc(i,1);//2
      arrShablon[i].Kod:=SHABLON_USLUG;      arrShablon[i].Name:='����������� �� �������';  Inc(i,1);   //3
      arrShablon[i].Kod:=SHABLON_DOK_SMERT;  arrShablon[i].Name:='�������� �����. ���� ������';  Inc(i,1);
      arrShablon[i].Kod:=SHABLON_RAZR_ORGAN; arrShablon[i].Name:='�������. ������ ���������� �� �����.';  Inc(i,1);// 5
      arrShablon[i].Kod:=SHABLON_ZH_PRICH;   arrShablon[i].Name:='������� �����������';  Inc(i,1);// 6
      arrShablon[i].Kod:=SHABLON_SM_PRICH;   arrShablon[i].Name:='������� ������';  Inc(i,1);// 7
    {$ELSE}
      arrShablon[i].Kod:=SHABLON_DOKUMENT;   arrShablon[i].Name:='�������� �������������� ��������'; Inc(i,1);  //1
      arrShablon[i].Kod:=SHABLON_NATION;     arrShablon[i].Name:='������� � ��������������'; Inc(i,1);
      arrShablon[i].Kod:=SHABLON_OTEC;       arrShablon[i].Name:= '������ �������� �� ����';  Inc(i,1);
      arrShablon[i].Kod:=SHABLON_ISPRAV;     arrShablon[i].Name:= '���������, �����������, ����������'; Inc(i,1);
      arrShablon[i].Kod:=SHABLON_SP_SM;      arrShablon[i].Name:= '����� �������� ��������, �������������� ���� ������'; Inc(i,1); //5
      arrShablon[i].Kod:=SHABLON_REG;        arrShablon[i].Name:= '����� �����������'; Inc(i,1);
      arrShablon[i].Kod:=SHABLON_SUD;        arrShablon[i].Name:= '������� ����';  Inc(i,1);
      {$IFDEF ZAGS}
        arrShablon[i].Kod:=SHABLON_ISPOLN;   arrShablon[i].Name:= '������� �� ����������'; Inc(i,1);     // 8
      {$ELSE}
        arrShablon[i].Kod:=SHABLON_OCH;      arrShablon[i].Name:= '��������� ��� ���������� �� �������'; Inc(i,1);  // 8
      {$ENDIF}
      arrShablon[i].Kod:=SHABLON_ROVD;       arrShablon[i].Name:= '������ ����'; Inc(i,1);                              // 9
      arrShablon[i].Kod:=SHABLON_ZAJAVIT;    arrShablon[i].Name:= '���������';   Inc(i,1);                              // 10
      arrShablon[i].Kod:=SHABLON_DOK_ROGD;   arrShablon[i].Name:= '�������� �����. ���� ��������'; Inc(i,1);            // 11
      {$IFDEF ZAGS}
        arrShablon[i].Kod:=SHABLON_ADRESAT;     arrShablon[i].Name:= '�������';   Inc(i,1);                  //12
        arrShablon[i].Kod:=SHABLON_SPEC;        arrShablon[i].Name:= '����������� ������ �������'; Inc(i,1); //13
        arrShablon[i].Kod:=SHABLON_SPEC_DOLG;   arrShablon[i].Name:= '��������� ������������ ������ �������'; Inc(i,1); //14
        arrShablon[i].Kod:=SHABLON_PRICH_PER;   arrShablon[i].Name:= '�������';   Inc(i,1);//15
        arrShablon[i].Kod:=SHABLON_ZAKL_ROVD;   arrShablon[i].Name:= '���������� ���� (�������� ���)';  Inc(i,1);// 16
        arrShablon[i].Kod:=SHABLON_POLAG;       arrShablon[i].Name:= '������� (�������� ���)';     Inc(i,1);     // 17
      {$ELSE}
        arrShablon[i].Kod:=SHABLON_DRUG_PR;     arrShablon[i].Name:= '������ ������� ��������';   Inc(i,1);             //12
        arrShablon[i].Kod:=SHABLON_OSNOV_PRED;  arrShablon[i].Name:= '��������� �������������� ������ ���������'; Inc(i,1); //13
        arrShablon[i].Kod:=SHABLON_PRICH_PASP;  arrShablon[i].Name:= '������� ������ �������� (�� ����������� �����)'; Inc(i,1);  //14
        arrShablon[i].Kod:=SHABLON_INOSTR_PASP; arrShablon[i].Name:= '����������� ����������� (�� ����������� �����)'; Inc(i,1);  //15
        arrShablon[i].Kod:=SHABLON_ROVD_BEL;    arrShablon[i].Name:= '������ ���� (�� ����������� �����)';  Inc(i,1); //16
        arrShablon[i].Kod:=SHABLON_NAME_ZAGS;   arrShablon[i].Name:= '������ ����';  Inc(i,1); //17
      {$ENDIF}
      arrShablon[i].Kod:=SHABLON_BANK;        arrShablon[i].Name:='��������� ������'; Inc(i,1);  //18
      arrShablon[i].Kod:=SHABLON_ADD_GRAG;    arrShablon[i].Name:='�������������� �����������'; Inc(i,1);  //19
      arrShablon[i].Kod:=SHABLON_DOK_SEMPOL;  arrShablon[i].Name:='�������� �������������� �������� ���������'; Inc(i,1); // 20

      {$IFDEF ZAGS}
        arrShablon[i].Kod:=SHABLON_SVID_Z;        arrShablon[i].Name:='���������';  Inc(i,1);// 21
        arrShablon[i].Kod:=SHABLON_ISP_DECL_BRAK; arrShablon[i].Name:='������� �� ���������� ���������'; Inc(i,1);    //  22
        arrShablon[i].Kod:=SHABLON_DOCS;          arrShablon[i].Name:='���������'; Inc(i,1);    //  23
        arrShablon[i].Kod:=SHABLON_DECL_ROGD;     arrShablon[i].Name:='��������� � ������ ���� � �������� (����������� #)'; Inc(i,1);    //  24
//        arrShablon[i].Kod:=SHABLON_SM_PIS_PRICH;  arrShablon[i].Name:='������� ����������� ��������� � �/� � ������'; Inc(i,1);    //  25
      {$ELSE}
        arrShablon[i].Kod:=SHABLON_OTM_PASP;      arrShablon[i].Name:='��������� ������� (��������� �� �������)'; Inc(i,1); // 21
        arrShablon[i].Kod:=SHABLON_RES;           arrShablon[i].Name:='���������';  Inc(i,1);     // 22 - ��� ����
        arrShablon[i].Kod:=SHABLON_TRAN;          arrShablon[i].Name:='���������';  Inc(i,1);   //23
        arrShablon[i].Kod:=SHABLON_USLUG;         arrShablon[i].Name:='����������� �� �������'; Inc(i,1);    //24
        arrShablon[i].Kod:=SHABLON_ISP_DECL_BRAK; arrShablon[i].Name:='������� �� ���������� ���������'; Inc(i,1);    //  25
        arrShablon[i].Kod:=SHABLON_OTKAZ_REG;     arrShablon[i].Name:='�������������� ����� ��� �����������';    Inc(i,1);   // 26
        arrShablon[i].Kod:=SHABLON_DOK_LIC;       arrShablon[i].Name:='�������������� ��������� � ������� �����';    Inc(i,1); // 27
      {$ENDIF}
      arrShablon[i].Kod:=SHABLON_SM_PIS_PRICH;  arrShablon[i].Name:='������� ����������� ��������� � �/� � ������'; Inc(i,1);  //
      arrShablon[i].Kod:=SHABLON_NOT_DOK;       arrShablon[i].Name:='������� ���������� ���������'; Inc(i,1);    //

    {$ENDIF}
  {$IFEND}
  for i:=1 to SHABLON_MAX do begin
    edNameShablon.Items.Add(arrShablon[i].Name);
  end;
end;

function TfmShablon.GetName(nKod:Integer): String;
var
  i:Integer;
begin
  Result:='???';
  for i:=1 to SHABLON_MAX do begin
    if arrShablon[i].Kod=nKod then begin
      Result:=arrShablon[i].Name;
      break;
    end;
  end;
end;

function TfmShablon.GetIndex(nKod:Integer): Integer;
var
  i:Integer;
begin
  Result:=-1;
  for i:=1 to  SHABLON_MAX do begin
    if arrShablon[i].Kod=nKod then begin
      Result:=i-1;
      break;
    end;
  end;
end;

function TfmShablon.GetKod(nInd:Integer): Integer;
var
  i:Integer;
begin
  Result:=-1;
  if nInd<=Length(arrShablon)
    then Result:=arrShablon[nInd].Kod;
end;

procedure TfmShablon.TBItemOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmShablon.TBItemCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmShablon.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FChoice then begin
    if (Key = VK_RETURN) then begin
      ModalResult := mrOk;
    end else if (Key = VK_ESCAPE) then begin
      ModalResult := mrCancel;
    end;
  end;
end;

procedure TfmShablon.TBItemAddClick(Sender: TObject);
var
  Ic : TIcon;
begin
  Ic := TIcon.Create;
  TBToolbar.Images.GetIcon(127,Ic);
  try
    EditRecordGrid(TsasaDbGrid(Grid),true,Ic, nil);
  finally
    Ic.Free;
  end;
end;

procedure TfmShablon.TBItemDelClick(Sender: TObject);
var
  lDel:Boolean;
  n:Integer;
  s:String;
begin
 if Grid.DataSource.DataSet.Eof and Grid.DataSource.DataSet.Bof then begin
   Beep;
   Exit;
 end;
 if Problem('   ������� ������� ������ ?   ',mtConfirmation,self) then begin
   s:='';
   lDel:=true;
   {$IF Defined(ZAGS) or Defined(LAIS) }
     if arrShablon[edNameShablon.ItemIndex+1].Kod=SHABLON_SM_PIS_PRICH then begin
         OpenMessage('�������� ������� ������ ...');
         n:=Grid.DataSource.DataSet.FieldByName('ID').AsInteger;
         dmBase.WorkQuery.SQL.text:='SELECT TOP 1 TYPEREG FROM ����������� WHERE typereg='+InttoStr(n);
         dmBase.WorkQuery.Open;
         if dmBase.WorkQuery.Fields[0].AsInteger>0 then begin
           lDel:=false;
           s:='(���� �������)';
         end;
         closeMessage;
     end;
   {$IFEND}
   {$IF Defined(LAIS) or Defined(GKH) }
     if arrShablon[edNameShablon.ItemIndex+1].Kod=SHABLON_DOK_LIC then begin
         OpenMessage('�������� ������� ������ ...');
         n:=Grid.DataSource.DataSet.FieldByName('ID').AsInteger+ADD_KOD_SHABLON;
         dmBase.WorkQuery.SQL.text:='select top 1 typedok from dokuments where typedok='+InttoStr(n);
         dmBase.WorkQuery.Open;
         if dmBase.WorkQuery.Fields[0].AsInteger>0 then begin
           lDel:=false;
           s:='(��������� ���.�����)';
         end;
         closeMessage;
     end;
   {$IFEND}
   if lDel then begin
     DataSource.DataSet.Delete;
     arrShablon[edNameShablon.ItemIndex+1].Modify:=true;
   end else begin
     PutError('�������� ������������ � ����'+s+'. �������� ����������.',self);
   end;
 end;
end;

procedure TfmShablon.TBItemClearFltClick(Sender: TObject);
begin
  DataSource.DataSet.Filtered:=false;
  DataSource.DataSet.Filter  :='';
  TBItemClearFlt.Visible := false;
end;

procedure TfmShablon.TBItemEditClick(Sender: TObject);
var
  Ic : TIcon;
begin
  if Grid.DataSource.DataSet.Eof and Grid.DataSource.DataSet.Bof then begin
    Beep;
    Exit;
  end;
  Ic := TIcon.Create;
  TBToolbar.Images.GetIcon(126,Ic);
  try
    EditRecordGrid(TSasaDbGrid(Grid),false,Ic,nil);
  finally
    Ic.Free;
  end;
end;

procedure TfmShablon.TBItemSetFltClick(Sender: TObject);
var
  lReopen : Boolean;
  strFirstFilter:String;
begin
  strFirstFilter:='';
  DataSource.DataSet.DisableControls;
  if SetGridSeekColumn(Grid.Columns[Grid.SelectedIndex], true, strFirstFilter, lReopen, nil) then begin
    TBItemClearFlt.Visible := true;
    DataSource.DataSet.EnableControls;
    if lReopen then begin
    end;
  end else begin
    DataSource.DataSet.EnableControls;
  end;
end;

initialization
  ModifyShablon:=false;
end.
