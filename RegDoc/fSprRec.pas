unit fSprRec;
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mDRecInt, mAdsObj, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Buttons;

type
   TfmSprRec=class(TForm)
      bv01: TBevel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
   private
      FSpr: TDBSpr;
   public
      // установить/очистить привязку к объектам базы данных
      procedure SetControl;
   public
      property Spr: TDBSpr read FSpr write FSpr;
   end;

implementation

{$R *.dfm}

{ TfmSprRec }

procedure TfmSprRec.SetControl;
begin
   // установка режима просмотр/редактирование/добавление
   case FSpr.ViewMode of
      vmAdd:  Caption:='Добавление новой записи';
      vmEdit: Caption:='Изменение записи';
      vmView: Caption:='Просмотр записи';
   end;
end;

procedure TfmSprRec.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=FSpr.OnFormCloseQuery(FSpr.DBItem);
   {--if ModalResult=mrOk then begin
      CanClose:=FSpr.OnFormCloseQuery(FSpr.DBItem);
   end;}
end;

end.
