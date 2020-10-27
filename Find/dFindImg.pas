unit dFindImg; // find images [02.11.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ImgList;

const
   II_Number=0;
   II_String=1;
   II_Date=2;
   II_Tables=3;
   II_Table=4;
   II_Spr=5;
   II_Folder_Close=6;
   II_Folder_Open=7;
   II_Float=8;
   II_Bool=9;
   II_Text=10;
   //
   II_CloseGroup=6;
   II_OpenGroup=7;

type
   TdmFindImg=class(TDataModule)
      imFields: TImageList;
   end;

implementation

{$R *.DFM}

end.
 