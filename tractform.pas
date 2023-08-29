unit tractform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, Buttons, puppetmasterlib;

type

  { TfrmTract }

  TfrmTract = class(TForm)
    btnLocked: TSpeedButton;
    btnRollAll: TButton;
    Label1: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlHeader: TPanel;
    txtArmour: TComboBox;
    txtClass: TComboBox;
    txtClothing: TComboBox;
    txtContainer: TComboBox;
    txtFauna: TComboBox;
    txtFlora: TComboBox;
    txtInstrument: TComboBox;
    txtJewelry: TComboBox;
    txtKit: TComboBox;
    txtNotes: TMemo;
    txtRemains: TComboBox;
    txtTitle: TEdit;
    txtTool: TComboBox;
    txtTrap: TComboBox;
    txtUnnatural: TComboBox;
    txtNatural: TComboBox;
    txtVehicle: TComboBox;
    txtWeapon: TComboBox;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure txtNaturalExit(Sender: TObject);
    procedure txtNaturalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure txtNaturalSelect(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FTract: TPMLeaf;
    procedure SetTract(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Tract: TPMLeaf read FTract write SetTract;
  end;

var
  frmTract: TfrmTract;

implementation

{$R *.lfm}

{ TfrmTract }

procedure TfrmTract.btnRollAllClick(Sender: TObject);
begin
  txtClass.ItemIndex := Random(txtClass.Items.Count);
  txtNatural.ItemIndex := Random(txtNatural.Items.Count);
  txtUnnatural.ItemIndex := Random(txtUnnatural.Items.Count);
  txtFlora.ItemIndex := Random(txtFlora.Items.Count);
  txtFauna.ItemIndex := Random(txtFauna.Items.Count);


  FTract.SetTrait('Class', txtClass.Text);
  FTract.SetTrait('Natural', txtNatural.Text);
  FTract.SetTrait('Manufactured', txtUnnatural.Text);
  FTract.SetTrait('Flora', txtFlora.Text);
  FTract.SetTrait('Fauna', txtFauna.Text);
end;

procedure TfrmTract.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmTract.txtNaturalExit(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FTract.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmTract.txtNaturalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  if Key = VK_RETURN then
    FTract.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmTract.txtNaturalSelect(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FTract.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmTract.txtTitleExit(Sender: TObject);
begin
  FTract.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmTract.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FTract.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmTract.SetTract(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Tract' then exit;
  if FTract = AValue then Exit;
  FTract := AValue;

  txtTitle.Text := FTract.GetTrait('Title');
  txtClass.Text := FTract.GetTrait('Class');
  txtNatural.Text := FTract.GetTrait('Natural');
  txtUnnatural.Text := FTract.GetTrait('Manufactured');
  txtFlora.Text := FTract.GetTrait('Flora');
  txtFauna.Text := FTract.GetTrait('Fauna');
  btnLocked.Down := FTract.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmTract.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtNatural.Enabled := not btnLocked.Down;
  txtUnnatural.Enabled := not btnLocked.Down;
  txtFlora.Enabled := not btnLocked.Down;
  txtFauna.Enabled := not btnLocked.Down;
  btnRollAll.Enabled := not btnLocked.Down;
  FTract.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

