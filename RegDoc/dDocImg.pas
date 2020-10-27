unit dDocImg;
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ImgList;

type
   TdmDocImg=class(TDataModule)
      imDocs: TImageList;
    imEditRec: TImageList;
   end;

const
   // ������������ �������� ��� ����������
   DI_Citizen       = 0;  // ��������� �������
   DI_Incoming      = 1;  // ��������
   DI_Outgoing      = 2;  // ���������
   DI_Info          = 3;  // �������
   DI_Internal      = 4;  // ����������
   DI_RegDate       = 5;  // ���� �����������
   DI_Blank         = 6;  // ������ ����
   DI_FolderClose   = 7;  // �������� �����
   DI_FolderOpen    = 8;  // �������� �����
   DI_Check         = 9;  // �� ��������
   DI_CheckComplete =10;  // �� �������� - ���������
   DI_Organization  =11;  // �����������
   DI_Citizen2      =12;  // ���������

var
  dmDocImg: TdmDocImg;

implementation

{$R *.DFM}

initialization

  dmDocImg:=TdmDocImg.Create(nil);

finalization

  dmDocImg.Free;

end.
