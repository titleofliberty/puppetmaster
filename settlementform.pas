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
    btnRollMood: TButton;
    btnRollName: TButton;
    Condition: TComboBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Moods: TComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Roofs: TComboBox;
    Title: TEdit;
    Walls: TComboBox;
    procedure btnRollMoodClick(Sender: TObject);
    procedure btnRollNameClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure TitleExit(Sender: TObject);
    procedure TitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WallsExit(Sender: TObject);
    procedure WallsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WallsSelect(Sender: TObject);
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

procedure TfrmSettlement.btnRollNameClick(Sender: TObject);
begin
  FSettlement.SetTrait('Title', Title.Text);
end;

procedure TfrmSettlement.btnRollMoodClick(Sender: TObject);
begin
  Moods.ItemIndex := Random(Moods.Items.Count);
  FSettlement.SetTrait('Moods', Moods.Text);
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

procedure TfrmSettlement.TitleExit(Sender: TObject);
begin
  FSettlement.SetTrait('Title', Title.Text);
end;

procedure TfrmSettlement.TitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FSettlement.SetTrait('Title', Title.Text);
end;

procedure TfrmSettlement.WallsExit(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name, cbo.Text);
end;

procedure TfrmSettlement.WallsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name, cbo.Text);
end;

procedure TfrmSettlement.WallsSelect(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name, cbo.Text);
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

