unit fExportStru;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, AdsCnnct, Db, adsdata, adsfunc, adstable, FuncPr,
  DbFunc;

type
  TfmExportStru = class(TForm)
    Panel2: TPanel;
    btPrint: TBitBtn;
    btExit: TBitBtn;
    edStru: TMemo;
    Query: TAdsQuery;
    Query1: TAdsQuery;
    procedure btPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    Connection : TAdsConnection;
    function ExportStru( sl : TStringList ) : Boolean;
  end;

var
  fmExportStru: TfmExportStru;

implementation

{$R *.DFM}

{ TfmExportStru }

function TfmExportStru.ExportStru(sl: TStringList): Boolean;
var
  s : String;
  old : TCursor;
  lAds10:Boolean;
begin
  old := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  if Copy(Query.Version,1,1)='8' then lAds10:=false else lAds10:=true;
  Query.DatabaseName  := Connection.Name;
  Query1.DatabaseName := Connection.Name;
  Query.SQL.Text := 'Select * from '+CheckSysView('system.dictionary',lAds10);
  Query.Open;
  with Query do begin
    s := 'База: '+FieldByName('Comment').AsString + '  ( Версия '+
         FieldByName('Version_Major').AsString+'.'+FieldByName('Version_Minor').AsString+' )';
    sl.Add( s );
  end;
  Query.Close;
  Query.SQL.Text := 'Select * from '+CheckSysView('system.tables',lAds10);
  Query.Open;
  while not Query.Eof do begin
    sl.Add( '-----------------------------------------');
    sl.Add( 'Таблица : ' + Query.FieldByName('Name').AsString );
    Query1.SQL.Text := 'Select * from '+CheckSysView('system.columns',lAds10)+' where parent='+''''+
            Query.FieldByName('Name').AsString+''''+' order by field_num';
    Query1.Open;
    while not Query1.Eof do begin
      s := PadRStr(Query1.FieldByName('Name').AsString,20,' ');
      s := s + GetStruColumn( Query1 );
      s := s + '   '+Query1.FieldByName('Comment').AsString;
      sl.Add( '      ' + s);
      Query1.Next;
    end;
    Query1.Close;
    Query.Next;
  end;
  Query.Close;
  Result := true;
  Screen.Cursor := old;
end;

procedure TfmExportStru.btPrintClick(Sender: TObject);
var
  sl : TStringList;
  i : Integer;
begin
  sl := TStringList.Create;;
  if ExportStru( sl ) then begin
    for i:=0 to sl.Count-1 do begin
      edStru.Lines.Add( sl.Strings[i] );
    end;
  end;
  sl.Free;
end;

end.
