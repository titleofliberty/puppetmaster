unit chamberform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComboEx, LCLType, puppetmasterlib;

type

  { TfrmChamber }

  TfrmChamber = class(TForm)
    btnRollAll: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlTop: TPanel;
    pnlTop1: TPanel;
    txtArmour: TComboBox;
    txtClass: TComboBox;
    txtClothing: TComboBox;
    txtContainer: TComboBox;
    txtInstrument: TComboBox;
    txtJewelry: TComboBox;
    txtKit: TComboBox;
    txtRemains: TComboBox;
    txtTitle: TEdit;
    txtTitle1: TEdit;
    txtTool: TComboBox;
    Label1: TLabel;
    txtTrap: TComboBox;
    txtVehicle: TComboBox;
    txtWeapon: TComboBox;
    procedure btnRollAllClick(Sender: TObject);
    procedure txtTitle1Exit(Sender: TObject);
    procedure txtTitle1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
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

procedure TfrmChamber.txtTitle1Exit(Sender: TObject);
begin
  FChamber.SetTrait('Title', TEdit(Sender).Text);
end;

procedure TfrmChamber.txtTitle1KeyUp(Sender: TObject; var Key: Word;
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

