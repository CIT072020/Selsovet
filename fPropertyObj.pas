unit fPropertyObj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fMain, Db, kbmMemTable, TB2Dock, TB2Toolbar, TB2Item, ExtCtrls, Grids, uProject,
  DBGridEh, SasaDBGrid, MetaTask, FuncPr, adsdata, adsfunc, adstable;

type
  TfmPropertyObj = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    memRazdel: TkbmMemTable;
    memProperty: TkbmMemTable;
    TBItemSave: TTBItem;
    TBItemExit: TTBItem;
    dsRazdel: TDataSource;
    dsProperty: TDataSource;
    memRazdelNAME: TStringField;
    memRazdelFNAME: TStringField;
    memRazdelTYPEOBJ: TIntegerField;
    memRazdelNOMER: TIntegerField;
    memRazdelVISIBLE: TBooleanField;
    memRazdelENABLED: TBooleanField;
    memRazdelUSER: TStringField;
    GridRazdel: TSasaDBGrid;
    Splitter: TSplitter;
    GridProperty: TDBGridEh;
    memPropertyID: TAutoIncField;
    memPropertyTYPEOBJ: TSmallintField;
    memPropertyRAZDEL: TIntegerField;
    memPropertyNOMER: TSmallintField;
    memPropertyKOD: TStringField;
    memPropertyNAME: TStringField;
    memPropertyFNAME: TStringField;
    memPropertyEDIZM: TStringField;
    memPropertyEDITMASK: TStringField;
    memPropertyVISIBLE: TBooleanField;
    memPropertyENABLE: TBooleanField;
    memPropertyUSER: TStringField;
    memPropertyOPISEDIT: TStringField;
    memRazdelID: TAutoIncField;
    memPropertyFIELDNAME: TStringField;
    memPropertyWHERESAVE: TSmallintField;
    memPropertyVID: TSmallintField;
    memPropertyWIDTH: TStringField;
    memPropertyTIP: TStringField;
    memPropertyFONT_SIZE: TIntegerField;
    memPropertyFONT_BOLD: TBooleanField;
    memPropertyFONT_KURSIV: TBooleanField;
    memPropertyFONT_PODCH: TBooleanField;
    memPropertyLINE_UP: TBooleanField;
    memPropertyLINE_DOWN: TBooleanField;
    memPropertyDATE_CR: TDateField;
    memPropertyDATE_DEL: TDateField;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    memPropertyNAME_FLT: TStringField;
    memPropertyDEFAULT_OP: TStringField;
    memPropertyADD_FLT: TStringField;
    memPropertyUROV: TIntegerField;
    memPropertyFIELD_FLT: TStringField;
    memPropertyMINVALUE: TIntegerField;
    memPropertyMAXVALUE: TIntegerField;
    memPropertyDISPLAYFORMAT: TStringField;
    TBItemSaveToSysSpr: TTBItem;
    tbPropertysObj: TAdsTable;
    procedure TBItemSaveClick(Sender: TObject);
    procedure TBItemExitClick(Sender: TObject);
    procedure dsPropertyDataChange(Sender: TObject; Field: TField);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItemSaveToSysSprClick(Sender: TObject);
  private
    FChange: Boolean;
    procedure SetChange(const Value: Boolean);
  public
    property Change : Boolean read FChange write SetChange;
    function ReadAllProperty  : Boolean;
    function WriteAllProperty : Boolean;
    constructor Create(Owner : TComponent); override;
    destructor Destroy; override;
  end;

var
  fmPropertyObj: TfmPropertyObj;

implementation

uses dBase, uFilter;

{$R *.DFM}

procedure TfmPropertyObj.TBItemSaveClick(Sender: TObject);
begin
  WriteAllProperty;
  DropFileOpisFilter;
  Close;
end;

procedure TfmPropertyObj.TBItemExitClick(Sender: TObject);
begin
  if Problem('   Выйти без сохранения ?  ') then begin
    Close;
  end;
end;

procedure TfmPropertyObj.SetChange(const Value: Boolean);
begin
  FChange := Value;
end;

constructor TfmPropertyObj.Create(Owner: TComponent);
begin
  inherited;
  FChange := false;
  ReadAllProperty;
  GlobalTask.CurrentOpisEdit.SetKeyForm(Self,nil);
end;

destructor TfmPropertyObj.Destroy;
begin
  inherited;
end;

function TfmPropertyObj.ReadAllProperty: Boolean;
var
  iMax : Integer;
begin
  Result := true;
  memProperty.MasterFields := '';
  memProperty.MasterSource := nil;
  memRazdel.EmptyTable;
  memProperty.EmptyTable;
  memRazdel.LoadFromDataSet(fmMain.mtSprRazdel,[mtcpoAppend,mtcpoFieldIndex]);
  memProperty.LoadFromDataSet(fmMain.mtSprProperty,[mtcpoAppend,mtcpoFieldIndex]);
  {
  memRazdel.LoadFromDataSet(dmBase.SprRazdel1,[mtcpoAppend,mtcpoFieldIndex]);
  memProperty.LoadFromDataSet(dmBase.SprProperty1,[mtcpoAppend,mtcpoFieldIndex]);
  }
  with memRazdel do begin
    First;
    iMax := 1;
    while not Eof do begin
      if FieldByName('ID').AsInteger > iMax
        then iMax := FieldByName('ID').AsInteger;
      Next;
    end;
    AutoIncMinValue := iMax+1;
    ResetAutoInc;
    First;
  end;
  with memProperty do begin
    First;
    iMax := 1;
    while not Eof do begin
      if FieldByName('ID').AsInteger > iMax
        then iMax := FieldByName('ID').AsInteger;
      Next;
    end;
    AutoIncMinValue := iMax+1;
    ResetAutoInc;
    First;
  end;
  memProperty.MasterFields := 'TYPEOBJ;ID';
  memProperty.MasterSource := dsRazdel;
end;

function TfmPropertyObj.WriteAllProperty: Boolean;
var
  cur : TCursor;
begin
  cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  memProperty.MasterFields := '';
  memProperty.MasterSource := nil;
  Result := true;

  memRazdel.SaveToFile(Globaltask.PathService+NameFile_Partitions);
  memProperty.SaveToFile(Globaltask.PathService+NameFile_Propertys);
  fmMain.mtSprRazdel.EmptyTable;
  fmMain.mtSprRazdel.LoadFromFile(GlobalTask.PathService+NameFile_Partitions);
  fmMain.mtSprProperty.EmptyTable;
  fmMain.mtSprProperty.LoadFromFile(GlobalTask.PathService+NameFile_Propertys);
  {
  dmBase.SprRazdel1.Close;
  dmBase.SprRazdel1.Exclusive:=true;
  dmBase.SprRazdel1.Open;
  dmBase.SprRazdel1.AdsZapTable;
  dmBase.SprRazdel1.Close;
  dmBase.SprRazdel1.Exclusive:=false;
  dmBase.SprRazdel1.Open;
  dmBase.SprProperty1.Close;
  dmBase.SprProperty1.Exclusive:=true;
  dmBase.SprProperty1.Open;
  dmBase.SprProperty1.AdsZapTable;
  dmBase.SprProperty1.Close;
  dmBase.SprProperty1.Exclusive:=false;
  dmBase.SprProperty1.Open;
  memRazdel.SaveToDataSet(dmBase.SprRazdel1);
  memProperty.SaveToDataSet(dmBase.SprProperty1);
  }
  memProperty.MasterFields := 'TYPEOBJ;ID';
  memProperty.MasterSource := dsRazdel;
  memRazdel.First;
  Screen.Cursor := cur;
end;

procedure TfmPropertyObj.dsPropertyDataChange(Sender: TObject;
  Field: TField);
begin
  if Field<>nil then begin
    if Field.FieldName = 'NAME' then begin
      if (memPropertyFNAME.AsString='') and (Field.AsString<>'') then begin
        memPropertyFNAME.AsString := Field.AsString;
      end;
    end;
  end;
end;

procedure TfmPropertyObj.TBItem1Click(Sender: TObject);
begin
  memRazdel.SaveToFile(Globaltask.PathService+NameFile_Partitions);
  memProperty.SaveToFile(Globaltask.PathService+NameFile_Propertys);
end;

procedure TfmPropertyObj.TBItem2Click(Sender: TObject);
begin
  memProperty.MasterFields := '';
  memProperty.MasterSource := nil;
  memRazdel.EmptyTable;
  memProperty.EmptyTable;
  memRazdel.LoadFromFile(Globaltask.PathService+NameFile_Partitions);
  memProperty.LoadFromFile(Globaltask.PathService+NameFile_Propertys);
  memProperty.MasterFields := 'TYPEOBJ;ID';
  memProperty.MasterSource := dsRazdel;
  memRazdel.First;
end;

procedure TfmPropertyObj.TBItemSaveToSysSprClick(Sender: TObject);
var
  i:Integer;
begin
  if Problem('Вы уверены ?') then begin
  //  tbPropertysObj.FieldDefs.Clear;
  //  tbPropertysObj.FieldDefs.Assign(memProperty.FieldDefs);
  //  tbPropertysObj.CreateTable;
    tbPropertysObj.Open;
    memProperty.MasterFields := '';
    memProperty.MasterSource := nil;
    memProperty.First;
    while not memProperty.Eof do begin
      tbPropertysObj.Append;
      for i:=0 to memProperty.FieldCount-1 do begin
        if memProperty.Fields[i].DataType=ftAutoInc then begin

        end else begin
          tbPropertysObj.Fields[i].Value:=memProperty.Fields[i].Value;
        end;
      end;
      tbPropertysObj.Post;
      memProperty.Next;
    end;
    tbPropertysObj.Close;
    memProperty.MasterFields := 'TYPEOBJ;ID';
    memProperty.MasterSource := dsRazdel;
    memRazdel.First;
  end;
end;

end.
