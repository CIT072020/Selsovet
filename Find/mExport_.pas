unit mExport;
//Недостатки:
// - memo в dbf
//
interface
uses
   Windows, Dialogs, Forms, Controls, Classes, DB, SysUtils, Graphics, ShellApi,
   DBGridEh,
   fWait,
   fGauge,
   fDlgExp,
   mDbfLite,
   fViewDbf,
   fViewTxt,
   mBIFF8,
   mCDoc;

type
   TExportFormat=(efHtml, efTxt, efDbf, efCsv, efRtf, efXls);
   TExportFormats=set of TExportFormat;
   TColorArray=array of TColor;
   TBreakException=class(Exception);
   TIntegerArray=array of Integer;
   TStringArray=array of string;

const
   FormatInd: array [1..6] of TExportFormat=(efHtml, efTxt, efDbf, efCsv, efRtf, efXls);
   FormatName: array [TExportFormat] of string=('Файл HTML', 'Текстовый файл', 'Файл DBF', 'Файл CSV', 'Файл Word', 'Файл Excel');
   FormatExt: array [TExportFormat] of string=('htm', 'txt', 'dbf', 'csv', 'rtf', 'xls');
   FormatId: array [TExportFormat] of string=('HTML', 'TXT', 'DBF', 'CSV', 'RTF', 'XLS');

const
   DefBooleanName: array [Boolean] of string=('F', 'T');
   //DefBooleanName: array [Boolean] of string=('0', '1');

type

   // export row format parameters
   TExportRowParam=class(TObject)
   private
      FBold: Boolean;
   public
      constructor Create;
      destructor Destroy; override;
      procedure SetDefault;
   public
      property Bold: Boolean read FBold write FBold;
   end;

   TOnExportRowParamEvent=procedure (Data: TObject; Param: TExportRowParam) of object;

   // hierarchy                                    comments
   // -------------------------------------------------------------------------
   // TExportColumn                                export column class
   // TExportColumnList                            export column list class
   // -------------------------------------------------------------------------

   // export column class
   TExportColumn=class(TObject)
   private
      FFont: TFont;
      FDisplayName: string;
      FCaption: string; // in table head
      FDisplayWidth: Integer; // width in symbols
      FWidth: Integer; // width in pixels
      FVisible: Boolean;
      FAlignment: TAlignment; // horizontal
      FColor: TColor; // background
      FFieldNameInFile: string;
      FColumnEh: TColumnEh;
      // read only
      FFieldName: string;
      FFieldIndex: Integer;
      // calculated
      FAveCharWidth: Integer;
      FOverhang: Integer;
      FBgColorIndex: Integer;
      FFgColorIndex: Integer;
      FSpaceBefore: Integer;
      FSpaceAfter: Integer;
   private
      procedure CalcFont;
      procedure SetFont(NewFont: TFont);
      procedure SetAllDefault;
   public
      constructor Create(FieldName: string; FieldIndex: Integer);
      destructor Destroy; override;
      procedure Hide;
      procedure Show;
      procedure UpdateWidth(FontSize: Integer; FontName: string);
      procedure Assign(ExportColumn: TExportColumn);
   public
      property Font: TFont read FFont write SetFont;
      property DisplayName: string read FDisplayName write FDisplayName;
      property Caption: string read FCaption write FCaption;
      property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
      property Width: Integer read FWidth write FWidth;
      property Visible: Boolean read FVisible write FVisible;
      property Alignment: TAlignment read FAlignment write FAlignment;
      property Color: TColor read FColor write FColor;
      property FieldNameInFile: string read FFieldNameInFile write FFieldNameInFile;
      property ColumnEh: TColumnEh read FColumnEh write FColumnEh;
      // read only
      property FieldName: string read FFieldName;
      property FieldIndex: Integer read FFieldIndex write FFieldIndex;
      // calculated
      property AveCharWidth: Integer read FAveCharWidth;
      property Overhang: Integer read FOverhang;
      property BgColorIndex: Integer read FBgColorIndex write FBgColorIndex;
      property FgColorIndex: Integer read FFgColorIndex write FFgColorIndex;
      property SpaceBefore: Integer read FSpaceBefore write FSpaceBefore;
      property SpaceAfter: Integer read FSpaceAfter write FSpaceAfter;
   end;

   // export column list class
   TExportColumnList=class(TObject)
   private
      FList: TList;
      FFontSize: Integer;
      FFontNo: Integer;
      FBoldHead: Boolean;
      FGridLine: Boolean;
      FRowKeep: Boolean;
      FOnExportRowParam: TOnExportRowParamEvent;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TExportColumn;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      procedure Insert(Ind: Integer; ExportColumn: TExportColumn);
      function Add(ExportColumn: TExportColumn): Integer;
      function AddNew(FieldName: string; FieldIndex: Integer): TExportColumn;
      function AddNew2(FieldName: string; FieldIndex: Integer; DisplayName, Caption: string; Width: Integer): TExportColumn;
      procedure UpdateWidth(FontSize: Integer; FontName: string);
      procedure HideAll;
      procedure ShowAll;
      procedure DeleteHided;
      procedure Assign(ExportColumns: TExportColumnList);
      procedure BuildColorTable(var ColorTable: TColorArray);
      function IsVisible: Boolean;
      function SelCount: Integer;
      function ByFieldName(FieldName: string): TExportColumn;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TExportColumn read GetItem; default;
      property FontSize: Integer read FFontSize write FFontSize;
      property FontNo: Integer read FFontNo write FFontNo;
      property BoldHead: Boolean read FBoldHead write FBoldHead;
      property GridLine: Boolean read FGridLine write FGridLine;
      property OnExportRowParam: TOnExportRowParamEvent read FOnExportRowParam write FOnExportRowParam;
      property RowKeep: Boolean read FRowKeep write FRowKeep;
   end;

   // hierarchy                                    comments
   // -------------------------------------------------------------------------
   // TExportDataProvider                          abstract class
   //  |-- TExportDataSet                          TDataSet
   //  |-- TExportDataSet2                         TDataSet
   // TExportDataProviderList
   // -------------------------------------------------------------------------

   TExportDataProviderClass=class of TExportDataProvider;

   // abstract export data provider class
   TExportDataProvider=class(TObject)
   protected
      FExportColumns: TExportColumnList;
      FExcludeFields: string;
      FDateFormat: string;
      FFloatFormat: string;
      FReadBuffer: Integer;
      FSheetName: string;
      // export events
      FOnExportRowParam: TOnExportRowParamEvent;
   public
      constructor Create(Data: TObject; ExcludeFields: string); virtual;
      destructor Destroy; override;
      procedure SetDefaultFormat;
      // field property
      function IsFieldNull(I: Integer): Boolean; virtual; abstract;
      function IsFieldString(I: Integer): Boolean; virtual; abstract;
      function IsFieldNumber(I: Integer): Boolean; virtual; abstract;
      function GetFieldName(I: Integer): string; virtual; abstract;
      function GetFieldValue(I: Integer): string; virtual; abstract;
      function GetFieldDouble(I: Integer): Double; virtual; abstract;
      function GetCaption(I: Integer): string; virtual; abstract;
      function GetDisplayName(I: Integer): string; virtual; abstract;
      function GetDisplayWidth(I: Integer): Integer; virtual; abstract;
      function GetWidth(I: Integer): Integer; virtual; abstract;
      function GetFont(I: Integer): TFont; virtual; abstract;
      procedure SetDbfField(FieldName: string; var DBFField: TDBFFieldRec); virtual; abstract;
      // datset
      procedure SetDefaultColumnList; virtual; abstract;
      function GetEof: Boolean; virtual; abstract;
      function GetFieldCount: Integer; virtual; abstract;
      function GetRecordCount: Integer; virtual; abstract;
      procedure FirstData; virtual; abstract;
      procedure NextData; virtual; abstract;
      procedure BeforeExportData; virtual; abstract;
      procedure AfterExportData; virtual; abstract;
      function FindFieldName(FieldName: string): Boolean; virtual; abstract;
      // export events
      procedure DoExportRowParam(Param: TExportRowParam); virtual; abstract;
   public
      property ExportColumns: TExportColumnList read FExportColumns;
      property DateFormat: string read FDateFormat write FDateFormat;
      property FloatFormat: string read FFloatFormat write FFloatFormat;
      property ReadBuffer: Integer read FReadBuffer write FReadBuffer;
      property SheetName: string read FSheetName write FSheetName;
      // export events
      property OnExportRowParam: TOnExportRowParamEvent read FOnExportRowParam write FOnExportRowParam;
   end;

   // export data provider list class
   TExportDataProviderList=class(TObject)
   private
      FList: TList;
   private
      function GetCount: Integer;
      function GetItem(I: Integer): TExportDataProvider;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Clear;
      function Add(Item: TExportDataProvider): Integer;
      function AddNew(ItemClass: TExportDataProviderClass; Data: TObject; ExcludeFields: string): TExportDataProvider;
      function InsertNew(InsPos: Integer; ItemClass: TExportDataProviderClass; Data: TObject; ExcludeFields: string): TExportDataProvider;
      // for all item
      procedure SetDefaultColumnList;
   public
      property Count: Integer read GetCount;
      property Item[I: Integer]: TExportDataProvider read GetItem; default;
   end;

   // export TDataSet provider
   TExportDataSet=class(TExportDataProvider)
   protected
      FCount: Integer;
      FDataSet: TDataSet;
   public
      constructor Create(Data: TObject; ExcludeFields: string); override;
      destructor Destroy; override;
      // field property
      function IsFieldNull(I: Integer): Boolean; override;
      function IsFieldString(I: Integer): Boolean; override;
      function IsFieldNumber(I: Integer): Boolean; override;
      function GetFieldName(I: Integer): string; override;
      function GetFieldValue(I: Integer): string; override;
      function GetFieldDouble(I: Integer): Double; override;
      function GetCaption(I: Integer): string; override;
      function GetDisplayName(I: Integer): string; override;
      function GetDisplayWidth(I: Integer): Integer; override;
      function GetWidth(I: Integer): Integer; override;
      function GetFont(I: Integer): TFont; override;
      procedure SetDbfField(FieldName: string; var DBFField: TDBFFieldRec); override;
      // datset
      procedure SetDefaultColumnList; override;
      function GetEof: Boolean; override;
      function GetFieldCount: Integer; override;
      function GetRecordCount: Integer; override;
      procedure FirstData; override;
      procedure NextData; override;
      procedure BeforeExportData; override;
      procedure AfterExportData; override;
      function FindFieldName(FieldName: string): Boolean; override;
      // events
      procedure DoExportRowParam(Param: TExportRowParam); override;
   public
      property DataSet: TDataSet read FDataSet;
   end;

   // export TDataSet2 provider
   TExportDataSet2=class(TExportDataSet)
   private
      FList: TList;
      FColCellParamsEh: TColCellParamsEh;
   public
      constructor Create(Data: TObject; ExcludeFields: string); override;
      destructor Destroy; override;
      function IsFieldNull(I: Integer): Boolean; override;
      function GetFieldValue(I: Integer): string; override;
      function GetFieldDouble(I: Integer): Double; override;
      procedure SetDefaultColumnList; override;
   end;

   // hierarchy                                   comments
   // -------------------------------------------------------------------------
   // TExportDataToFile                           abstract class (export)
   //  |-- TExportAddDataToFile                   abstract class (export or add)
   //  |    |-- TExportDataToDbf                  dbf
   //  |    \-- TExportDataToCsv                  csv
   //  |-- TExportDataToXls                       xls (biff<5)
   //  |-- TExportDataToXls8                      xls (biff8)
   //  |-- TExportDataToRtf                       rtf
   //  |-- TExportDataToHtml                      html
   //  \-- TExportDataToTxt                       txt
   // -------------------------------------------------------------------------

   // abstract export data to file class
   TExportDataToFile=class(TObject)
   private
      FFileName: string;
      FFileExt: string;
      FCaption: string;
      FInterval: Integer;
      FShowGauge: Boolean;
      FHide: Boolean;
      // read only
      FRecordCount: Integer;
      FRecordProcessed: Integer;
      //
      FWait: TfmWait;
      FGauge: TSimpleGauge;
      FExportData: TExportDataProvider;
      FDataProviderList: TExportDataProviderList;
   private
      procedure ShowStart; virtual;
      procedure ShowStartGauge; virtual;
      procedure ShowUpdate; virtual;
      procedure ShowStop; virtual;
      procedure ShowFinally; virtual;
      function CheckFileExists(CanAdd: Boolean; var RewriteAppend: Boolean): Boolean; virtual;
      function ExportData: Boolean; virtual; abstract;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
      function DoExport: Boolean; virtual;
   public
      property Caption: string read FCaption write FCaption;
      property Interval: Integer read FInterval write FInterval;
      property ShowGauge: Boolean read FShowGauge write FShowGauge;
      property Hide: Boolean read FHide write FHide;
      // read only
      property FileName: string read FFileName;
      property FileExt: string read FFileExt;
      property RecordCount: Integer read FRecordCount;
      property RecordProcessed: Integer read FRecordProcessed;
      //
      property Wait: TfmWait read FWait;
      property Gauge: TSimpleGauge read FGauge;
   end;

   // abstract export (or add) data to file class
   TExportAddDataToFile=class(TExportDataToFile)
   private
      procedure BuildFieldList; virtual; abstract;
      function CreateFile: Boolean; virtual; abstract;
      function CheckFile: Boolean; virtual; abstract;
   public
      function DoExport: Boolean; override;
   end;

   // export data to dbf format
   TExportDataToDbf=class(TExportAddDataToFile)
   private
      FDbfFields: TDBFFieldArray;
   private
      procedure BuildFieldList; override;
      function CreateFile: Boolean; override;
      function CheckFile: Boolean; override;
      function ExportData: Boolean; override;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
   end;

   // export data to csv format
   TExportDataToCsv=class(TExportAddDataToFile)
   private
      procedure BuildFieldList; override;
      function CreateFile: Boolean; override;
      function CheckFile: Boolean; override;
      function ExportData: Boolean; override;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
   end;

   // export data to xls format (biff<5)
   TExportDataToXls=class(TExportDataToFile)
   private
      function ExportData: Boolean; override;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
   end;

   // export data to xls format (biff8)
   TExportDataToXls8=class(TExportDataToFile)
   private
      function ExportData: Boolean; override;
      function oldExportData: Boolean;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
   end;

   // export data to rtf format
   TExportDataToRtf=class(TExportDataToFile)
   private
      function ExportData: Boolean; override;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
   end;

   // export data to html format
   TExportDataToHtml=class(TExportDataToFile)
   private
      function ExportData: Boolean; override;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
   end;

   // export data to txt format
   TExportDataToTxt=class(TExportDataToFile)
   private
      function ExportData: Boolean; override;
   public
      constructor Create(FileName: string; DataProviderList: TExportDataProviderList);
      destructor Destroy; override;
   end;

//
procedure FillColumnList2(Grid: TDBGridEh; ExportColumns: TExportColumnList);
procedure DoExportData(FileName, Msg, ExcludeFields: string; Data: TObject; ExportColumns: TExportColumnList; Target: TExportFormat; ShowResult, Hide, ShowGauge: Boolean; Interval, ReadBuffer: Integer);
//++
function GetTextWidth(Text: string; FontSize: Integer; FontName: string): Integer;
procedure GetFontMetric(FontSize: Integer; FontName: string; var tm: TEXTMETRIC);
procedure StrToArr(S: string; Delimeter: Char; var Arr: TStringArray);
procedure AddString(var S: string; AddS, Delimeter: string);
function GetDeviceCaps(I: Integer): Integer;
function GetTextHeight(Text: string; TextWidth, FontSize: Integer; FontName: string): Integer;
function ColorToHex(Color: TColor): string;

const
   CMaxTableWidth   : Integer = 30000;

implementation

function GetTextWidth(Text: string; FontSize: Integer; FontName: string): Integer;
var
   dc: HDC;
   font: HFONT;
   old: HFONT;
   lf: LOGFONT;
   sz: SIZE;
begin
   lf.lfHeight:=FontSize;
   lf.lfWidth:=0;
   lf.lfEscapement:=0;
   lf.lfOrientation:=0;
   lf.lfWeight:=FW_NORMAL;
   lf.lfItalic:=Byte(0);
   lf.lfUnderline:=Byte(0);
   lf.lfStrikeOut:=Byte(0);
   lf.lfCharSet:=RUSSIAN_CHARSET;
   lf.lfOutPrecision:=OUT_DEFAULT_PRECIS;
   lf.lfClipPrecision:=CLIP_DEFAULT_PRECIS;
   lf.lfQuality:=DEFAULT_QUALITY;
   lf.lfPitchAndFamily:=DEFAULT_PITCH;
   StrPCopy(lf.lfFaceName, FontName);
   dc:=CreateCompatibleDC(0);
   font:=CreateFontIndirect(lf);
   old:=SelectObject(dc, font);
   try
      GetTextExtentPoint32(dc, PChar(Text), Length(Text), sz);
   finally
      SelectObject(dc, old);
      DeleteDC(dc);
      DeleteObject(font);
   end;
   Result:=sz.cx;
end;

procedure GetFontMetric(FontSize: Integer; FontName: string; var tm: TEXTMETRIC);
var
   dc: HDC;
   font: HFONT;
   old: HFONT;
   lf: LOGFONT;
begin
   lf.lfHeight:=FontSize;
   lf.lfWidth:=0;
   lf.lfEscapement:=0;
   lf.lfOrientation:=0;
   lf.lfWeight:=FW_NORMAL;
   lf.lfItalic:=Byte(0);
   lf.lfUnderline:=Byte(0);
   lf.lfStrikeOut:=Byte(0);
   lf.lfCharSet:=RUSSIAN_CHARSET;
   lf.lfOutPrecision:=OUT_DEFAULT_PRECIS;
   lf.lfClipPrecision:=CLIP_DEFAULT_PRECIS;
   lf.lfQuality:=DEFAULT_QUALITY;
   lf.lfPitchAndFamily:=DEFAULT_PITCH;
   StrPCopy(lf.lfFaceName, FontName);
   FillChar(tm, SizeOf(tm), 0);
   dc:=CreateCompatibleDC(0);
   font:=CreateFontIndirect(lf);
   old:=SelectObject(dc, font);
   try
      GetTextMetrics(dc, tm);
   finally
      SelectObject(dc, old);
      DeleteDC(dc);
      DeleteObject(font);
   end;
end;

procedure StrToArr(S: string; Delimeter: Char; var Arr: TStringArray);
var
   P: Integer;
   Last: Boolean;
begin
   SetLength(Arr, 0);
   Last:=(Length(S)>0) and (S[Length(S)]=Delimeter);
   repeat
      P:=Pos(Delimeter, S);
      if P>0 then begin
         SetLength(Arr, Succ(Length(Arr)));
         Arr[Pred(Length(Arr))]:=Copy(S, 1, Pred(P));
         Delete(S, 1, P);
      end
   until P=0;
   if (Length(S)>0) or Last then begin
      SetLength(Arr, Succ(Length(Arr)));
      Arr[Pred(Length(Arr))]:=S;
   end;
end;

procedure AddString(var S: string; AddS, Delimeter: string);
begin
   if S='' then begin
      S:=AddS;
   end
   else if AddS<>'' then begin
      S:=S+Delimeter+AddS;
   end;
end;

function GetDeviceCaps(I: Integer): Integer;
var
   dc: HDC;
begin
   dc:=GetDC(0);
   try
      Result:=Windows.GetDeviceCaps(dc, I);
   finally
      ReleaseDC(0, DC);
   end;
end;

function GetTextHeight(Text: string; TextWidth, FontSize: Integer; FontName: string): Integer;
var
   dc: HDC;
   font: HFONT;
   old: HFONT;
   lf: LOGFONT;
   rect: TRect;
begin
   lf.lfHeight:=FontSize;
   lf.lfWidth:=0;
   lf.lfEscapement:=0;
   lf.lfOrientation:=0;
   lf.lfWeight:=FW_NORMAL;
   lf.lfItalic:=Byte(0);
   lf.lfUnderline:=Byte(0);
   lf.lfStrikeOut:=Byte(0);
   lf.lfCharSet:=RUSSIAN_CHARSET;
   lf.lfOutPrecision:=OUT_DEFAULT_PRECIS;
   lf.lfClipPrecision:=CLIP_DEFAULT_PRECIS;
   lf.lfQuality:=DEFAULT_QUALITY;
   lf.lfPitchAndFamily:=DEFAULT_PITCH;
   StrPCopy(lf.lfFaceName, FontName);
   rect:=Bounds(0, 0, TextWidth, 0);
   dc:=CreateCompatibleDC(0);
   font:=CreateFontIndirect(lf);
   old:=SelectObject(dc, font);
   try
      Result:=DrawTextEx(dc, PChar(Text), Length(Text), rect, DT_CALCRECT or DT_NOPREFIX or DT_WORDBREAK, nil);
   finally
      SelectObject(dc, old);
      DeleteDC(dc);
      DeleteObject(font);
   end;
end;

function ColorToHex(Color: TColor): string;
var
   RGB: Longint;
begin
   RGB:=ColorToRGB(Color);
   Result:=IntToHex(RGB and $000000FF, 2)+
           IntToHex((RGB and $0000FF00) shr 8, 2)+
           IntToHex((RGB and $00FF0000) shr 16, 2);
end;

procedure FillColumnList2(Grid: TDBGridEh; ExportColumns: TExportColumnList);
var
   I: Integer;
   Field: TField;
   Column: TColumnEh;
   ExportColumn: TExportColumn;
begin
   if ExportColumns<>nil then begin
      ExportColumns.Clear;
      for I:=0 to Pred(Grid.Columns.Count) do begin
         Column:=Grid.Columns[I];
         Field:=Column.Field;
         if Column.Visible and (Field<>nil) then begin
            ExportColumn:=ExportColumns.AddNew(Field.FieldName, Field.Index);
            ExportColumn.ColumnEh:=Column;
            ExportColumn.DisplayName:=StringReplace(Column.Title.Caption, '|', ' ', [rfReplaceAll]);
            ExportColumn.Caption:=Column.Title.Caption;
            ExportColumn.Font:=Column.Font;
            ExportColumn.Color:=Column.Color;
            ExportColumn.Width:=Column.Width;
            ExportColumn.Alignment:=Column.Alignment;
         end;
      end;
   end;
end;

procedure DoExportData(FileName, Msg, ExcludeFields: string; Data: TObject; ExportColumns: TExportColumnList; Target: TExportFormat; ShowResult, Hide, ShowGauge: Boolean; Interval, ReadBuffer: Integer);
var
   I: Integer;
   List: TList;
   flOk: Boolean;
   Exp: TExportDataToFile;
   DataProviderList: TExportDataProviderList;
   ExportData: TExportDataProvider;

   function AddProvider(Data: TDataSet): TExportDataProvider;
   begin
      if Target=efDbf then begin
         Result:=DataProviderList.AddNew(TExportDataSet, Data, ExcludeFields);
      end
      else begin
         Result:=DataProviderList.AddNew(TExportDataSet2, Data, ExcludeFields);
      end;
   end;

begin
   ExportData:=nil;
   DataProviderList:=TExportDataProviderList.Create;
   try
      if Data is TDataSet then begin
         ExportData:=AddProvider(Data as TDataSet);
      end
      else if Data is TList then begin
         List:=Data as TList;
         for I:=0 to Pred(List.Count) do begin
            if TObject(List[I]) is TDataSet then begin
               ExportData:=AddProvider(TObject(List[I]) as TDataSet);
            end;
         end;
      end;
      if ExportData<>nil then begin
         if ExportColumns<>nil then begin
            ExportData.ExportColumns.Assign(ExportColumns);
         end;
         Screen.Cursor:=crAppStart;
         try
            flOk:=False;
            Exp:=nil;
            case Target of
               efDbf: begin
                  Exp:=TExportDataToDbf.Create(FileName, DataProviderList);
               end;
               efCsv: begin
                  Exp:=TExportDataToCsv.Create(FileName, DataProviderList);
               end;
               efXls: begin
                  //Exp:=TExportDataToXls.Create(FileName, DataProviderList);
                  Exp:=TExportDataToXls8.Create(FileName, DataProviderList);
               end;
               efRtf: begin
                  Exp:=TExportDataToRtf.Create(FileName, DataProviderList);
               end;
               efTxt: begin
                  Exp:=TExportDataToTxt.Create(FileName, DataProviderList);
               end;
               efHtml: begin
                  Exp:=TExportDataToHtml.Create(FileName, DataProviderList);
               end;
            end;
            if Exp<>nil then begin
               Exp.Interval:=Interval;
               Exp.Hide:=Hide;
               Exp.ShowGauge:=ShowGauge;
               Exp.Caption:=Msg;
               try
                  try
                     flOk:=Exp.DoExport;
                  except
                     on E: TBreakException do begin
                        flOk:=True;
                        ShowMessage(E.Message);
                     end;
                  end;
               finally
                  Exp.Free;
               end;
            end;
         finally
            Screen.Cursor:=crDefault;
         end;
         if flOk and ShowResult then begin
            case Target of
               efRtf, efXls, efHtml: begin
                  ShellExecute(Application.Handle, nil, PChar(FileName), nil, nil, SW_SHOWNORMAL);
               end;
               efTxt, efCsv: begin
                  ViewTextFile(FileName);
               end;
               efDbf: begin
                  ViewDbf(FileName);
               end;
            end;
         end;
      end;
   finally
      DataProviderList.Free;
   end;
end;

{ TExportColumn }

procedure TExportColumn.Assign(ExportColumn: TExportColumn);
begin
   if ExportColumn<>nil then begin
      FFieldName:=ExportColumn.FieldName;
      FFieldIndex:=ExportColumn.FieldIndex;
      FDisplayName:=ExportColumn.DisplayName;
      FCaption:=ExportColumn.Caption;
      FDisplayWidth:=ExportColumn.DisplayWidth;
      FWidth:=ExportColumn.Width;
      FVisible:=ExportColumn.Visible;
      FColor:=ExportColumn.Color;
      FFont.Assign(ExportColumn.Font);
      FAveCharWidth:=ExportColumn.AveCharWidth;
      FOverhang:=ExportColumn.Overhang;
      FAlignment:=ExportColumn.Alignment;
      FColumnEh:=ExportColumn.ColumnEh;
      FSpaceBefore:=ExportColumn.SpaceBefore;
      FSpaceAfter:=ExportColumn.SpaceAfter;
   end;
end;

procedure TExportColumn.CalcFont;
var
   tm: TEXTMETRIC;
begin
   FAveCharWidth:=GetTextWidth('0', FFont.Height, FFont.Name);
   GetFontMetric(FFont.Height, FFont.Name, tm);
   FOverhang:=tm.tmOverhang;
end;

constructor TExportColumn.Create(FieldName: string; FieldIndex: Integer);
begin
   FFont:=TFont.Create;
   FFieldName:=FieldName;
   FFieldNameInFile:=FieldName;
   FFieldIndex:=FieldIndex;
   FColumnEh:=nil;
   SetAllDefault;
end;

destructor TExportColumn.Destroy;
begin
   FFont.Free;
   inherited;
end;

procedure TExportColumn.Hide;
begin
   FVisible:=False;
end;

procedure TExportColumn.SetAllDefault;
begin
   FFont.Name:='MS Sans Serif';
   FFont.Size:=8;
   FFont.Color:=clBlack;
   CalcFont;
   FDisplayName:=FFieldName;
   FCaption:=FFieldName;
   FDisplayWidth:=0;
   FWidth:=0;
   FVisible:=True;
   FAlignment:=taLeftJustify;
   FColor:=clWhite;
   FSpaceBefore:=55;
   FSpaceAfter:=15;
end;

procedure TExportColumn.SetFont(NewFont: TFont);
begin
   if NewFont<>nil then begin
      FFont.Assign(NewFont);
      CalcFont;
   end;
end;

procedure TExportColumn.Show;
begin
   FVisible:=True;
end;

procedure TExportColumn.UpdateWidth(FontSize: Integer; FontName: string);
var
   OldCharWidth: Integer;
   OldOverhang: Integer;
   NewOverhang: Integer;
   NewCharWidth: Integer;
begin
   OldOverhang:=FOverhang;
   OldCharWidth:=FAveCharWidth;
   FFont.Size:=FontSize;
   FFont.Name:=FontName;
   CalcFont;
   NewCharWidth:=FAveCharWidth;
   NewOverhang:=FOverhang;
   if (FWidth<>0) and (FDisplayWidth=0) then begin
      FDisplayWidth:=(FWidth-OldOverhang-4) div (OldCharWidth-OldOverhang);
   end
   else if (FWidth=0) and (FDisplayWidth=0) then begin
      FDisplayWidth:=Length(FDisplayName);
   end
   else if (FWidth<>0) and (FDisplayWidth<>0) then begin
      if FWidth<>(FDisplayWidth*OldCharWidth) then begin
         FDisplayWidth:=(FWidth-OldOverhang-4) div (OldCharWidth-OldOverhang);
      end;
   end;
   FWidth:=FDisplayWidth*(NewCharWidth-NewOverhang)+NewOverhang+4;
end;

{ TExportColumnList }

function TExportColumnList.Add(ExportColumn: TExportColumn): Integer;
begin
   Result:=FList.Add(ExportColumn);
end;

function TExportColumnList.AddNew(FieldName: string; FieldIndex: Integer): TExportColumn;
begin
   Result:=TExportColumn.Create(FieldName, FieldIndex);
   Add(Result);
end;

function TExportColumnList.AddNew2(FieldName: string; FieldIndex: Integer; DisplayName, Caption: string; Width: Integer): TExportColumn;
begin
   Result:=AddNew(FieldName, FieldIndex);
   if DisplayName='' then begin
      DisplayName:=Caption;
   end;
   if Caption='' then begin
      Caption:=DisplayName;
   end;
   Result.DisplayName:=DisplayName;
   Result.Caption:=Caption;
   Result.Width:=Width;
end;

procedure TExportColumnList.Assign(ExportColumns: TExportColumnList);
var
   I: Integer;
   Item: TExportColumn;
   NewItem: TExportColumn;
begin
   if ExportColumns<>nil then begin
      FGridLine:=ExportColumns.GridLine;
      Clear;
      for I:=0 to Pred(ExportColumns.Count) do begin
         Item:=ExportColumns[I];
         if Item<>nil then begin
            NewItem:=AddNew(Item.FieldName, Item.FieldIndex);
            NewItem.Assign(Item);
         end;
      end;
      FFontNo:=ExportColumns.FontNo;
      FFontSize:=ExportColumns.FontSize;
      FBoldHead:=ExportColumns.BoldHead;
      FGridLine:=ExportColumns.GridLine;
      FRowKeep:=ExportColumns.RowKeep;
      FOnExportRowParam:=ExportColumns.OnExportRowParam;
   end;
end;

procedure TExportColumnList.BuildColorTable(var ColorTable: TColorArray);
var
   I: Integer;
   J: Integer;
   Item: TExportColumn;

   function AddColor(Color: TColor): Integer;
   begin
      SetLength(ColorTable, Succ(Length(ColorTable)));
      Result:=Pred(Length(ColorTable));
      ColorTable[Result]:=ColorToRGB(Color);
      Inc(Result);
   end;

begin
   SetLength(ColorTable, 0);
   AddColor(clWhite);
   AddColor(clBlack);
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.BgColorIndex:=-1;
         for J:=0 to Pred(Length(ColorTable)) do begin
            if ColorToRGB(Item.Color)=ColorTable[J] then begin
               Item.BgColorIndex:=Succ(J);
               Break;
            end;
         end;
         if Item.BgColorIndex=-1 then begin
            Item.BgColorIndex:=AddColor(Item.Color);
         end;
         Item.FgColorIndex:=-1;
         for J:=0 to Pred(Length(ColorTable)) do begin
            if ColorToRGB(Item.Font.Color)=ColorTable[J] then begin
               Item.FgColorIndex:=Succ(J);
               Break;
            end;
         end;
         if Item.FgColorIndex=-1 then begin
            Item.FgColorIndex:=AddColor(Item.Font.Color);
         end;
      end;
   end;
end;

procedure TExportColumnList.Clear;
var
   I: Integer;
   Item: TExportColumn;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

function TExportColumnList.ByFieldName(FieldName: string): TExportColumn;
var
   I: Integer;
   Item: TExportColumn;
begin
   Result:=nil;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and SameText(FieldName, Item.FieldName) then begin
         Result:=Item;
      end;
   end;
end;

constructor TExportColumnList.Create;
begin
   FList:=TList.Create;
   FFontSize:=8;
   FFontNo:=0;
   FBoldHead:=False;
   FGridLine:=False;
   FRowKeep:=False;
end;

procedure TExportColumnList.DeleteHided;
var
   I: Integer;
   Item: TExportColumn;
begin
   I:=0;
   while I<GetCount do begin
      Item:=GetItem(I);
      if (Item<>nil) and (not Item.Visible) then begin
         Item.Free;
         FList.Delete(I);
      end
      else begin
         Inc(I);
      end;
   end;
end;

destructor TExportColumnList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TExportColumnList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TExportColumnList.GetItem(I: Integer): TExportColumn;
begin
   Result:=TExportColumn(FList[I]);
end;

procedure TExportColumnList.HideAll;
var
   I: Integer;
   Item: TExportColumn;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Visible:=False;
      end;
   end;
end;

procedure TExportColumnList.Insert(Ind: Integer; ExportColumn: TExportColumn);
begin
   FList.Insert(Ind, ExportColumn);
end;

function TExportColumnList.IsVisible: Boolean;
var
   I: Integer;
   Item: TExportColumn;
begin
   Result:=False;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if (Item<>nil) and Item.Visible then begin
         Result:=True;
         Break;
      end;
   end;
end;

function TExportColumnList.SelCount: Integer;
var
   I: Integer;
   Item: TExportColumn;
begin
   Result:=0;
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Inc(Result);
      end;
   end;
end;

procedure TExportColumnList.ShowAll;
var
   I: Integer;
   Item: TExportColumn;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Visible:=True;
      end;
   end;
end;

procedure TExportColumnList.UpdateWidth(FontSize: Integer; FontName: string);
var
   I: Integer;
   Item: TExportColumn;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.UpdateWidth(FontSize, FontName);
      end;
   end;
end;


{ TExportDataProvider }

constructor TExportDataProvider.Create(Data: TObject; ExcludeFields: string);
begin
   FExportColumns:=TExportColumnList.Create;
   FReadBuffer:=0;
   FExcludeFields:=ExcludeFields;
   SetDefaultFormat;
   FOnExportRowParam:=nil;
   FSheetName:='';
end;

destructor TExportDataProvider.Destroy;
begin
   FExportColumns.Free;
   inherited;
end;

procedure TExportDataProvider.SetDefaultFormat;
begin
   FDateFormat:='DD.MM.YYYY';
   //FFloatFormat:='0.0';
   FFloatFormat:='0.##########';
end;

{ TExportDataSet }

procedure TExportDataSet.AfterExportData;
begin
   FDataSet.EnableControls;
end;

procedure TExportDataSet.BeforeExportData;
begin
   FDataSet.DisableControls;
   //-if not FDataSet.Active then begin
   //-   FDataSet.Open;
   //-end;
end;

constructor TExportDataSet.Create(Data: TObject; ExcludeFields: string);
begin
   inherited;
   FDataSet:=TDataSet(Data);
   FCount:=0;
end;

destructor TExportDataSet.Destroy;
begin
   inherited;
end;

procedure TExportDataSet.FirstData;
begin
   FDataSet.First;
   FCount:=1;
end;

function TExportDataSet.GetCaption(I: Integer): string;
begin
   if I<0 then begin
      Result:='';
   end
   else begin
      Result:=FDataSet.Fields[I].DisplayLabel;
   end;
end;

procedure TExportDataSet.SetDefaultColumnList;
var
   I: Integer;
   Field: TField;
   ExportColumn: TExportColumn;
begin
   if FExportColumns.Count=0 then begin
      FExportColumns.Clear;
      for I:=0 to Pred(FDataSet.FieldCount) do begin
         Field:=FDataSet.Fields[I];
         if Field.Visible and (Pos('-'+UpperCase(Field.FieldName)+'+', FExcludeFields)=0) then begin
            ExportColumn:=FExportColumns.AddNew(Field.FieldName, Field.Index);
            ExportColumn.DisplayName:=Field.FieldName;
            ExportColumn.Caption:=Field.DisplayLabel;
            ExportColumn.DisplayWidth:=Field.DisplayWidth;
         end;
      end;
   end;
   FExportColumns.DeleteHided;
end;

function TExportDataSet.GetDisplayName(I: Integer): string;
begin
   if I<0 then begin
      Result:='';
   end
   else begin
      Result:=FDataSet.Fields[I].DisplayName;
   end;
end;

function TExportDataSet.GetDisplayWidth(I: Integer): Integer;
begin
   if I<0 then begin
      Result:=0;
   end
   else begin
      Result:=FDataSet.Fields[I].DisplayWidth;
   end;
end;

function TExportDataSet.GetEof: Boolean;
begin
   Result:=FDataSet.Eof;
end;

function TExportDataSet.GetFieldCount: Integer;
begin
   Result:=FDataSet.FieldCount;
end;

function TExportDataSet.GetFieldName(I: Integer): string;
begin
   if I<0 then begin
      Result:='';
   end
   else begin
      Result:=FDataSet.Fields[I].FieldName;
   end;
end;

function TExportDataSet.GetFieldValue(I: Integer): string;
var
   Field: TField;
begin
   Result:='';
   if I<0 then begin
      Result:=IntToStr(FCount);
   end
   else begin
      Field:=FDataSet.Fields[I];
      case Field.DataType of
         ftString, ftWideString, ftMemo, ftFMTBcd: begin
            Result:=Field.AsString;
         end;
         ftSmallint, ftInteger, ftWord: begin
            Result:=Field.AsString;
         end;
         ftFloat: begin
            Result:=FormatFloat(FFloatFormat, Field.AsFloat);
         end;
         ftDate, ftTime, ftDateTime: begin
            if not Field.IsNull then begin
               Result:=FormatDateTime(FDateFormat, Field.AsDateTime);
            end;
         end;
         ftBoolean: begin
            {--
            if Field.AsBoolean then begin
               Result:='T';
            end
            else begin
               Result:='F';
            end;
            }
            Result:=DefBooleanName[Field.AsBoolean];
         end;
      end;
   end;
end;

function TExportDataSet.GetFont(I: Integer): TFont;
begin
   Result:=nil;
end;

function TExportDataSet.GetRecordCount: Integer;
begin
   Result:=FDataSet.RecordCount;
end;

function TExportDataSet.GetWidth(I: Integer): Integer;
begin
   Result:=0;
end;

function TExportDataSet.IsFieldNull(I: Integer): Boolean;
begin
   if I<0 then begin
      Result:=False;
   end
   else begin
      Result:=FDataSet.Fields[I].IsNull;
   end;
end;

function TExportDataSet.IsFieldString(I: Integer): Boolean;
begin
   if I<0 then begin
      Result:=True;
   end
   else begin
      Result:=FDataSet.Fields[I].DataType in [ftString, ftWideString, ftMemo];
   end;
end;

procedure TExportDataSet.NextData;
begin
   FDataSet.Next;
   Inc(FCount);
end;

function TExportDataSet.FindFieldName(FieldName: string): Boolean;
begin
   Result:=FDataSet.FindField(FieldName)<>nil;
end;

procedure TExportDataSet.SetDbfField(FieldName: string; var DBFField: TDBFFieldRec);
var
   Field: TField;
begin
   if FieldName='' then begin
      DbfField.Len:=10;
      DbfField.Dec:=0;
      DbfField.Typ:='C';
   end
   else begin
      Field:=FDataSet.FindField(FieldName);
      case Field.DataType of
         ftString: begin
            DbfField.Len:=Field.Size mod 256;
            DbfField.Dec:=Field.Size div 256;
            DbfField.Typ:='C';
         end;
         ftSmallint, ftInteger, ftWord: begin
            DbfField.Len:=10;
            DbfField.Dec:=0;
            DbfField.Typ:='N';
         end;
         ftFloat: begin
            DbfField.Len:=19;
            DbfField.Dec:=7;
            DbfField.Typ:='N';
         end;
         ftDate, ftTime, ftDateTime: begin
            DbfField.Len:=8;
            DbfField.Dec:=0;
            DbfField.Typ:='D';
         end;
         ftBoolean: begin
            DbfField.Len:=1;
            DbfField.Dec:=0;
            DbfField.Typ:='L';
         end;
      end;
   end;
end;

procedure TExportDataSet.DoExportRowParam(Param: TExportRowParam);
begin
   if Assigned(FOnExportRowParam) then begin
      FOnExportRowParam(FDataSet, Param);
   end
   else if (FExportColumns<>nil) and Assigned(FExportColumns.OnExportRowParam) then begin
      FExportColumns.OnExportRowParam(FDataSet, Param);
   end;
end;

function TExportDataSet.IsFieldNumber(I: Integer): Boolean;
begin
   if I<0 then begin
      Result:=True;
   end
   else begin
      Result:=FDataSet.Fields[I].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftAutoInc, ftLargeint{, ftBoolean}];
   end;
end;

function TExportDataSet.GetFieldDouble(I: Integer): Double;
var
   Field: TField;
begin
   if I<0 then begin
      Result:=FCount;
   end
   else begin
      Field:=FDataSet.Fields[I];
      Result:=Field.AsFloat;
   end;
end;

{ TExportDataToFile }

function TExportDataToFile.CheckFileExists(CanAdd: Boolean; var RewriteAppend: Boolean): Boolean;
begin
   Result:=False;
   RewriteAppend:=False;
   if FileExists(FFileName) then begin
      if FileExistsMsg(FFileName, CanAdd, RewriteAppend) then begin
         Result:=True;
      end;
   end
   else begin
      Result:=True;
      RewriteAppend:=True;
   end;
end;

constructor TExportDataToFile.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   FFileName:=FileName;
   FExportData:=DataProviderList[0];
   FDataProviderList:=DataProviderList;
end;

destructor TExportDataToFile.Destroy;
begin
   inherited;
end;

function TExportDataToFile.DoExport: Boolean;
var
   RewriteAppend: Boolean;
begin
   Result:=False;
   if CheckFileExists(False, RewriteAppend) then begin
      if not FHide then begin
         FWait:=ShowWait('Экспорт таблиц', Caption, True);
      end;
      try
         FDataProviderList.SetDefaultColumnList;
         Result:=ExportData;
      finally
         FWait.Free;
      end;
   end;
end;

procedure TExportDataToFile.ShowFinally;
begin
   if FGauge<>nil then begin
      FGauge.Stop;
      FGauge.Free;
   end;
end;

procedure TExportDataToFile.ShowStart;
begin
   if FShowGauge then begin
      if FWait<>nil then begin
         FWait.UpdateMsg(#10'Идет подсчет записей ...');
      end;
      FRecordCount:=FExportData.GetRecordCount;
      if FRecordCount<>-1 then begin
         FGauge:=TSimpleGauge.Create;
      end;
   end;
   if FWait<>nil then begin
      FWait.UpdateMsg(#10'Идет выполнение запроса к базе ...');
   end;
   FRecordProcessed:=0;
end;

procedure TExportDataToFile.ShowStartGauge;
begin
   if FGauge<>nil then begin
      FWait.Stop;
      FGauge.CancelOn;
      FGauge.Start(FRecordCount, FCaption);
   end;
end;

procedure TExportDataToFile.ShowStop;
begin
   if FGauge<>nil then begin
      FGauge.Update(FRecordProcessed, '', False);
   end
   else if FWait<>nil then begin
      FWait.UpdateMsg(Format(#10'Обработано %d записей', [FRecordProcessed]));
   end;
end;

procedure TExportDataToFile.ShowUpdate;
var
   Cancel: Boolean;
begin
   Inc(FRecordProcessed);
   if (FInterval<=0) or (FRecordProcessed mod FInterval=0) then begin
      Cancel:=False;
      if FGauge<>nil then begin
         FGauge.Update(FRecordProcessed, '', False);
         Cancel:=FGauge.Cancel;
      end
      else if FWait<>nil then begin
         FWait.UpdateMsg(Format(#10'Обработано %d записей', [FRecordProcessed]));
         Cancel:=FWait.Cancel;
      end;
      if Cancel  then begin
         raise TBreakException.Create('Экспорт прерван по запросу пользователя');
      end;
   end;
end;

{ TExportAddDataToFile }

function TExportAddDataToFile.DoExport: Boolean;
var
   RewriteAppend: Boolean;
begin
   Result:=False;
   if CheckFileExists(True, RewriteAppend) then begin
      if not FHide then begin
         FWait:=ShowWait('Экспорт таблиц', Caption, True);
      end;
      try
         FDataProviderList.SetDefaultColumnList;
         BuildFieldList;
         if RewriteAppend then begin
            if CreateFile then begin
               Result:=ExportData;
            end
            else begin
               MessageDlg(Format('Ошибка при создании файла "%s".', [FFileName]), mtError, [mbOk], 0);
            end;
         end
         else begin
            if CheckFile then begin
               Result:=ExportData;
            end
            else begin
               MessageDlg(Format('Ошибка в структуре %s-файла "%s".', [FFileExt, FFileName]), mtError, [mbOk], 0);
            end;
         end;
      finally
         FWait.Free;
      end;
   end;
end;

{ TExportDataToDbf }

procedure TExportDataToDbf.BuildFieldList;
var
   I: Integer;
   N: Integer;
   FieldCount: Integer;
   FieldName: string;
   ExportColumns: TExportColumnList;
begin
   ExportColumns:=FExportData.ExportColumns;
   FieldCount:=ExportColumns.Count;
   SetLength(FDbfFields, FieldCount);
   N:=0;
   for I:=0 to Pred(FieldCount) do begin
      FieldName:=ExportColumns[I].FieldName;
      FExportData.SetDbfField(FieldName, FDbfFields[I]);
      if (FieldName='') or (Length(FieldName)>10) or (FieldName[1] in ['0'..'9']) then begin
         repeat
            Inc(N);
            FieldName:=Format('FIELD%d', [N]);
         until not FExportData.FindFieldName(FieldName);
         ExportColumns[I].FieldNameInFile:=FieldName;
      end;
      FDbfFields[I].Name:=FieldName;
   end;
end;

function TExportDataToDbf.CheckFile: Boolean;
var
   I: Integer;
   DbfFile: TDBFFile;
   FieldNo: Integer;
   flErr: Boolean;
   FieldCount: Integer;
begin
   Result:=False;
   FieldCount:=FExportData.ExportColumns.Count;
   if FileExists(FFileName) then begin
      DbfFile:=TDBFFile.Create(FFileName);
      try
         DbfFile.Open(True);
         if FieldCount=DbfFile.FieldsCount then begin
            flErr:=False;
            for I:=0 to Pred(FieldCount) do begin
               FieldNo:=DbfFile.GetFieldNo(FDBfFields[I].Name);
               if FieldNo=-1 then begin
                  flErr:=True;
                  Break;
               end;
               if not ((DbfFile.FieldsArr[FieldNo].Len=FDBfFields[I].Len) and
                       (DbfFile.FieldsArr[FieldNo].Dec=FDBfFields[I].Dec) and
                       (DbfFile.FieldsArr[FieldNo].Typ=FDBfFields[I].Typ))
               then begin
                  flErr:=True;
                  Break;
               end;
            end;
            Result:=not flErr;
         end;
      finally
         DbfFile.Close;
         DbfFile.Free;
      end;
   end;
end;

constructor TExportDataToDbf.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   inherited;
   FFileExt:='dbf';
end;

function TExportDataToDbf.CreateFile: Boolean;
begin
   Result:=CreateDbf(FFileName, FDbfFields, True);
end;

destructor TExportDataToDbf.Destroy;
begin
   inherited;
end;

function TExportDataToDbf.ExportData: Boolean;
var
   I: Integer;
   FieldName: string;
   DestFields: TIntegerArray;
   FieldNo: Integer;
   DestFieldNo: Integer;
   SrcFieldNo: Integer;
   DbfFile: TDBFFile;
   OldSeparator: Char;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;
   FloatFormats: TStringArray;
begin
   Result:=False;
   OldSeparator:=DecimalSeparator;
   FExportData.DateFormat:='YYYYMMDD';
   ExportColumns:=FExportData.ExportColumns;
   DbfFile:=TDBFFile.Create(FFileName);
   try
      DecimalSeparator:='.';
      DbfFile.Open(False);
      FieldCount:=ExportColumns.Count;
      SetLength(DestFields, FieldCount);
      SetLength(FloatFormats, FieldCount);
      for I:=0 to Pred(FieldCount) do begin
         FieldName:=ExportColumns[I].FieldNameInFile;
         FieldNo:=DbfFile.GetFieldNo(FieldName);
         if FieldNo<>-1 then begin
            DestFields[I]:=FieldNo;
         end
         else begin
            raise Exception.CreateFmt('У dbf-файла %s отсутствует поле %s.', [FFileName, FieldName]);
         end;
         if FDbfFields[I].Dec<>0 then begin
            FloatFormats[I]:='0.'+StringOfChar('0', FDbfFields[I].Dec);
         end
         else begin
            FloatFormats[I]:='0';
         end;
      end;
      FExportData.BeforeExportData;
      ShowStart;
      ShowStartGauge;
      FExportData.FirstData;
      while not FExportData.GetEof do begin
         DbfFile.Append;
         for I:=0 to Pred(FieldCount) do begin
            DestFieldNo:=DestFields[I];
            SrcFieldNo:=ExportColumns[I].FieldIndex;
            FExportData.FloatFormat:=FloatFormats[I];
            if not FExportData.IsFieldNull(SrcFieldNo) then begin
               DbfFile[DestFieldNo]:=FExportData.GetFieldValue(SrcFieldNo);
            end;
         end;
         ShowUpdate;
         FExportData.NextData;
      end;
      ShowStop;
      if FExportData.GetEof then begin
         Result:=True;
      end;
   finally
      DecimalSeparator:=OldSeparator;
      FExportData.AfterExportData;
      FExportData.SetDefaultFormat;
      ShowFinally;
      DbfFile.Close;
      DbfFile.Free;
   end;
end;

{ TExportDataToCsv }

procedure TExportDataToCsv.BuildFieldList;
begin

end;

function TExportDataToCsv.CheckFile: Boolean;
var
   I: Integer;
   F: TextFile;
   S: string;
   Arr: TStringArray;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;
begin
   Result:=False;
   ExportColumns:=FExportData.ExportColumns;
   FieldCount:=ExportColumns.Count;
   try
      AssignFile(F, FFileName);
      Reset(F);
      try
         Readln(F, S);
      finally
         CloseFile(F);
      end;
      if S<>'' then begin
         StrToArr(S, ';', Arr);
         if Length(Arr)=FieldCount then begin
            for I:=0 to Pred(FieldCount) do begin
               if CompareText(Trim(Arr[I]), ExportColumns[I].FieldNameInFile)<>0 then begin
                  Exit;
               end;
            end;
            Result:=True;
         end;
      end;
   except
      Result:=False;
   end;
end;

constructor TExportDataToCsv.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   inherited;
   FFileExt:='csv';
end;

function TExportDataToCsv.CreateFile: Boolean;
begin
   try
      DeleteFile(FFileName);
      Result:=True;
   except
      Result:=False;
   end;
end;

destructor TExportDataToCsv.Destroy;
begin
   inherited;
end;

function TExportDataToCsv.ExportData: Boolean;
var
   //CsvFile: TextFile;
   CsvFile: TFileStream;
   I: Integer;
   N: Integer;
   FieldNo: Integer;
   LineStr: string;
   TempStr: string;
   FieldName: string;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;

   procedure Writeln(FileStream: TFileStream; S: string); overload;
   begin
      FileStream.Write(PChar(S+#13#10)^, Length(S)+2);
   end;

begin
   Result:=False;
   ExportColumns:=FExportData.ExportColumns;
   FieldCount:=ExportColumns.Count;
   CsvFile:=nil;
   try
      //AssignFile(CsvFile, FFileName);
      if FileExists(FFileName) then begin
         //Append(CsvFile);
         CsvFile:=TFileStream.Create(FFileName, fmOpenReadWrite or fmShareExclusive);
         CsvFile.Seek(0, soFromEnd);
      end
      else begin
         //Rewrite(CsvFile);
         CsvFile:=TFileStream.Create(FFileName, fmCreate or fmShareExclusive);
         LineStr:='';
         N:=0;
         for I:=0 to Pred(FieldCount) do begin
            if ExportColumns[I].FieldNameInFile='' then begin
               repeat
                  Inc(N);
                  FieldName:=Format('FIELD%d', [N]);
               until not FExportData.FindFieldName(FieldName);
               ExportColumns[I].FieldNameInFile:=FieldName;
            end;
            AddString(LineStr, ExportColumns[I].FieldNameInFile, ';');
         end;
         Writeln(CsvFile, LineStr);
      end;
      FExportData.BeforeExportData;
      ShowStart;
      ShowStartGauge;
      FExportData.FirstData;
      while not FExportData.GetEof do begin
         LineStr:='';
         for I:=0 to Pred(FieldCount) do begin
            FieldNo:=ExportColumns[I].FieldIndex;
            if not FExportData.IsFieldNull(FieldNo) then begin
               if FExportData.IsFieldString(FieldNo) then begin
                  TempStr:=TrimRight(FExportData.GetFieldValue(FieldNo));
                  if Pos('"', TempStr)>0 then begin
                     TempStr:=StringReplace(TempStr, '"', '""', [rfReplaceAll]);
                     LineStr:=LineStr+'"'+TempStr+'"';
                  end
                  else if Pos(';', TempStr)>0 then begin
                     LineStr:=LineStr+'"'+TempStr+'"';
                  end
                  else begin
                     LineStr:=LineStr+TempStr;
                  end;
               end
               else begin
                  LineStr:=LineStr+FExportData.GetFieldValue(FieldNo);
               end;
            end;
            if I<>Pred(FieldCount) then begin
               LineStr:=LineStr+';'
            end;
         end;
         Writeln(CsvFile, LineStr);
         ShowUpdate;
         FExportData.NextData;
      end;
      ShowStop;
      if FExportData.GetEof then begin
         Result:=True;
      end;
   finally
      FExportData.AfterExportData;
      ShowFinally;
      //CloseFile(CsvFile);
      if CsvFile<>nil then begin
         CsvFile.Free;
      end;
   end;
end;

{ TExportDataToXls }

constructor TExportDataToXls.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   inherited;
   FFileExt:='xls';
end;

destructor TExportDataToXls.Destroy;
begin
   inherited;
end;

function TExportDataToXls.ExportData: Boolean;
type
   BofRec=packed record
      id: Word;
      sz: Word;
      ver: Word;
      kind: Word;
      id_cr: Word;
      year_cr: Word;
   end;

   EofRec=packed record
      id: Word;
      sz: Word;
   end;

   LabelRec=packed record
      id: Word;
      sz: Word;
      rw: Word;
      col: Word;
      ixfe: Word;
      cch: Word;
   end;

const
   BOF: BofRec=(id: $0809; sz: $0008; ver: $0000; kind: $0010; id_cr: $0000; year_cr: $0000);
   EOF: EofRec=(id: $000A; sz: $0000);
   Label_: LabelRec=(id: $0204; sz: 0; rw: 0; col: 0; ixfe: 0; cch: 0);

var
   Stream: TFileStream;
   TempStr: string;
   I: Integer;
   Col: Integer;
   Row: Integer;
   FieldNo: Integer;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;
   flOpen: Boolean;

   procedure WriteCell(S: string; Col, Row: Integer);
   var
      Len: Integer;
   begin
      Len:=Length(S);
      Label_.col:=Col;
      Label_.rw:=Row;
      Label_.sz:=8+Len;
      Label_.cch:=Len;
      Stream.Write(Label_, SizeOf(Label_));
      Stream.Write(Pointer(S)^, Len);
   end;

begin
   Result:=False;
   ExportColumns:=FExportData.ExportColumns;
   FieldCount:=ExportColumns.Count;
   flOpen:=False;
   Stream:=nil;
   try
      Stream:=TFileStream.Create(FFileName, fmCreate);
      flOpen:=True;
      Stream.Write(BOF, SizeOf(BOF));
      for I:=0 to Pred(FieldCount) do begin
         TempStr:=ExportColumns[I].FieldNameInFile;
         WriteCell(TempStr, I, 0);
      end;
      FExportData.BeforeExportData;
      ShowStart;
      ShowStartGauge;
      FExportData.FirstData;
      Row:=1;
      while not FExportData.GetEof do begin
         for Col:=0 to Pred(FieldCount) do begin
            FieldNo:=ExportColumns[Col].FieldIndex;
            if not FExportData.IsFieldNull(FieldNo) then begin
               TempStr:=FExportData.GetFieldValue(FieldNo);
            end
            else begin
               TempStr:='';
            end;
            WriteCell(TempStr, Col, Row);
         end;
         Inc(Row);
         ShowUpdate;
         FExportData.NextData;
      end;
      ShowStop;
      if FExportData.GetEof then begin
         Result:=True;
      end;
   finally
      FExportData.AfterExportData;
      ShowFinally;
      if flOpen then begin
         Stream.Write(EOF, SizeOf(EOF));
      end;
      if Stream<>nil then begin
         Stream.Free;
      end;
   end;
end;

{ TExportDataToRtf }

constructor TExportDataToRtf.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   inherited;
   FFileExt:='rtf';
end;

destructor TExportDataToRtf.Destroy;
begin
   inherited;
end;

function TExportDataToRtf.ExportData: Boolean;
const
   MapAlignment: array [TAlignment] of string=('ql', 'qr', 'qc');

var
   //RtfFile: TextFile;
   RtfFile: TFileStream;
   s_trowd: string;
   X: Integer;
   J: Integer;
   //--K: Integer;
   Col: Integer;
   ColWidth: array of Integer;
   //AveCharWidth: Integer;
   LogInch: Integer;
   TempStr: string;
   TempStr2: string;
   cellx: array of Integer;
   trgaph: Integer;
   FieldNo: Integer;
   FontSize: Integer;
   FontNo: Integer;
   CellHead: TStringArray;
   CellData: TStringArray;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;
   flOpen: Boolean;
   Koef: Double;
   Param: TExportRowParam;
   saN: string;
   sbN: string;

   type
      THeadCell=record
         S: string;
         RowSpan: Integer;
         Print: Boolean;
         MainCol: Integer;
         MergeRow: Boolean;
         MergeCol: Boolean;
         MergeFirstCol: Boolean;
         MergeFirstRow: Boolean;
         MergeLastCol: Boolean;
      end;

      THeadCol=array of THeadCell;

      TOrder=record
         Col: Integer;
         NumRow: Integer;
      end;

   procedure Writeln(FileStream: TFileStream; S: string); overload;
   begin
      FileStream.Write(PChar(S+#13#10)^, Length(S)+2);
   end;

   procedure Writeln(FileStream: TFileStream; S1, S2, S3: string); overload;
   begin
      FileStream.Write(PChar(S1)^, Length(S1));
      FileStream.Write(PChar(S2)^, Length(S2));
      FileStream.Write(PChar(S3+#13#10)^, Length(S3)+2);
   end;

   procedure PrintHead;
   var
      I: Integer;
      HeadCell: array of THeadCol;
      Col: Integer;
      Col2: Integer;
      Row: Integer;
      Row2: Integer;
      NumRow: Integer;
      MaxRow: Integer;
      ColOrder: array of TOrder;
      flSort: Boolean;
      RowSpan: string;
   begin
      MaxRow:=0;
      SetLength(HeadCell, FieldCount);
      SetLength(ColOrder, FieldCount);
      for Col:=0 to Pred(FieldCount) do begin
         TempStr:=ExportColumns[Col].Caption;
         SetLength(HeadCell[Col], 1);
         Row:=0;
         HeadCell[Col][Row].S:=TempStr;
         repeat
            X:=Pos('|', TempStr);
            if X<>0 then begin
               HeadCell[Col][Row].S:=Trim(Copy(TempStr, 1, Pred(X)));
               Inc(Row);
               SetLength(HeadCell[Col], Succ(Row));
               TempStr:=Trim(Copy(TempStr, Succ(X), Length(TempStr)-X));
               HeadCell[Col][Row].S:=TempStr;
            end;
         until X=0;
         if MaxRow<Row then begin
            MaxRow:=Row;
         end;
         ColOrder[Col].Col:=Col;
         ColOrder[Col].NumRow:=Row;
      end;
      for Row:=0 to MaxRow do begin
         for Col:=0 to Pred(FieldCount) do begin
            if Length(HeadCell[Col])>Row then begin
               HeadCell[Col][Row].RowSpan:=-1;
               HeadCell[Col][Row].Print:=True;
               HeadCell[Col][Row].MainCol:=-1;
               HeadCell[Col][Row].MergeCol:=False;
               HeadCell[Col][Row].MergeRow:=False;
               HeadCell[Col][Row].MergeFirstCol:=False;
               HeadCell[Col][Row].MergeFirstRow:=False;
               if (Col>0) and (Length(HeadCell[Pred(Col)])>Row) and
                  (HeadCell[Pred(Col)][Row].S=HeadCell[Col][Row].S) and
                  ((Row=0) or ((HeadCell[Col][Pred(Row)].MainCol<>-1) and (HeadCell[Pred(Col)][Pred(Row)].MainCol=HeadCell[Col][Pred(Row)].MainCol))) and
                  ((Row=MaxRow) or ((Length(HeadCell[Pred(Col)])>Succ(Row)) and (Length(HeadCell[Col])>Succ(Row)))) then begin
                  if not HeadCell[Pred(Col)][Row].MergeCol then begin
                     HeadCell[Pred(Col)][Row].MergeFirstCol:=True;
                     HeadCell[Pred(Col)][Row].MergeCol:=True;
                  end;
                  HeadCell[Col][Row].MergeCol:=True;
                  HeadCell[Col][Row].Print:=False;
                  HeadCell[Pred(Col)][Row].MainCol:=Col;
                  HeadCell[Col][Row].MainCol:=Col;
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=Pred(Col)) then begin
                        HeadCell[Col2][Row].MainCol:=Col;
                     end;
                  end;
               end;
            end;
         end;
      end;
      repeat
         flSort:=True;
         for I:=1 to Pred(FieldCount) do begin
            if ColOrder[Pred(I)].NumRow<ColOrder[I].NumRow then begin
               flSort:=False;
               Col:=ColOrder[Pred(I)].Col;
               NumRow:=ColOrder[Pred(I)].NumRow;
               ColOrder[Pred(I)].Col:=ColOrder[I].Col;
               ColOrder[Pred(I)].NumRow:=ColOrder[I].NumRow;
               ColOrder[I].Col:=Col;
               ColOrder[I].NumRow:=NumRow;
            end;
         end;
      until flSort;
      for I:=0 to Pred(FieldCount) do begin
         Col:=ColOrder[I].Col;
         NumRow:=0;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan>0 then begin
               NumRow:=NumRow+Pred(HeadCell[Col][Row].RowSpan);
            end;
         end;
         NumRow:=NumRow+Pred(Length(HeadCell[Col]));
         NumRow:=MaxRow-NumRow;
         if NumRow<>0 then begin
            Inc(NumRow);
         end;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan=-1 then begin
               if HeadCell[Col][Row].MainCol=-1 then begin
                  HeadCell[Col][Row].RowSpan:=NumRow;
               end
               else begin
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=HeadCell[Col][Row].MainCol) then begin
                        HeadCell[Col2][Row].RowSpan:=NumRow;
                     end;
                  end;
               end;
               NumRow:=0;
            end;
         end;
      end;
      for Col:=0 to Pred(FieldCount) do begin
         for Row:=0 to MaxRow do begin
            NumRow:=Length(HeadCell[Col]);
            if NumRow>Row then begin
               X:=HeadCell[Col][Row].RowSpan;
               if X>0 then begin
                  Dec(X);
                  SetLength(HeadCell[Col], NumRow+X);
                  for Row2:=Pred(NumRow+X) downto Succ(Row+X) do begin
                     HeadCell[Col][Row2].S:=HeadCell[Col][Row2-X].S;
                     HeadCell[Col][Row2].Print:=HeadCell[Col][Row2-X].Print;
                     HeadCell[Col][Row2].MainCol:=HeadCell[Col][Row2-X].MainCol;
                     HeadCell[Col][Row2].MergeCol:=HeadCell[Col][Row2-X].MergeCol;
                     HeadCell[Col][Row2].MergeFirstCol:=HeadCell[Col][Row2-X].MergeFirstCol;
                     HeadCell[Col][Row2].MergeFirstRow:=HeadCell[Col][Row2-X].MergeFirstRow;
                  end;
                  if ((HeadCell[Col][Row].MainCol<>-1) and (HeadCell[Col][Row].MergeFirstCol)) or (HeadCell[Col][Row].MainCol=-1) then begin
                     HeadCell[Col][Row].MergeFirstRow:=True;
                     HeadCell[Col][Row].MergeRow:=True;
                  end;
                  for Row2:=Succ(Row) to Row+X do begin
                     HeadCell[Col][Row2].S:='';
                     HeadCell[Col][Row2].Print:=False;
                     HeadCell[Col][Row2].MainCol:=-1;
                     HeadCell[Col][Row2].MergeCol:=HeadCell[Col][Row].MergeCol;
                     HeadCell[Col][Row2].MergeFirstCol:=HeadCell[Col][Row].MergeFirstCol;
                     HeadCell[Col][Row2].MergeFirstRow:=False;
                     HeadCell[Col][Row2].MergeRow:=True;
                  end;
               end;
            end;
         end;
      end;
      for Row:=0 to MaxRow do begin
         for Col:=0 to Pred(FieldCount) do begin
            if HeadCell[Col][Row].MergeCol and ((Col=Pred(FieldCount)) or (not HeadCell[Succ(Col)][Row].MergeCol) or HeadCell[Succ(Col)][Row].MergeFirstCol) then begin
               HeadCell[Col][Row].MergeLastCol:=True;
            end
            else begin
               HeadCell[Col][Row].MergeLastCol:=False;
            end;
         end;
      end;
      for Row:=0 to MaxRow do begin
         Writeln(RtfFile, s_trowd+'\trhdr');
         for Col:=0 to Pred(FieldCount) do begin
            TempStr:='';
            {--
            if HeadCell[Col][Row].MergeFirstCol then begin
               TempStr:='\clmgf';
            end
            else if HeadCell[Col][Row].MergeCol then begin
               TempStr:='\clmrg';
            end;
            }
            if HeadCell[Col][Row].MergeFirstRow then begin
               TempStr:=TempStr+'\clvmgf';
            end
            else if HeadCell[Col][Row].MergeRow then begin
               TempStr:=TempStr+'\clvmrg';
            end;
            //Writeln(RtfFile, Format('%s\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\cellx%d', [TempStr, cellx[Col]]));
            if not HeadCell[Col][Row].MergeCol or HeadCell[Col][Row].MergeLastCol then begin
               Writeln(RtfFile, Format('%s\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\cellx%d', [TempStr, cellx[Col]]));
            end;
         end;
         for Col:=0 to Pred(FieldCount) do begin
            TempStr:='';
            //if HeadCell[Col][Row].Print then begin
            if HeadCell[Col][Row].Print or HeadCell[Col][Row].MergeLastCol then begin
               TempStr:=Trim(HeadCell[Col][Row].S);
            end;
            //Writeln(RtfFile, Format('\pard\intbl\qc\sb55\sa55\f0\fs%d %s\cell', [FontSize, TempStr]));
            if not HeadCell[Col][Row].MergeCol or HeadCell[Col][Row].MergeLastCol then begin
               Writeln(RtfFile, Format('\pard\intbl\qc\sb55\sa55\f0\fs%d %s\cell', [FontSize, TempStr]));
            end;
         end;
         Writeln(RtfFile, '\row');
      end;
   end;

   procedure PrintColorTable;
   var
      I: Integer;
      ColorTable: TColorArray;
   begin
      ExportColumns.BuildColorTable(ColorTable);
      WriteLn(RtfFile, '{\colortbl;');
      for I:=0 to Pred(Length(ColorTable)) do begin
         WriteLn(RtfFile, Format('\red%d\green%d\blue%d;', [
             ColorTable[I] and $000000FF,
            (ColorTable[I] and $0000FF00) shr 8,
            (ColorTable[I] and $00FF0000) shr 16]));
      end;
      WriteLn(RtfFile, '}');
   end;

type
   TFontRecord=record
      Name: string;
      Family: string;
   end;

const
   CFontTable: array [0..1] of TFontRecord=(
      (Name: 'Microsoft Sans Serif'; Family: 'froman'),
      (Name: 'Times New Roman';      Family: 'froman')
   );

   procedure PrintFontTable;
   var
      I: Integer;
   begin
      WriteLn(RtfFile, '{\fonttbl');
      for I:=0 to 1 do begin
         WriteLn(RtfFile, Format('{\f%d\%s\fcharset204 %s;}', [I, CFontTable[I].Family, CFontTable[I].Name]));
      end;
      WriteLn(RtfFile, '}');
   end;

begin
   Result:=False;
   flOpen:=False;
   ExportColumns:=FExportData.ExportColumns;
   FieldCount:=ExportColumns.Count;
   RtfFile:=nil;
   Param:=TExportRowParam.Create;
   try
      //AssignFile(RtfFile, FFileName);
      RtfFile:=TFileStream.Create(FFileName, fmCreate or fmShareExclusive);
      //Rewrite(RtfFile);
      flOpen:=True;
      FontSize:=ExportColumns.FontSize*2;
      FontNo:=ExportColumns.FontNo;
      ExportColumns.UpdateWidth(ExportColumns.FontSize, CFontTable[FontNo].Name);
      LogInch:=GetDeviceCaps(LOGPIXELSY);
      trgaph:=72;
      if ExportColumns.RowKeep then begin
         s_trowd:=Format('\trowd\trgaph%d\trkeep', [trgaph]);
      end
      else begin
         s_trowd:=Format('\trowd\trgaph%d', [trgaph]);
      end;
      // формируем заголовок rtf
      Writeln(RtfFile, '{\rtf1\ansi\deff0');
      PrintFontTable;
      PrintColorTable;
      Writeln(RtfFile, '\paperw16838\paperh11906\margl1134\margr567\margt1134\margb1134\landscape'); //A4 альбомная
      Writeln(RtfFile, '\plain');
      // две пустые строки
      Writeln(RtfFile, '\par');
      Writeln(RtfFile, '\par');
      SetLength(CellData, FieldCount);
      SetLength(CellHead, FieldCount);
      SetLength(ColWidth, FieldCount);
      SetLength(cellx, FieldCount);
      for Col:=0 to Pred(FieldCount) do begin
         ColWidth[Col]:=ExportColumns[Col].Width;
         if Col=0 then begin
            cellx[Col]:=Trunc((ColWidth[Col]*1440)/LogInch)+2*trgaph;
         end
         else begin
            cellx[Col]:=Trunc((ColWidth[Col]*1440)/LogInch)+cellx[Pred(Col)]+2*trgaph;
         end;
      end;
      if cellx[Pred(FieldCount)]>CMaxTableWidth then begin
         Koef:=(CMaxTableWidth-FieldCount*(2*trgaph))/(cellx[Pred(FieldCount)]-FieldCount*(2*trgaph));
         for Col:=0 to Pred(FieldCount) do begin
            cellx[Col]:=Round((cellx[Col]-Succ(Col)*2*trgaph)*Koef)+Succ(Col)*2*trgaph;
         end;
      end;
      for Col:=0 to Pred(FieldCount) do begin
         if ExportColumns[Col].BgColorIndex=1{clWhite} then begin
            CellHead[Col]:=Format('\cellx%d', [cellx[Col]]);
         end
         else begin
            CellHead[Col]:=Format('\clcbpat%d\cellx%d', [ExportColumns[Col].BgColorIndex, cellx[Col]]);
         end;
         if ExportColumns.GridLine then begin
            CellHead[Col]:='\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs'+CellHead[Col];
         end;
         saN:='';
         if ExportColumns[Col].SpaceAfter<>0 then begin
            saN:=Format('\sa%d', [ExportColumns[Col].SpaceAfter]);
         end;
         sbN:='';
         if ExportColumns[Col].SpaceBefore<>0 then begin
            sbN:=Format('\sb%d', [ExportColumns[Col].SpaceBefore]);
         end;
         CellData[Col]:=Format('\pard\intbl\%s%s%s\f%d\fs%d\cf%d ', [MapAlignment[ExportColumns[Col].Alignment], sbN, saN, FontNo, FontSize, ExportColumns[Col].FgColorIndex]);
      end;
      if ExportColumns.BoldHead then begin
         Writeln(RtfFile, '\b1 ');
      end;
      PrintHead;
      if ExportColumns.BoldHead then begin
         Writeln(RtfFile, '\b0 ');
      end;
      FExportData.BeforeExportData;
      ShowStart;
      ShowStartGauge;
      FExportData.FirstData;
      while not FExportData.GetEof do begin
         Writeln(RtfFile, s_trowd);
         Param.SetDefault;
         FExportData.DoExportRowParam(Param);
         for Col:=0 to Pred(FieldCount) do begin
            Writeln(RtfFile, CellHead[Col]);
         end;
         for Col:=0 to Pred(FieldCount) do begin
            FieldNo:=ExportColumns[Col].FieldIndex;
            if not FExportData.IsFieldNull(FieldNo) then begin
               TempStr:=FExportData.GetFieldValue(FieldNo);
               if FExportData.IsFieldString(FieldNo) then begin
                  TempStr2:=TempStr;
                  TempStr:='';
                  for J:=1 to Length(TempStr2) do begin
                     case TempStr2[J] of
                        #09: begin
                           TempStr:=TempStr+'\tab ';
                        end;
                        #10: begin
                        end;
                        #13: begin
                           TempStr:=TempStr+'\par ';
                        end;
                        '{', '}', '\': begin
                           TempStr:=TempStr+'\'+TempStr2[J];
                        end;
                        Chr(160): begin
                           TempStr:=TempStr+'\~';
                        end;
                        Chr(128)..Chr(159), Chr(161)..Chr(255): begin
                           TempStr:=TempStr+'\'''+LowerCase(IntToHex(Ord(TempStr2[J]), 2));
                        end;
                     else
                        TempStr:=TempStr+TempStr2[J];
                     end;
                  end;
                  (*--
                  SetLength(TempStr2, Length(TempStr)*2);
                  K:=0;
                  for J:=1 to Length(TempStr) do begin
                     Inc(K);
                     if TempStr[J] in ['{', '}', '\'] then begin
                        TempStr2[K]:='\';
                        Inc(K);
                        TempStr2[K]:=TempStr[J];
                     end
                     else begin
                        TempStr2[K]:=TempStr[J];
                     end;
                  end;
                  if K<>Length(TempStr) then begin
                     SetLength(TempStr2, K);
                     TempStr:=TempStr2;
                  end;
                  *)
               end;
            end
            else begin
               TempStr:='';
            end;
            if Param.Bold then begin
               Writeln(RtfFile, CellData[Col], '\b1 '+TempStr+'\b0 ', '\cell');
            end
            else begin
               Writeln(RtfFile, CellData[Col], TempStr, '\cell');
            end;
         end;
         Writeln(RtfFile, '\row');
         ShowUpdate;
         FExportData.NextData;
      end;
      if FExportData.GetEof then begin
         Result:=True;
      end;
   finally
      FExportData.AfterExportData;
      ShowFinally;
      if flOpen then begin
         Writeln(RtfFile, '}');
         //CloseFile(RtfFile);
      end;
      if RtfFile<>nil then begin
         RtfFile.Free;
      end;
      Param.Free;
   end;
end;

{ TExportDataToHtml }

constructor TExportDataToHtml.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   inherited;
   FFileExt:='htm';
end;

destructor TExportDataToHtml.Destroy;
begin
   inherited;
end;

function TExportDataToHtml.ExportData: Boolean;
var
   //HtmFile: TextFile;
   HtmFile: TFileStream;
   I: Integer;
   X: Integer;
   J: Integer;
   K: Integer;
   tagTD: array of string;
   TempStr: string;
   TempStr2: string;
   ColWidth: array of Integer;
   FieldCount: Integer;
   FieldNo: Integer;
   ExportColumns: TExportColumnList;
   flOpen: Boolean;

   type
      THeadCell=record
         S: string;
         RowSpan: Integer;
         ColSpan: Integer;
         Print: Boolean;
         Width: Integer;
         Height: Integer;
         MainCol: Integer;
      end;

      THeadCol=array of THeadCell;

      TOrder=record
         Col: Integer;
         NumRow: Integer;
      end;

   procedure Writeln(FileStream: TFileStream; S: string); overload;
   begin
      FileStream.Write(PChar(S+#13#10)^, Length(S)+2);
   end;

   procedure PrintHead;
   var
      I: Integer;
      HeadCell: array of THeadCol;
      Col: Integer;
      Col2: Integer;
      Row: Integer;
      Row2: Integer;
      NumRow: Integer;
      MaxRow: Integer;
      ColOrder: array of TOrder;
      flSort: Boolean;
      ColSpan: string;
      RowSpan: string;
   begin
      MaxRow:=0;
      SetLength(HeadCell, FieldCount);
      SetLength(ColOrder, FieldCount);
      for Col:=0 to Pred(FieldCount) do begin
         TempStr:=ExportColumns[Col].Caption;
         SetLength(HeadCell[Col], 1);
         Row:=0;
         HeadCell[Col][Row].S:=TempStr;
         repeat
            X:=Pos('|', TempStr);
            if X<>0 then begin
               HeadCell[Col][Row].S:=Trim(Copy(TempStr, 1, Pred(X)));
               Inc(Row);
               SetLength(HeadCell[Col], Succ(Row));
               TempStr:=Trim(Copy(TempStr, Succ(X), Length(TempStr)-X));
               HeadCell[Col][Row].S:=TempStr;
            end;
         until X=0;
         if MaxRow<Row then begin
            MaxRow:=Row;
         end;
         ColOrder[Col].Col:=Col;
         ColOrder[Col].NumRow:=Row;
      end;
      for Row:=0 to MaxRow do begin
         for Col:=0 to Pred(FieldCount) do begin
            if Length(HeadCell[Col])>Row then begin
               HeadCell[Col][Row].RowSpan:=-1;
               HeadCell[Col][Row].ColSpan:=0;
               HeadCell[Col][Row].Print:=True;
               HeadCell[Col][Row].Width:=ColWidth[Col];
               HeadCell[Col][Row].MainCol:=-1;
               if (Col>0) and (Length(HeadCell[Pred(Col)])>Row) and
                  (HeadCell[Pred(Col)][Row].S=HeadCell[Col][Row].S) and
                  ((Row=0) or ((HeadCell[Col][Pred(Row)].MainCol<>-1) and (HeadCell[Pred(Col)][Pred(Row)].MainCol=HeadCell[Col][Pred(Row)].MainCol))) and
                  ((Row=MaxRow) or ((Length(HeadCell[Pred(Col)])>Succ(Row)) and (Length(HeadCell[Col])>Succ(Row)))) then begin
                  HeadCell[Pred(Col)][Row].Print:=False;
                  if HeadCell[Pred(Col)][Row].ColSpan=0 then begin
                     HeadCell[Col][Row].ColSpan:=2;
                  end
                  else begin
                     HeadCell[Col][Row].ColSpan:=HeadCell[Pred(Col)][Row].ColSpan+1;
                  end;
                  HeadCell[Col][Row].Width:=HeadCell[Col][Row].Width+HeadCell[Pred(Col)][Row].Width+2;
                  HeadCell[Pred(Col)][Row].MainCol:=Col;
                  HeadCell[Col][Row].MainCol:=Col;
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=Pred(Col)) then begin
                        HeadCell[Col2][Row].MainCol:=Col;
                     end;
                  end;
               end;
            end;
         end;
      end;
      for Col:=0 to Pred(FieldCount) do begin
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].Print then begin
               TempStr:=HeadCell[Col][Row].S;
               if TempStr='' then begin
                  TempStr:=' ';
               end;
               HeadCell[Col][Row].Height:=GetTextHeight(TempStr, HeadCell[Col][Row].Width, -11, 'MS Sans Serif');
            end;
         end;
      end;
      repeat
         flSort:=True;
         for I:=1 to Pred(FieldCount) do begin
            if ColOrder[Pred(I)].NumRow<ColOrder[I].NumRow then begin
               flSort:=False;
               Col:=ColOrder[Pred(I)].Col;
               NumRow:=ColOrder[Pred(I)].NumRow;
               ColOrder[Pred(I)].Col:=ColOrder[I].Col;
               ColOrder[Pred(I)].NumRow:=ColOrder[I].NumRow;
               ColOrder[I].Col:=Col;
               ColOrder[I].NumRow:=NumRow;
            end;
         end;
      until flSort;
      for I:=0 to Pred(FieldCount) do begin
         Col:=ColOrder[I].Col;
         NumRow:=0;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan>0 then begin
               NumRow:=NumRow+Pred(HeadCell[Col][Row].RowSpan);
            end;
         end;
         NumRow:=NumRow+Pred(Length(HeadCell[Col]));
         NumRow:=MaxRow-NumRow;
         if NumRow<>0 then begin
            Inc(NumRow);
         end;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan=-1 then begin
               if HeadCell[Col][Row].MainCol=-1 then begin
                  HeadCell[Col][Row].RowSpan:=NumRow;
               end
               else begin
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=HeadCell[Col][Row].MainCol) then begin
                        HeadCell[Col2][Row].RowSpan:=NumRow;
                     end;
                  end;
               end;
               NumRow:=0;
            end;
         end;
      end;
      for Col:=0 to Pred(FieldCount) do begin
         for Row:=0 to MaxRow do begin
            NumRow:=Length(HeadCell[Col]);
            if NumRow>Row then begin
               X:=HeadCell[Col][Row].RowSpan;
               if X>0 then begin
                  Dec(X);
                  SetLength(HeadCell[Col], NumRow+X);
                  for Row2:=Pred(NumRow+X) downto Succ(Row+X) do begin
                     HeadCell[Col][Row2].S:=HeadCell[Col][Row2-X].S;
                     HeadCell[Col][Row2].RowSpan:=HeadCell[Col][Row2-X].RowSpan;
                     HeadCell[Col][Row2].ColSpan:=HeadCell[Col][Row2-X].ColSpan;
                     HeadCell[Col][Row2].Print:=HeadCell[Col][Row2-X].Print;
                     HeadCell[Col][Row2].Width:=HeadCell[Col][Row2-X].Width;
                     HeadCell[Col][Row2].Height:=HeadCell[Col][Row2-X].Height;
                     HeadCell[Col][Row2].MainCol:=HeadCell[Col][Row2-X].MainCol;
                  end;
                  for Row2:=Succ(Row) to Row+X do begin
                     HeadCell[Col][Row2].S:='';
                     HeadCell[Col][Row2].RowSpan:=-1;
                     HeadCell[Col][Row2].ColSpan:=-1;
                     HeadCell[Col][Row2].Print:=False;
                     HeadCell[Col][Row2].Width:=0;
                     HeadCell[Col][Row2].Height:=0;
                     HeadCell[Col][Row2].MainCol:=-1;
                  end;
               end;
            end;
         end;
      end;
      for Row:=0 to MaxRow do begin
         Writeln(HtmFile, '<tr>');
         for Col:=0 to Pred(FieldCount) do begin
            if (Length(HeadCell[Col])>Row) and (HeadCell[Col][Row].Print) then begin
               TempStr:=Trim(HeadCell[Col][Row].S);
               TempStr:=StringReplace(TempStr, '&', '&amp;', [rfReplaceAll]);
               TempStr:=StringReplace(TempStr, '<', '&lt;', [rfReplaceAll]);
               TempStr:=StringReplace(TempStr, '>', '&gt;', [rfReplaceAll]);
               TempStr:=StringReplace(TempStr, '"', '&quot;', [rfReplaceAll]);
               if TempStr='' then begin
                  TempStr:='&nbsp;';
               end;
               if HeadCell[Col][Row].RowSpan>0 then begin
                  RowSpan:=Format('rowspan="%d"', [HeadCell[Col][Row].RowSpan]);
               end
               else begin
                  RowSpan:='';
               end;
               if HeadCell[Col][Row].ColSpan>0 then begin
                  ColSpan:=Format('colspan="%d"', [HeadCell[Col][Row].ColSpan]);
               end
               else begin
                  ColSpan:='';
               end;
               Writeln(HtmFile, Format('<td %s %s align="center" style="font-family: MS Sans Serif; font-size: 8pt; background-color: #c0c0c0; color: #000000;">%s</td>', [RowSpan, ColSpan, TempStr]))
            end;
         end;
         Writeln(HtmFile, '</tr>')
      end;
   end;

begin
   Result:=False;
   ExportColumns:=FExportData.ExportColumns;
   FieldCount:=ExportColumns.Count;
   flOpen:=False;
   //AssignFile(HtmFile, FFileName);
   HtmFile:=nil;
   try
      HtmFile:=TFileStream.Create(FFileName, fmCreate or fmShareExclusive);
      flOpen:=True;
      //Rewrite(HtmFile);
      ExportColumns.UpdateWidth(8, 'MS Sans Serif'); // что бы установилось Width
      SetLength(tagTD, FieldCount);
      SetLength(ColWidth, FieldCount);
      Writeln(HtmFile, '<html>'#13#10'<head>'#13#10'<style><!--');
      for I:=0 to Pred(FieldCount) do begin
         ColWidth[I]:=ExportColumns[I].Width+10;
         Writeln(HtmFile, Format('.%s {', [LowerCase(ExportColumns[I].FieldName)]));
         Writeln(HtmFile, 'font-family: MS Sans Serif;');
         Writeln(HtmFile, 'font-size: 8pt;');
         case ExportColumns[I].Alignment of
            taLeftJustify: Writeln(HtmFile, 'text-align: left;');
            taRightJustify: Writeln(HtmFile, 'text-align: right;');
            taCenter: Writeln(HtmFile, 'text-align: center;');
         end;
         Writeln(HtmFile, Format('color: #%s;', [ColorToHex(ExportColumns[I].Font.Color)]));
         Writeln(HtmFile, Format('background-color: #%s;', [ColorToHex(ExportColumns[I].Color)]));
         Writeln(HtmFile, 'padding-left: 5px;');
         Writeln(HtmFile, 'padding-right: 5px;');
         Writeln(HtmFile, Format('width: %dpx;', [ColWidth[I]]));
         Writeln(HtmFile, '}');
         tagTD[I]:=Format('<td class="%s">%%s</td>', [LowerCase(ExportColumns[I].FieldName)]);
      end;
      Writeln(HtmFile, '--></style>'#13#10'</head>'#13#10'<body>');
      Writeln(HtmFile, '<table border="1" cellspacing="0" cellpadding="1">');
      PrintHead;
      FExportData.BeforeExportData;
      ShowStart;
      ShowStartGauge;
      FExportData.FirstData;
      while not FExportData.GetEof do begin
         Writeln(HtmFile, '<tr>');
         for I:=0 to Pred(FieldCount) do begin
            FieldNo:=ExportColumns[I].FieldIndex;
            if not FExportData.IsFieldNull(FieldNo) then begin
               TempStr:=FExportData.GetFieldValue(FieldNo);
               if FExportData.IsFieldString(FieldNo) then begin
                  if TempStr='' then begin
                     TempStr:='&nbsp;';
                  end
                  else begin
                     TempStr2:='';
                     K:=1;
                     while (K<=Length(TempStr)) and (TempStr[K]=' ') do begin
                        TempStr2:=TempStr2+'&nbsp;';
                        Inc(K);
                     end;
                     for J:=K to Length(TempStr) do begin
                        case TempStr[J] of
                           '&': TempStr2:=TempStr2+'&amp;';
                           '<': TempStr2:=TempStr2+'&lt;';
                           '>': TempStr2:=TempStr2+'&gt;';
                           '"': TempStr2:=TempStr2+'&quot;';
                        else
                           TempStr2:=TempStr2+TempStr[J];
                        end;
                     end;
                     TempStr:=TempStr2;
                  end;
               end;
            end
            else begin
               TempStr:='&nbsp;';
            end;
            Writeln(HtmFile, Format(tagTD[I], [TempStr]));
         end;
         Writeln(HtmFile, '</tr>');
         ShowUpdate;
         FExportData.NextData;
      end;
      if FExportData.GetEof then begin
         Result:=True;
      end;
   finally
      FExportData.AfterExportData;
      ShowFinally;
      if flOpen then begin
         Writeln(HtmFile, '</table>'#13#10'</body>'#13#10'</html>');
      end;
      //CloseFile(HtmFile);
      if HtmFile<>nil then begin
         HtmFile.Free;
      end;
   end;
end;

{ TExportDataToTxt }

constructor TExportDataToTxt.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   inherited;
   FFileExt:='txt';
end;

destructor TExportDataToTxt.Destroy;
begin
   inherited;
end;

function TExportDataToTxt.ExportData: Boolean;
var
   //TxtFile: TextFile;
   TxtFile: TFileStream;
   I: Integer;
   J: Integer;
   W: array of Integer;
   S: array of TStringArray;
   HA: array of TAlignment;
   VA: array of TAlignment;
   flNewLine: Boolean;
   CurLine: Integer;
   Temp: string;
   Part: string;
   Len: Integer;
   Space: PChar;
   X: Integer;
   Y: Integer;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;
   FieldNo: Integer;

   type
      TStringCell=record
         S: TStringArray;
         W: Integer;
         H: Boolean;
         I: Integer;
      end;

      TCellH=record
         H: Integer;
         J: Integer;
      end;

   procedure Writeln(FileStream: TFileStream; S: string); overload;
   begin
      FileStream.Write(PChar(S+#13#10)^, Length(S)+2);
   end;

   procedure HAlign;
   var
      I: Integer;
   begin
      CurLine:=0;
      repeat
         flNewLine:=False;
         for I:=0 to Pred(FieldCount) do begin
            Temp:=S[CurLine][I];
            Len:=Length(Temp);
            if Len>W[I] then begin
               if not flNewLine then begin
                  flNewLine:=True;
                  SetLength(S, Succ(Length(S)));
                  SetLength(S[Succ(CurLine)], FieldCount);
               end;
               Part:=Copy(Temp, 1, W[I]);
               Space:=StrRScan(PChar(Part), ' ');
               if (Space=nil) or (Temp[Succ(W[I])]=' ') then begin
                  S[CurLine][I]:=Part;
                  S[Succ(CurLine)][I]:=Trim(Copy(Temp, Succ(W[I]), Len-W[I]));
                  Temp:=Part;
               end
               else begin
                  X:=Space-PChar(Part);
                  S[Succ(CurLine)][I]:=Trim(Copy(Temp, X+1, Len-X));
                  Temp:=Trim(Copy(Part, 1, X));
                  S[CurLine][I]:=Temp;
               end;
               Len:=Length(Temp);
            end;
            if Len<W[I] then begin
               case HA[I] of
                  taLeftJustify: begin
                     S[CurLine][I]:=Temp+StringOfChar(' ', W[I]-Len);
                  end;
                  taCenter: begin
                     X:=((W[I]-Len) div 2);
                     S[CurLine][I]:=StringOfChar(' ', X)+Temp+StringOfChar(' ', W[I]-Len-X);
                  end;
                  taRightJustify: begin
                     S[CurLine][I]:=StringOfChar(' ', W[I]-Len)+Temp;
                  end;
               end;
            end;
         end;
         Inc(CurLine);
      until not flNewLine;
   end;

   procedure VAlign;
   var
      I: Integer;
      J: Integer;
   begin
      if CurLine>1 then begin
         for I:=0 to Pred(FieldCount) do begin
            if VA[I]<>taLeftJustify then begin
               X:=0;
               for J:=0 to Pred(CurLine) do begin
                  if Trim(S[J][I])='' then begin
                     X:=J;
                     Break;
                  end;
               end;
               if (X<>0) and (X<>CurLine) then begin
                  case VA[I] of
                     taCenter: begin
                        X:=(CurLine-X) div 2;
                        for J:=Pred(CurLine) downto X do begin
                           S[J][I]:=S[J-X][I];
                        end;
                     end;
                     taRightJustify: begin
                        X:=CurLine-X;
                        for J:=Pred(CurLine) downto X do begin
                           S[J][I]:=S[J-X][I];
                        end;
                     end;
                  end;
                  for J:=0 to Pred(X) do begin
                     S[J][I]:=StringOfChar(' ', W[I]);
                  end;
               end;
            end;
         end;
      end;
   end;

   procedure PrintHead;
   var
      I: Integer;
      J: Integer;
      K: Integer;
      L: Integer;
      SH: array of array of TStringCell;
      Line: Integer;
      MaxH: Integer;
      CurH: Integer;
      RH: array of TCellH;
      CH: array of TCellH;
      First: Integer;
      Last: Integer;
      flSort: Boolean;
      Col: Integer;
      sl: TStringList;
   begin
      SetLength(SH, 1);
      SetLength(SH[0], FieldCount);
      for I:=0 to Pred(FieldCount) do begin
         SetLength(SH[0][I].S, 1);
         SH[0][I].S[0]:=ExportColumns[I].Caption;
         SH[0][I].W:=W[I];
         SH[0][I].H:=False;
         SH[0][I].I:=-1;
      end;
      CurLine:=0;
      repeat
         flNewLine:=False;
         for I:=0 to Pred(FieldCount) do begin
            Temp:=SH[CurLine][I].S[0];
            X:=Pos('|', Temp);
            if X<>0 then begin
               Y:=Succ(CurLine);
               if not flNewLine then begin
                  flNewLine:=True;
                  SetLength(SH, Succ(Y));
                  SetLength(SH[Y], FieldCount);
                  for J:=0 to Pred(FieldCount) do begin
                     SetLength(SH[Y][J].S, 1);
                     SH[Y][J].W:=W[J];
                     SH[Y][J].H:=False;
                     SH[Y][J].I:=-1;
                  end;
               end;
               Part:=Trim(Copy(Temp, 1, Pred(X)));
               if Part='' then begin
                  Part:=#04;
               end;
               SH[CurLine][I].S[0]:=Part;
               SH[Y][I].S[0]:=Trim(Copy(Temp, Succ(X), Length(Temp)-X));
            end;
         end;
         if flNewLine then begin
            Inc(CurLine);
         end;
      until not flNewLine;
      for J:=0 to CurLine do begin
         for I:=1 to Pred(FieldCount) do begin
            if (SH[J][I].S[0]<>'') and
               (SH[J][Pred(I)].S[0]=SH[J][I].S[0]) and
               ((J=0) or ((J>0) and (SH[Pred(J)][Pred(I)].I<>-1) and (SH[Pred(J)][Pred(I)].I=SH[Pred(J)][I].I))) and
               ((J=CurLine) or ((SH[Succ(J)][Pred(I)].S[0]<>'') and (SH[Succ(J)][I].S[0]<>''))) then begin
               X:=SH[J][Pred(I)].I;
               if X=-1 then begin
                  SH[J][Pred(I)].I:=I;
               end
               else begin
                  for K:=Pred(I) downto 0 do begin
                     if SH[J][K].I=X then begin
                        SH[J][K].I:=I;
                     end
                     else begin
                        Break;
                     end;
                  end;
               end;
               SH[J][Pred(I)].S[0]:='';
               SH[J][I].I:=I;
               SH[J][I].W:=SH[J][I].W+SH[J][Pred(I)].W+1;
            end;
         end;
      end;
      for J:=0 to CurLine do begin
         for I:=0 to Pred(FieldCount) do begin
            if SH[J][I].S[0]<>'' then begin
               Y:=SH[J][I].W;
               flNewLine:=False;
               Line:=0;
               repeat
                  flNewLine:=False;
                  Temp:=SH[J][I].S[Line];
                  Len:=Length(Temp);
                  if Len>Y then begin
                     flNewLine:=True;
                     SetLength(SH[J][I].S, Succ(Length(SH[J][I].S)));
                     Part:=Copy(Temp, 1, Y);
                     Space:=StrRScan(PChar(Part), ' ');
                     if (Space=nil) or (Temp[Succ(Y)]=' ') then begin
                        SH[J][I].S[Line]:=Part;
                        SH[J][I].S[Succ(Line)]:=Trim(Copy(Temp, Succ(Y), Len-Y));
                        Temp:=Part;
                     end
                     else begin
                        X:=Space-PChar(Part);
                        SH[J][I].S[Succ(Line)]:=Trim(Copy(Temp, X+1, Len-X));
                        Temp:=Trim(Copy(Part, 1, X));
                        SH[J][I].S[Line]:=Temp;
                     end;
                     Len:=Length(Temp);
                  end;
                  if Len<Y then begin
                     X:=((Y-Len) div 2);
                     SH[J][I].S[Line]:=StringOfChar(' ', X)+Temp+StringOfChar(' ', Y-Len-X);
                  end;
                  Inc(Line)
               until not flNewLine;
            end;
         end;
      end;
      for I:=0 to Pred(FieldCount) do begin
         for J:=0 to CurLine do begin
            if SH[J][I].S[0]<>'' then begin
               X:=Length(SH[J][I].S);
               SetLength(SH[J][I].S, Succ(X));
               SH[J][I].S[X]:=StringOfChar(' ', SH[J][I].W);
            end;
         end;
      end;
      MaxH:=0;
      SetLength(CH, FieldCount);
      for I:=0 to Pred(FieldCount) do begin
         Y:=0;
         for J:=0 to CurLine do begin
            if SH[J][I].I<>-1 then begin
               Y:=Y+Length(SH[J][SH[J][I].I].S);
            end
            else if SH[J][I].S[0]<>'' then begin
               Y:=Y+Length(SH[J][I].S);
            end;
         end;
         CH[I].H:=Y;
         CH[I].J:=I;
         if Y>MaxH then begin
            MaxH:=Y;
         end;
      end;
      for I:=0 to Pred(FieldCount) do begin
         if CH[I].H=MaxH then begin
            for J:=0 to CurLine do begin
               if SH[J][I].I<>-1 then begin
                  for K:=0 to Pred(FieldCount) do begin
                     if SH[J][K].I=SH[J][I].I then begin
                        SH[J][K].H:=True;
                     end;
                  end;
               end
               else begin
                  SH[J][I].H:=True;
               end;
            end;
         end;
      end;
      repeat
         flSort:=True;
         for I:=1 to Pred(FieldCount) do begin
            if CH[I].H>CH[Pred(I)].H then begin
               X:=CH[Pred(I)].J;
               Y:=CH[Pred(I)].H;
               CH[Pred(I)].J:=CH[I].J;
               CH[Pred(I)].H:=CH[I].H;
               CH[I].J:=X;
               CH[I].H:=Y;
               flSort:=False;
            end;
         end;
      until flSort;
      for Col:=0 to Pred(FieldCount) do begin
         I:=CH[Col].J;
         CurH:=0;
         SetLength(RH, 0);
         for J:=0 to CurLine do begin
            if SH[J][I].I<>-1 then begin
               Y:=Length(SH[J][SH[J][I].I].S);
               CurH:=CurH+Y;
            end
            else if SH[J][I].S[0]<>'' then begin
               Y:=Length(SH[J][I].S);
               CurH:=CurH+Y;
            end
            else begin
               SH[J][I].H:=True;
            end;
            if not SH[J][I].H then begin
               X:=Length(RH);
               SetLength(RH, Succ(X));
               RH[X].H:=Y;
               RH[X].J:=J;
            end;
         end;
         if MaxH<>CurH then begin
            CurH:=MaxH-CurH;
            RH[0].H:=RH[0].H+CurH;
            for J:=0 to Pred(Length(RH)) do begin
               if SH[RH[J].J][I].I=-1 then begin
                  SH[RH[J].J][I].H:=True;
                  SetLength(SH[RH[J].J][I].S, RH[J].H);
                  L:=Pred(RH[J].H);
                  while (SH[RH[J].J][I].S[L]='') and (L>=0) do begin
                     SH[RH[J].J][I].S[L]:=StringOfChar(' ', SH[RH[J].J][I].W);
                     Dec(L);
                  end;
               end
               else begin
                  for K:=0 to Pred(FieldCount) do begin
                     if SH[RH[J].J][K].I=SH[RH[J].J][I].I then begin
                        SH[RH[J].J][K].H:=True;
                        if SH[RH[J].J][K].S[0]<>'' then begin
                           SetLength(SH[RH[J].J][K].S, RH[J].H);
                           L:=Pred(RH[J].H);
                           while (SH[RH[J].J][K].S[L]='') and (L>=0) do begin
                              SH[RH[J].J][K].S[L]:=StringOfChar(' ', SH[RH[J].J][K].W);
                              Dec(L);
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
      for J:=0 to CurLine do begin
         for I:=0 to Pred(FieldCount) do begin
            if SH[J][I].S[0]<>'' then begin
               X:=0;
               Y:=Length(SH[J][I].S);
               for K:=0 to Pred(Y) do begin
                  if Trim(SH[J][I].S[K])='' then begin
                     X:=K;
                     Break;
                  end;
               end;
               Dec(Y);
               if (X<>0) and (X<>Y) then begin
                  X:=(Y-X) div 2;
                  for K:=Pred(Y) downto X do begin
                     SH[J][I].S[K]:=SH[J][I].S[K-X];
                  end;
                  for K:=0 to Pred(X) do begin
                     SH[J][I].S[K]:=StringOfChar(' ', SH[J][I].W);
                  end;
               end;
               SH[J][I].S[Y]:=StringOfChar(#01, SH[J][I].W);
            end;
         end;
      end;
      sl:=TStringList.Create;
      First:=sl.Add('');
      for K:=0 to Pred(MaxH) do begin
         Temp:='';
         for I:=0 to Pred(FieldCount) do begin
            CurH:=0;
            for J:=0 to CurLine do begin
               if SH[J][I].I<>-1 then begin
                  X:=Length(SH[J][SH[J][I].I].S);
               end
               else if SH[J][I].S[0]<>'' then begin
                  X:=Length(SH[J][I].S);
               end;
               if CurH+X>K then begin
                  Break;
               end;
               CurH:=CurH+X;
            end;
            if (SH[J][I].I<>-1) and (SH[J][I].I=I) then begin
               Temp:=Temp+SH[J][SH[J][I].I].S[K-CurH];
               if I<>Pred(FieldCount) then begin
                  Temp:=Temp+#02;
               end;
            end
            else if SH[J][I].S[0]<>'' then begin
               Temp:=Temp+SH[J][I].S[K-CurH];
               if I<>Pred(FieldCount) then begin
                  Temp:=Temp+#02;
               end;
            end;
         end;
         Last:=sl.Add(Temp);
      end;
      X:=Length(sl[Last]);
      sl[First]:=StringOfChar(#01, X);
      for J:=First to Last do begin
         for I:=1 to X do begin
            if (J<Last) and (sl[J][I]=#01) and (sl[Succ(J)][I]=#02) then begin
               Temp:=sl[J];
               Temp[I]:=#03;
               sl[J]:=Temp;
            end;
            if (I>0) and (I<X) and (sl[J][I]=#02) and (sl[J][Pred(I)]=#01) and (sl[J][Succ(I)]=#01) then begin
               Temp:=sl[J];
               Temp[I]:=#03;
               sl[J]:=Temp;
            end;
         end;
      end;
      for J:=First to Last do begin
         for I:=1 to X do begin
            case sl[J][I] of
               #01: begin
                  Temp:=sl[J];
                  Temp[I]:='-';
                  sl[J]:=Temp;
               end;
               #02: begin
                  Temp:=sl[J];
                  Temp[I]:='|';
                  sl[J]:=Temp;
               end;
               #03: begin
                  Temp:=sl[J];
                  Temp[I]:='+';
                  sl[J]:=Temp;
               end;
               #04: begin
                  Temp:=sl[J];
                  Temp[I]:=' ';
                  sl[J]:=Temp;
               end;
            end;
         end;
      end;
      for I:=0 to Pred(sl.Count) do begin
         WriteLn(TxtFile, sl[I]);
      end;
      sl.Free;
   end;

begin
   Result:=False;
   ExportColumns:=FExportData.ExportColumns;
   FieldCount:=ExportColumns.Count;
   //AssignFile(TxtFile, FFileName);
   TxtFile:=nil;
   try
      //Rewrite(TxtFile);
      TxtFile:=TFileStream.Create(FFileName, fmCreate or fmShareExclusive);
      ExportColumns.UpdateWidth(8, 'MS Sans Serif'); // что бы установилось DisplayWidth
      SetLength(W, FieldCount);
      SetLength(HA, FieldCount);
      SetLength(VA, FieldCount);
      for I:=0 to Pred(FieldCount) do begin
         W[I]:=ExportColumns[I].DisplayWidth;
         HA[I]:=taCenter;
         VA[I]:=taCenter;
      end;
      PrintHead;
      for I:=0 to Pred(FieldCount) do begin
         HA[I]:=ExportColumns[I].Alignment;
         VA[I]:=taLeftJustify;
      end;
      FExportData.BeforeExportData;
      ShowStart;
      ShowStartGauge;
      FExportData.FirstData;
      while not FExportData.GetEof do begin
         SetLength(S, 1);
         SetLength(S[0], FieldCount);
         for I:=0 to Pred(FieldCount) do begin
            FieldNo:=ExportColumns[I].FieldIndex;
            if not FExportData.IsFieldNull(FieldNo) then begin
               if FExportData.IsFieldString(FieldNo) then begin
                  S[0][I]:=TrimRight(FExportData.GetFieldValue(FieldNo));
               end
               else begin
                  S[0][I]:=FExportData.GetFieldValue(FieldNo);
               end;
            end
            else begin
               S[0][I]:='';
            end;
         end;
         HAlign;
         VAlign;
         for J:=0 to Pred(CurLine) do begin
            Temp:='';
            for I:=0 to Pred(FieldCount) do begin
               if I=0 then begin
                  Temp:=Temp+S[J][I];
               end
               else begin
                  Temp:=Temp+' ';
                  Temp:=Temp+S[J][I];
               end;
            end;
            WriteLn(TxtFile, Temp);
         end;
         ShowUpdate;
         FExportData.NextData;
      end;
      if FExportData.GetEof then begin
         Result:=True;
      end;
   finally
      FExportData.AfterExportData;
      ShowFinally;
      //CloseFile(TxtFile);
      if TxtFile<>nil then begin
         TxtFile.Free;
      end;
   end;
end;

{ TExportDataToXls8 }

constructor TExportDataToXls8.Create(FileName: string; DataProviderList: TExportDataProviderList);
begin
   inherited;
   FFileExt:='xls';
end;

destructor TExportDataToXls8.Destroy;
begin
   inherited;
end;

function CustomCompare(List: TStringList; Index1, Index2: Integer): Integer;
begin
   Result:=Integer(List.Objects[Index1])-Integer(List.Objects[Index2]);
end;

function TExportDataToXls8.ExportData: Boolean;
type
   TMerge=record
      FC: Word;
      LC: Word;
      FR: Word;
      LR: Word;
   end;

   TBorderLine=(blTop, blBottom, blLeft, blRight);

   THeadCell=record
      S: string;
      RowSpan: Integer;
      Print: Boolean;
      MainCol: Integer;
      MergeRow: Boolean;
      MergeCol: Boolean;
      MergeFirstCol: Boolean;
      MergeFirstRow: Boolean;
      Style: set of TBorderLine;
      Merged: Boolean;
   end;

   THeadCol=array of THeadCell;

   TOrder=record
      Col: Integer;
      NumRow: Integer;
   end;

   TSTR=packed record
      LN: Word;
      B: Byte;
   end;

const

   CSTR: TSTR=(
      LN: 0;
      B: fUnCompressed;
   );

var
   XlsFile: TRootStorage;
   Workbook: TStgStream;
   I: Integer;
   J: Integer;
   Row: Integer;
   RowInBlock: Integer;
   NumBlock: Integer;
   FirstRowOffset: DWORD;
   CellOffset: array [1..32] of Word;
   DBCellOffset: array of DWORD;
   Buffer: TMemoryStream;
   Offset: DWORD;
   Value: WideString;
   X: Word;
   MergeCell: array of TMerge;
   HeadCell: array of THeadCol;
   HeadRow: Integer;
   XF: TXFRec;
   HeadXF: Integer;
   LeftXF: array of Integer;
   RightXF: array of Integer;
   CenterXF: array of Integer;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;
   CellAlign: TIntegerArray;
   SheetName: WideString;
   SheetPosition: array of DWORD;
   SheetOffset: array of DWORD;
   Position: DWORD;
   StringTable: TStringList;
   NumSST: DWORD;
   SizePosition: DWORD;
   Size: Word;
   ValueLength: Integer;
   WriteLength: Integer;
   RowCount: Integer;

   function ParseHead: Integer;
   var
      I: Integer;
      X: Integer;
      Col: Integer;
      Col2: Integer;
      Row: Integer;
      Row2: Integer;
      NumRow: Integer;
      MaxRow: Integer;
      ColOrder: array of TOrder;
      flSort: Boolean;
      RowSpan: string;
      TempStr: string;
      FC: Word;
      FR: Word;
      LC: Word;
      LR: Word;
   begin
      MaxRow:=0;
      SetLength(HeadCell, FieldCount);
      SetLength(ColOrder, FieldCount);
      SetLength(MergeCell, 0);
      for Col:=0 to Pred(FieldCount) do begin
         TempStr:=ExportColumns[Col].Caption;
         SetLength(HeadCell[Col], 1);
         Row:=0;
         HeadCell[Col][Row].S:=TempStr;
         repeat
            X:=Pos('|', TempStr);
            if X<>0 then begin
               HeadCell[Col][Row].S:=Trim(Copy(TempStr, 1, Pred(X)));
               Inc(Row);
               SetLength(HeadCell[Col], Succ(Row));
               TempStr:=Trim(Copy(TempStr, Succ(X), Length(TempStr)-X));
               HeadCell[Col][Row].S:=TempStr;
            end;
         until X=0;
         if MaxRow<Row then begin
            MaxRow:=Row;
         end;
         ColOrder[Col].Col:=Col;
         ColOrder[Col].NumRow:=Row;
      end;
      Result:=MaxRow;
      for Row:=0 to MaxRow do begin
         for Col:=0 to Pred(FieldCount) do begin
            if Length(HeadCell[Col])>Row then begin
               HeadCell[Col][Row].RowSpan:=-1;
               HeadCell[Col][Row].Print:=True;
               HeadCell[Col][Row].MainCol:=-1;
               HeadCell[Col][Row].MergeCol:=False;
               HeadCell[Col][Row].MergeRow:=False;
               HeadCell[Col][Row].MergeFirstCol:=False;
               HeadCell[Col][Row].MergeFirstRow:=False;
               HeadCell[Col][Row].Style:=[];
               HeadCell[Col][Row].Merged:=False;
               if (Col>0) and (Length(HeadCell[Pred(Col)])>Row) and
                  (HeadCell[Pred(Col)][Row].S=HeadCell[Col][Row].S) and
                  ((Row=0) or ((HeadCell[Col][Pred(Row)].MainCol<>-1) and (HeadCell[Pred(Col)][Pred(Row)].MainCol=HeadCell[Col][Pred(Row)].MainCol))) and
                  ((Row=MaxRow) or ((Length(HeadCell[Pred(Col)])>Succ(Row)) and (Length(HeadCell[Col])>Succ(Row)))) then begin
                  if not HeadCell[Pred(Col)][Row].MergeCol then begin
                     HeadCell[Pred(Col)][Row].MergeFirstCol:=True;
                     HeadCell[Pred(Col)][Row].MergeCol:=True;
                  end;
                  HeadCell[Col][Row].MergeCol:=True;
                  HeadCell[Col][Row].Print:=False;
                  HeadCell[Pred(Col)][Row].MainCol:=Col;
                  HeadCell[Col][Row].MainCol:=Col;
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=Pred(Col)) then begin
                        HeadCell[Col2][Row].MainCol:=Col;
                     end;
                  end;
               end;
            end;
         end;
      end;
      repeat
         flSort:=True;
         for I:=1 to Pred(FieldCount) do begin
            if ColOrder[Pred(I)].NumRow<ColOrder[I].NumRow then begin
               flSort:=False;
               Col:=ColOrder[Pred(I)].Col;
               NumRow:=ColOrder[Pred(I)].NumRow;
               ColOrder[Pred(I)].Col:=ColOrder[I].Col;
               ColOrder[Pred(I)].NumRow:=ColOrder[I].NumRow;
               ColOrder[I].Col:=Col;
               ColOrder[I].NumRow:=NumRow;
            end;
         end;
      until flSort;
      for I:=0 to Pred(FieldCount) do begin
         Col:=ColOrder[I].Col;
         NumRow:=0;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan>0 then begin
               NumRow:=NumRow+Pred(HeadCell[Col][Row].RowSpan);
            end;
         end;
         NumRow:=NumRow+Pred(Length(HeadCell[Col]));
         NumRow:=MaxRow-NumRow;
         if NumRow<>0 then begin
            Inc(NumRow);
         end;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan=-1 then begin
               if HeadCell[Col][Row].MainCol=-1 then begin
                  HeadCell[Col][Row].RowSpan:=NumRow;
               end
               else begin
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=HeadCell[Col][Row].MainCol) then begin
                        HeadCell[Col2][Row].RowSpan:=NumRow;
                     end;
                  end;
               end;
               NumRow:=0;
            end;
         end;
      end;
      for Col:=0 to Pred(FieldCount) do begin
         for Row:=0 to MaxRow do begin
            NumRow:=Length(HeadCell[Col]);
            if NumRow>Row then begin
               X:=HeadCell[Col][Row].RowSpan;
               if X>0 then begin
                  Dec(X);
                  SetLength(HeadCell[Col], NumRow+X);
                  for Row2:=Pred(NumRow+X) downto Succ(Row+X) do begin
                     HeadCell[Col][Row2].S:=HeadCell[Col][Row2-X].S;
                     HeadCell[Col][Row2].Print:=HeadCell[Col][Row2-X].Print;
                     HeadCell[Col][Row2].MainCol:=HeadCell[Col][Row2-X].MainCol;
                     HeadCell[Col][Row2].MergeCol:=HeadCell[Col][Row2-X].MergeCol;
                     HeadCell[Col][Row2].MergeFirstCol:=HeadCell[Col][Row2-X].MergeFirstCol;
                     HeadCell[Col][Row2].MergeFirstRow:=HeadCell[Col][Row2-X].MergeFirstRow;
                     HeadCell[Col][Row2].Style:=[];
                     HeadCell[Col][Row2].Merged:=False;
                  end;
                  if ((HeadCell[Col][Row].MainCol<>-1) and (HeadCell[Col][Row].MergeFirstCol)) or (HeadCell[Col][Row].MainCol=-1) then begin
                     HeadCell[Col][Row].MergeFirstRow:=True;
                     HeadCell[Col][Row].MergeRow:=True;
                  end;
                  for Row2:=Succ(Row) to Row+X do begin
                     HeadCell[Col][Row2].S:='';
                     HeadCell[Col][Row2].Print:=False;
                     HeadCell[Col][Row2].MainCol:=-1;
                     HeadCell[Col][Row2].MergeCol:=HeadCell[Col][Row].MergeCol;
                     HeadCell[Col][Row2].MergeFirstCol:=HeadCell[Col][Row].MergeFirstCol;
                     HeadCell[Col][Row2].MergeFirstRow:=False;
                     HeadCell[Col][Row2].MergeRow:=True;
                     HeadCell[Col][Row2].Style:=[];
                     HeadCell[Col][Row2].Merged:=False;
                  end;
               end;
            end;
         end;
      end;
      for Row:=0 to MaxRow do begin
         for Col:=0 to Pred(FieldCount) do begin
            if not HeadCell[Col][Row].Merged then begin
               if HeadCell[Col][Row].MergeFirstCol and HeadCell[Col][Row].MergeFirstRow then begin
                  X:=Length(MergeCell);
                  SetLength(MergeCell, Succ(X));
                  MergeCell[X].FC:=Col;
                  MergeCell[X].LC:=Col;
                  MergeCell[X].FR:=Row;
                  MergeCell[X].LR:=Row;
                  for Col2:=Succ(Col) to Pred(FieldCount) do begin
                     if HeadCell[Col2][Row].MergeCol and not HeadCell[Col2][Row].MergeFirstCol then begin
                        MergeCell[X].LC:=Col2;
                        HeadCell[Col2][Row].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
                  for Row2:=Succ(Row) to MaxRow do begin
                     if HeadCell[Col][Row2].MergeRow and not HeadCell[Col][Row2].MergeFirstRow then begin
                        MergeCell[X].LR:=Row2;
                        HeadCell[Col][Row2].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
               end
               else if HeadCell[Col][Row].MergeFirstCol then begin
                  X:=Length(MergeCell);
                  SetLength(MergeCell, Succ(X));
                  MergeCell[X].FC:=Col;
                  MergeCell[X].LC:=Col;
                  MergeCell[X].FR:=Row;
                  MergeCell[X].LR:=Row;
                  for Col2:=Succ(Col) to Pred(FieldCount) do begin
                     if HeadCell[Col2][Row].MergeCol and not HeadCell[Col2][Row].MergeFirstCol then begin
                        MergeCell[X].LC:=Col2;
                        HeadCell[Col2][Row].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
               end
               else if HeadCell[Col][Row].MergeFirstRow then begin
                  X:=Length(MergeCell);
                  SetLength(MergeCell, Succ(X));
                  MergeCell[X].FC:=Col;
                  MergeCell[X].LC:=Col;
                  MergeCell[X].FR:=Row;
                  MergeCell[X].LR:=Row;
                  for Row2:=Succ(Row) to MaxRow do begin
                     if HeadCell[Col][Row2].MergeRow and not HeadCell[Col][Row2].MergeFirstRow then begin
                        MergeCell[X].LR:=Row2;
                        HeadCell[Col][Row2].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
               end;
            end;
            HeadCell[Col][Row].Merged:=True;
         end;
      end;
      HeadRow:=MaxRow;
   end;

   procedure WriteGlobals;
   var
      I: Integer;
      LastXF: Integer;
   begin
      CBOF.BOFType:=btWorkbookGlobals;
      Workbook.Stream.Write(CBOF, SizeOf(TBOFRec));
      Workbook.Stream.Write(CWINDOW1, SizeOf(TWINDOW1Rec));
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      for I:=1 to CFORMATNum do begin
         CFORMAT.Size:=CFORMATSize[I];
         CFORMAT.ifmt:=CFORMATifmt[I];
         CFORMAT.ln:=CFORMATln[I];
         Workbook.Stream.Write(CFORMAT, SizeOf(TFORMATRec));
         Workbook.Stream.Write(PChar(CFORMATrgch[I])^, Length(CFORMATrgch[I])*2);
      end;
      for I:=1 to CXFNum do begin
         CXF.ifnt:=CXFifnt[I];
         CXF.ifmt:=CXFifmt[I];
         CXF.W1:=CXFW1[I];
         CXF.B3:=CXFB3[I];
         Workbook.Stream.Write(CXF, SizeOf(TXFRec));
      end;
      XF:=CXF;
      XF.ifnt:=0;
      XF.ifmt:=0;
      XF.W1:=$0001;
      XF.B1:=$1A; // vaCentred fWrap haCentred
      XF.B3:=$30;
      XF.DW1:=$20401111;
      XF.DW2:=$00002040;
      HeadXF:=CXFNum;
      Workbook.Stream.Write(XF, SizeOf(TXFRec));
      // сброс параметров рисовании линий
      if not FExportData.ExportColumns.GridLine then begin
         XF.DW1:=0;
         XF.DW2:=0;
      end;
      LastXF:=HeadXF;
      XF.B3:=fAtrAlc;
      SetLength(LeftXF, FDataProviderList.Count);
      SetLength(RightXF, FDataProviderList.Count);
      SetLength(CenterXF, FDataProviderList.Count);
      for I:=0 to Pred(FDataProviderList.Count) do begin
         FExportData:=FDataProviderList[I];
         if FExportData.ExportColumns.GridLine then begin
            XF.DW1:=$20401111;
            XF.DW2:=$00002040;
         end
         else begin
            // сброс параметров рисования линий
            XF.DW1:=0;
            XF.DW2:=0;
         end;
         // стиль "влево"
         Inc(LastXF);
         LeftXF[I]:=LastXF;
         XF.B1:=haLeft;
         Workbook.Stream.Write(XF, SizeOf(TXFRec));
         // стиль "вправо"
         Inc(LastXF);
         RightXF[I]:=LastXF;
         XF.B1:=haRight;
         Workbook.Stream.Write(XF, SizeOf(TXFRec));
         // стиль "середина"
         Inc(LastXF);
         CenterXF[I]:=LastXF;
         XF.B1:=haCentred;
         Workbook.Stream.Write(XF, SizeOf(TXFRec));
      end;
      for I:=1 to CSTYLENum do begin
         CSTYLE.W1:=CSTYLEW1[I];
         CSTYLE.istyBuiltIn:=CSTYLEistyBuiltIn[I];
         Workbook.Stream.Write(CSTYLE, SizeOf(TSTYLERec));
      end;
      // запись наименований листов
      SetLength(SheetPosition, FDataProviderList.Count);
      SetLength(SheetOffset, FDataProviderList.Count);
      for I:=0 to Pred(FDataProviderList.Count) do begin
         FExportData:=FDataProviderList[I];
         SheetPosition[I]:=Workbook.Stream.Position+4;
         if FExportData.SheetName='' then begin
            SheetName:=Format(CBoundsheetName, [Succ(I)]);
         end
         else begin
            SheetName:=FExportData.SheetName;
         end;
         CBOUNDSHEET.lbPlyPos:=0;
         CBOUNDSHEET.Size:=8+2*Length(SheetName);
         CBOUNDSHEET.LN:=Length(SheetName);
         Workbook.Stream.Write(CBOUNDSHEET, SizeOf(TBOUNDSHEETRec));
         Workbook.Stream.Write(PChar(SheetName)^, Length(SheetName)*2);
      end;
   end;

   function GetSST(S: string): Integer;
   var
      Ind: Integer;
   begin
      Inc(NumSST);
      if StringTable.Find(S, Ind) then begin
         Result:=Integer(StringTable.Objects[Ind]);
      end
      else begin
         Result:=StringTable.Count;
         StringTable.AddObject(S, TObject(Result));
      end;
   end;

   procedure PrintHead;
   var
      I: Integer;
      R: Integer;
      C: Integer;
   begin
      for R:=0 to HeadRow do begin
         if (Row mod 32)=0 then begin
            if Row<>0 then begin
               Offset:=Buffer.Position;
               Inc(NumBlock);
               SetLength(DBCellOffset, NumBlock);
               DBCellOffset[Pred(NumBlock)]:=Offset;
               CDBCELL.Size:=SizeOf(TDBCELLRec)-4+2*32;
               CDBCELL.dbRtrw:=Offset-FirstRowOffset;
               Buffer.Write(CDBCELL, SizeOf(TDBCELLRec));
               for I:=1 to 32 do begin
                  if CellOffset[I]<>0 then begin
                     CellOffset[I]:=CellOffset[I]-FirstRowOffset-SizeOf(TROWRec)
                  end;
                  Buffer.Write(CellOffset[I], SizeOf(Word));
                  CellOffset[I]:=0;
               end;
            end;
            RowInBlock:=0;
            FirstRowOffset:=Buffer.Position;
            for I:=1 to 32 do begin
               CROW.rw:=Pred(Row+I);
               CROW.colMic:=0;
               CROW.colMac:=FieldCount;
               Buffer.Write(CROW, SizeOf(TROWRec));
            end;
         end;
         CellOffset[Succ(RowInBlock)]:=Buffer.Position;
         for C:=0 to Pred(FieldCount) do begin
            if HeadCell[C][R].Print then begin
               Value:=HeadCell[C][R].S;
               CLABELSST.rw:=R;
               CLABELSST.col:=C;
               CLABELSST.ixfe:=HeadXF;
               CLABELSST.isst:=GetSST(Value);
               Buffer.Write(CLABELSST, SizeOf(TLABELSSTRec));
            end
            else begin
               CBLANK.rw:=R;
               CBLANK.col:=C;
               CBLANK.ixfe:=HeadXF;
               Buffer.Write(CBLANK, SizeOf(TBLANKRec));
            end;
         end;
         Inc(Row);
         Inc(RowInBlock);
      end;
   end;

   procedure WriteSize;
   begin
      Position:=Workbook.Stream.Position;
      Workbook.Stream.Position:=SizePosition;
      Workbook.Stream.Write(Size, SizeOf(Word));
      Workbook.Stream.Position:=Position;
      SizePosition:=Workbook.Stream.Position+2;
   end;

begin
   Result:=False;
   XlsFile:=TRootStorage.Create;
   Buffer:=TMemoryStream.Create;
   Workbook:=nil;
   StringTable:=TStringList.Create;
   StringTable.Duplicates:=dupIgnore;
   StringTable.Sorted:=True;
   NumSST:=0;
   try
      if XlsFile.OpenFile(FFileName, sfsRewrite) then begin
         Workbook:=XlsFile.CreateStream('Workbook', GetMode(amReadWrite, smExclusive, tmDirect, ofFail, []));
         WriteGlobals;
         for J:=0 to Pred(FDataProviderList.Count) do begin
            FExportData:=FDataProviderList[J];
            try
               ExportColumns:=FExportData.ExportColumns;
               FieldCount:=ExportColumns.Count;
               ExportColumns.UpdateWidth(10, 'Arial Cyr');
               NumBlock:=0;
               SetLength(DBCellOffset, 0);
               SetLength(CellAlign, FieldCount);
               Row:=0;
               RowInBlock:=0;
               FirstRowOffset:=0;
               for I:=1 to 32 do begin
                  CellOffset[I]:=0;
               end;
               RowCount:=ParseHead;
               for I:=0 to Pred(FieldCount) do begin
                  case ExportColumns[I].Alignment of
                     taLeftJustify: CellAlign[I]:=LeftXF[J];
                     taRightJustify: CellAlign[I]:=RightXF[J];
                     taCenter: CellAlign[I]:=CenterXF[J];
                  end;
               end;
               //
               SheetOffset[J]:=Buffer.Position;
               CBOF.BOFType:=btWorksheet;
               Buffer.Write(CBOF, SizeOf(TBOFRec));
               for I:=0 to Pred(FieldCount) do begin
                  CCOLINFO.fc:=I;
                  CCOLINFO.lc:=I;
                  CCOLINFO.Width:=(ExportColumns[I].DisplayWidth)*256; //??!!!!????
                  Buffer.Write(CCOLINFO, SizeOf(TCOLINFORec));
               end;
               CDIMENSIONS.rwMic:=0;
               CDIMENSIONS.rwMac:=Row;
               CDIMENSIONS.colMic:=0;
               CDIMENSIONS.colMac:=FieldCount;
               Buffer.Write(CDIMENSIONS, SizeOf(TDIMENSIONSRec));
               PrintHead;
               FExportData.BeforeExportData;
               ShowStart;
               ShowStartGauge;
               FExportData.FirstData;
               while not FExportData.GetEof and (RowCount<CMaxExcelRow) do begin
                  if (Row mod 32)=0 then begin
                     if Row<>0 then begin
                        Offset:=Buffer.Position;
                        Inc(NumBlock);
                        SetLength(DBCellOffset, NumBlock);
                        DBCellOffset[Pred(NumBlock)]:=Offset;
                        CDBCELL.Size:=SizeOf(TDBCELLRec)-4+2*32;
                        CDBCELL.dbRtrw:=Offset-FirstRowOffset;
                        Buffer.Write(CDBCELL, SizeOf(TDBCELLRec));
                        for I:=1 to 32 do begin
                           if CellOffset[I]<>0 then begin
                              CellOffset[I]:=CellOffset[I]-FirstRowOffset-SizeOf(TROWRec)
                           end;
                           Buffer.Write(CellOffset[I], SizeOf(Word));
                           CellOffset[I]:=0;
                        end;
                     end;
                     RowInBlock:=0;
                     FirstRowOffset:=Buffer.Position;
                     for I:=1 to 32 do begin
                        CROW.rw:=Pred(Row+I);
                        CROW.colMic:=0;
                        CROW.colMac:=FieldCount;
                        Buffer.Write(CROW, SizeOf(TROWRec));
                     end;
                  end;
                  CellOffset[Succ(RowInBlock)]:=Buffer.Position;
                  for I:=0 to Pred(FieldCount) do begin
                     if ((Pos('POKAZ_', FExportData.GetFieldName(ExportColumns[I].FieldIndex))=1) or
                        (Pos('COUNT_', FExportData.GetFieldName(ExportColumns[I].FieldIndex))=1)) and
                        FExportData.IsFieldNumber(ExportColumns[I].FieldIndex)
                     then begin
                        Value:=Trim(FExportData.GetFieldValue(ExportColumns[I].FieldIndex));
                        if FExportData.IsFieldNull(ExportColumns[I].FieldIndex) or (Value='') then begin
                           Value:='0';
                        end;
                        //if not FExportData.IsFieldNull(ExportColumns[I].FieldIndex) and (Value<>'') then begin
                           CNUMBER.Size:=SizeOf(TNUMBERRec)-4; {??? константой сделать ???}
                           CNUMBER.rw:=Row;
                           CNUMBER.col:=I;
                           CNUMBER.ixfe:=CellAlign[I];
                           CNUMBER.num:=StrToFloat(Value); {??? исключения ???}
                           Buffer.Write(CNUMBER, SizeOf(TNUMBERRec));
                        //end
                        //else begin
                        //   CBLANK.rw:=Row;
                        //   CBLANK.col:=I;
                        //   CBLANK.ixfe:=CellAlign[I];
                        //   Buffer.Write(CBLANK, SizeOf(TBLANKRec));
                        //end;
                     end
                     else begin
                        Value:=FExportData.GetFieldValue(ExportColumns[I].FieldIndex);
                        CLABELSST.rw:=Row;
                        CLABELSST.col:=I;
                        CLABELSST.ixfe:=CellAlign[I];
                        CLABELSST.isst:=GetSST(Value);
                        Buffer.Write(CLABELSST, SizeOf(TLABELSSTRec));
                     end;
                  end;
                  Inc(Row);
                  Inc(RowInBlock);
                  ShowUpdate;
                  FExportData.NextData;
                  Inc(RowCount);
               end;
               ShowStop;
               if FExportData.GetEof then begin
                  Result:=True;
               end;
            finally
               FExportData.AfterExportData;
               ShowFinally;
               if Row<>0 then begin
                  Offset:=Buffer.Position;
                  Inc(NumBlock);
                  SetLength(DBCellOffset, NumBlock);
                  DBCellOffset[Pred(NumBlock)]:=Offset;
                  CDBCELL.Size:=SizeOf(TDBCELLRec)-4+2*32;
                  CDBCELL.dbRtrw:=Offset-FirstRowOffset;
                  Buffer.Write(CDBCELL, SizeOf(TDBCELLRec));
                  for I:=1 to 32 do begin
                     if CellOffset[I]<>0 then begin
                        CellOffset[I]:=CellOffset[I]-FirstRowOffset-SizeOf(TROWRec)
                     end;
                     Buffer.Write(CellOffset[I], SizeOf(Word));
                  end;
               end;
               if J=0 then begin
                  CWINDOW2.grbit:=fDspGrid or fDspRwCol or fDspZeros or fDefaultHdr or fDspGuts or fSelected or fVisible;
               end
               else begin
                  CWINDOW2.grbit:=fDspGrid or fDspRwCol or fDspZeros or fDefaultHdr or fDspGuts;
               end;
               Buffer.Write(CWINDOW2, SizeOf(TWINDOW2Rec));
               if Length(MergeCell)>0 then begin
                  CMERGEDCELLS.Size:=SizeOf(TMERGEDCELLSRec)-4+SizeOf(TADDRRec)*Length(MergeCell);
                  CMERGEDCELLS.nm:=Length(MergeCell);
                  Buffer.Write(CMERGEDCELLS, SizeOf(TMERGEDCELLSRec));
                  for I:=0 to Pred(Length(MergeCell)) do begin
                     CADDR.fr:=MergeCell[I].fr;
                     CADDR.lr:=MergeCell[I].lr;
                     CADDR.fc:=MergeCell[I].fc;
                     CADDR.lc:=MergeCell[I].lc;
                     Buffer.Write(CADDR, SizeOf(TADDRRec));
                  end;
               end;
               Buffer.Write(CEOF, SizeOf(TEOFRec));
            end;
         end;
         SizePosition:=Workbook.Stream.Position+2;
         StringTable.Sorted:=False;
         StringTable.CustomSort(CustomCompare);
         CSST.TotalNum:=NumSST;
         CSST.nm:=StringTable.Count;
         Workbook.Stream.Write(CSST, SizeOf(TSSTRec));
         Size:=8;
         for I:=0 to Pred(StringTable.Count) do begin
            Value:=StringTable[I];
            ValueLength:=Length(Value);
            CSTR.LN:=ValueLength;
            if Size+SizeOf(CSTR)+2>=CMaxDataSize then begin
               WriteSize;
               Workbook.Stream.Write(CCONTINUE, SizeOf(CCONTINUE));
               Size:=0;
            end;
            Workbook.Stream.Write(CSTR, SizeOf(CSTR));
            Inc(Size, SizeOf(CSTR));
            repeat
               WriteLength:=ValueLength;
               if Size+WriteLength*2>CMaxDataSize then begin
                  WriteLength:=(CMaxDataSize-Size) div 2;
               end;
               Workbook.Stream.Write(PWideChar(@Value[Succ(CSTR.LN-ValueLength)])^, WriteLength*2);
               //Workbook.Stream.Write(PWideChar(@Value[1])^, WriteLength*2);
               Inc(Size, WriteLength*2);
               ValueLength:=ValueLength-WriteLength;
               if ValueLength<>0 then begin
                  WriteSize;
                  Workbook.Stream.Write(CCONTINUE, SizeOf(CCONTINUE));
                  Workbook.Stream.Write(CSTR.B, SizeOf(Byte));
                  Size:=1;
               end;
            until ValueLength=0;
         end;
         //Position:=Workbook.Stream.Position;
         //Workbook.Stream.Position:=SizePosition;
         //Workbook.Stream.Write(Size, SizeOf(Word));
         //Workbook.Stream.Position:=Position;
         WriteSize;
         Workbook.Stream.Write(CEOF, SizeOf(TEOFRec));
         Position:=Workbook.Stream.Position;
         Workbook.Stream.Write(Buffer.Memory^, Buffer.Size);
         for J:=0 to Pred(FDataProviderList.Count) do begin
            Workbook.Stream.Position:=SheetPosition[J];
            SheetOffset[J]:=SheetOffset[J]+Position;
            Workbook.Stream.Write(SheetOffset[J], SizeOf(DWORD));
         end;
      end;
   finally
      if Workbook<>nil then begin
         Workbook.Free;
      end;
      XlsFile.Free;
      Buffer.Free;
      StringTable.Free;
   end;
end;

function TExportDataToXls8.oldExportData: Boolean;
type
   TMerge=record
      FC: Word;
      LC: Word;
      FR: Word;
      LR: Word;
   end;

   TBorderLine=(blTop, blBottom, blLeft, blRight);

   THeadCell=record
      S: string;
      RowSpan: Integer;
      Print: Boolean;
      MainCol: Integer;
      MergeRow: Boolean;
      MergeCol: Boolean;
      MergeFirstCol: Boolean;
      MergeFirstRow: Boolean;
      Style: set of TBorderLine;
      Merged: Boolean;
   end;

   THeadCol=array of THeadCell;

   TOrder=record
      Col: Integer;
      NumRow: Integer;
   end;

var
   XlsFile: TRootStorage;
   Workbook: TStgStream;
   I: Integer;
   J: Integer;
   Row: Integer;
   RowInBlock: Integer;
   NumBlock: Integer;
   FirstRowOffset: DWORD;
   CellOffset: array [1..32] of Word;
   DBCellOffset: array of DWORD;
   Buffer: TMemoryStream;
   Offset: DWORD;
   Value: WideString;
   X: Word;
   MergeCell: array of TMerge;
   HeadCell: array of THeadCol;
   HeadRow: Integer;
   XF: TXFRec;
   HeadXF: Integer;
   LeftXF: array of Integer;
   RightXF: array of Integer;
   CenterXF: array of Integer;
   FieldCount: Integer;
   ExportColumns: TExportColumnList;
   CellAlign: TIntegerArray;
   SheetPos: LongInt;
   BoundsheetPos: array of LongInt;
   SheetName: WideString;

   procedure ParseHead;
   var
      I: Integer;
      X: Integer;
      Col: Integer;
      Col2: Integer;
      Row: Integer;
      Row2: Integer;
      NumRow: Integer;
      MaxRow: Integer;
      ColOrder: array of TOrder;
      flSort: Boolean;
      RowSpan: string;
      TempStr: string;
      FC: Word;
      FR: Word;
      LC: Word;
      LR: Word;
   begin
      MaxRow:=0;
      SetLength(HeadCell, FieldCount);
      SetLength(ColOrder, FieldCount);
      SetLength(MergeCell, 0);
      for Col:=0 to Pred(FieldCount) do begin
         TempStr:=ExportColumns[Col].Caption;
         SetLength(HeadCell[Col], 1);
         Row:=0;
         HeadCell[Col][Row].S:=TempStr;
         repeat
            X:=Pos('|', TempStr);
            if X<>0 then begin
               HeadCell[Col][Row].S:=Trim(Copy(TempStr, 1, Pred(X)));
               Inc(Row);
               SetLength(HeadCell[Col], Succ(Row));
               TempStr:=Trim(Copy(TempStr, Succ(X), Length(TempStr)-X));
               HeadCell[Col][Row].S:=TempStr;
            end;
         until X=0;
         if MaxRow<Row then begin
            MaxRow:=Row;
         end;
         ColOrder[Col].Col:=Col;
         ColOrder[Col].NumRow:=Row;
      end;
      for Row:=0 to MaxRow do begin
         for Col:=0 to Pred(FieldCount) do begin
            if Length(HeadCell[Col])>Row then begin
               HeadCell[Col][Row].RowSpan:=-1;
               HeadCell[Col][Row].Print:=True;
               HeadCell[Col][Row].MainCol:=-1;
               HeadCell[Col][Row].MergeCol:=False;
               HeadCell[Col][Row].MergeRow:=False;
               HeadCell[Col][Row].MergeFirstCol:=False;
               HeadCell[Col][Row].MergeFirstRow:=False;
               HeadCell[Col][Row].Style:=[];
               HeadCell[Col][Row].Merged:=False;
               if (Col>0) and (Length(HeadCell[Pred(Col)])>Row) and
                  (HeadCell[Pred(Col)][Row].S=HeadCell[Col][Row].S) and
                  ((Row=0) or ((HeadCell[Col][Pred(Row)].MainCol<>-1) and (HeadCell[Pred(Col)][Pred(Row)].MainCol=HeadCell[Col][Pred(Row)].MainCol))) and
                  ((Row=MaxRow) or ((Length(HeadCell[Pred(Col)])>Succ(Row)) and (Length(HeadCell[Col])>Succ(Row)))) then begin
                  if not HeadCell[Pred(Col)][Row].MergeCol then begin
                     HeadCell[Pred(Col)][Row].MergeFirstCol:=True;
                     HeadCell[Pred(Col)][Row].MergeCol:=True;
                  end;
                  HeadCell[Col][Row].MergeCol:=True;
                  HeadCell[Col][Row].Print:=False;
                  HeadCell[Pred(Col)][Row].MainCol:=Col;
                  HeadCell[Col][Row].MainCol:=Col;
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=Pred(Col)) then begin
                        HeadCell[Col2][Row].MainCol:=Col;
                     end;
                  end;
               end;
            end;
         end;
      end;
      repeat
         flSort:=True;
         for I:=1 to Pred(FieldCount) do begin
            if ColOrder[Pred(I)].NumRow<ColOrder[I].NumRow then begin
               flSort:=False;
               Col:=ColOrder[Pred(I)].Col;
               NumRow:=ColOrder[Pred(I)].NumRow;
               ColOrder[Pred(I)].Col:=ColOrder[I].Col;
               ColOrder[Pred(I)].NumRow:=ColOrder[I].NumRow;
               ColOrder[I].Col:=Col;
               ColOrder[I].NumRow:=NumRow;
            end;
         end;
      until flSort;
      for I:=0 to Pred(FieldCount) do begin
         Col:=ColOrder[I].Col;
         NumRow:=0;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan>0 then begin
               NumRow:=NumRow+Pred(HeadCell[Col][Row].RowSpan);
            end;
         end;
         NumRow:=NumRow+Pred(Length(HeadCell[Col]));
         NumRow:=MaxRow-NumRow;
         if NumRow<>0 then begin
            Inc(NumRow);
         end;
         for Row:=0 to Pred(Length(HeadCell[Col])) do begin
            if HeadCell[Col][Row].RowSpan=-1 then begin
               if HeadCell[Col][Row].MainCol=-1 then begin
                  HeadCell[Col][Row].RowSpan:=NumRow;
               end
               else begin
                  for Col2:=0 to Pred(FieldCount) do begin
                     if (Length(HeadCell[Col2])>Row) and (HeadCell[Col2][Row].MainCol=HeadCell[Col][Row].MainCol) then begin
                        HeadCell[Col2][Row].RowSpan:=NumRow;
                     end;
                  end;
               end;
               NumRow:=0;
            end;
         end;
      end;
      for Col:=0 to Pred(FieldCount) do begin
         for Row:=0 to MaxRow do begin
            NumRow:=Length(HeadCell[Col]);
            if NumRow>Row then begin
               X:=HeadCell[Col][Row].RowSpan;
               if X>0 then begin
                  Dec(X);
                  SetLength(HeadCell[Col], NumRow+X);
                  for Row2:=Pred(NumRow+X) downto Succ(Row+X) do begin
                     HeadCell[Col][Row2].S:=HeadCell[Col][Row2-X].S;
                     HeadCell[Col][Row2].Print:=HeadCell[Col][Row2-X].Print;
                     HeadCell[Col][Row2].MainCol:=HeadCell[Col][Row2-X].MainCol;
                     HeadCell[Col][Row2].MergeCol:=HeadCell[Col][Row2-X].MergeCol;
                     HeadCell[Col][Row2].MergeFirstCol:=HeadCell[Col][Row2-X].MergeFirstCol;
                     HeadCell[Col][Row2].MergeFirstRow:=HeadCell[Col][Row2-X].MergeFirstRow;
                     HeadCell[Col][Row2].Style:=[];
                     HeadCell[Col][Row2].Merged:=False;
                  end;
                  if ((HeadCell[Col][Row].MainCol<>-1) and (HeadCell[Col][Row].MergeFirstCol)) or (HeadCell[Col][Row].MainCol=-1) then begin
                     HeadCell[Col][Row].MergeFirstRow:=True;
                     HeadCell[Col][Row].MergeRow:=True;
                  end;
                  for Row2:=Succ(Row) to Row+X do begin
                     HeadCell[Col][Row2].S:='';
                     HeadCell[Col][Row2].Print:=False;
                     HeadCell[Col][Row2].MainCol:=-1;
                     HeadCell[Col][Row2].MergeCol:=HeadCell[Col][Row].MergeCol;
                     HeadCell[Col][Row2].MergeFirstCol:=HeadCell[Col][Row].MergeFirstCol;
                     HeadCell[Col][Row2].MergeFirstRow:=False;
                     HeadCell[Col][Row2].MergeRow:=True;
                     HeadCell[Col][Row2].Style:=[];
                     HeadCell[Col][Row2].Merged:=False;
                  end;
               end;
            end;
         end;
      end;
      for Row:=0 to MaxRow do begin
         for Col:=0 to Pred(FieldCount) do begin
            if not HeadCell[Col][Row].Merged then begin
               if HeadCell[Col][Row].MergeFirstCol and HeadCell[Col][Row].MergeFirstRow then begin
                  X:=Length(MergeCell);
                  SetLength(MergeCell, Succ(X));
                  MergeCell[X].FC:=Col;
                  MergeCell[X].LC:=Col;
                  MergeCell[X].FR:=Row;
                  MergeCell[X].LR:=Row;
                  for Col2:=Succ(Col) to Pred(FieldCount) do begin
                     if HeadCell[Col2][Row].MergeCol and not HeadCell[Col2][Row].MergeFirstCol then begin
                        MergeCell[X].LC:=Col2;
                        HeadCell[Col2][Row].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
                  for Row2:=Succ(Row) to MaxRow do begin
                     if HeadCell[Col][Row2].MergeRow and not HeadCell[Col][Row2].MergeFirstRow then begin
                        MergeCell[X].LR:=Row2;
                        HeadCell[Col][Row2].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
               end
               else if HeadCell[Col][Row].MergeFirstCol then begin
                  X:=Length(MergeCell);
                  SetLength(MergeCell, Succ(X));
                  MergeCell[X].FC:=Col;
                  MergeCell[X].LC:=Col;
                  MergeCell[X].FR:=Row;
                  MergeCell[X].LR:=Row;
                  for Col2:=Succ(Col) to Pred(FieldCount) do begin
                     if HeadCell[Col2][Row].MergeCol and not HeadCell[Col2][Row].MergeFirstCol then begin
                        MergeCell[X].LC:=Col2;
                        HeadCell[Col2][Row].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
               end
               else if HeadCell[Col][Row].MergeFirstRow then begin
                  X:=Length(MergeCell);
                  SetLength(MergeCell, Succ(X));
                  MergeCell[X].FC:=Col;
                  MergeCell[X].LC:=Col;
                  MergeCell[X].FR:=Row;
                  MergeCell[X].LR:=Row;
                  for Row2:=Succ(Row) to MaxRow do begin
                     if HeadCell[Col][Row2].MergeRow and not HeadCell[Col][Row2].MergeFirstRow then begin
                        MergeCell[X].LR:=Row2;
                        HeadCell[Col][Row2].Merged:=True;
                     end
                     else begin
                        Break;
                     end;
                  end;
               end;
            end;
            HeadCell[Col][Row].Merged:=True;
         end;
      end;
      HeadRow:=MaxRow;
   end;

   procedure WriteGlobals;
   var
      I: Integer;
      LastXF: Integer;
   begin
      CBOF.BOFType:=btWorkbookGlobals;
      Workbook.Stream.Write(CBOF, SizeOf(TBOFRec));
      Workbook.Stream.Write(CWINDOW1, SizeOf(TWINDOW1Rec));
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      Workbook.Stream.Write(CFONT, SizeOf(TFONTRec));
      Workbook.Stream.Write(PChar(CFontName)^, Length(CFontName)*2);
      for I:=1 to CFORMATNum do begin
         CFORMAT.Size:=CFORMATSize[I];
         CFORMAT.ifmt:=CFORMATifmt[I];
         CFORMAT.ln:=CFORMATln[I];
         Workbook.Stream.Write(CFORMAT, SizeOf(TFORMATRec));
         Workbook.Stream.Write(PChar(CFORMATrgch[I])^, Length(CFORMATrgch[I])*2);
      end;
      for I:=1 to CXFNum do begin
         CXF.ifnt:=CXFifnt[I];
         CXF.ifmt:=CXFifmt[I];
         CXF.W1:=CXFW1[I];
         CXF.B3:=CXFB3[I];
         Workbook.Stream.Write(CXF, SizeOf(TXFRec));
      end;
      XF:=CXF;
      XF.ifnt:=0;
      XF.ifmt:=0;
      XF.W1:=$0001;
      XF.B1:=$1A;
      XF.B3:=$30;
      XF.DW1:=$20401111;
      XF.DW2:=$00002040;
      HeadXF:=CXFNum;
      Workbook.Stream.Write(XF, SizeOf(TXFRec));
      //
      LastXF:=HeadXF;
      XF.B3:=fAtrAlc;
      SetLength(LeftXF, FDataProviderList.Count);
      SetLength(RightXF, FDataProviderList.Count);
      SetLength(CenterXF, FDataProviderList.Count);
      for I:=0 to Pred(FDataProviderList.Count) do begin
         FExportData:=FDataProviderList[I];
         if FExportData.ExportColumns.GridLine then begin
            XF.DW1:=$20401111;
            XF.DW2:=$00002040;
         end
         else begin
            // сброс параметров рисования линий
            XF.DW1:=0;
            XF.DW2:=0;
         end;
         // стиль "влево"
         Inc(LastXF);
         LeftXF[I]:=LastXF;
         XF.B1:=haLeft;
         Workbook.Stream.Write(XF, SizeOf(TXFRec));
         // стиль "вправо"
         Inc(LastXF);
         RightXF[I]:=LastXF;
         XF.B1:=haRight;
         Workbook.Stream.Write(XF, SizeOf(TXFRec));
         // стиль "середина"
         Inc(LastXF);
         CenterXF[I]:=LastXF;
         XF.B1:=haCentred;
         Workbook.Stream.Write(XF, SizeOf(TXFRec));
      end;
      for I:=1 to CSTYLENum do begin
         CSTYLE.W1:=CSTYLEW1[I];
         CSTYLE.istyBuiltIn:=CSTYLEistyBuiltIn[I];
         Workbook.Stream.Write(CSTYLE, SizeOf(TSTYLERec));
      end;
      // запись наименований листов
      SetLength(BoundsheetPos, FDataProviderList.Count);
      for I:=0 to Pred(FDataProviderList.Count) do begin
         FExportData:=FDataProviderList[I];
         BoundsheetPos[I]:=Workbook.Stream.Position;
         if FExportData.SheetName='' then begin
            SheetName:=Format(CBoundsheetName, [Succ(I)]);
         end
         else begin
            SheetName:=FExportData.SheetName;
         end;
         Workbook.Stream.Position:=Workbook.Stream.Position+SizeOf(TBOUNDSHEETRec);
         Workbook.Stream.Write(PChar(SheetName)^, Length(SheetName)*2);
      end;
      Workbook.Stream.Write(CEOF, SizeOf(TEOFRec));
   end;

   procedure PrintHead;
   var
      I: Integer;
      R: Integer;
      C: Integer;
   begin
      for R:=0 to HeadRow do begin
         if (Row mod 32)=0 then begin
            if Row<>0 then begin
               Offset:=Buffer.Position;
               Inc(NumBlock);
               SetLength(DBCellOffset, NumBlock);
               DBCellOffset[Pred(NumBlock)]:=Offset;
               CDBCELL.Size:=SizeOf(TDBCELLRec)-4+2*32;
               CDBCELL.dbRtrw:=Offset-FirstRowOffset;
               Buffer.Write(CDBCELL, SizeOf(TDBCELLRec));
               for I:=1 to 32 do begin
                  if CellOffset[I]<>0 then begin
                     CellOffset[I]:=CellOffset[I]-FirstRowOffset-SizeOf(TROWRec)
                  end;
                  Buffer.Write(CellOffset[I], SizeOf(Word));
                  CellOffset[I]:=0;
               end;
            end;
            RowInBlock:=0;
            FirstRowOffset:=Buffer.Position;
            for I:=1 to 32 do begin
               CROW.rw:=Pred(Row+I);
               CROW.colMic:=0;
               CROW.colMac:=FieldCount;
               Buffer.Write(CROW, SizeOf(TROWRec));
            end;
         end;
         CellOffset[Succ(RowInBlock)]:=Buffer.Position;
         for C:=0 to Pred(FieldCount) do begin
            if HeadCell[C][R].Print then begin
               Value:=HeadCell[C][R].S;
               CLABEL.Size:=SizeOf(TLABELRec)-4+Length(Value)*2;
               CLABEL.rw:=R;
               CLABEL.col:=C;
               CLABEL.ixfe:=HeadXF;
               CLABEL.ln:=Length(Value);
               Buffer.Write(CLABEL, SizeOf(TLABELRec));
               Buffer.Write(PChar(Value)^, Length(Value)*2);
            end
            else begin
               CBLANK.rw:=R;
               CBLANK.col:=C;
               CBLANK.ixfe:=HeadXF;
               Buffer.Write(CBLANK, SizeOf(TBLANKRec));
            end;
         end;
         Inc(Row);
         Inc(RowInBlock);
      end;
   end;

begin
   Result:=False;
   XlsFile:=TRootStorage.Create;
   Workbook:=nil;
   try
      if XlsFile.OpenFile(FFileName, sfsRewrite) then begin
         Workbook:=XlsFile.CreateStream('Workbook', GetMode(amReadWrite, smExclusive, tmDirect, ofFail, []));
         WriteGlobals;
         for J:=0 to Pred(FDataProviderList.Count) do begin
            FExportData:=FDataProviderList[J];
            Buffer:=TMemoryStream.Create;
            try
               ExportColumns:=FExportData.ExportColumns;
               FieldCount:=ExportColumns.Count;
               ExportColumns.UpdateWidth(10, 'Arial Cyr');
               NumBlock:=0;
               SetLength(DBCellOffset, 0);
               SetLength(CellAlign, FieldCount);
               Row:=0;
               RowInBlock:=0;
               FirstRowOffset:=0;
               for I:=1 to 32 do begin
                  CellOffset[I]:=0;
               end;
               ParseHead;
               for I:=0 to Pred(FieldCount) do begin
                  case ExportColumns[I].Alignment of
                     taLeftJustify: CellAlign[I]:=LeftXF[J];
                     taRightJustify: CellAlign[I]:=RightXF[J];
                     taCenter: CellAlign[I]:=CenterXF[J];
                  end;
               end;
               //
               SheetPos:=Workbook.Stream.Position;
               Workbook.Stream.Position:=BoundsheetPos[J];
               if FExportData.SheetName='' then begin
                  SheetName:=Format(CBoundsheetName, [Succ(J)]);
               end
               else begin
                  SheetName:=FExportData.SheetName;
               end;
               CBOUNDSHEET.lbPlyPos:=SheetPos;
               CBOUNDSHEET.Size:=8+2*Length(SheetName);
               CBOUNDSHEET.LN:=Length(SheetName);
               Workbook.Stream.Write(CBOUNDSHEET, SizeOf(TBOUNDSHEETRec));
               Workbook.Stream.Position:=SheetPos;
               //
               CBOF.BOFType:=btWorksheet;
               Workbook.Stream.Write(CBOF, SizeOf(TBOFRec));
               PrintHead;
               FExportData.BeforeExportData;
               ShowStart;
               ShowStartGauge;
               FExportData.FirstData;
               while not FExportData.GetEof do begin
                  if (Row mod 32)=0 then begin
                     if Row<>0 then begin
                        Offset:=Buffer.Position;
                        Inc(NumBlock);
                        SetLength(DBCellOffset, NumBlock);
                        DBCellOffset[Pred(NumBlock)]:=Offset;
                        CDBCELL.Size:=SizeOf(TDBCELLRec)-4+2*32;
                        CDBCELL.dbRtrw:=Offset-FirstRowOffset;
                        Buffer.Write(CDBCELL, SizeOf(TDBCELLRec));
                        for I:=1 to 32 do begin
                           if CellOffset[I]<>0 then begin
                              CellOffset[I]:=CellOffset[I]-FirstRowOffset-SizeOf(TROWRec)
                           end;
                           Buffer.Write(CellOffset[I], SizeOf(Word));
                           CellOffset[I]:=0;
                        end;
                     end;
                     RowInBlock:=0;
                     FirstRowOffset:=Buffer.Position;
                     for I:=1 to 32 do begin
                        CROW.rw:=Pred(Row+I);
                        CROW.colMic:=0;
                        CROW.colMac:=FieldCount;
                        Buffer.Write(CROW, SizeOf(TROWRec));
                     end;
                  end;
                  CellOffset[Succ(RowInBlock)]:=Buffer.Position;
                  for I:=0 to Pred(FieldCount) do begin
                     if FExportData.IsFieldNumber(ExportColumns[I].FieldIndex) then begin
                        Value:=Trim(FExportData.GetFieldValue(ExportColumns[I].FieldIndex));
                        if not FExportData.IsFieldNull(ExportColumns[I].FieldIndex) and (Value<>'') then begin
                           CNUMBER.Size:=SizeOf(TNUMBERRec)-4; {??? константой сделать ???}
                           CNUMBER.rw:=Row;
                           CNUMBER.col:=I;
                           CNUMBER.ixfe:=CellAlign[I];
                           CNUMBER.num:=StrToFloat(Value); {??? исключения ???}
                           Buffer.Write(CNUMBER, SizeOf(TNUMBERRec));
                        end
                        else begin
                           CBLANK.rw:=Row;
                           CBLANK.col:=I;
                           CBLANK.ixfe:=CellAlign[I];
                           Buffer.Write(CBLANK, SizeOf(TBLANKRec));
                        end;
                     end
                     else begin
                        Value:=FExportData.GetFieldValue(ExportColumns[I].FieldIndex);
                        CLABEL.Size:=SizeOf(TLABELRec)-4+Length(Value)*2;
                        CLABEL.rw:=Row;
                        CLABEL.col:=I;
                        CLABEL.ixfe:=CellAlign[I];
                        CLABEL.ln:=Length(Value);
                        Buffer.Write(CLABEL, SizeOf(TLABELRec));
                        Buffer.Write(PChar(Value)^, Length(Value)*2);
                     end;
                  end;
                  Inc(Row);
                  Inc(RowInBlock);
                  ShowUpdate;
                  FExportData.NextData;
               end;
               ShowStop;
               if FExportData.GetEof then begin
                  Result:=True;
               end;
            finally
               FExportData.AfterExportData;
               ShowFinally;
               if Row<>0 then begin
                  Offset:=Buffer.Position;
                  Inc(NumBlock);
                  SetLength(DBCellOffset, NumBlock);
                  DBCellOffset[Pred(NumBlock)]:=Offset;
                  CDBCELL.Size:=SizeOf(TDBCELLRec)-4+2*32;
                  CDBCELL.dbRtrw:=Offset-FirstRowOffset;
                  Buffer.Write(CDBCELL, SizeOf(TDBCELLRec));
                  for I:=1 to 32 do begin
                     if CellOffset[I]<>0 then begin
                        CellOffset[I]:=CellOffset[I]-FirstRowOffset-SizeOf(TROWRec)
                     end;
                     Buffer.Write(CellOffset[I], SizeOf(Word));
                  end;
               end;
               CINDEX.rf:=0;
               CINDEX.rl:=Row;
               CINDEX.Size:=SizeOf(TINDEXRec)-4+4*NumBlock;
               X:=Workbook.Stream.Position+SizeOf(TINDEXRec)+4*NumBlock+SizeOf(TDIMENSIONSRec);
               for I:=0 to Pred(NumBlock) do begin
                  DBCellOffset[I]:=DBCellOffset[I]+X;
               end;
               Workbook.Stream.Write(CINDEX, SizeOf(TINDEXRec));
               for I:=0 to Pred(NumBlock) do begin
                  Workbook.Stream.Write(DBCellOffset[I], SizeOf(DWORD));
               end;
               for I:=0 to Pred(FieldCount) do begin
                  CCOLINFO.fc:=I;
                  CCOLINFO.lc:=I;
                  CCOLINFO.Width:=(ExportColumns[I].DisplayWidth)*256; //??!!!!????
                  Workbook.Stream.Write(CCOLINFO, SizeOf(TCOLINFORec));
               end;
               CDIMENSIONS.rwMic:=0;
               CDIMENSIONS.rwMac:=Row;
               CDIMENSIONS.colMic:=0;
               CDIMENSIONS.colMac:=FieldCount;
               Workbook.Stream.Write(CDIMENSIONS, SizeOf(TDIMENSIONSRec));
               Workbook.Stream.Write(Buffer.Memory^, Buffer.Size);
               if J=0 then begin
                  CWINDOW2.grbit:=fDspGrid or fDspRwCol or fDspZeros or fDefaultHdr or fDspGuts or fSelected or fVisible;
               end
               else begin
                  CWINDOW2.grbit:=fDspGrid or fDspRwCol or fDspZeros or fDefaultHdr or fDspGuts;
               end;
               Workbook.Stream.Write(CWINDOW2, SizeOf(TWINDOW2Rec));
               if Length(MergeCell)>0 then begin
                  CMERGEDCELLS.Size:=SizeOf(TMERGEDCELLSRec)-4+SizeOf(TADDRRec)*Length(MergeCell);
                  CMERGEDCELLS.nm:=Length(MergeCell);
                  Workbook.Stream.Write(CMERGEDCELLS, SizeOf(TMERGEDCELLSRec));
                  for I:=0 to Pred(Length(MergeCell)) do begin
                     CADDR.fr:=MergeCell[I].fr;
                     CADDR.lr:=MergeCell[I].lr;
                     CADDR.fc:=MergeCell[I].fc;
                     CADDR.lc:=MergeCell[I].lc;
                     Workbook.Stream.Write(CADDR, SizeOf(TADDRRec));
                  end;
               end;
               Workbook.Stream.Write(CEOF, SizeOf(TEOFRec));
               Buffer.Free;
            end;
         end;
      end;
   finally
      if Workbook<>nil then begin
         Workbook.Free;
      end;
      XlsFile.Free;
   end;
end;

{ TExportDataSet2 }

constructor TExportDataSet2.Create(Data: TObject; ExcludeFields: string);
begin
   inherited;
   FList:=TList.Create;
   FColCellParamsEh:=TColCellParamsEh.Create;
end;

destructor TExportDataSet2.Destroy;
begin
   FList.Free;
   FColCellParamsEh.Free;
   inherited;
end;

function TExportDataSet2.GetFieldDouble(I: Integer): Double;
var
   Ind: Integer;
   ExportColumn: TExportColumn;
   Column: TColumnEh;
   Field: TField;
begin
   if I<0 then begin
      Result:=FCount;
   end
   else begin
      ExportColumn:=TExportColumn(FList[I]);
      Column:=ExportColumn.ColumnEh;
      Field:=FDataSet.Fields[I];
      if (Column<>nil) and Assigned(Column.OnGetCellParams) then begin
         FColCellParamsEh.Alignment:=Column.Alignment;
         FColCellParamsEh.Background:=Column.Color;
         FColCellParamsEh.CheckboxState:=Column.CheckboxState;;
         FColCellParamsEh.ImageIndex:=Column.GetImageIndex;
         FColCellParamsEh.ReadOnly:=Column.ReadOnly;
         FColCellParamsEh.State:=[];
         FColCellParamsEh.Font:=Column.Font;
         FColCellParamsEh.Col:=-1;
         FColCellParamsEh.Row:=-1;
         FColCellParamsEh.Text:=Field.AsString;
         Column.OnGetCellParams(Column, False, FColCellParamsEh);
         Result:=StrToFloat(FColCellParamsEh.Text);
      end
      else if (Column<>nil) and (Column.PickList.Count>0) then begin
         Ind:=Column.KeyList.IndexOf(Field.AsString);
         if Ind<>-1 then begin
            Result:=StrToFloat(Column.PickList[Ind]);
         end
         else begin
            Result:=Field.AsFloat;
         end;
      end
      else begin
         Result:=inherited GetFieldDouble(I);
      end;
   end;
end;

function TExportDataSet2.GetFieldValue(I: Integer): string;
var
   Ind: Integer;
   ExportColumn: TExportColumn;
   Column: TColumnEh;
   Field: TField;
begin
   if I<0 then begin
      Result:=IntToStr(FCount);
   end
   else begin
      ExportColumn:=TExportColumn(FList[I]);
      Column:=ExportColumn.ColumnEh;
      Field:=FDataSet.Fields[I];
      if (Column<>nil) and (Column.PickList.Count>0) then begin
         Ind:=Column.KeyList.IndexOf(Field.AsString);
         if Ind<>-1 then begin
            Result:=Column.PickList[Ind];
         end
         else begin
            Result:=Field.AsString;
         end;
      end
      else if (Column<>nil) and Assigned(Column.OnGetCellParams) then begin
         FColCellParamsEh.Alignment:=Column.Alignment;
         FColCellParamsEh.Background:=Column.Color;
         FColCellParamsEh.CheckboxState:=Column.CheckboxState;;
         FColCellParamsEh.ImageIndex:=Column.GetImageIndex;
         FColCellParamsEh.ReadOnly:=Column.ReadOnly;
         FColCellParamsEh.State:=[];
         FColCellParamsEh.Font:=Column.Font;
         FColCellParamsEh.Col:=-1;
         FColCellParamsEh.Row:=-1;
         FColCellParamsEh.Text:=Field.AsString;
         Column.OnGetCellParams(Column, False, FColCellParamsEh);
         Result:=FColCellParamsEh.Text;
      end
      else begin
         Result:=inherited GetFieldValue(I);
      end;
   end;
end;

function TExportDataSet2.IsFieldNull(I: Integer): Boolean;
var
   ExportColumn: TExportColumn;
   Column: TColumnEh;
begin
   if I<0 then begin
      Result:=False;
   end
   else begin
      ExportColumn:=TExportColumn(FList[I]);
      Column:=ExportColumn.ColumnEh;
      if (Column<>nil) and Assigned(Column.OnGetCellParams) then begin
         Result:=False;
      end
      else begin
         Result:=FDataSet.Fields[I].IsNull;
      end;
   end;
end;

procedure TExportDataSet2.SetDefaultColumnList;
var
   I: Integer;
begin
   inherited;
   FList.Clear;
   for I:=0 to Pred(FDataSet.FieldCount) do begin
      FList.Add(nil);
   end;
   for I:=0 to Pred(FExportColumns.Count) do begin
      if FExportColumns[I].FieldIndex>=0 then begin
         FList[FExportColumns[I].FieldIndex]:=FExportColumns[I];
      end;
   end;
end;

{ TExportRowParam }

constructor TExportRowParam.Create;
begin
   FBold:=False;
end;

destructor TExportRowParam.Destroy;
begin
   inherited;
end;

procedure TExportRowParam.SetDefault;
begin
   FBold:=False;
end;

{ TExportDataProviderList }

function TExportDataProviderList.Add(Item: TExportDataProvider): Integer;
begin
   Result:=FList.Add(Item);
end;

function TExportDataProviderList.AddNew(ItemClass: TExportDataProviderClass; Data: TObject; ExcludeFields: string): TExportDataProvider;
begin
   Result:=ItemClass.Create(Data, ExcludeFields);
   Add(Result);
end;

procedure TExportDataProviderList.Clear;
var
   I: Integer;
   Item: TExportDataProvider;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.Free;
      end;
   end;
   FList.Clear;
end;

constructor TExportDataProviderList.Create;
begin
   FList:=TList.Create;
end;

destructor TExportDataProviderList.Destroy;
begin
   Clear;
   FList.Free;
   inherited;
end;

function TExportDataProviderList.GetCount: Integer;
begin
   Result:=FList.Count;
end;

function TExportDataProviderList.GetItem(I: Integer): TExportDataProvider;
begin
   Result:=TExportDataProvider(FList[I]);
end;

function TExportDataProviderList.InsertNew(InsPos: Integer; ItemClass: TExportDataProviderClass; Data: TObject; ExcludeFields: string): TExportDataProvider;
begin
   Result:=ItemClass.Create(Data, ExcludeFields);
   FList.Insert(InsPos, Result);
end;

procedure TExportDataProviderList.SetDefaultColumnList;
var
   I: Integer;
   Item: TExportDataProvider;
begin
   for I:=0 to Pred(GetCount) do begin
      Item:=GetItem(I);
      if Item<>nil then begin
         Item.SetDefaultColumnList;
      end;
   end;
end;

end.
