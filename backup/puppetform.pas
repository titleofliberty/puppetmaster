unit puppetform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, LCLType, Buttons, puppetmasterlib;

type

  { TfrmPuppet }

  TfrmPuppet = class(TForm)
    btnLocked: TSpeedButton;
    btnRollName: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label38: TLabel;
    pnlTitleClass: TPanel;
    pnlFooter: TPanel;
    pnlTraits: TFlowPanel;
    pnlHeader: TPanel;
    txtClass: TComboBox;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
  private
    FPuppet: TLeaf;
    procedure SetPuppet(AValue: TLeaf);
    procedure LockForm;
  public
    property Puppet: TLeaf read FPuppet write SetPuppet;
  end;

var
  frmPuppet: TfrmPuppet;

implementation

{$R *.lfm}

{ TfrmPuppet }

procedure TfrmPuppet.SetPuppet(AValue: TLeaf);
var
  trait: TTrait;
begin
  if FPuppet = AValue then Exit;
  FPuppet := AValue;
  txtTitle.Text := FPuppet.GetTrait('Title');

  btnLocked.Down := FPuppet.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmPuppet.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  FPuppet.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

procedure TfrmPuppet.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

end.

