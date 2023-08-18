unit diceform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLType, ExtCtrls, puppetmasterlib;

type

  { TfrmDice }

  TfrmDice = class(TForm)
    Label5: TLabel;
    txtCount: TComboBox;
    txtDie: TComboBox;
    txtModifier: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtTitle: TEdit;
    Label1: TLabel;
    procedure txtCountExit(Sender: TObject);
    procedure txtCountSelect(Sender: TObject);
    procedure txtDieExit(Sender: TObject);
    procedure txtDieSelect(Sender: TObject);
    procedure txtModifierExit(Sender: TObject);
    procedure txtModifierSelect(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FDice: TPMLeaf;
    procedure SetDice(AValue: TPMLeaf);
  public
    property Dice : TPMLeaf read FDice write SetDice;
  end;

var
  frmDice: TfrmDice;

implementation

{$R *.lfm}

{ TfrmDice }

procedure TfrmDice.txtTitleExit(Sender: TObject);
begin
  FDice.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmDice.txtCountSelect(Sender: TObject);
begin
  FDice.SetTrait('Count', txtCount.Text);
end;

procedure TfrmDice.txtCountExit(Sender: TObject);
begin
  FDice.SetTrait('Count', txtCount.Text);
end;

procedure TfrmDice.txtDieExit(Sender: TObject);
begin
  FDice.SetTrait('Die', txtDie.Text);
end;

procedure TfrmDice.txtDieSelect(Sender: TObject);
begin
  FDice.SetTrait('Die', txtDie.Text);
end;

procedure TfrmDice.txtModifierExit(Sender: TObject);
begin
  FDice.SetTrait('Modifier', txtModifier.Text);
end;

procedure TfrmDice.txtModifierSelect(Sender: TObject);
begin
  FDice.SetTrait('Modifier', txtModifier.Text);
end;

procedure TfrmDice.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  FDice.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmDice.SetDice(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Dice' then Exit;
  if FDice = AValue then Exit;
  FDice := AValue;
  txtTitle.Text := FDice.GetTrait('Title');
  txtCount.Text := FDice.GetTrait('Count');
  txtDie.Text := FDice.GetTrait('Die');
  txtModifier.Text := FDice.GetTrait('Modifier');
end;

end.

