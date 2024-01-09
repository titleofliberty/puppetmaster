unit chambertractroomform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, Buttons, puppetmasterlib, tagsframe;

type

  { TfrmChamberTractRoom }

  TfrmChamberTractRoom = class(TForm)
    btnLocked: TSpeedButton;
    fraTags1: TfraTags;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    pnlHeader: TPanel;
    txtClass: TComboBox;
    txtNotes: TMemo;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure txtNaturalExit(Sender: TObject);
    procedure txtNaturalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure txtNaturalSelect(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLeaf: TLeaf;
    procedure SetLeaf(AValue: TLeaf);
    procedure LockForm;
    procedure RollCbo(Cbo: TComboBox; Multiply: integer);
  public
    property Leaf: TLeaf read FLeaf write SetLeaf;
  end;

var
  frmChamberTractRoom: TfrmChamberTractRoom;

implementation

{$R *.lfm}

{ TfrmChamberTractRoom }

procedure TfrmChamberTractRoom.btnRollAllClick(Sender: TObject);
begin
  txtClass.ItemIndex := Random(txtClass.Items.Count);
  //txtNatural.ItemIndex := Random(txtNatural.Items.Count);
  //txtUnnatural.ItemIndex := Random(txtUnnatural.Items.Count);
  //txtFlora.ItemIndex := Random(txtFlora.Items.Count);
  //txtFauna.ItemIndex := Random(txtFauna.Items.Count);
  //
  //RollCbo(txtTool, 5);
  //RollCbo(txtClothing, 5);
  //RollCbo(txtInstrument, 5);
  //RollCbo(txtKit, 9);
  //RollCbo(txtContainer, 5);
  //RollCbo(txtWeapon, 5);
  //RollCbo(txtArmour, 5);
  //RollCbo(txtVehicle, 20);
  //RollCbo(txtJewelry, 5);
  //RollCbo(txtRemains, 9);
  //RollCbo(txtTrap, 8);
  //
  //FLeaf.SetTrait('Class', txtClass.Text);
  //FLeaf.SetTrait('Natural', txtNatural.Text);
  //FLeaf.SetTrait('Manufactured', txtUnnatural.Text);
  //FLeaf.SetTrait('Flora', txtFlora.Text);
  //FLeaf.SetTrait('Fauna', txtFauna.Text);
  //FLeaf.SetTrait('Tool', txtTool.Text);
  //FLeaf.SetTrait('Clothing', txtClothing.Text);
  //FLeaf.SetTrait('Kit', txtKit.Text);
  //FLeaf.SetTrait('Container', txtContainer.Text);
  //FLeaf.SetTrait('Weapon', txtWeapon.Text);
  //FLeaf.SetTrait('Vehicle', txtVehicle.Text);
  //FLeaf.SetTrait('Jewelry', txtJewelry.Text);
  //FLeaf.SetTrait('Remains', txtRemains.Text);
  //FLeaf.SetTrait('Instrument', txtInstrument.Text);
  //FLeaf.SetTrait('Armour', txtArmour.Text);
  //FLeaf.SetTrait('Trap', txtTrap.Text);

end;

procedure TfrmChamberTractRoom.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmChamberTractRoom.txtNaturalExit(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FLeaf.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmChamberTractRoom.txtNaturalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  if Key = VK_RETURN then
    FLeaf.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmChamberTractRoom.txtNaturalSelect(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FLeaf.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmChamberTractRoom.txtTitleExit(Sender: TObject);
begin
  FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmChamberTractRoom.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmChamberTractRoom.SetLeaf(AValue: TLeaf);
begin

  if FLeaf = AValue then Exit;
  FLeaf := AValue;

  txtClass.Clear;
  if (FLeaf.Category = 'Chamber') then
    txtClass.Items.AddStrings(TPMChamberClasses)
  else if (FLeaf.Category = 'Tract') then
    txtClass.Items.AddStrings(TPMTractClasses)
  else if (FLeaf.Category = 'Room') then
    txtClass.Items.AddStrings(TPMRoomClasses);

  pnlHeader.Caption := FLeaf.Category;

  txtTitle.Text  := FLeaf.GetTrait('Title');
  txtClass.Text  := FLeaf.GetTrait('Class');
  btnLocked.Down := FLeaf.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmChamberTractRoom.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  FLeaf.Locked := BoolToStr(btnLocked.Down, 'True', 'False');
end;

procedure TfrmChamberTractRoom.RollCbo(Cbo: TComboBox; Multiply: integer);
var
  i, j: Integer;
begin
  j := Cbo.Items.Count * Multiply;
  i := Random(j);
  if i > Cbo.Items.Count - 1 then i := -1;
  Cbo.ItemIndex := i;
end;


end.

