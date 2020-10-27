unit fPropHouse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, Db, StdCtrls, Buttons, ExtCtrls, fMain, OpisEdit, MetaTask, funcpr, uFunc;

type
  TfmPropHouse = class(TForm)
    sp: TSplitter;
    Panel1: TPanel;
    gbConst: TGroupBox;
    lbConst: TListBox;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    DataSource: TDataSource;
    GroupBox1: TGroupBox;
    Grid: TDBGridEh;
    Panel2: TPanel;
    sbAdd: TSpeedButton;
    sbDel: TSpeedButton;
    procedure sbAddClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DataSet : TDataSet;
    KeyListConst : TOpisEdit;
    KeyListFull  : TOpisEdit;
    FirstValue : Integer;
    procedure EditModal;
  end;

  procedure CreateAddPriznaki(strName,strKeyList1,strKeyList2 : String;
                              ds : TDataSet; nAddFirst : Integer;
                              lOnlyCreate : Boolean);


implementation

uses dBase;

{$R *.DFM}

procedure CreateAddPriznaki(strName,strKeyList1,strKeyList2 : String;
                          ds : TDataSet; nAddFirst : Integer;
                          lOnlyCreate : Boolean);
var
  fmPropHouse: TfmPropHouse;
begin
  fmPropHouse:=TfmPropHouse.Create(nil);
  try
    fmPropHouse.Caption := strName;
    fmPropHouse.DataSet := ds;
    fmPropHouse.DataSet.First;
//if GlobalTask.CurrentOpisEdit.GetListOpis(FProp.NameOpisEdit, Items, KeyItems) then begin
    fmPropHouse.KeyListConst := GlobalTask.CurrentOpisEdit.GetListOpisA(strKeyList1);
    fmPropHouse.KeyListFull  := GlobalTask.CurrentOpisEdit.GetListOpisA(strKeyList2);
    fmPropHouse.FirstValue   := nAddFirst;
    if lOnlyCreate then begin
      fmPropHouse.btOkClick(nil);
    end else begin
      fmPropHouse.EditModal;
    end;
  finally
    fmPropHouse.Free;
  end;
end;


{ TfmPropHouse }

procedure TfmPropHouse.EditModal;
var
  i : Integer;
begin
  fmMain.ImageList.GetBitmap(IL_ADD_MEN, sbAdd.Glyph);
  fmMain.ImageList.GetBitmap(IL_DEL_MEN, sbDel.Glyph);
  DataSource.DataSet := DataSet;
  for i:=0 to KeyListConst.Items.Count-1 do begin
    lbConst.Items.Add(KeyListConst.Items.Strings[i]);
  end;
  ShowModal;
end;

procedure TfmPropHouse.sbAddClick(Sender: TObject);
begin
  DataSet.Insert;
end;

procedure TfmPropHouse.sbDelClick(Sender: TObject);
var
  fld:TField;
  nSeek:Integer;
begin
  if Problem('   Удалить признак ?  ') then begin
    fld:=DataSet.FindField('ADD_ID');
    if fld=nil then begin
      DataSet.Delete;
    end else begin
      nSeek:=FirstValue+fld.AsInteger;
      if dmBase.tbHouseProps.Locate('KOD',nSeek,[]) then begin
        PutError(' Значение присутствует в базе. ');
      end else begin
        DataSet.Delete;
      end;
    end;
  end;
end;

procedure TfmPropHouse.btOkClick(Sender: TObject);
var
  i   : Integer;
  fld : TField;
begin
  KeyListFull.Items.Clear;
  KeyListFull.KeyList.Clear;
  for i:=0 to KeyListConst.Items.Count-1 do begin
    KeyListFull.Items.Add(KeyListConst.Items.Strings[i]);
    KeyListFull.KeyList.Add(KeyListConst.KeyList.Strings[i]);
  end;
  DataSet.First;
  i := FirstValue;
  fld:=DataSet.FindField('ADD_ID');
  while not DataSet.Eof do begin
    KeyListFull.Items.Add(DataSet.FieldByName('NAME').AsString);
    if fld=nil then begin
      KeyListFull.KeyList.Add(IntToStr(i));
    end else begin
      KeyListFull.KeyList.Add(IntToStr(FirstValue+fld.AsInteger));
    end;
    DataSet.Next;
    Inc(i,1);
  end;
  DataSet.First;
end;

procedure TfmPropHouse.FormCreate(Sender: TObject);
begin
  LoadPosForm( Self );
end;

procedure TfmPropHouse.FormDestroy(Sender: TObject);
begin
  SavePosForm( Self );
end;

end.
