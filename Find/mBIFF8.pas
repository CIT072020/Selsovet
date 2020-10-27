unit mBIFF8; // BIFF (Binary Interchange File Firmat)
interface
uses
   Windows;

// Этот модуль описывает типы данных и константы, которые необходимы
// для чтения/записи файлов формата BIFF8. Этот формат поддерживается
// Excel 8.0 (Excel 97) и выше. Здесь описан только минимальный набор
// записей, но достаточный для генерации простых xls файлов.

// Общая структура потока "Workbook" (Workbook Stream):
//
//    <Workbook Globals>:
//    BOF type = workbook globals
//       WINDOW1
//       FONTn (n=0..4)
//       FORMAT (n=0..7)
//       XFn (n=0..15)
//       STYLEn (n=0..5)
//       PALETTE
//       BOUNDSHEET
//       <Shared String Table>
//          SST
//          [CONTINUE]
//          [EXTSST]
//    EOF
//
//    <Worksheet>:
//    BOF type = worksheet
//       INDEX
//       COLINFO
//       DIMENSIONS
//       <Cell Table>:
//          <Row Block>...<Row Block>:
//             ROW...ROW
//             <Cell Block>...<Cell Block>:
//                BLANK | LABEL | NUMBER | RK | RSTRING | LABELSST
//             DBCELL
//       WINDOW2
//       MERGEDCELLS
//    EOF

const

   RowInBlock = 32; // количество строк в блоке строк (Row Block)

   CMaxExcelRow = 65536; // максимальное количество строк на одном листе

type

   TRGB=packed record
      Red: Byte;
      Green: Byte;
      Blue: Byte;
      NotUsed: Byte;
   end;

const

   // Unicode String Option Flags
   fUnCompressed = $01; // 0 =Compressed (8-bit characters)1 =Uncompressed (16-bit characters)
   fFarEast      = $04; // 0 =Contains no Far-East info 1 =Contains Far-East info
   fRichText     = $08; // 0 =Contains no Rich-Text info 1 =Contains Rich-Text info

   cTextColor    = $40;   // System window text colour for border lines (used in records XF .5.113, CF .5.16, and WINDOW2 (BIFF8 only), .5.107)
   cBgColour     = $41;   // System window background colour for pattern background (used in records XF, and CF)
   cFontColour   = $7FFF; // System window text colour for fonts (used in records FONT .5.43, EFONT .5.35, and CF)

const // record id

   riBOF        = $0809; // beginning of file
   riEOF        = $000A; // end of file
   riWINDOW1    = $003D; // workbook global settings
   riWINDOW2    = $023E; // additional settings for the window of a specific worksheet
   riFONT       = $0031; // information about a used font,including character formatting
   riXF         = $00E0; // extended format - this record contains formatting
                      // information for cells,rows,columns or styles.
   riSTYLE      = $0293; // the name of a user-defined cell style or specific
                      // options for a built-in cell style
   riBOUNDSHEET = $0085; // имя листа, тип листа, и позиция в потоке
   riDIMENSIONS = $0200; // contains the range address of the used area in the current sheet
   riINDEX      = $020B; // range of used rows and stream positions of several records of the current sheet
   riDBCELL     = $00D7; //
   riROW        = $0208; //
   riFORMAT     = $041E; //
   riBLANK      = $0201; // This record represents an empty cell. It contains the cell address and formatting information.
   riNUMBER     = $0203; // This record represents a cell that contains a floating-point value.
   riLABEL      = $0204; //
   riMERGEDCELLS= $00E5; // This record contains all merged cell ranges of the current sheet
   riCOLINFO    = $007D; // This record specifies the width for a given range of columns
   riPALETTE    = $0092; // This record contains the definition of all user-defined colours available for cell and object formatting
   {
   riRK
   riSTRING}
   riSST        = $00FC; // This record contains a list of all strings used an1where in the workbook. Each string occurs onl1 once. Ahe workbook uses indexes into the list to reference the strings.
   riEXTSST     = $00FF; // This record occurs in conjunction with the SST record. It is used b1 Excel to create a hash table with stream offsets to the SST record to optimise string search operations.
   riLABELSST   = $00FD; // This record represents a cell that contains a string
   riCONTINUE   = $003C; // Whenever the content of a record exceeds the given limits the record must be split.
                         // BIFF version   Maximum data size of a record
                         // BIFF2-BIFF5    2080 bytes (2084 bytes including record header)
                         // BIFF8          8224 bytes (8228 bytes including record header)

const
   CMaxDataSize = 8224;

type

   TBOFRec=packed record
      Id: Word;         // идентификатор записи (record id)
      Size: Word;       // размер записи (не включая полей Id и Size)
      Version: Word;    // версия
      BOFType: Word;    // тип (BOF type)
      BuildId: Word;    // Build identifier
      BuildYear: Word;  // Build year
      HistFlags: DWORD; // флаги истории файла
      LowVer: DWORD;    // наименьшая версия Excel, которая может читать
                        // все записи из этого файла
   end;

const

   // BOF type
   btWorkbookGlobals   = $0005; // Workbook globals
   btVisualBasicModule = $0006; // Visual Basic module
   btWorksheet         = $0010; // Worksheet
   btChart             = $0020; // Chart
   btMacroSheet        = $0040; // BIFF4 Macro sheet
   btWorkspaceFile     = $0100; // Workspace file

   verBIFF8 = $0600; // версия BIFF8

   CBOF: TBOFRec=(
      Id: riBOF;
      Size: 16;
      Version: verBIFF8;
      BOFType: 0;
      BuildId: 4307;
      BuildYear: 1996;
      HistFlags: 65{193};
      LowVer: 6;
   );

type

   TEOFRec=packed record
      Id: Word;
      Size: Word;
   end;

const

   CEOF: TEOFRec=(
      Id: riEOF;
      Size: $0000
   );

type

   TWINDOW1Rec=packed record
      Id: Word;        //
      Size: Word;      //
      xWn: Word;       // горизонтальная позиция окна документа (twips = 1/20 of a point)
      yWn: Word;       // вертикальная позиция окна документа (twips)
      dxWn: Word;      // ширина окна документа (twips)
      dyWn: Word;      // высота окна документа (twips)
      grbit: Word;     // флаг опций (grbit mask)
      itabCur: Word;   // индекс выбранного(видимого) worksheet (отсчет от 0)
      itabFirst: Word; // индекс первого показываемого tab in the worksheet tab bar (отсчет от 0)
      ctabSel: Word;   // количество выбранных worksheets (highlighted in the worksheet tab bar)
      wTabRatio: Word; // ширина worksheet tab bar (in 1/1000 of window
                       // width). The remaining space is used by the horizontal
                       // scrollbar
   end;

const // grbit mask - WINDOW1
   //              Mask     Bits  Contents
   fHidden       = $0001; // 0    1 = окно спрятано 0 = видно
   fIconic       = $0002; // 1    1 = окно минимизировано 0 = развернуто
   fDspHScroll   = $0008; // 3    1 = видна горизонтальная полоса прокрутки 0 = спрятана
   fDspVScroll   = $0010; // 4    1 = видна вертикальная полоса прокрутки 0 = спрятана
   fBotAdornment = $0020; // 5    1 = видно worksheet tab bar 0 = спрятан

   CWINDOW1: TWINDOW1Rec=(
      Id: riWINDOW1;
      Size: 18;
      xWn: 360;
      yWn: 15;
      dxWn: 11340;
      dyWn: 6540;
      grbit: fDspVScroll or fBotAdornment or fDspHScroll;
      itabCur: 0;
      itabFirst: 0;
      ctabSel: 1;
      wTabRatio: 600;
   );

type

   TWINDOW2Rec=packed record
      Id: Word;       //
      Size: Word;     //
      grbit: Word;    // флаг опций (grbit mask)
      rwTop: Word;    // Index to first visible row
      colLeft: Word;  // Index to first visible column
      icvGrid: Word;   // Colour index of grid line colour
      NotUsed1: Word;
      Factor1: Word;  // Cached magnification factor in page break preview (in percent);0 =Default (60%)
      Factor2: Word;  // Cached magnification factor in normal view (in percent);0 =Default (100%)
      NotUsed2: DWORD;
   end;

const // grbit mask - WINDOW2
   //              Mask     Bits  Contents
   fDspFmla      = $0001; // 0    1 = показывать формулы 0 = показываться значения формул
   fDspGrid      = $0002; // 1    1 = показывать сетку 0 = не показывать
   fDspRwCol     = $0004; // 2    1 = показывать заголовки строк/колонок 0 = не показывать
   fFrozen       = $0008; // 3    1 = замораживать panes (freeze) 0 = не замораживать
                          //          этот флаг указывается если следующая PANE
                          //          запись описывает незамороженые или
                          //          замороженые panes
   fDspZeros     = $0010; // 4    1 = показываться нулевые значения (0) 0 = не показывать
   fDefaultHdr   = $0020; // 5    1 = цвет сетки по умолчанию 0 = используется rgbHdr цвет
   fArabic       = $0040; // 6    1 = колонки с права на лево 0 = колонки с лева на право
   fDspGuts      = $0080; // 7    1 = если outline символы показываются 0 = не показывать
   fFrozenNoSplit= $0100; // 8    1 = убирать splits если pane не заморожены 0 = оставлять splits
   fSelected     = $0200; // 9    1 = выбран sheet tab  0 = не выбран
   fVisible      = $0400; // 10   1 = лист виден 0 = не виден
   fPaged        = $0800; // 11   1 = Show in page break preview 0 =Show in normal view

   CWINDOW2: TWINDOW2Rec=(
      Id: riWINDOW2;
      Size: 18;
      grbit: fDspGrid or fDspRwCol or fDspZeros or fDefaultHdr or fDspGuts or fSelected or fVisible;
      rwTop: 0;
      colLeft: 0;
      icvGrid: cTextColor;
      NotUsed1: 0;
      Factor1: 0;
      Factor2: 0;
      NotUsed2: 0
   );

type

   TFONTRec=packed record
      Id: Word;         //
      Size: Word;       //
      dyHeight: Word;   // высота шрифта (twips)
      grbit: Word;      // атрибуты шрифта (grbit mask)
      icv: Word;        // индекс в цветовой палитре
      bls: Word;        // вес шрифта weight (от 100 до 1000)
      sss: Word;        // escapement type
      uls: Byte;        // подчеркивание
      bFamily: Byte;    // семейство шрифтов
      bCharSet: Byte;   // набор символов
      NotUsed: Byte;    // (0)
      ln: Byte;         // длина имени шрифта
      opt: Byte;        // Unicode String Option Flags
      {rgch: WideString;} // имя шрифта
   end;

const // grbit mask - FONT
   //              Mask     Bits  Contents
   fBold         = $0001; // 0    1 = жирный (не используется, есть bls)
   fItalic       = $0002; // 1    1 = курсив
   fUnderlined   = $0004; // 2    1 = подчеркнутый (не используется, есть uls)
   fStruk        = $0008; // 3    1 = шрифт петачный (struck)

   // bls - вес шрифта
   blsNormal = $0190; // нормальный текст (normal)
   blsBold   = $02BC; // жирный (bold)

   // escapement type
   sssNone        = $0000;
   sssSuperscript = $0001;
   sssSubscript   = $0002;

   // uls - подчеркивание
   ulsNone = $00;
   ulsSingle = $01;
   ulsDouble = $02;
   ulsSingleAccounting = $21;
   ulsDoubleAccounting = $22;

   // bFamily - семейство шрифтов
   ffNone       = $00; // unknown or don't care 
   ffRoman      = $01; // variable width, serifed
   ffSwiss      = $02; // variable width, sans-serifed 
   ffModern     = $03; // fixed width, serifed or sans-serifed
   ffScript     = $04; // cursive
   ffDecorative = $05; // specialised, i.e.Old English, Fraktur 

   // bCharSet - набор символов
   csANSI         = $00; // ANSI Latin
   csSymbol       = $02; // Symbol
   csAppleRoman   = $4D; // Apple Roman
   csJapanese     = $80; // ANSI Japanese Shift-JIS
   csKoreanHangul = $81; // ANSI Korean (Hangul)
   csKoreanJohab  = $82; // ANSI Korean (Johab)
   csChineseSimp  = $86; // ANSI Chinese Simplified GBK
   csChineseTrad  = $88; // ANSI Chinese Traditional BIG5
   csGreek        = $A1; // ANSI Greek
   csTurkish      = $A2; // ANSI Turkish
   csVietnamese   = $A3; // ANSI Vietnamese
   csHebrew       = $B1; // ANSI Hebrew
   csArabic       = $B2; // ANSI Arabic
   csBaltic       = $BA; // ANSI Baltic
   csCyrillic     = $CC; // ANSI Cyrillic
   csThai         = $DE; // ANSI Thai
   csLatin        = $EE; // ANSI Latin II (Central European)
   csOEM          = $FF; // OEM Latin I

   CFONT: TFONTRec=(
      Id: riFONT;
      Size: 34;
      dyHeight: 200;
      grbit: 0;
      icv: cFontColour;
      bls: blsNormal;
      sss: sssNone;
      uls: ulsNone;
      bFamily: ffNone;
      bCharSet: csCyrillic;
      NotUsed: 0;
      ln: 9;
      opt: fUnCompressed;
      {rgch: 'Arial Cyr';}
   );

   CFontName: WideString ='Arial Cyr';

   CFONTUser: TFONTRec=(
      Id: riFONT;
      Size: 56;
      dyHeight: 200;
      grbit: 0;
      icv: 32767;
      bls: blsNormal;
      sss: sssNone;
      uls: ulsNone;
      bFamily: ffSwiss;
      bCharSet: csCyrillic;
      NotUsed: 0;
      ln: 20;
      opt: fUnCompressed;
      {rgch: 'Microsoft Sans Serif';}
   );

type

   TXFRec=packed record
      Id: Word;        //
      Size: Word;      //
      ifnt: Word;      // индекс в таблице FONT записей
      ifmt: Word;      // индекс в таблице FORMAT записей
      W1: Word;            // Bit  Mask    Contents
      {prot:XF_TYPE_PROT}  // 2-0  $0007   XF type, cell protection
      {ixfParent}          // 15-4 $FFF0   индекс родительского style XF (всегда ixfNULL = $FFF
                           //              в style XFs и обычно ixfeNormal = 0 для cell XF)

      B1: Byte;            // Bit  Mask    Contents
      {alc:XF_HOR_ALIGN}   // 2-0  $07H    горизонтальное выравнивание
      {fWrap}              // 3    $08H    1 = text is wrapped at right border
      {alcV:XF_VERT_ALIGN} // 6-4  $70H    вертикальное выравнивание

      rot: Byte;       // XF_ROTATION: Text rotation angle (see above)

      B2: Byte;        // Bit  Mask    Contents
      {cIndent}        // 3-0  $0F     Indent level
      {fShrinkToFit}   // 4    $10     1 = Shrink content to fit into cell
      {fMergeCell}     // 5    $20     = 1 если Merge Cells опция включена
      {iReadingOrder}  // 7-6  $C0     Text direction (BIFF8X only)

      B3: Byte;              // Bit  Mask    Contents
      {attr: XF_USED_ATTRIB} // 7-2  $FC     используемые родительские атрибуты

                       // Cell border lines and background area:
      DW1: DWORD;      // Bit    Mask        Contents
      {dgLeft}         // 3-0    $0000000F   стиль левой линии
      {dgRight}        // 7-4    $000000F0   стиль правой линии
      {dgTop}          // 11-8   $00000F00   стиль верхней линии
      {dgBottom}       // 15-12  $0000F000   стиль нижней линии
      {icvLeft}        // 22-16  $007F0000   индекс цвета для левой линии
      {icvRight}       // 29-23  $3F800000   индекс цвета для правой линии
      {fDiag1}         // 30     $40000000   1 = Diagonal line from top left to right bottom
      {fDiag2}         // 31     $80000000   1 = Diagonal line from bottom left to right top

      DW2: DWORD;      // Bit    Mask        Contents
      {icvTop}         // 6-0    $0000007F   индекс цвета для верхней линии
      {icvBottom}      // 13-7   $00003F80   индекс цвета для нижней линии
      {icvDiag}        // 20-14  $001FC000   индекс цвета для диаганальной линии
      {dgDiag}         // 24-21  $01E00000   стиль диаганальной линии
      {fls}            // 31-26  $FC000000   Fill pattern

      W2: WORD;        // Bit    Mask        Contents
      {icvFore}        // 6-0    $007F       Colour index for pattern colour
      {icvBack}        // 13-7   $3F80       Colour index for pattern background
   end;

const

   // маски и смещения
   mskXF_TYPE_PROT = $0007; // XF_TYPE_PROT mask
   mskParent       = $FFF0; // ixfParent mask
   shrParent       = 4;
   mskAlc          = $07;
   fWrap           = $08;
   mskAlcV         = $70;
   shrAlcV         = 4;
   mskIndent       = $0F;
   fShrinkToFit    = $10;
   fMergeCell      = $20;
   mskReadingOrder = $C0;
   shrReadingOrder = 6;
   mskAttr         = $FC;
   shrAttr         = 2;
   mskdgLeft       = $0000000F;
   mskdgRight      = $000000F0;
   shrdgRight      = 4;
   mskdgTop        = $00000F00;
   shrdgTop        = 8;
   mskdgBottom     = $0000F000;
   shrdgBottom     = 12;
   mskicvLeft      = $007F0000;
   shricvLeft      = 16;
   mskicvRight     = $3F800000;
   shricvRight     = 23;
   fDiag1          = $40000000;
   fDiag2          = $80000000;
   mskicvTop       = $0000007F;
   mskicvBottom    = $00003F80;
   shricvBottom    = 7;
   mskicvDiag      = $001FC000;
   shricvDiag      = 14;
   mskdgDiag       = $01E00000;
   shrdgDiag       = 21;
   mskFfls         = $FC000000;
   shrFfls         = 26;
   mskicvFore      = $007F;
   mskicvBack      = $3F80;
   shricvBack      = 7;

   // XF_ROTATION – Text Rotation Angle
   rotNotRotated = 0;   // Not rotated
   rotStacked    = 255; //  Letters are stacked top-to-bottom, but not rotated

   // XF_TYPE_PROT - XF Type and Cell Protection
   //              Mask     Bits  Contents
   fLocked       = $0001; // 0    1 = ячейка locked
   ffHidden      = $0002; // 1    1 = формула скрыта
   fStyle        = $0004; // 2    1 = style XF 0 = cell XF

   ixfeNormal    = 0;
   ixfNULL       = $FFF;

   // XF_HOR_ALIGN - Horizontal Alignment
   haGeneral     = $00; // обычное
   haLeft        = $01; // влево
   haCentred     = $02; // по центру
   haRight       = $03; // вправо
   haFilled      = $04; // заполнение
   haJustified   = $05; // по формату
   haCentredAS   = $06; // centred across selection

   // XF_VERT_ALIGN - Vertical Alignment
   vaTop       = $00; // вверх
   vaCentred   = $01; // по центру
   vaBottom    = $02; // вниз
   vaJustified = $03; // по формату

   // XF_ORIENTATION - Text Orientation
   orNotRotated = $00; // без поворота
   orStacked    = $01; // буквы перевернуты вверх ногами, но текст не повернут
   orLeft90     = $02; // текст повернут на 90 градусов против часовой стрелки
   orRight90    = $03; // текст повернут на 90 градусов по часовой стрелке

   // XF_USED_ATTRIB - Attributes Used from Parent Style XF
   // каждый бит описывает приминимость (validity) указанного атрибута
   // для cell XFs 0 = означает, что используется атрибут родительского style XF
   // (но только если этот атрибут здесь можно использовать (valid))
   // для cell XFs 1 = означает, что используется атрибут этого XF
   // для style XF 0 = означает, что атрибут можно использовать (is valid)
   // для style XF 1 = означает, что атрибут должен быть проигнорирован
   //              Mask    Bits  Contents
   fAtrNum       = $01;  // 0    Flag for number format (ifmt)
   fAtrFnt       = $02;  // 1    Flag for font (ifnt)
   fAtrAlc       = $04;  // 2    Flag for horizontal and vertical alignment,text wrap,indentation,orientation,rotation,and text direction (alc или fWrap)
   fAtrBdr       = $08;  // 3    Flag for border lines (dgTop, and so on)
   fAtrPat       = $10;  // 4    Flag for background area style (fls, icvFore, icvBack)
   fAtrProt      = $20;  // 5    Flag for cell protection (cell locked and formula hidden) (fLocked или fHidden)

   // Line Style for Cell Borders
   lsNoLine = $00; // нет границы
   lsThin   = $01; // тонкая
   lsMedium = $02; // средняя
   lsDashed = $03; // пунктир
   lsDotted = $04; // точечная
   lsThick  = $05; // толстая
   lsDouble = $06; // двойная
   lsHair   = $07; // очень тонкая

   // Text direction (BIFF8X only)
   tdContext   = 002; // According to context
   tdLeftRight = 012; // Left-to-right
   tdRightLeft = 102; // Right-to-left

   CXFNum = 21;

   CXFifnt: array [1..CXFNum] of Word =(0, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 43, 1);
   CXFifmt: array [1..CXFNum] of Word =(0, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 42, 9, 43, 41);
   CXFW1: array [1..CXFNum] of Word =($FFF5, $FFF5, $FFF5, $FFF5, $FFF5, $FFF5, $FFF5,
                                  $FFF5, $FFF5, $FFF5, $FFF5, $FFF5, $FFF5, $FFF5,
                                  $FFF5, $0001, $FFF5, $FFF5, $FFF5, $FFF5, $FFF5);
   CXFB3: array [1..CXFNum] of Byte =($00, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F4, $F8, $F8, $F8, $F8, $F8);

   CXF: TXFRec=(
      Id: riXF;
      Size: 20;
      ifnt: 0; {0, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,    1,  1, 1, 43,  1}
      ifmt: 0; {0, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,    44, 42, 9, 43, 41}
      W1: $FFF5; { $0001}
         // prot      = fLocked fStyle и fLocked для XF[15]
         // ixfParent = ixfNULL и 0 для XF[15]
      B1: $20;
         // alc   = haGeneral
         // fWrap = 0
         // alcV  = vaBottom
      rot: 0;
      B2: 0;
         // cIndent = 0
         // fShrinkToFit = 0
         // fMergeCell = 0
         // iReadingOrder = 0
      B3: $00; { $00, $F4 ... последние пять $F8}
         // attr = {-, fAtrNum ... последние пять fAtrFnt}
      DW1: 0;
         // dgLeft = lsNoLine
         // dgRight = lsNoLine
         // dgTop = lsNoLine
         // dgBottom = lsNoLine
         // icvLeft = 0
         // icvRight= 0
         // fDiag1= 0
         // fDiag2= 0
      DW2: 0;
         // icvTop = 0
         // icvBottom = 0
         // icvDiag = 0
         // dgDiag = lsNoLine
         // fls = 0
      W2: $20C0;
         // icvFore = cTextColor
         // icvBack = cBgColour
   );

type

   TSTYLERec=packed record
      Id: Word;          //
      Size: Word;        //
      W1: Word;          // Bit    Mask     Contents
      {ixfe}             // 11-0   $0FFF    индекс style XF записи
      {fBuiltIn}         // 15     $8000    1 = встроенный стиль 0 = пользовательский стиль
      istyBuiltIn: Byte; // идентификатор встроенного стиля
      iLevel: Byte;      // уровень для bsRowLevelN или bsColLevelN стилей
                         // (начиная с нуля ), иначе $FF
   end;

   TUserSTYLERec=packed record
      Id: Word;        //
      Size: Word;      //
      W1: Word;        // Bit    Mask     Contents
      {ixfe}           // 11-0   $0FFF    индекс style XF записи
      {fBuiltIn}       // 15     $8000    1 = встроенный стиль 0 = пользовательский стиль
      ln: Byte;        // длина имени пользовательского стиля
      opt: Byte;       // Unicode String Option Flags
      rgch: WideString;// имя пользовательского стиля
   end;

const
   // маски и смещения
   mskIxfe     = $0FFF;
   fBuiltIn    = $8000;

   // built-in styles
   bsNormal       = $00;
   bsRowLevelN    = $01;
   bsColLevelN    = $02;
   bsComma        = $03;
   bsCurrency     = $04;
   bsPercent      = $05;
   bsCommaZero    = $06;
   bsCurrencyZero = $07;

   CSTYLENum = 6;

   CSTYLEW1: array [1..CSTYLENum] of Word=($8010, $8011, $8000, $8012, $8013, $8014);
   CSTYLEistyBuiltIn: array [1..CSTYLENum] of Byte=(bsCurrency, bsCurrencyZero, bsNormal, bsPercent, bsComma, bsCommaZero);

   CSTYLE: TSTYLERec=(
      Id: riSTYLE;
      Size: 4;
      W1: $8010; { $8010, $8011, $8000, $8012, $8013, $8014}
         // ixfe = 16, 17, 0, 18, 19, 20
         // fBuiltIn = 1
      istyBuiltIn: bsCurrency; {bsCurrency, bsCurrencyZero, bsNormal, bsPercent, bsComma, bsCommaZero}
      iLevel: $FF;
   );

type

   TBOUNDSHEETRec=packed record
      Id: Word;         //
      Size: Word;       //
      lbPlyPos: DWORD;  // абсолютная позиция в потоке BOF записи листа
      hsState: Byte;    // видимость листа
      dt: Byte;         // тип листа
      ln: Byte;         // длина названия листа
      opt: Byte;        // Unicode String Option Flags
      {rgch: WideString;} // имя пользовательского стиля
   end;

const
   // видимость листа
   ssVisible      = $00; // виден
   ssHidden       = $01; // не виден
   ssStrongHidden = $02; // не виден (эту видимость можно установить только через VB macro)

   // тип листа
   stWorksheet = $00; // worksheet
   stChart     = $02; // chart
   stVBModule  = $06; // Visual Basic module

   CBOUNDSHEET: TBOUNDSHEETRec=(
      Id: riBOUNDSHEET;
      Size: 8;  //+2*Length(rgch)
      lbPlyPos: 0;
      hsState: ssVisible;
      dt: stWorksheet;
      LN: 0; //Length(rgch)
      opt: fUnCompressed;
      {rgch: например 'Лист1'}
   );

   CBoundsheetName: WideString='Лист%d';

type

   TDIMENSIONSRec=packed record
      Id: Word;      //
      Size: Word;    //
      rwMic: DWord;  // индекс первой используемой строки на листе
      rwMac: DWord;  // индекс последней используемой строки на листе +1
      colMic: Word;  // индекс первой используемой колонки на листе
      colMac: Word;  // индекс последней используемой колонки на листе +1
      NotUsed: Word; // (0)
   end;

const

   CDIMENSIONS: TDIMENSIONSRec =(
      Id: riDIMENSIONS;
      Size: 14;
      rwMic: 0;
      rwMac: 0;
      colMic: 0;
      colMac: 0;
      NotUsed: 0;
   );

type

   TINDEXRec=packed record
      Id: Word;        //
      Size: Word;      //
      NotUsed1: DWORD; // (0)
      rf: DWORD;       // индекс первой используемой строки на листе (0-based)
      rl: DWORD;       // индекс первой неиспользуемой строки на листе (0-based)
      DefCol: DWORD;   // Absolute stream position of the DEFCOLWIDTH record of the current sheet.
                       // If this record does not exist, the offset points to the record at the position where the DEFCOLWIDTH record would occur.
      {rgibRw: ^DWORD;}// Array of nm absolute stream positions to the DBCELL
                       // record of each Row Block nm =(rl - rf - 1) / 32 + 1
   end;

const

   CINDEX: TINDEXRec=(
      Id: riIndex;
      Size: 0;
      NotUsed1: 0;
      rf: 0;
      rl: 0;
      DefCol: 0;
   );

type

   TROWRec=packed record
      Id: Word;       //
      Size: Word;     //
      rw: Word;       // Index of this row (0-based)
      colMic: Word;   // Index to column of the first cell which is described by a cell record
      colMac: Word;   // Index to column of the last cell which is described by a cell record,increased by 1
      W1: Word;       // Bit   Mask   Contents
      {miyRw}         // 14-0  $7FFF  Height of the row, in twips =1 /20 of a point
      {fCustomHeight} // 15    $8000  0 =Row has custom height;1 =Row has default height
      NotUsed1: WORD; // (0)
      NotUsed2: WORD; // (0)
      D1: DWORD;      // Option flags and default row formatting:
                      // Bit    Mask       Contents
      {iOutLevel}     // 2-0    $00000007  Outline level of the row
      {fCollapsed}    // 4      $00000010  1 =Outline group starts or ends here (depending on where the outline buttons are located, see WSBOOL record), and is collapsed
      {fDyZero}       // 5      $00000020  1 =Row is hidden (manually, or by a filter or outline group)
      {fUnsynced}     // 6      $00000040  1 =Row height and default font height do not match
      {fGhostDirty}   // 7      $00000080  1 =Row has explicit default format (fl)
      {ixfe}          // 27-16  $0FFF0000  If fl =1: Index to default XF record
      {fExAsc}        // 28     $10000000  1 =Additional space above the row
      {fExDsc}        // 29     $20000000  1 =Additional space below the row
   end;

const

   // маски
   mskmiyRw       = $7FFF;
   fCustomHeight  = $8000;
   mskiOutLevel   = $00000007;
   fCollapsed     = $00000010;
   fDyZero        = $00000020;
   fUnsynced      = $00000040;
   fGhostDirty    = $00000080;
   mskRowIxfe     = $0FFF0000;
   shrRowIxfe     = 16;
   fExAsc         = $10000000;
   fExDsc         = $20000000;

   CROW: TROWRec=(
      Id: riROW;
      Size: 16;
      rw: 0;
      colMic: 0;
      colMac: 0;
      W1: $00FF;
         // miyRw = 255
         // fCustomHeight = 0
      NotUsed1: 0;
      NotUsed2: 0;
      D1: 0;
      {iOutLevel}     // 2-0    $00000007  Outline level of the row
      {fCollapsed}    // 4      $00000010  1 =Outline group starts or ends here (depending on where the outline buttons are located, see WSBOOL record), and is collapsed
      {fDyZero}       // 5      $00000020  1 =Row is hidden (manually, or by a filter or outline group)
      {fUnsynced}     // 6      $00000040  1 =Row height and default font height do not match
      {fGhostDirty}   // 7      $00000080  1 =Row has explicit default format (fl)
      {ixfe}          // 27-16  $0FFF0000  If fl =1: Index to default XF record
      {fExAsc}        // 28     $10000000  1 =Additional space above the row
      {fExDsc}        // 29     $20000000  1 =Additional space below the row
   );

type

   TDBCELLRec=packed record
      Id: Word;      //
      Size: Word;    //
      dbRtrw: DWORD; // Смещение от начала записи DBCELL до первой записи ROW в блоке;
                     // смещение отсчитывается назад
      {rgdb: ^WORD;}   // Массив смещений (2 байта каждый)
   end;

const

   CDBCELL: TDBCELLRec=(
      Id: riDBCELL;
      Size: 0;
      dbRtrw: 0;
   );

type

   TFORMATRec=packed record
      Id: Word;         //
      Size: Word;       //
      ifmt: Word;       // Format index used in other records
      ln  : Word;       // длина строки формата
      opt : Byte;
      {rgch: WideString;} // format string
   end;

const

   CFORMATNum = 8;

   CFORMATSize: array [1..CFORMATNum] of Word=(47, 57, 59, 69, 107, 107, 123, 123);
   CFORMATifmt: array [1..CFORMATNum] of Word=(5, 6, 7, 8, 42, 41, 44, 43);
   CFORMATln: array [1..CFORMATNum] of Word=(21, 26, 27, 32, 51, 51, 59, 59);
   CFORMATrgch: array [1..CFORMATNum] of WideString=(
       '#,##0"р.";\-#,##0"р."',
       '#,##0"р.";[Red]\-#,##0"р."',
       '#,##0.00"р.";\-#,##0.00"р."',
       '#,##0.00"р.";[Red]\-#,##0.00"р."',
       '_-* #,##0"р."_-;\-* #,##0"р."_-;_-* "-""р."_-;_-@_-',
       '_-* #,##0_р_._-;\-* #,##0_р_._-;_-* "-"_р_._-;_-@_-',
       '_-* #,##0.00"р."_-;\-* #,##0.00"р."_-;_-* "-"??"р."_-;_-@_-',
       '_-* #,##0.00_р_._-;\-* #,##0.00_р_._-;_-* "-"??_р_._-;_-@_-'
   );

   CFORMAT: TFORMATRec=(
      Id: riFORMAT;
      Size: 0;
      ifmt: 0;
      ln: 0;
      opt: fUnCompressed;
   );

type

   TBLANCKRec=packed record
      Id: Word;
      Size: Word;
      rw: Word;    // Index to row
      col: Word;   // Index to column
      ixfe: Word;  // Index to XF record
   end;

type

   TLABELRec=packed record
      Id: Word;
      Size: Word;
      rw: Word; // Index to row
      col: Word; // Index to column
      ixfe: Word; // Index to XF record
      ln: Word; //
      opt: Byte; //
      {rgch: WideString;} // Unicode string, 16-bit string length
   end;

const

   CLABEL: TLABELRec=(
      Id: riLABEL;
      Size: 0;
      rw: 0;
      col: 0;
      ixfe: 0;
      ln: 0;
      opt: fUnCompressed;
   );

type

   TNUMBERRec=packed record
      Id: Word;
      Size: Word;
      rw: Word;   // Index to row
      col: Word;  // Index to column
      ixfe: Word; // Index to XF record
      num: Double; // IEEE floating-point value
   end;

const

   CNUMBER: TNUMBERRec=(
      Id: riNUMBER;
      Size: 0;
      rw: 0;
      col: 0;
      ixfe: 0;
      num: 0;
   );

type

   TBLANKRec=packed record
      Id: Word;
      Size: Word;
      rw: Word;   // Index to row
      col: Word;  // Index to column
      ixfe: Word; // Index to XF record
   end;

const

   CBLANK: TBLANKRec=(
      Id: riBLANK;
      Size: 6;
      rw: 0;
      col: 0;
      ixfe: 0;
   );

type

   TMERGEDCELLSRec=packed record
      Id: Word;
      Size: Word;
      nm: Word;      // Number of following cell range addresses (nm)
      {TADDRRec•nm}  // List of nm cell range addresses
   end;

   TADDRRec=packed record
      fr: Word; // Index to first row
      lr: Word; // Index to last row
      fc: Word; // Index to first column
      lc: Word; // Index to last column
   end;

const

   CMERGEDCELLS: TMERGEDCELLSRec=(
      Id: riMERGEDCELLS;
      Size: 0;
      nm: 0;
   );

   CADDR: TADDRRec=(
      fr: 0;
      lr: 0;
      fc: 0;
      lc: 0;
   );

type

   TCOLINFORec=packed record
      Id: Word;
      Size: Word;
      fc: Word;    // Index to first column in the range
      lc: Word;    // Index to last column in the range
      Width: Word; // Width of the columns in 1/256 of the width of the zero character, using default font (first FONT record in the file)
      ixfe: Word;  // Index to XF record for default column formatting
      opt: Word;   // Bits  Mask    Contents
      {fHidden}    // 0     $0001   1 = Columns are hidden
      {Level}      // 10-8  $0700   Outline level of the columns (0 = no outline)
      {fCollapsed} // 12    $1000   1 = Columns are collapsed
      NotUsed: Word; // Not used
   end;

const

   // mask
   {fHidden    = $0001;}
   mskLevel    = $0700; // Outline level of the columns (0 = no outline)
   shrLevel    = 8;
   ffCollapsed = $1000; // 1 = Columns are collapsed

   CCOLINFO: TCOLINFORec=(
      Id: riCOLINFO;
      Size: 12;
      fc: 0;
      lc: 0;
      Width: 0;
      ixfe: 0;
      opt: 0;
      NotUsed: 0;
   );

type

   TPALETTERec=packed record
      Id: Word;
      Size: Word;
      nm: Word; // Number of following colours (nm). Contains 56 in BIFF5-BIFF8
      {4•nm List of nm RGB colours}
   end;

const

   CPALETTE: TPALETTERec=(
      Id: riPALETTE;
      Size: 0;
      nm: 0;
   );

type

   TSSTRec=packed record
      Id: Word;
      Size: Word;
      TotalNum: DWORD; // Total number of strings in the workbook
      nm: DWORD;       // Number of following strings (nm)
      { List of nm Unicode strings, 16-bit string length }
   end;

const

   CSST: TSSTRec=(
      Id: riSST;
      Size: 0;
      TotalNum: 0;
      nm: 0;
   );

type

   TEXTSSTRec=packed record
      Id: Word;
      Size: Word;
      num: Word;       // Number of strings in a portion, this number is >=8
      {List of OFFSET structures for all portions.}
   end;

   TOFFSETRec=packed record
      pos: DWORD;      // Absolute stream position of first string of the portion
      FirstPos: Word;  // Position of first string of the portion inside of current record, including record header. This counter restarts at zero, if the SST record is continued with a CONTINUE record.
      NotUsed: Word;   // Not used
   end;

const

   CEXTSST: TEXTSSTRec=(
      Id: riEXTSST;
      Size: 0;
      num: 0;
   );

   COFFSET: TOFFSETRec=(
      pos: 0;
      FirstPos: 0;
      NotUsed: 0;
   );

type

   TLABELSSTRec=packed record
      Id: Word;
      Size: Word;
      rw: Word;        // Index to row
      col: Word;       // Index to column
      ixfe: Word;      // Index to XF record
      isst: DWORD;     // Index into SST record
   end;

const

   CLABELSST: TLABELSSTRec=(
      Id: riLABELSST;
      Size: 10;
      rw: 0;
      col: 0;
      ixfe: 0;
      isst: 0;
   );

type

   TCONTINUERec=packed record
      Id: Word;
      Size: Word;
   end;

const

   CCONTINUE: TCONTINUERec=(
      Id: riCONTINUE;
      Size: 0;
   );

implementation
end.