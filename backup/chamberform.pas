unit chamberform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx;

type

  { TfrmChamber }

  TfrmChamber = class(TForm)
    btnRollAll: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    txtTrap: TComboBox;
    txtRemains: TComboBox;
    txtVehicle: TComboBox;
    txtClass: TComboBox;
    Label3: TLabel;
    txtJewelry: TComboBox;
    txtWeapon: TComboBox;
    txtInstrument: TComboBox;
    txtKit: TComboBox;
    txtContainer: TComboBox;
    txtTool: TComboBox;
    txtTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtClothing: TComboBox;
    txtArmour: TComboBox;
    procedure btnRollAllClick(Sender: TObject);
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

uses
  traitframe;

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

end;

procedure TfrmChamber.SetChamber(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Chamber' then exit;
  if FChamber = AValue then Exit;
  FChamber := AValue;
  txtTitle.Text:= FChamber.GetTrait('Title');
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

