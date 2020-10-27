unit fRichEdit;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls, ClipBrd,
  ToolWin, ActnList, ImgList;

type
  TfmRichEdit = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    Ruler: TPanel;
    FontDialog1: TFontDialog;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RulerLine: TBevel;
    RightInd: TLabel;
    Editor: TRichEdit;
    StatusBar: TStatusBar;
    StandardToolBar: TToolBar;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    FontSize: TEdit;
    ToolButton11: TToolButton;
    UpDown1: TUpDown;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    ActionList1: TActionList;
    FileNewCmd: TAction;
    FileOpenCmd: TAction;
    FileSaveCmd: TAction;
    FilePrintCmd: TAction;
    FileExitCmd: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Bevel1: TBevel;
    EditCutCmd: TAction;
    EditCopyCmd: TAction;
    EditPasteCmd: TAction;
    EditUndoCmd: TAction;
    EditFontCmd: TAction;
    FileSaveAsCmd: TAction;

    procedure SelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure EditUndo(Sender: TObject);
    procedure EditCut(Sender: TObject);
    procedure EditCopy(Sender: TObject);
    procedure EditPaste(Sender: TObject);
    procedure HelpAbout(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure RulerResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RulerItemMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure ActionList2Update(Action: TBasicAction;
      var Handled: Boolean);
  private
    FFileName: string;
    FUpdating: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    function CurrText: TTextAttributes;
    procedure GetFontNames;
    procedure SetFileName(const FileName: String);
    procedure CheckFileSave;
    procedure SetupRuler;
    procedure SetEditRect;
    procedure UpdateCursorPos;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure PerformFileOpen(const AFileName: string);
    procedure SetModified(Value: Boolean);
  end;

var
  fmRichEdit: TfmRichEdit;

implementation

uses REAbout, RichEdit, ShellAPI, ReInit;

resourcestring
  sSaveChanges = 'Сохранить изменеичя в %s?';
  sOverWrite = 'OK to overwrite %s';
  sUntitled = 'БезНазвания';
  sModified = 'Изменен';
  sColRowInfo = 'Стр.: %3d   Кол.: %3d';

const
  RulerAdj = 4/3;
  GutterWid = 6;

{$R *.DFM}

procedure TfmRichEdit.SelectionChange(Sender: TObject);
begin
  with Editor.Paragraph do
  try
    FUpdating := True;
    FirstInd.Left := Trunc(FirstIndent*RulerAdj)-4+GutterWid;
    LeftInd.Left := Trunc((LeftIndent+FirstIndent)*RulerAdj)-4+GutterWid;
    RightInd.Left := Ruler.ClientWidth-6-Trunc((RightIndent+GutterWid)*RulerAdj);
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
    UpdateCursorPos;
  finally
    FUpdating := False;
  end;
end;

function TfmRichEdit.CurrText: TTextAttributes;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TfmRichEdit.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TfmRichEdit.SetFileName(const FileName: String);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TfmRichEdit.CheckFileSave;
var
  SaveResp: Integer;
begin
  if not Editor.Modified then Exit;
  SaveResp := MessageDlg(Format(sSaveChanges, [FFileName]),
    mtConfirmation, mbYesNoCancel, 0);
  case SaveResp of
    idYes: FileSave(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;
end;

procedure TfmRichEdit.SetupRuler;
var
  I: Integer;
  S: String;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I+1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

procedure TfmRichEdit.SetEditRect;
var
  R: TRect;
begin
  with Editor do
  begin
    R := Rect(GutterWid, 0, ClientWidth-GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

{ Event Handlers }

procedure TfmRichEdit.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName(sUntitled);
  GetFontNames;
  SetupRuler;
  SelectionChange(Self);

  CurrText.Name := DefFontData.Name;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

end;

procedure TfmRichEdit.ShowHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar.SimplePanel := True;
    StatusBar.SimpleText := Application.Hint;
  end
  else StatusBar.SimplePanel := False;
end;

procedure TfmRichEdit.FileNew(Sender: TObject);
begin
  SetFileName(sUntitled);
  Editor.Lines.Clear;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TfmRichEdit.PerformFileOpen(const AFileName: string);
begin
  Editor.Lines.LoadFromFile(AFileName);
  SetFileName(AFileName);
  Editor.SetFocus;
  Editor.Modified := False;
  SetModified(False);
end;

procedure TfmRichEdit.FileOpen(Sender: TObject);
begin
  CheckFileSave;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
    Editor.ReadOnly := ofReadOnly in OpenDialog.Options;
  end;
end;

procedure TfmRichEdit.FileSave(Sender: TObject);
begin
  if FFileName = sUntitled then
    FileSaveAs(Sender)
  else
  begin
    Editor.Lines.SaveToFile(FFileName);
    Editor.Modified := False;
    SetModified(False);
  end;
end;

procedure TfmRichEdit.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
  begin
    if FileExists(SaveDialog.FileName) then
      if MessageDlg(Format(sOverWrite, [SaveDialog.FileName]),
        mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
    Editor.Lines.SaveToFile(SaveDialog.FileName);
    SetFileName(SaveDialog.FileName);
    Editor.Modified := False;
    SetModified(False);
  end;
end;

procedure TfmRichEdit.FilePrint(Sender: TObject);
begin
  if PrintDialog.Execute then
    Editor.Print(FFileName);
end;

procedure TfmRichEdit.FileExit(Sender: TObject);
begin
  Close;
end;

procedure TfmRichEdit.EditUndo(Sender: TObject);
begin
  with Editor do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TfmRichEdit.EditCut(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TfmRichEdit.EditCopy(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TfmRichEdit.EditPaste(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TfmRichEdit.HelpAbout(Sender: TObject);
begin
  with TAboutBox.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmRichEdit.SelectFont(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    CurrText.Assign(FontDialog1.Font);
  SelectionChange(Self);
  Editor.SetFocus;
end;

procedure TfmRichEdit.RulerResize(Sender: TObject);
begin
  RulerLine.Width := Ruler.ClientWidth - (RulerLine.Left*2);
end;

procedure TfmRichEdit.FormResize(Sender: TObject);
begin
  SetEditRect;
  SelectionChange(Sender);
end;

procedure TfmRichEdit.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TfmRichEdit.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TfmRichEdit.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TfmRichEdit.FontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := StrToInt(FontSize.Text);
end;

procedure TfmRichEdit.AlignButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfmRichEdit.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

procedure TfmRichEdit.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TfmRichEdit.BulletsButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);
end;

procedure TfmRichEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    CheckFileSave;
  except
    CanClose := False;
  end;
end;

{ Ruler Indent Dragging }

procedure TfmRichEdit.RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left+X-FDragOfs;
  FDragging := True;
end;

procedure TfmRichEdit.RulerItemMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FDragging then
    TLabel(Sender).Left :=  TLabel(Sender).Left+X-FDragOfs
end;

procedure TfmRichEdit.FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.FirstIndent := Trunc((FirstInd.Left+FDragOfs-GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfmRichEdit.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.LeftIndent := Trunc((LeftInd.Left+FDragOfs-GutterWid) / RulerAdj)-Editor.Paragraph.FirstIndent;
  SelectionChange(Sender);
end;

procedure TfmRichEdit.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
  Editor.Paragraph.RightIndent := Trunc((Ruler.ClientWidth-RightInd.Left+FDragOfs-2) / RulerAdj)-2*GutterWid;
  SelectionChange(Sender);
end;

procedure TfmRichEdit.UpdateCursorPos;
var
  CharPos: TPoint;
begin
  CharPos.Y := SendMessage(Editor.Handle, EM_EXLINEFROMCHAR, 0,
    Editor.SelStart);
  CharPos.X := (Editor.SelStart -
    SendMessage(Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar.Panels[0].Text := Format(sColRowInfo, [CharPos.Y, CharPos.X]);
end;

procedure TfmRichEdit.FormShow(Sender: TObject);
begin
  UpdateCursorPos;
  DragAcceptFiles(Handle, True);
  RichEditChange(nil);
  Editor.SetFocus;
  { Check if we should load a file from the command line }
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    PerformFileOpen(ParamStr(1));
end;

procedure TfmRichEdit.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of Char;
begin
  try
    if DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0 then
    begin
      CheckFileSave;
      PerformFileOpen(CFileName);
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TfmRichEdit.RichEditChange(Sender: TObject);
begin
  SetModified(Editor.Modified);
end;

procedure TfmRichEdit.SetModified(Value: Boolean);
begin
  if Value then StatusBar.Panels[1].Text := sModified
  else StatusBar.Panels[1].Text := '';
end;


procedure TfmRichEdit.ActionList2Update(Action: TBasicAction;
  var Handled: Boolean);
begin
 { Update the status of the edit commands }
  EditCutCmd.Enabled := Editor.SelLength > 0;
  EditCopyCmd.Enabled := EditCutCmd.Enabled;
  if Editor.HandleAllocated then
  begin
    EditUndoCmd.Enabled := Editor.Perform(EM_CANUNDO, 0, 0) <> 0;
    EditPasteCmd.Enabled := Editor.Perform(EM_CANPASTE, 0, 0) <> 0;
  end;
end;

end.
