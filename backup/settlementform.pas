unit settlementform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLType, Buttons, puppetmasterlib;

type

  { TfrmSettlement }

  TfrmSettlement = class(TForm)
    btnLocked: TSpeedButton;
    btnRollAll: TButton;
    btnRollName: TButton;
    txtCondition: TComboBox;
    Label1: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlHeader: TPanel;
    txtRoofs: TComboBox;
    txtTitle: TEdit;
    txtWalls: TComboBox;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollNameClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtWallsExit(Sender: TObject);
    procedure txtWallsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtWallsSelect(Sender: TObject);
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
  FSettlement.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSettlement.btnLockedClick(Sender: TObject);
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtWalls.Enabled := not btnLocked.Down;
  txtRoofs.Enabled := not btnLocked.Down;
  txtCondition.Enabled := not btnLocked.Down;
  btnRollName.Enabled := not btnLocked.Down;
  btnRollAll.Enabled := not btnLocked.Down;
  FSettlement.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

procedure TfrmSettlement.btnRollAllClick(Sender: TObject);
var
  i : integer;
begin
  txtWalls.ItemIndex := Random(txtWalls.Items.Count);
  txtRoofs.ItemIndex := Random(txtRoofs.Items.Count);
  txtCondition.ItemIndex  := Random(txtCondition.Items.Count);

  FSettlement.SetTrait('Walls', txtWalls.Text);
  FSettlement.SetTrait('Roofs', txtRoofs.Text);
  FSettlement.SetTrait('Condition', txtCondition.Text);
end;

procedure TfrmSettlement.txtTitleExit(Sender: TObject);
begin
  FSettlement.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSettlement.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FSettlement.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSettlement.txtWallsExit(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name, cbo.Text);
end;

procedure TfrmSettlement.txtWallsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name, cbo.Text);
end;

procedure TfrmSettlement.txtWallsSelect(Sender: TObject);
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

  txtTitle.Text := FSettlement.GetTrait('Title');
  txtWalls.Text := FSettlement.GetTrait('Walls');
  txtRoofs.Text := FSettlement.GetTrait('Roofs');
  txtCondition.Text := FSettlement.GetTrait('Condition');
  btnLocked.Down := FSettlement.GetTrait('Locked') = 'True';
end;

end.

