unit fDsgnTl; // [25.10.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, ImgList, ComCtrls, ToolWin, Buttons;

const
   MM_CLOSEINSP=WM_USER+1234;

type
   TToolCommand=(tcDefault, tcInspector, tcDesigner, tcSize, tcAlign, tcOrder, tcExit, tcCut);

   TToolCommandEvent=procedure(Command: TToolCommand) of object;

   TfmDesignTool=class(TForm)
      imTool: TImageList;
      tbaTool: TToolBar;
      tbSelect: TToolButton;
      sbtDefault: TSpeedButton;
      tbInsp: TToolButton;
      tbAlign: TToolButton;
      tbSize: TToolButton;
      tbOrder: TToolButton;
      tbExit: TToolButton;
      tbCut: TToolButton;
      tbSep3: TToolButton;
      tbSep1: TToolButton;
      tbSep2: TToolButton;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbtDefaultClick(Sender: TObject);
      procedure tbInspClick(Sender: TObject);
      procedure tbSelectClick(Sender: TObject);
      procedure tbAlignClick(Sender: TObject);
      procedure tbSizeClick(Sender: TObject);
      procedure tbOrderClick(Sender: TObject);
      procedure tbExitClick(Sender: TObject);
      procedure tbCutClick(Sender: TObject);
   private
      FOnToolCommand: TToolCommandEvent;
   private
      procedure DoCommand(Command: TToolCommand);
      procedure CloseInspector(var Msg: TMessage); message MM_CLOSEINSP;
   public
      procedure EnableCommand(Command: TToolCommand; Value: Boolean);
   public
      property OnToolCommand: TToolCommandEvent read FOnToolCommand write FOnToolCommand;
   end;

implementation

{$R *.DFM}

procedure TfmDesignTool.DoCommand(Command: TToolCommand);
begin
   if Assigned(FOnToolCommand) then begin
      FOnToolCommand(Command);
   end;
end;

procedure TfmDesignTool.EnableCommand(Command: TToolCommand; Value: Boolean);
begin
   case Command of
      tcDefault: begin
         sbtDefault.Enabled:=Value;
      end;
      tcInspector: begin
         tbInsp.Enabled:=Value;
      end;
      tcDesigner: begin
         tbSelect.Enabled:=Value;
      end;
      tcSize: begin
         tbSize.Enabled:=Value;
      end;
      tcAlign: begin                             
         tbAlign.Enabled:=Value;
      end;
      tcOrder: begin
         tbOrder.Enabled:=Value;
      end;
      tcExit: begin
         tbExit.Enabled:=Value;
      end;
      tcCut: begin
         tbCut.Enabled:=Value;
      end;
   end;
end;

procedure TfmDesignTool.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caNone;
end;

procedure TfmDesignTool.sbtDefaultClick(Sender: TObject);
begin
   DoCommand(tcDefault);
end;

procedure TfmDesignTool.tbInspClick(Sender: TObject);
begin
   DoCommand(tcInspector);
end;

procedure TfmDesignTool.tbSelectClick(Sender: TObject);
begin
   DoCommand(tcDesigner);
   tbInsp.Down:=tbSelect.Down;
end;

procedure TfmDesignTool.tbAlignClick(Sender: TObject);
begin
   DoCommand(tcAlign);
end;

procedure TfmDesignTool.tbSizeClick(Sender: TObject);
begin
   DoCommand(tcSize);
end;

procedure TfmDesignTool.CloseInspector(var Msg: TMessage);
begin
   tbInsp.Down:=False;
   Msg.Result:=0;
end;

procedure TfmDesignTool.tbOrderClick(Sender: TObject);
begin
   DoCommand(tcOrder);
end;

procedure TfmDesignTool.tbExitClick(Sender: TObject);
begin
   DoCommand(tcExit);
end;

procedure TfmDesignTool.tbCutClick(Sender: TObject);
begin
   DoCommand(tcCut);
end;

end.
