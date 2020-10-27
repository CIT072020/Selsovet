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
      // ����������/�������� �������� � �������� ���� ������
      procedure SetControl;
   public
      property Spr: TSpAdmProcU read FSpr write FSpr;
   end;

implementation

{$R *.dfm}

{ TfmSprRec }

procedure TfmSpAdmU.SetControl;
begin
   // ��������� ������ ��������/��������������/����������
   case FSpr.ViewMode of
      vmAdd:  Caption:='���������� ����� ������';
      vmEdit: Caption:='��������� ������';
      vmView: Caption:='�������� ������';
   end;
end;

end.
