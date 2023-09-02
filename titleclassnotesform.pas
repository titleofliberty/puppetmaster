unit titleclassnotesform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LCLType, Buttons, puppetmasterlib;

type

  { TfrmTitleClassNotes }

  TfrmTitleClassNotes = class(TForm)
    btnLocked: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    pnlClient: TPanel;
    pnlHeader: TPanel;
    txtClass: TComboBox;
    txtNotes: TMemo;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLeaf: TPMLeaf;
    procedure SetLeaf(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Leaf: TPMLeaf read FLeaf write SetLeaf;
  end;

var
  frmTitleClassNotes: TfrmTitleClassNotes;

implementation

{$R *.lfm}

{ TfrmTitleClassNotes }

procedure TfrmTitleClassNotes.txtTitleExit(Sender: TObject);
begin
  FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmTitleClassNotes.txtClassExit(Sender: TObject);
begin
  FLeaf.SetTrait('Class', txtClass.Text);
end;

procedure TfrmTitleClassNotes.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmTitleClassNotes.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Class', txtClass.Text);
end;

procedure TfrmTitleClassNotes.txtClassSelect(Sender: TObject);
begin
  FLeaf.SetTrait('Class', txtClass.Text);
end;

procedure TfrmTitleClassNotes.txtNotesExit(Sender: TObject);
begin
  FLeaf.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmTitleClassNotes.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmTitleClassNotes.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmTitleClassNotes.SetLeaf(AValue: TPMLeaf);
begin
  if FLeaf = AValue then Exit;
  FLeaf := AValue;

  txtClass.Items.Clear;
  if (leaf.Category = 'Dungeon') then
    txtClass.Items.AddStrings(TPMDungeonClasses)
  else if (leaf.Category = 'Level') then
    txtClass.Items.AddStrings(TPMLevelClasses)
  else if (leaf.Category = 'Wilderness') then
    txtClass.Items.AddStrings(TPMWildernessClasses)
  else if (leaf.Category = 'Route') then
    txtClass.Items.AddStrings(TPMRouteClasses)
  else if (leaf.Category = 'Settlement') then
    txtClass.Items.AddStrings(TPMSettlementClasses)
  else if (leaf.Category = 'Venue') then
    txtClass.Items.AddStrings(TPMVenueClasses)
  else if (leaf.Category = 'Floor') then
    txtClass.Items.AddStrings(TPMFloorClasses)
  else if (leaf.Category = 'Consumable') then
    txtClass.Items.AddStrings(TPMConsumableClasses);


  pnlHeader.Caption := FLeaf.Category;
  txtTitle.Text := FLeaf.GetTrait('Title');
  txtClass.Text := FLeaf.GetTrait('Class');
  txtNotes.Text := FLeaf.GetTrait('Notes');
end;

procedure TfrmTitleClassNotes.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FLeaf.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

