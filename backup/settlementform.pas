unit settlementform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLType, puppetmasterlib;

type

  { TfrmSettlement }

  TfrmSettlement = class(TForm)
    btnRollAll: TButton;
    btnRollName: TButton;
    btnRollMood: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Condition: TComboBox;
    Walls: TComboBox;
    Label2: TLabel;
    Title: TEdit;
    Label1: TLabel;
    Roofs: TComboBox;
    Moods: TComboBox;
    procedure btnRollMoodClick(Sender: TObject);
    procedure btnRollNameClick(Sender: TObject);
    procedure FieldExit(Sender: TObject);
    procedure FieldKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRollAllClick(Sender: TObject);
  private
    FSettlement: TPMLeaf;
    procedure SetSettlement(AValue: TPMLeaf);
  public
    property Settlement: TPMLeaf read FSettlement write SetSettlement;
  end;

var
  frmSettlement: TfrmSettlement;

implementation

{$R *.lfm}

{ TfrmSettlement }

procedure TfrmSettlement.FieldExit(Sender: TObject);
var
  txt : TEdit;
  cbo : TComboBox;
begin
  if Sender is TEdit then
    txt := TEdit(Sender)
  else if Sender is TComboBox then
    cbo := TComboBox(Sender);

  if Assigned(txt) then
    FSettlement.SetTrait(txt.Name, txt.Text)
  else if Assigned(cbo) then
    FSettlement.SetTrait(cbo.Name, cbo.Text);
end;

procedure TfrmSettlement.btnRollNameClick(Sender: TObject);
begin
  FSettlement.SetTrait('Title', Title.Text);
end;

procedure TfrmSettlement.btnRollMoodClick(Sender: TObject);
begin
  Moods.ItemIndex := Random(Moods.Items.Count);
  FSettlement.SetTrait('Moods', Moods.Text);
end;

procedure TfrmSettlement.FieldKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  txt : TEdit;
  cbo : TComboBox;
begin
  if Sender is TEdit then
    txt := TEdit(Sender)
  else if Sender is TComboBox then
    cbo := TComboBox(Sender);

  if Key = VK_RETURN then
  begin
    if Assigned(txt) then
      FSettlement.SetTrait(txt.Name, txt.Text)
    else if Assigned(cbo) then
      FSettlement.SetTrait(cbo.Name, cbo.Text);
  end;
end;

procedure TfrmSettlement.btnRollAllClick(Sender: TObject);
var
  i : integer;
begin
  Moods.ItemIndex := Random(Moods.Items.Count);
  Walls.ItemIndex := Random(Walls.Items.Count);
  Roofs.ItemIndex := Random(Roofs.Items.Count);
  Condition.ItemIndex  := Random(Condition.Items.Count);

  FSettlement.SetTrait('Moods', Moods.Text);
  FSettlement.SetTrait('Walls', Walls.Text);
  FSettlement.SetTrait('Roofs', Roofs.Text);
  FSettlement.SetTrait('Condition', Condition.Text);
end;

procedure TfrmSettlement.SetSettlement(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Settlement' then Exit;
  if FSettlement = AValue then Exit;
  FSettlement := AValue;
  Title.Text := FSettlement.GetTrait('Title');
  Walls.Text := FSettlement.GetTrait('Walls');
  Roofs.Text := FSettlement.GetTrait('Roofs');
  Moods.Text := FSettlement.GetTrait('Moods');
  Condition.Text := FSettlement.GetTrait('Condition');
end;

end.

