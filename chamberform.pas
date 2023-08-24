unit chamberform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx, LCLType, Buttons, puppetmasterlib;

type

  { TfrmChamber }

  TfrmChamber = class(TForm)
    btnLocked: TSpeedButton;
    btnRollAll: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlHeader: TPanel;
    pnlTop: TPanel;
    txtArmour: TComboBox;
    txtClass: TComboBox;
    txtClothing: TComboBox;
    txtContainer: TComboBox;
    txtInstrument: TComboBox;
    txtJewelry: TComboBox;
    txtKit: TComboBox;
    txtRemains: TComboBox;
    txtTitle: TEdit;
    txtTool: TComboBox;
    txtTrap: TComboBox;
    txtVehicle: TComboBox;
    txtWeapon: TComboBox;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure txtToolExit(Sender: TObject);
    procedure txtToolKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtToolSelect(Sender: TObject);
  private
    FChamber: TPMLeaf;
    procedure SetChamber(AValue: TPMLeaf);
  public
    property Chamber: TPMLeaf read FChamber write SetChamber;
    procedure RollCbo(Cbo: TComboBox; Multiply: integer);
  end;

var
  frmChamber: TfrmChamber;

implementation

{$R *.lfm}

{ TfrmChamber }

procedure TfrmChamber.btnRollAllClick(Sender: TObject);
begin
  txtClass.ItemIndex := Random(txtClass.Items.Count);
  RollCbo(txtTool, 5);
  RollCbo(txtClothing, 5);
  RollCbo(txtInstrument, 5);
  RollCbo(txtKit, 9);
  RollCbo(txtContainer, 5);
  RollCbo(txtWeapon, 5);
  RollCbo(txtArmour, 5);
  RollCbo(txtVehicle, 20);
  RollCbo(txtJewelry, 5);
  RollCbo(txtRemains, 9);
  RollCbo(txtTrap, 8);

  FChamber.SetTrait('Class', txtClass.Text);
  FChamber.SetTrait('Tool', txtTool.Text);
  FChamber.SetTrait('Clothing', txtClothing.Text);
  FChamber.SetTrait('Kit', txtKit.Text);
  FChamber.SetTrait('Container', txtContainer.Text);
  FChamber.SetTrait('Weapon', txtWeapon.Text);
  FChamber.SetTrait('Vehicle', txtVehicle.Text);
  FChamber.SetTrait('Jewelry', txtJewelry.Text);
  FChamber.SetTrait('Remains', txtRemains.Text);
  FChamber.SetTrait('Instrument', txtInstrument.Text);
  FChamber.SetTrait('Armour', txtArmour.Text);
  FChamber.SetTrait('Trap', txtTrap.Text);

end;

procedure TfrmChamber.btnLockedClick(Sender: TObject);
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtTool.Enabled := not btnLocked.Down;
  txtClothing.Enabled := not btnLocked.Down;
  txtKit.Enabled := not btnLocked.Down;
  txtContainer.Enabled := not btnLocked.Down;
  txtWeapon.Enabled := not btnLocked.Down;
  txtVehicle.Enabled := not btnLocked.Down;
  txtJewelry.Enabled := not btnLocked.Down;
  txtRemains.Enabled := not btnLocked.Down;
  txtInstrument.Enabled := not btnLocked.Down;
  txtArmour.Enabled := not btnLocked.Down;
  txtTrap.Enabled := not btnLocked.Down;
  btnRollAll.Enabled := not btnLocked.Down;
  FChamber.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

procedure TfrmChamber.txtTitleExit(Sender: TObject);
begin
  FChamber.SetTrait('Title', TEdit(Sender).Text);
end;

procedure TfrmChamber.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FChamber.SetTrait('Title', TEdit(Sender).Text);
end;

procedure TfrmChamber.txtToolExit(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FChamber.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmChamber.txtToolKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  if Key = VK_RETURN then
    FChamber.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmChamber.txtToolSelect(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FChamber.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmChamber.SetChamber(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Chamber' then exit;
  if FChamber = AValue then Exit;
  FChamber := AValue;
  txtTitle.Text := FChamber.GetTrait('Title');
  txtClass.Text := FChamber.GetTrait('Class');
  txtTool.Text := FChamber.GetTrait('Tool');
  txtClothing.Text := FChamber.GetTrait('Clothing');
  txtKit.Text := FChamber.GetTrait('Kit');
  txtContainer.Text := FChamber.GetTrait('Container');
  txtWeapon.Text := FChamber.GetTrait('Weapon');
  txtVehicle.Text := FChamber.GetTrait('Vehicle');
  txtJewelry.Text := FChamber.GetTrait('Jewelry');
  txtRemains.Text := FChamber.GetTrait('Remains');
  txtInstrument.Text := FChamber.GetTrait('Instrument');
  txtArmour.Text := FChamber.GetTrait('Armour');
  txtTrap.Text := FChamber.GetTrait('Trap');
  btnLocked.Down := FChamber.GetTrait('Locked') = 'True';
end;

procedure TfrmChamber.RollCbo(Cbo: TComboBox; Multiply: integer);
var
  i, j: Integer;
begin
  j := Cbo.Items.Count * Multiply;
  i := Random(j);
  if i > Cbo.Items.Count - 1 then i := 0;;
  Cbo.ItemIndex := i;
end;

end.

