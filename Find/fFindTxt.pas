// форма для показа текста
unit fFindTxt; // show text form [28.09.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, IniFiles, TypInfo;

type
   TfmShowTxt=class(TForm)
      meText: TMemo;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   public
      procedure SaveLayout(Section, Name: string; Ini: TCustomIniFile);
      procedure LoadLayout(Section, Name: string; Ini: TCustomIniFile);
   end;

procedure ShowStrings(T: TStrings; S: string; Section, Name: string; Ini: TCustomIniFile);

implementation

{$R *.DFM}

procedure ShowStrings(T: TStrings; S: string; Section, Name: string; Ini: TCustomIniFile);
begin
   with TfmShowTxt.Create(nil) do begin
      try
         Caption:=S;
         meText.Lines.Assign(T);
         LoadLayout(Section, Name, Ini);
         ShowModal;
         SaveLayout(Section, Name, Ini);
      finally
         Free;
      end;
   end;
end;

{ TfmShowTxt }

procedure TfmShowTxt.LoadLayout(Section, Name: string; Ini: TCustomIniFile);
begin
   if (Ini<>nil) and (Section<>'') then begin
      Top:=Ini.ReadInteger(Section, Name+'.Top', Self.Top);
      Left:=Ini.ReadInteger(Section, Name+'.Left', Self.Left);
      Width:=Ini.ReadInteger(Section, Name+'.Width', Self.Width);
      Height:=Ini.ReadInteger(Section, Name+'.Height', Self.Height);
      WindowState:=TWindowState(GetEnumValue(TypeInfo(TWindowState), Ini.ReadString(Section, Name+'.WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)))));
   end;
end;

procedure TfmShowTxt.SaveLayout(Section, Name: string; Ini: TCustomIniFile);
begin
   if (Ini<>nil) and (Section<>'') then begin
      if WindowState<>wsMaximized then begin
         Ini.WriteInteger(Section, Name+'.Top', Self.Top);
         Ini.WriteInteger(Section, Name+'.Left', Self.Left);
         Ini.WriteInteger(Section, Name+'.Width', Self.Width);
         Ini.WriteInteger(Section, Name+'.Height', Self.Height);
      end;
      Ini.WriteString(Section, Name+'.WindowState', GetEnumName(TypeInfo(TWindowState), Ord(Self.WindowState)));
   end;
end;

procedure TfmShowTxt.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key=VK_ESCAPE then begin
      ModalResult:=mrOk;
   end;
end;

end.
