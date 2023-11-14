unit dicerollform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  puppetmasterlib;

type

  { TfrmRollDice }

  TfrmRollDice = class(TForm)
    lblRoll: TLabel;
    Roll: TButton;
    btnCancel: TButton;
    procedure AdjustCount(Amount: integer);
    procedure AdjustModifier(Amount: integer);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCount: integer;
    FModifier: integer;
    FDice: TLeaf;
    procedure SetDice(AValue: TLeaf);
    procedure DisplayRoll;
  public
    property Dice: TLeaf read FDice write SetDice;
  end;

var
  frmRollDice: TfrmRollDice;

implementation

{$R *.lfm}

{ TfrmRollDice }

procedure TfrmRollDice.AdjustCount(Amount: integer);
begin
  FCount := FCount + Amount;
  if FCount < 1 then FCount := 1;
  FDice.SetTrait('Count', FCount.ToString);
end;

procedure TfrmRollDice.AdjustModifier(Amount: integer);
begin
  FModifier := FModifier + Amount;
  if FModifier > 0 then
    FDice.SetTrait('Modifier', '+' + FModifier.ToString)
  else
    FDice.SetTrait('Modifier', FModifier.ToString);
end;

procedure TfrmRollDice.FormCreate(Sender: TObject);
begin
  FDice := TLeaf.Create('Dice');
end;

procedure TfrmRollDice.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
  begin
    if (FDice.GetTrait('Die') = 'd4') and (Key = VK_F1) then
      AdjustCount(-1)
    else if (FDice.GetTrait('Die') = 'd6') and (Key = VK_F2) then
      AdjustCount(-1)
    else if (FDice.GetTrait('Die') = 'd8') and (Key = VK_F3) then
      AdjustCount(-1)
    else if (FDice.GetTrait('Die') = 'd10') and (Key = VK_F4) then
      AdjustCount(-1)
    else if (FDice.GetTrait('Die') = 'd12') and (Key = VK_F5) then
      AdjustCount(-1)
    else if (FDice.GetTrait('Die') = 'd20') and (Key = VK_F6) then
      AdjustCount(-1)
    else if (FDice.GetTrait('Die') = 'd100') and (Key = VK_F7) then
      AdjustCount(-1);
  end
  else
  begin
    if (FDice.GetTrait('Die') = 'd4') and (Key = VK_F1) then
      AdjustCount(1)
    else if (FDice.GetTrait('Die') = 'd6') and (Key = VK_F2) then
      AdjustCount(1)
    else if (FDice.GetTrait('Die') = 'd8') and (Key = VK_F3) then
      AdjustCount(1)
    else if (FDice.GetTrait('Die') = 'd10') and (Key = VK_F4) then
      AdjustCount(1)
    else if (FDice.GetTrait('Die') = 'd12') and (Key = VK_F5) then
      AdjustCount(1)
    else if (FDice.GetTrait('Die') = 'd20') and (Key = VK_F6) then
      AdjustCount(1)
    else if (FDice.GetTrait('Die') = 'd100') and (Key = VK_F7) then
      AdjustCount(1)
    else if (Key = VK_ADD) or (Key = 187) then
      AdjustModifier(1)
    else if (Key = VK_SUBTRACT) or (Key = 189) then
      AdjustModifier(-1);
  end;
  DisplayRoll;
end;

procedure TfrmRollDice.SetDice(AValue: TLeaf);
begin
  if FDice = AValue then Exit;
  FDice := AValue;
  FDice.SetTrait('Count', '1');
  FCount := 1;
  FModifier := FDice.GetTrait('Modifier').ToInt64;
  DisplayRoll;
end;

procedure TfrmRollDice.DisplayRoll;
var
  str : string;
begin
  if (FModifier = 0) then
    str := FDice.GetTrait('Count') + FDice.GetTrait('Die')
  else
    str := FDice.GetTrait('Count') + FDice.GetTrait('Die') + FDice.GetTrait('Modifier');

  lblRoll.Caption := str;
end;

end.

