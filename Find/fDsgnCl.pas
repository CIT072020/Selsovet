unit fDsgnCl; // [04.11.2004]
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ImgList, ToolWin;

type
   TExtraControl=(ecNone, ecLabel, ecRadioGroup, ecGroupBox);

   TfmDesignCtrl=class(TForm)
      tbaControls: TToolBar;
      imControls: TImageList;
      tbArrow: TToolButton;
      tbLabel: TToolButton;
      tbRadioGroup: TToolButton;
      tbGroupBox: TToolButton;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure tbLabelClick(Sender: TObject);
      procedure tbArrowClick(Sender: TObject);
      procedure tbRadioGroupClick(Sender: TObject);
      procedure tbGroupBoxClick(Sender: TObject);
   private
      FCurCtrl: TExtraControl;
      FOnSelectCtrl: TNotifyEvent;
   private
      procedure DoSelect;
   public
      procedure EnableControls(Value: Boolean);
      procedure SetDesign;
      procedure UnCheckAll;
   public
      property CurCtrl: TExtraControl read FCurCtrl write FCurCtrl;
      property OnSelectCtrl: TNotifyEvent read FOnSelectCtrl write FOnSelectCtrl;
   end;

implementation

{$R *.DFM}

procedure TfmDesignCtrl.EnableControls(Value: Boolean);
begin
   tbArrow.Enabled:=Value;
   tbLabel.Enabled:=Value;
   tbRadioGroup.Enabled:=Value;
   tbGroupBox.Enabled:=Value;
   if Value then begin
      SetDesign;
   end
   else begin
      UnCheckAll;
   end;
end;

procedure TfmDesignCtrl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caNone;
end;

procedure TfmDesignCtrl.SetDesign;
begin
   tbArrow.Down:=True;
   FCurCtrl:=ecNone;
end;

procedure TfmDesignCtrl.UnCheckAll;
begin
   tbArrow.Down:=False;
   tbLabel.Down:=False;
   tbRadioGroup.Down:=False;
   tbGroupBox.Down:=False;
   FCurCtrl:=ecNone;
end;

procedure TfmDesignCtrl.FormCreate(Sender: TObject);
begin
   FCurCtrl:=ecNone;
end;

procedure TfmDesignCtrl.tbLabelClick(Sender: TObject);
begin
   FCurCtrl:=ecLabel;
   DoSelect;
end;

procedure TfmDesignCtrl.DoSelect;
begin
   if Assigned(FOnSelectCtrl) then begin
      FOnSelectCtrl(Self);
   end;
end;

procedure TfmDesignCtrl.tbArrowClick(Sender: TObject);
begin
   FCurCtrl:=ecNone;
   DoSelect;
end;

procedure TfmDesignCtrl.tbRadioGroupClick(Sender: TObject);
begin
   FCurCtrl:=ecRadioGroup;
   DoSelect;
end;

procedure TfmDesignCtrl.tbGroupBoxClick(Sender: TObject);
begin
   FCurCtrl:=ecGroupBox;
   DoSelect;
end;

end.
