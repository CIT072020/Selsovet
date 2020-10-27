unit fShowErrorGISUN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ValEdit;

type
  TfmShowErrorGISUN = class(TForm)
    Grid: TDBGridEh;
    Panel: TPanel;
    btOk: TBitBtn;
    DataSource: TDataSource;
    ValList: TValueListEditor;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ShowAsForm:Boolean;
    procedure CheckColumns;
  end;

var
  fmShowErrorGISUN: TfmShowErrorGISUN;

implementation

{$R *.dfm}

procedure TfmShowErrorGISUN.FormActivate(Sender: TObject);
begin
   SetWindowPos(Handle,
                          HWND_TOPMOST,
                          Left,
                          Top,
                          Width,
                          Height,
                          SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

procedure TfmShowErrorGISUN.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then begin
    Close;
  end;
end;

procedure TfmShowErrorGISUN.CheckColumns;
var
  ds:TDataSet;
  arr: array[1..7] of Boolean;
  i:Integer;
begin
  if DataSource.DataSet<>nil then begin
    ds:=DataSource.DataSet;
    if (ds.RecordCount=1) and ShowAsForm then begin
      Grid.Visible:=false;
      ValList.Align:=alClient;
      ValList.Strings.Clear;
      ValList.Strings.Add('Код='+ds.FieldByName('ERROR_CODE').AsString);
      if ds.FieldByName('ERROR_TEXT').AsString<>'' then ValList.Strings.Add(Grid.Columns[1].Title.Caption+'='+ds.FieldByName('ERROR_TEXT').AsString);
      if ds.FieldByName('DESCRIPTION').AsString<>'' then ValList.Strings.Add(Grid.Columns[2].Title.Caption+'='+ds.FieldByName('DESCRIPTION').AsString);
      if ds.FieldByName('CHECK_NAME').AsString<>'' then ValList.Strings.Add(Grid.Columns[3].Title.Caption+'='+ds.FieldByName('CHECK_NAME').AsString);
      if ds.FieldByName('WRONG_VALUE').AsString<>'' then ValList.Strings.Add(Grid.Columns[4].Title.Caption+'='+ds.FieldByName('WRONG_VALUE').AsString);
      if ds.FieldByName('CORRECT_VALUE').AsString<>'' then ValList.Strings.Add(Grid.Columns[5].Title.Caption+'='+ds.FieldByName('CORRECT_VALUE').AsString);
      if ds.FieldByName('ERROR_PLACE').AsString<>'' then ValList.Strings.Add(Grid.Columns[6].Title.Caption+'='+ds.FieldByName('ERROR_PLACE').AsString);
      if ds.FieldByName('IDENTIF').AsString<>'' then ValList.Strings.Add(Grid.Columns[7].Title.Caption+'='+ds.FieldByName('IDENTIF').AsString);
      ClientHeight:=ValList.DefaultRowHeight*(ValList.Strings.Count+1)+Panel.Height;
      ActiveControl:=ValList;
    end else begin
      Grid.Align:=alClient;
      ValList.Visible:=false;
      for i:=1 to 7 do arr[i]:=false;
      ds.DisableControls;
      try
        ds.First;
        while not ds.Eof do begin
          if ds.FieldByName('ERROR_TEXT').AsString<>''    then arr[1]:=true;
          if ds.FieldByName('DESCRIPTION').AsString<>''   then arr[2]:=true;
          if ds.FieldByName('CHECK_NAME').AsString<>''    then arr[3]:=true;
          if ds.FieldByName('WRONG_VALUE').AsString<>''   then arr[4]:=true;
          if ds.FieldByName('CORRECT_VALUE').AsString<>'' then arr[5]:=true;
          if ds.FieldByName('ERROR_PLACE').AsString<>''   then arr[6]:=true;
          if ds.FieldByName('IDENTIF').AsString<>''       then arr[7]:=true;
          ds.Next;
        end;
        ds.First;
        for i:=1 to 7 do Grid.Columns[i].Visible:=arr[i];
      finally
        ds.EnableControls;
      end;
    end;
  end;
end;

procedure TfmShowErrorGISUN.FormCreate(Sender: TObject);
begin
  ShowAsForm:=false;
end;

end.
