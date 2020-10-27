unit prnWord;
interface
Uses ComObj,Windows,SysUtils,Dialogs;

procedure PrintWord(DocName : string);
implementation


procedure PrintWord(DocName : string);

Var WordAppl : Variant;
    lLoadWord : boolean;
    nCopies   : integer;
    Protocol  : string;
    lOpen     : boolean;
    flRun     : Boolean;
Const
    wdOpenFormatAuto = 0 ;
//    wdOpenFormatDocument = 1;
//    wdOpenFormatTemplate = 2;
//    wdOpenFormatRTF = 3;
//    wdOpenFormatText = 4;
//    wdOpenFormatUnicodeText = 5;

     wdPrintAllDocument = 0 ;
//    wdPrintSelection = 1;
//    wdPrintCurrentPage = 2;
//    wdPrintFromTo = 3;
//    wdPrintRangeOfPages = 4;

    wdPrintDocumentContent = 0;
//    wdPrintProperties = 1;
//    wdPrintComments = 2;
//    wdPrintStyles = 3;
//    wdPrintAutoTextEntries = 4;
//    wdPrintKeyAssignments = 5;
//    wdPrintEnvelope = 6;

      wdPrintAllPages = 0 ;
//      wdPrintOddPagesOnly = 1;
//      wdPrintEvenPagesOnly = 2;

begin

    if InitProc <> nil then TProcedure(InitProc);

    try
       lLoadWord:=True;
       WordAppl := GetActiveOleObject('Word.Application');
       flRun:=False;
    except
       lLoadWord := False;
    end;
    if not lLoadWord then
    try
      lLoadWord:=True;
      flRun:=True;
      WordAppl := CreateOleObject('Word.Application');
    except
      lLoadWord := False;
    end;
    if lLoadWord then
    begin
      nCopies:=2;
      lOpen:=False;
      try
        WordAppl.Application.Documents.Open(DocName);
//        WordAppl.Application.Documents.Open(DocName); //,False,False,False,'','',False,'','',wdOpenFormatAuto);
        lOpen:=True;
        WordAppl.Options.PrintBackground := False;
//        WordAppl.Application.ActiveDocument.PrintOut;
        //(null,0,0,'1',null,null);//,True);
//        WordAppl.Application.ActiveDocument.PrintOut('',wdPrintAllDocument,wdPrintDocumentContent,1,'',null,True,False,False);
//WordAppl.Application.ActiveDocument.PrintOut(null,0,0,'Copies:=2');
WordAppl.Dialogs(wdDialogFilePrint).Show;
 // FileName:="", Range:=wdPrintAllDocument, Item:= _
//        wdPrintDocumentContent, Copies:=1, Pages:="", PageType:=wdPrintAllPages, _
//        Collate:=True, Background:=True, PrintToFile:=False  //      Protocol := 'Файл отправлен на печать'
      except
//        Protocol := 'Не удалось распечатать';
          ShowMessage('╬°шсър яхўрЄш Їрщыр');
      end;
      if lOpen then WordAppl.ActiveDocument.Close;
//      if flRun then WordAppl.Quit;
    end;
//    else Protocol := 'Не удалось загрузить MS-Word 97';
// WriteLn(Protocol);
end;
end.
