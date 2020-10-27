unit fEdWork; // форма просмотра и редактирования записи "Хода рассмотрения"
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mAdsObj, StdCtrls, DB, Mask, DBCtrlsEh, ExtCtrls, mDRecInt;

type
   TfmEdWork=class(TForm)
      btCancel: TButton;
      btOk: TButton;
      laGroup01: TLabel;
      bv01: TBevel;
      laOutNote: TLabel;
      deOutNote: TDBEditEh;
      deOutDate: TDBDateTimeEditEh;
      laOutInd: TLabel;
      deOutInd: TDBEditEh;
      laOutDate: TLabel;
      laGroup02: TLabel;
      bv02: TBevel;
      laCheckDate: TLabel;
      deCheckDate: TDBDateTimeEditEh;
      laCheckOut: TLabel;
      laGroup03: TLabel;
      bv03: TBevel;
      laInNote: TLabel;
      deInNote: TDBEditEh;
      deInDate: TDBDateTimeEditEh;
      deInInd: TDBEditEh;
      laInInd: TLabel;
      laInDate: TLabel;
      bvBottom: TBevel;
      dcCheckOut: TDBComboBoxEh;
   private
      FDoc: TDocWork;
   public
      // установить привязку к объектам базы данных
      procedure SetControl;
   public
      property Doc: TDocWork read FDoc write FDoc;
   end;

implementation

{$R *.dfm}

procedure TfmEdWork.SetControl;
begin
   // установка режима просмотр/редактирование/добавление
   if FDoc.ViewMode=vmView then begin
      Caption:=Caption+' [ПРОСМОТР]';
      btOk.Enabled:=False;
   end;
end;

end.
