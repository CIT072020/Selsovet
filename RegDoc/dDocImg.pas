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
   // используемые картинки для документов
   DI_Citizen       = 0;  // обращения граждан
   DI_Incoming      = 1;  // входящие
   DI_Outgoing      = 2;  // исходящие
   DI_Info          = 3;  // справки
   DI_Internal      = 4;  // внутренние
   DI_RegDate       = 5;  // дата регистрации
   DI_Blank         = 6;  // пустой лист
   DI_FolderClose   = 7;  // закрытая папка
   DI_FolderOpen    = 8;  // открытая папка
   DI_Check         = 9;  // на контроле
   DI_CheckComplete =10;  // на контроле - выполнено
   DI_Organization  =11;  // организация
   DI_Citizen2      =12;  // гражданин

var
  dmDocImg: TdmDocImg;

implementation

{$R *.DFM}

initialization

  dmDocImg:=TdmDocImg.Create(nil);

finalization

  dmDocImg.Free;

end.
