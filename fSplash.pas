unit fSplash;

interface

{$I Task.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, FuncPr, RXCtrls;

type
  TfmSplash = class(TForm)
    Image: TImage;
    lb1: TLabel;
    lb2: TLabel;
    pb2: TProgressBar;
    pb1: TProgressBar;
    lbOchered: TRxLabel;
    lbCopyR: TRxLabel;
    lbNameProg: TRxLabel;
    lbNameProg3: TRxLabel;
    lbNameProg2: TRxLabel;
    lbNameProg4: TRxLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSplash: TfmSplash;

const
  last_year = '2020';
  name_org  = ' "ЦИТ Белстата"';

implementation

uses uProjectAll;

{$R *.DFM}

procedure TfmSplash.FormCreate(Sender: TObject);
begin
  lb1.Caption:='';
  lb2.Caption:='';
  lbNameProg.Visible:=false;
  lbNameProg2.Visible:=false;
  lbNameProg3.Visible:=false;
  lbNameProg4.Visible:=false;
  {$IFDEF OPEKA}
    try
      Image.Picture.LoadFromFile(NameFromExe('splash_opeka.bmp'));
    except
      Image.Visible:=false;
    end;
    ClientHeight:=383;
    ClientWidth:=500;

//    lbOchered.Visible:=true;
    lbCopyR.Font.Color:=clBlack;
    lbCopyR.Caption:= '© 2016-'+last_year+name_org;
    lb1.Font.Color:=clBlack;
    lb2.Font.Color:=clBlack;
//    pb1.Top:=250;
//    pb2.Top:=300;
//    lb1.top:=340;
//    lb2.top:=360;
  {$ENDIF}

  {$IFDEF OCHERED}
    try
      Image.Picture.LoadFromFile(NameFromExe('splash_ochered.bmp'));
    except
      Image.Visible:=false;
    end;
    ClientHeight:=375;
    ClientWidth:=500;
    lbOchered.Visible:=true;
    lbCopyR.Font.Color:=clBlack;
    lbCopyR.Caption:= '© 2010-'+last_year+name_org;
    pb1.Top:=250;
    pb2.Top:=300;
    lb1.top:=340;
    lb2.top:=360;
  {$ENDIF}

  {$IFDEF POST}
    try
      Image.Picture.LoadFromFile(NameFromExe('splash_post.bmp'));
    except
      Image.Visible:=false;
    end;
    ClientHeight:=313;
    ClientWidth:=500;
    lbNameProg.Alignment:=taLeftJustify;
    lbNameProg.Font.Size:=26;
//    lbNameProg.AutoSize:=false;
    lbNameProg.Caption:='ЛАИС.СМДО';
    lbNameProg.Left:=20;
    lbNameProg.Top:=20;
    lbNameProg.Visible:=true;

//    lbCopyR.Font.Color:=clBlack;
    lbCopyR.Caption:= '© 2016-'+last_year+name_org;
    pb1.Top:=200;
    pb2.Top:=250;
    lb1.top:=270;
    lb2.top:=290;
  {$ENDIF}

  {$IFDEF GKH}
    try
      Image.Picture.LoadFromFile(NameFromExe('splash_ochered.bmp'));
    except
      Image.Visible:=false;
    end;
    ClientHeight:=375;
    ClientWidth:=500;
    lbOchered.Caption:=' Ж К Х ';
    lbOchered.Font.Size:=32;
    lbOchered.Visible:=true;
    lbCopyR.Caption:= '© 2010-'+last_year+name_org;
    lbCopyR.Font.Color:=clBlack;
    pb1.Top:=250;
    pb2.Top:=300;
    lb1.top:=340;
    lb2.top:=360;
  {$ENDIF}

  {$IFDEF ZAH}
    try
      Image.Picture.LoadFromFile(NameFromExe('splash_zah.bmp'));
    except
      Image.Visible:=false;
    end;
//    ClientHeight:=409;
//    ClientWidth:=321;
    ClientHeight:=439;
    ClientWidth:=356;
    lbOchered.Caption:=' '+NAME_PROG+' ';
    lbOchered.Top:=lbOchered.Top+30;
//    lbOchered.Caption:=' Учет'#13'захоронений';
//    lbOchered.Font.Size:=32;
    lbOchered.Visible:=true;
    lbCopyR.Caption:= '© 2015-'+last_year+name_org;
//    lbCopyR.Font.Color:=clBlack;
    //pb1.Top:=250;
    //pb2.Top:=300;
    //lb1.top:=340;
    //lb2.top:=360;
  {$ENDIF}

  {$IFDEF ZAGS}
    try
      Image.Picture.LoadFromFile(NameFromExe('splash_zags.bmp'));
//      lbNameProg.Visible:=true;
//      lbNameProg.Caption:='ЗАГС';
      Application.ProcessMessages;
      lbCopyR.Caption:= '© 2004-'+last_year+name_org;
    except
      Image.Visible:=false;
    end;
  {$ENDIF}
  {$IFDEF LAIS}
    try
      {$IFDEF SMDO}
        lbNameProg.Caption:='ЛАИС+';
      {$ENDIF}
      lbNameProg.Visible:=true;
      lbNameProg2.Visible:=true;
      lbNameProg3.Visible:=true;
      lbNameProg4.Caption:='лаис.смдо ('+VERSION_SYSTEM_SMDO+')';
      lbNameProg4.Visible:=true;

      Application.ProcessMessages;
//       Локальная автоматизированная информационная система органов местного управления и самоуправления первичного территориального уровня
//      Image.Picture.LoadFromFile(NameFromExe('splash_lais.bmp'));
      lbCopyR.Caption:= '© 2009-'+last_year+name_org;
    except
      Image.Visible:=false;
    end;
  {$ENDIF}
end;

end.
