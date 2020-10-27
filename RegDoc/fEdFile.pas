unit fEdFile;
interface

{$I Task.inc}

uses
   Windows, Messages, SysUtils, Variants, Classes, TypInfo, Graphics, Controls, Forms,
   {$IFDEF REGDOC_SIGN}
   fEditSign, uSmdo,
   {$ENDIF}
   uProjectAll, FuncPr,
   Dialogs, mAdsObj, mDRecInt, StdCtrls, ExtCtrls, DBCtrlsEh, Mask, Grids, Buttons;

type
   TfmEdFile=class(TForm)
     bvBottom: TBevel;
     btOk: TButton;
     btCancel: TButton;
     laStoreKind: TLabel;
     dcStoreKind: TDBComboBoxEh;
     deName: TDBEditEh;
     laName: TLabel;
     laReadOnly: TLabel;
     dcReadOnly: TDBComboBoxEh;
     deNote: TDBEditEh;
     laNote: TLabel;
     laPath: TLabel;
     dePath: TDBEditEh;
    lbSign: TLabel;
    edSign: TDBEditEh;
    btETSPFile: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btETSPFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   private
     FDoc: TDocFile;
     procedure SetDoc(const Value: TDocFile);
//     procedure btETSPFileClick(Sender: TObject);
   public
     property Doc: TDocFile read FDoc write SetDoc;
     procedure UpdateActions; override;
   end;

implementation

{$R *.dfm}

{ TfmEdFile }

procedure TfmEdFile.SetDoc(const Value: TDocFile);
var
  sSign:String;
begin
  FDoc := Value;
//  Showmessage( GetEnumName(TypeInfo(TViewMode), Ord(FDoc.ViewMode)) );
end;

procedure TfmEdFile.UpdateActions;
begin
  inherited;
  btOk.Enabled:=((dcStoreKind.ItemIndex>-1) and (Trim(deName.Text)<>''));
  if btOk.Enabled then begin
//    btOk.Enabled:=FileExists(deName.Text);
  end;
end;

procedure TfmEdFile.FormActivate(Sender: TObject);
begin
  if FDoc.ViewMode<>vmAdd then begin
    dcStoreKind.ReadOnly:=true;
    dcStoreKind.Color:=clInfoBk;
    deName.ReadOnly:=true;
    deName.Color:=clInfoBk;
    dePath.ReadOnly:=true;
    dePath.Color:=clInfoBk;
  end;
  if FDoc.ViewMode=vmView then begin
    btOk.Enabled:=false;
    deNote.ReadOnly:=true;
    deNote.Color:=clInfoBk;
  end;
  {$IFDEF REGDOC_SIGN}
    edSign.ReadOnly:=true;
    edSign.Color:=clInfoBk;
    lbSign.Visible:=true;
    edSign.Visible:=true;
    btETSPFile.Visible:=true;
    if FDoc.ViewMode=vmView
      then btETSPFile.Visible:=false
      else btETSPFile.Visible:=true;
  {$ELSE}
    lbSign.Visible:=false;
    edSign.Visible:=false;
    btETSPFile.Visible:=false;
  {$ENDIF}
end;

//------------------------------------------------------------
procedure TfmEdFile.btETSPFileClick(Sender: TObject);
{$IFDEF REGDOC_SIGN}
var
  sErr,sFile,sSignature,sSignInfo:String;
  f:TfmEditSign;
begin
  if (FDoc['NAME'].AsString<>'') then begin
    sErr:='';
    if SMDO.ActiveAvest then begin
      if FDoc.ViewMode=vmAdd then begin
        sFile:=NormDir(FDoc['PATH'].AsString)+FDoc['NAME'].AsString;
      end else begin
        sFile:=FDoc.ExtractFile(sErr);    
      end;
      if sErr<>'' then begin
        PutError(sErr, self);
      end else begin
        if FileExists(sFile) then begin
          sSignInfo:=FDoc['SIGNINFO'].AsString;
          sSignature:=FDoc['SIGNATURE'].AsString;
          f:=TfmEditSign.Create(nil);
          try
            if f.EditSign(true, sFile, sSignature, sSignInfo, nil) then begin
              FDoc.DBItem.EditTable.CheckBrowseMode;
              FDoc.DBItem.EditTable.Edit;
              FDoc['SIGNINFO'].AsString:=sSignInfo;
              FDoc['SIGNATURE'].AsString:=sSignature;
              FDoc.DBItem.EditTable.Post;
            end;
          finally       
            f.Free;
          end;
        end else begin
          PutError('Не найден файл "'+sFile+'"', self);
        end;
      end;
    end else begin
      PutError(error_load_etsp, self);
    end;
  end;
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure TfmEdFile.FormCreate(Sender: TObject);
begin
{$IFDEF REGDOC_SIGN}
  lbSign.Visible:=true;
  edSign.Visible:=true;
  btETSPFile.Visible:=true;
{$ELSE}
  lbSign.Visible:=false;
  edSign.Visible:=false;
  btETSPFile.Visible:=false;
{$ENDIF}
end;

end.
