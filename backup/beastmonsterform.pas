unit beastmonsterform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, puppetmasterlib, LCLType;

type

  { TfrmBeastMonster }

  TfrmBeastMonster = class(TForm)
    btnLocked: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    txtClass: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlHeader: TPanel;
    txtArmorClass: TComboBox;
    txtHPMax: TComboBox;
    txtHPCurrent: TComboBox;
    txtNotes: TMemo;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure txtArmorClassExit(Sender: TObject);
    procedure txtArmorClassKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtArmorClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLeaf: TLeaf;
    procedure SetLeaf(AValue: TLeaf);
    procedure LockForm;
  public
    property Leaf: TLeaf read FLeaf write SetLeaf;
  end;

var
  frmBeastMonster: TfrmBeastMonster;

implementation

{$R *.lfm}

{ TfrmBeastMonster }

procedure TfrmBeastMonster.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmBeastMonster.txtArmorClassExit(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FLeaf.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmBeastMonster.txtArmorClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  if Key = VK_RETURN then
    FLeaf.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmBeastMonster.txtArmorClassSelect(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FLeaf.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmBeastMonster.txtNotesExit(Sender: TObject);
begin
  FLeaf.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmBeastMonster.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmBeastMonster.txtTitleExit(Sender: TObject);
begin
  FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmBeastMonster.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmBeastMonster.SetLeaf(AValue: TPMLeaf);
begin
  if FLeaf = AValue then Exit;
  FLeaf := AValue;

  if FLeaf.Category = 'Beast' then
    txtClass.Items.AddStrings(TPMBeastClasses)
  else if FLeaf.Category = 'Monster' then
    txtClass.Items.AddStrings(TPMMonsterClasses)
  else if FLeaf.Category = 'Humanoid' then
    txtClass.Items.AddStrings(TPMHumanoidClasses);

  pnlHeader.Caption := FLeaf.Category;

  txtTitle.Text := FLeaf.GetTrait('Title');
  txtClass.Text := FLeaf.GetTrait('Class');
  txtArmorClass.Text := FLeaf.GetTrait('ArmorClass');
  txtHPMax.Text := FLeaf.GetTrait('HPMax');
  txtHPCurrent.Text := FLeaf.GetTrait('HPCurrent');
  txtNotes.Text := FLeaf.GetTrait('Notes');

end;

procedure TfrmBeastMonster.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtArmorClass.Enabled := not btnLocked.Down;
  txtHPMax.Enabled := not btnLocked.Down;
  txtHPCurrent.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FLeaf.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

