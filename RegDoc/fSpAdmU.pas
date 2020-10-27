unit fSpAdmU;
interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mDRecInt, mAdsObj, StdCtrls, Mask, DBCtrlsEh, ExtCtrls;

type
   TfmSpAdmU=class(TForm)
      laSignType: TLabel;
      dcIsSelect: TDBComboBoxEh;
      btOk: TButton;
      btCancel: TButton;
      deName: TDBEditEh;
      laNeedReq: TLabel;
      dcNeedReq: TDBComboBoxEh;
      laProcRes: TLabel;
      dcProcRes: TDBComboBoxEh;
      laProcNo: TLabel;
      deProcNo: TDBEditEh;
      laName: TLabel;
      bv01: TBevel;
   private
      FSpr: TSpAdmProcU;
   public
      // установить/очистить привязку к объектам базы данных
      procedure SetControl;
   public
      property Spr: TSpAdmProcU read FSpr write FSpr;
   end;

implementation

{$R *.dfm}

{ TfmSprRec }

procedure TfmSpAdmU.SetControl;
begin
   // установка режима просмотр/редактирование/добавление
   case FSpr.ViewMode of
      vmAdd:  Caption:='Добавление новой записи';
      vmEdit: Caption:='Изменение записи';
      vmView: Caption:='Просмотр записи';
   end;
end;

end.
