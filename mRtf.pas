unit mRtf; // 24.11.2005
interface
uses
   Windows, Classes, SysUtils, DB, Forms, 
   uPSCompiler, uPSRunTime, Script, ROPasScript;

type

   // формат страницы
   TPageFormat=(
      pfA4,        // A4
      pfA3         // A3
   );

   // ориентаци€ страницы
   TPageOrientation=(
      poPortrait,     // книжна€
      poLandscape     // альбомна€
   );

   TPrintTable=class(TObject)
   private
      FOutput: TStringList;
      FDataSet: TDataSet;
      FHead: TStringList;
      FWidth: TStringList;
      FBorder: TStringList;
      FVertAlign: TStringList;
      FHorzAlign: TStringList;
      FCellKeyword: TStringList;
      FColFont: TStringList;
      FHeadFontCode: Integer;
      FHeadFontSize: Integer;
      FTableFontCode: Integer;
      FTableFontSize: Integer;
      FDoPrintHead: Boolean;
   public
      constructor Create(Output: TStringList; DataSet: TDataSet);
      destructor Destroy; override;
      procedure SetWidth(Ind: Integer; Width: Integer);
      procedure SetAllWidth(S: string);
      procedure SetHead(Ind: Integer; Head: string);
      procedure SetHeadWidth(Ind: Integer; Head: string; Width: Integer);
      procedure SetAllHead(S: string);
      procedure SetCellKeyword(Ind: Integer; Keyword: string);
      procedure SetFont(Code, Size: Integer);
      procedure SetHeadFont(Code, Size: Integer);
      procedure SetTableFont(Code, Size: Integer);
      procedure SetBorder(Ind: Integer; Border: string);
      procedure SetAlign(Ind: Integer; VertAlign, HorzAlign: Char);
      procedure SetColFont(Col: Integer; Code, Size: Integer);
      procedure SetPrintHead(DoPrint: Boolean);
      procedure Print;
   end;

const

   CDefaultLogPixels: Integer = 96;
   //[2007.12.10]
   CMaxTableWidth   : Integer = 30000;   

function CreatePrintTable(Output: TStringList; DataSet: TDataSet): TPrintTable;
procedure FreePrintTable(PrintTable: TPrintTable);

procedure StartPrint(Output: TStringList; PageOrientation: TPageOrientation; PageFormat: TPageFormat);
function FinishPrint(FileName: string; Output: TStringList; Rewrite: Boolean; var ErrMsg: string): Boolean;
procedure PrintString(Output: TStringList; S: string; FontCode, FontSize: Integer; Bold, Italic, UnderLine: Boolean);
procedure PrintTbl(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword, CellKeyword2: TStringList; HeadFontCode, HeadFontSize, TableFontCode, TableFontSize: Integer; DoPrintHead: Boolean);
procedure PrintTable(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword: TStringList; FontCode, FontSize: Integer);
procedure PrintTableEx(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword: TStringList; HeadFontCode, HeadFontSize, TableFontCode, TableFontSize: Integer; DoPrintHead: Boolean);

procedure RegisterRtfLibrary_C(S: TPSPascalCompiler);
procedure RegisterRtfLibrary_R(S: TPSExec);

procedure SIRegister_RtfLibrary(Cl: TIFPSPascalCompiler);
procedure RIRegister_RtfLibrary(Cl: TIFPSRuntimeClassImporter);


implementation

   {
const
   // это дл€ dos-кодировки
   CCharCode: array [1..64] of string=(
      'c0', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9',
      'ca', 'cb', 'cc', 'cd', 'ce', 'cf', 'd0', 'd1', 'd2', 'd3',
      'd4', 'd5', 'd6', 'd7', 'd8', 'd9', 'da', 'db', 'dc', 'dd',
      'de', 'df', 'e0', 'e1', 'e2', 'e3', 'e4', 'e5', 'e6', 'e7',
      'e8', 'e9', 'ea', 'eb', 'ec', 'ed', 'ee', 'ef', 'f0', 'f1',
      'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'fa', 'fb',
      'fc', 'fd', 'fe', 'ff'
   );
   }

function Decode(S: string): string;
   {
var
   I: Integer;
   Ch: Integer;
   }
begin
   Result:=S;
   {
   Result:='';
   for I:=1 to Length(S) do begin
      Ch:=Ord(S[I]);
      if (Ch>128) and (Ch<175) then Result:=Result+'\'''+CCharCode[Ch-127]
      else if (Ch>=224) and (Ch<=239) then Result:=Result+'\'''+CCharCode[Ch-175]
      else Result:=Result+S[I];
   end;
   }
end;

function GetFont(FontCode, FontSize: Integer; Bold, Italic, UnderLine: Boolean): string;
begin
   Result:=Format('\fs%d\f%d', [FontSize*2, FontCode]);
   if Bold then Result:=Result+'\b';
   if Italic then Result:=Result+'\i';
   if UnderLine then Result:=Result+'\ul';
end;

const
   fcTimesNewRoman =0;
   fcArial         =1;
   fcCourierNew    =2;

   CFontTable: array [0..2, 1..4] of string=(
     ('roman', '204', '2', 'Times New Roman Cyr'), // fcTimesNewRoman
     ('swiss', '204', '2', 'Arial Cyr'),           // fcArial
     ('modern', '204', '2', 'Courier New Cyr')     // fcCourierNew
   );

procedure StartPrint(Output: TStringList; PageOrientation: TPageOrientation; PageFormat: TPageFormat);
const
   CPageWidth: array [TPageFormat] of Integer=({A4}11906, {A3}16840);
   CPageHeight: array [TPageFormat] of Integer=({A4}16838, {A3}23814);
var
   I: Integer;
   sPageOrientation: string;
   sFontTable: string;
   paperw: Integer;
   paperh: Integer;
begin
   if Output<>nil then begin
      paperw:=CPageWidth[PageFormat];
      paperh:=CPageHeight[PageFormat];
      case PageOrientation of
         // книжна€
         poPortrait: sPageOrientation:=Format('\paperw%d\paperh%d\margl1134\margr1134\margt1134\margb1134', [paperw, paperh]);
         //poPortrait: sPageOrientation:='\paperw11906\paperh16838\margl1134\margr1134\margt1134\margb1134';
         // альбомна€
         poLandscape: sPageOrientation:=Format('\paperw%d\paperh%d\margl1134\margr1134\margt1134\margb1134\lndscpsxn', [paperh, paperw]);
         //poLandscape: sPageOrientation:='\paperw16838\paperh11906\margl1134\margr1134\margt1134\margb1134\lndscpsxn';
         //poLandscape: sPageOrientation:='\paperw16840\paperh11907\margl1134\margr1134\margt1134\margb1134\lndscpsxn';
      end;
      sFontTable:='{\fonttbl';
      for I:=0 to 2 do begin
         sFontTable:=sFontTable+Format('{\f%d\f%s\fcharset%s\fprq%s %s;}', [I, CFontTable[I, 1], CFontTable[I, 2], CFontTable[I, 3], CFontTable[I, 4]]);
      end;
      sFontTable:=sFontTable+'}';
      Output.Clear;
      //[2007.12.05]
      //Output.Add('{\rtf1\ansi \deff0\deflang1033\deflangfe1049'+sFontTable+sPageOrientation+'\plain');
      Output.Add('{\rtf1\ansi \deff0\deflang1049\deflangfe1049'+sFontTable+sPageOrientation+'\plain');
   end;
end;

function FinishPrint(FileName: string; Output: TStringList; Rewrite: Boolean; var ErrMsg: string): Boolean;
begin
   Result:=False;
   ErrMsg:='';
   try
      if Output<>nil then begin
         Output.Add('\par }');
         FileName:=Trim(FileName);
         if FileName<>'' then begin
            if not FileExists(FileName) or Rewrite then begin
               Output.SaveToFile(FileName);
               Result:=True;
            end;
         end;
      end;
   except
      on E: Exception do begin
         ErrMsg:=E.Message;
      end;
   end;
end;

procedure PrintString(Output: TStringList; S: string; FontCode, FontSize: Integer; Bold, Italic, UnderLine: Boolean);
begin
   if Output<>nil then begin
      Output.Add('{'+GetFont(FontCode, FontSize, Bold, Italic, UnderLine)+Decode(S)+'}');
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

procedure PrintTable(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword: TStringList; FontCode, FontSize: Integer);
begin
   PrintTbl(Output, DataSet, Head, Width, CellKeyword, nil, FontCode, FontSize, FontCode, FontSize, True);
end;

procedure PrintTableEx(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword: TStringList; HeadFontCode, HeadFontSize, TableFontCode, TableFontSize: Integer; DoPrintHead: Boolean);
begin
   PrintTbl(Output, DataSet, Head, Width, CellKeyword, nil, HeadFontCode, HeadFontSize, TableFontCode, TableFontSize, DoPrintHead);
end;

procedure PrintTbl(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword, CellKeyword2: TStringList; HeadFontCode, HeadFontSize, TableFontCode, TableFontSize: Integer; DoPrintHead: Boolean);
const
   MapAlignment: array [TAlignment] of string=('ql', 'qr', 'qc');
var
   FieldCount: Integer;
   s_trowd: string;
   trgaph: Integer;
   LogInch: Integer;
   CellHead: array of string;
   CellData: array of string;
   ColWidth: array of Integer;
   cellx: array of Integer;
   Col: Integer;
   X: Integer;
   TempStr: string;
   Field: TField;
   Koef: Double;
   (*--
   TempStr2: string;
   K: Integer;
   J: Integer;
   *)

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
         //[2007.12.05]
         MergeLastCol: Boolean;
      end;

      THeadCol=array of THeadCell;

      TOrder=record
         Col: Integer;
         NumRow: Integer;
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
         TempStr:=Head[Col];
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
      //[2007.12.05]
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
         Output.Add(s_trowd+'\trhdr');
         for Col:=0 to Pred(FieldCount) do begin
            TempStr:='';
            //[2007.12.05]
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
            //[2007.12.05]
            //Output.Add(Format('%s\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\cellx%d', [TempStr, cellx[Col]]));
            if not HeadCell[Col][Row].MergeCol or HeadCell[Col][Row].MergeLastCol then begin
               Output.Add(Format('%s\clvertalc\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\cellx%d', [TempStr, cellx[Col]]));
            end;
         end;
         for Col:=0 to Pred(FieldCount) do begin
            TempStr:='';
            //[2007.12.05]
            //if HeadCell[Col][Row].Print then begin
            if HeadCell[Col][Row].Print or HeadCell[Col][Row].MergeLastCol then begin
               TempStr:=Trim(HeadCell[Col][Row].S);
            end;
            //[2007.12.05]
            //Output.Add(Format('\pard\intbl\qc\sb55\sa55\f%d\fs%d %s\cell', [HeadFontCode, HeadFontSize*2, TempStr]));
            if not HeadCell[Col][Row].MergeCol or HeadCell[Col][Row].MergeLastCol then begin
               Output.Add(Format('\pard\intbl\qc\sb55\sa55\f%d\fs%d %s\cell', [HeadFontCode, HeadFontSize*2, TempStr]));
            end;
         end;
         Output.Add('\row');
      end;
   end;

begin
   if (Output<>nil) and (DataSet<>nil) and (DataSet.Active) and (Head<>nil) and (Width<>nil) and (CellKeyword<>nil) and (Head.Count>0) and (Width.Count=Head.Count) then begin
      FieldCount:=Head.Count;
      trgaph:=72;
      s_trowd:=Format('\trowd\trgaph%d\trkeep', [trgaph]);
      //TableFontSize:=TableFontSize*2;
      //--LogInch:=GetDeviceCaps(LOGPIXELSY);
      LogInch:=CDefaultLogPixels;
      SetLength(CellData, FieldCount);
      SetLength(CellHead, FieldCount);
      SetLength(ColWidth, FieldCount);
      SetLength(cellx, FieldCount);
      //[2007.12.11]
      for Col:=0 to Pred(FieldCount) do begin
         ColWidth[Col]:=StrToIntDef(Width[Col], 20);
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
         TempStr:='';
         if CellKeyword.Count=Head.Count then begin
            TempStr:=CellKeyword[Col];
         end;
         CellHead[Col]:=Format('%s\cellx%d', [TempStr, cellx[Col]]);
         //CellData[Col]:=Format('\pard\intbl\%s\sb55\sa15\f%d\fs%d ', [MapAlignment[taLeftJustify], FontCode, FontSize]);
         if CellKeyword2=nil then begin
            CellData[Col]:=Format('\pard\intbl\%s\f%d\fs%d ', [MapAlignment[taLeftJustify], TableFontCode, TableFontSize*2]);
         end
         else begin
            CellData[Col]:=Format('\pard\intbl%s ', [CellKeyWord2[Col]]);
         end;
      end;
      (*
      for Col:=0 to Pred(FieldCount) do begin
         ColWidth[Col]:=StrToIntDef(Width[Col], 20);
         if Col=0 then begin
            cellx[Col]:=Trunc((ColWidth[Col]*1440)/LogInch)+2*trgaph;
         end
         else begin
            cellx[Col]:=Trunc((ColWidth[Col]*1440)/LogInch)+cellx[Pred(Col)]+2*trgaph;
         end;
         TempStr:='';
         if CellKeyword.Count=Head.Count then begin
            TempStr:=CellKeyword[Col];
         end;
         CellHead[Col]:=Format('%s\cellx%d', [TempStr, cellx[Col]]);
         //CellData[Col]:=Format('\pard\intbl\%s\sb55\sa15\f%d\fs%d ', [MapAlignment[taLeftJustify], FontCode, FontSize]);
         if CellKeyword2=nil then begin
            CellData[Col]:=Format('\pard\intbl\%s\f%d\fs%d ', [MapAlignment[taLeftJustify], TableFontCode, TableFontSize*2]);
         end
         else begin
            CellData[Col]:=Format('\pard\intbl%s ', [CellKeyWord2[Col]]);
         end;
      end;
      //[2007.12.10]
      if cellx[Pred(FieldCount)]>CMaxTableWidth then begin
         Koef:=(CMaxTableWidth-FieldCount*(2*trgaph))/(cellx[Pred(FieldCount)]-FieldCount*(2*trgaph));
         for Col:=0 to Pred(FieldCount) do begin
            cellx[Col]:=Round((cellx[Col]-2*trgaph)*Koef)+2*trgaph;
         end;
      end;
      *)
      if DoPrintHead then begin
         PrintHead;
      end;
      DataSet.First;
      while not DataSet.Eof do begin
         Output.Add(s_trowd);
         for Col:=0 to Pred(FieldCount) do begin
            Output.Add(CellHead[Col]);
         end;
         for Col:=0 to Pred(FieldCount) do begin
            Field:=DataSet.Fields[Col];
            if not Field.IsNull then begin
               TempStr:=Field.AsString;
               (*--
               if Field.DataType=ftString then begin
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
               end;
               *)
            end
            else begin
               TempStr:='';
            end;
            Output.Add(CellData[Col]+TempStr+'\cell');
         end;
         Output.Add('\row');
         DataSet.Next;
      end;
      Output.Add('\pard');
   end;
end;

procedure RegisterRtfLibrary_C(S: TPSPascalCompiler);
begin
   S.AddTypeS('TPageOrientation', '(poPortrait, poLandscape)');
   S.AddTypeS('TPageFormat', '(pfA4, pfA3)');
   S.AddConstantN('fcTimesNewRoman', 'Longint').Value.ts32:=0;
   S.AddConstantN('fcArial', 'Longint').Value.ts32:=1;
   S.AddConstantN('fcCourierNew', 'Longint').Value.ts32:=2;
   S.AddDelphiFunction('procedure StartPrint(Output: TStringList; PageOrientation: TPageOrientation; PageFormat: TPageFormat);');
   S.AddDelphiFunction('function FinishPrint(FileName: string; Output: TStringList; Rewrite: Boolean; var ErrMsg: string): Boolean;');
   S.AddDelphiFunction('procedure PrintString(Output: TStringList; S: string; FontCode, FontSize: Integer; Bold, Italic, UnderLine: Boolean);');
   S.AddDelphiFunction('procedure PrintTable(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword: TStringList; FontCode, FontSize: Integer);');
   S.AddDelphiFunction('procedure PrintTableEx(Output: TStringList; DataSet: TDataSet; Head, Width, CellKeyword: TStringList; HeadFontCode, HeadFontSize, TableFontCode, TableFontSize: Integer; DoPrintHead: Boolean);');
   S.AddDelphiFunction('function CreatePrintTable(Output: TStringList; DataSet: TDataSet): TPrintTable;');
   S.AddDelphiFunction('procedure FreePrintTable(PrintTable: TPrintTable);');
end;

procedure RegisterRtfLibrary_R(S: TPSExec);
begin
   S.RegisterDelphiFunction(@StartPrint, 'STARTPRINT', cdRegister);
   S.RegisterDelphiFunction(@FinishPrint, 'FINISHPRINT', cdRegister);
   S.RegisterDelphiFunction(@PrintString, 'PRINTSTRING', cdRegister);
   S.RegisterDelphiFunction(@PrintTable, 'PRINTTABLE', cdRegister);
   S.RegisterDelphiFunction(@PrintTableEx, 'PRINTTABLEEX', cdRegister);
   S.RegisterDelphiFunction(@CreatePrintTable, 'CREATEPRINTTABLE', cdRegister);
   S.RegisterDelphiFunction(@FreePrintTable, 'FREEPRINTTABLE', cdRegister);
end;

procedure SIRegister_RtfLibrary(Cl: TIFPSPascalCompiler);
begin
   with Cl.AddClassN(Cl.FindClass('TOBJECT'), 'TPRINTTABLE') do begin
      RegisterMethod('procedure SetWidth(Ind: Integer; Width: Integer);');
      RegisterMethod('procedure SetAllWidth(S: string);');
      RegisterMethod('procedure SetHead(Ind: Integer; Head: string);');
      RegisterMethod('procedure SetHeadWidth(Ind: Integer; Head: string; Width: Integer);');
      RegisterMethod('procedure SetAllHead(S: string);');
      RegisterMethod('procedure SetCellKeyword(Ind: Integer; Keyword: string);');
      RegisterMethod('procedure SetFont(Code, Size: Integer);');
      RegisterMethod('procedure SetHeadFont(Code, Size: Integer);');
      RegisterMethod('procedure SetTableFont(Code, Size: Integer);');
      RegisterMethod('procedure Print;');
      RegisterMethod('procedure SetBorder(Ind: Integer; Border: string);');
      RegisterMethod('procedure SetAlign(Ind: Integer; VertAlign, HorzAlign: Char);');
      RegisterMethod('procedure SetColFont(Col: Integer; Code, Size: Integer);');
      RegisterMethod('procedure SetPrintHead(DoPrint: Boolean);');
   end;
end;

procedure RIRegister_RtfLibrary(Cl: TIFPSRuntimeClassImporter);
begin
   with Cl.Add(TPrintTable) do begin
      RegisterMethod(@TPrintTable.SetWidth, 'SETWIDTH');
      RegisterMethod(@TPrintTable.SetAllWidth, 'SETALLWIDTH');
      RegisterMethod(@TPrintTable.SetHead, 'SETHEAD');
      RegisterMethod(@TPrintTable.SetHeadWidth, 'SETHEADWIDTH');
      RegisterMethod(@TPrintTable.SetAllHead, 'SETALLHEAD');
      RegisterMethod(@TPrintTable.SetCellKeyword, 'SETCELLKEYWORD');
      RegisterMethod(@TPrintTable.SetFont, 'SETFONT');
      RegisterMethod(@TPrintTable.SetHeadFont, 'SETHEADFONT');
      RegisterMethod(@TPrintTable.SetTableFont, 'SETTABLEFONT');
      RegisterMethod(@TPrintTable.Print, 'PRINT');
      RegisterMethod(@TPrintTable.SetBorder, 'SETBORDER');
      RegisterMethod(@TPrintTable.SetAlign, 'SETALIGN');
      RegisterMethod(@TPrintTable.SetColFont, 'SETCOLFONT');
      RegisterMethod(@TPrintTable.SetPrintHead, 'SETPRINTHEAD');
   end;
end;

{ TPrintTable }

constructor TPrintTable.Create(Output: TStringList; DataSet: TDataSet);
var
   I: Integer;
begin
   FHead:=TStringList.Create;
   FWidth:=TStringList.Create;
   FCellKeyword:=TStringList.Create;
   FBorder:=TStringList.Create;
   FVertAlign:=TStringList.Create;
   FHorzAlign:=TStringList.Create;
   FColFont:=TStringList.Create;
   FDoPrintHead:=True;
   //
   FOutput:=Output;
   FDataSet:=DataSet;
   //
   for I:=0 to Pred(FDataSet.FieldCount) do begin
      FHead.Add('');
      FWidth.Add('0');
      FCellKeyword.Add('');
      FBorder.Add('');
      FVertAlign.Add('');
      FHorzAlign.Add('');
      FColFont.Add('');
   end;
end;

destructor TPrintTable.Destroy;
begin
   inherited;
   FBorder.Free;
   FVertAlign.Free;
   FHorzAlign.Free;
   FHead.Free;
   FWidth.Free;
   FCellKeyword.Free;
   FColFont.Free;
end;

function CreatePrintTable(Output: TStringList; DataSet: TDataSet): TPrintTable;
begin
   Result:=TPrintTable.Create(Output, DataSet);
end;

procedure FreePrintTable(PrintTable: TPrintTable);
begin
  PrintTable.Free;
end;

procedure TPrintTable.Print;
var
   I: Integer;
   CellKeyWord: TStringList;
   CellKeyWord2: TStringList;
begin
   CellKeyWord:=TStringList.Create;
   CellKeyWord2:=TStringList.Create;
   try
      for I:=0 to Pred(FCellKeyword.Count) do begin
         CellKeyWord.Add(FCellKeyword[I]+FVertAlign[I]+FBorder[I]);
         if FColFont[I]='' then begin
            CellKeyWord2.Add(FHorzAlign[I]+Format('\f%d\fs%d', [FTableFontCode, FTableFontSize*2]));
         end
         else begin
            CellKeyWord2.Add(FHorzAlign[I]+FColFont[I]);
         end;
      end;
      PrintTbl(FOutput, FDataSet, FHead, FWidth, CellKeyWord, CellKeyWord2, FHeadFontCode, FHeadFontSize, FTableFontCode, FTableFontSize, FDoPrintHead);
   finally
      CellKeyWord2.Free;
      CellKeyWord.Free;
   end;
end;

procedure TPrintTable.SetAlign(Ind: Integer; VertAlign, HorzAlign: Char);
var
   I: Integer;
   KeyWord1: string;
   KeyWord2: string;
begin
   KeyWord1:='';
   KeyWord2:='';
   case VertAlign of
      'T', 't': KeyWord1:='\clvertalt';
      'C', 'c': KeyWord1:='\clvertalc';
      'B', 'b': KeyWord1:='\clvertalb';
   end;
   case HorzAlign of
      'L', 'l': KeyWord2:='\ql';
      'C', 'c': KeyWord2:='\qc';
      'R', 'r': KeyWord2:='\qr';
   end;
   if Ind<0 then begin
      for I:=0 to Pred(FCellKeyword.Count) do begin
         FVertAlign[I]:=KeyWord1;
         FHorzAlign[I]:=KeyWord2;
      end;
   end
   else begin
      FVertAlign[Ind]:=KeyWord1;
      FHorzAlign[Ind]:=KeyWord2;
   end;
end;

procedure TPrintTable.SetAllHead(S: string);
var
   I: Integer;
   sl: TStringList;
begin
   sl:=TStringList.Create;
   try
      sl.CommaText:=S;
      for I:=0 to Pred(sl.Count) do begin
         SetHead(I, sl[I]);
      end;
   finally
      sl.Free;
   end;
end;

procedure TPrintTable.SetAllWidth(S: string);
var
   I: Integer;
   sl: TStringList;
begin
   sl:=TStringList.Create;
   try
      sl.CommaText:=S;
      for I:=0 to Pred(sl.Count) do begin
         SetWidth(I, StrToInt(sl[I]));
      end;
   finally
      sl.Free;
   end;
end;

procedure TPrintTable.SetBorder(Ind: Integer; Border: string);
var
   I: Integer;
   KeyWord: string;
begin
   KeyWord:='';
   Border:=UpperCase(Border);
   if Pos('T', Border)<>0 then KeyWord:=KeyWord+'\clbrdrt\brdrs';
   if Pos('L', Border)<>0 then KeyWord:=KeyWord+'\clbrdrl\brdrs';
   if Pos('R', Border)<>0 then KeyWord:=KeyWord+'\clbrdrr\brdrs';
   if Pos('B', Border)<>0 then KeyWord:=KeyWord+'\clbrdrb\brdrs';
   if Ind<0 then begin
      for I:=0 to Pred(FCellKeyword.Count) do begin
         FBorder[I]:=KeyWord;
      end;
   end
   else begin
      FBorder[Ind]:=KeyWord;
   end;
end;

procedure TPrintTable.SetCellKeyword(Ind: Integer; Keyword: string);
var
   I: Integer;
begin
   if Ind<0 then begin
      for I:=0 to Pred(FCellKeyword.Count) do begin
         FCellKeyword[I]:=Keyword;
      end;
   end
   else begin
      FCellKeyword[Ind]:=Keyword;
   end;
end;

procedure TPrintTable.SetColFont(Col, Code, Size: Integer);
var
   I: Integer;
begin
   if Col<0 then begin
      for I:=0 to Pred(FCellKeyword.Count) do begin
         FColFont[I]:=Format('\f%d\fs%d', [Code, Size*2]);
      end;
   end
   else begin
      FColFont[Col]:=Format('\f%d\fs%d', [Code, Size*2]);
   end;
end;

procedure TPrintTable.SetFont(Code, Size: Integer);
begin
   FHeadFontCode:=Code;
   FHeadFontSize:=Size;
   FTableFontCode:=Code;
   FTableFontSize:=Size;
end;

procedure TPrintTable.SetHead(Ind: Integer; Head: string);
begin
   FHead[Ind]:=Head;
end;

procedure TPrintTable.SetHeadFont(Code, Size: Integer);
begin
   FHeadFontCode:=Code;
   FHeadFontSize:=Size;
end;

procedure TPrintTable.SetHeadWidth(Ind: Integer; Head: string; Width: Integer);
begin
   SetHead(Ind, Head);
   SetWidth(Ind, Width);
end;

procedure TPrintTable.SetPrintHead(DoPrint: Boolean);
begin
   FDoPrintHead:=DoPrint;
end;

procedure TPrintTable.SetTableFont(Code, Size: Integer);
begin
   FTableFontCode:=Code;
   FTableFontSize:=Size;
end;

procedure TPrintTable.SetWidth(Ind, Width: Integer);
begin
   FWidth[Ind]:=IntToStr(Width);
end;

end.


