unit adventureform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, puppetmasterlib, LCLType, ComCtrls, StrUtils;

type

  { TfrmAdventure }

  TfrmAdventure = class(TForm)
    btnLocked: TSpeedButton;
    btnRollAll: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlClient: TPanel;
    pnlHeader: TPanel;
    txtAllyNeutral: TComboBox;
    txtCharacterEncounter: TComboBox;
    txtChase: TComboBox;
    txtClass: TComboBox;
    txtClimax: TComboBox;
    txtCruelTrick: TComboBox;
    txtDeathTrap: TComboBox;
    txtGeneralSetting: TComboBox;
    txtGoal: TComboBox;
    txtLieutenant1: TComboBox;
    txtLieutenant2: TComboBox;
    txtMasterVillian: TComboBox;
    txtMonsterEncounter: TComboBox;
    txtMoralQuandry: TComboBox;
    txtNotes: TMemo;
    txtOmenProphecy: TComboBox;
    txtPlot: TComboBox;
    txtRedHerring: TComboBox;
    txtSecretWeakness: TComboBox;
    txtSpecialCondition: TComboBox;
    txtSpecificSetting: TComboBox;
    txtStoryHook: TComboBox;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FAdventure: TPMLeaf;
    procedure SetAdventure(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Adventure: TPMLeaf read FAdventure write SetAdventure;
  end;

var
  frmAdventure: TfrmAdventure;

implementation

{$R *.lfm}

{ TfrmAdventure }

procedure TfrmAdventure.btnRollAllClick(Sender: TObject);
begin
  txtClass.ItemIndex := Random(txtClass.Items.Count);
  txtGoal.ItemIndex := Random(txtGoal.Items.Count);
  txtStoryHook.ItemIndex := Random(txtStoryHook.Items.Count);
  txtPlot.ItemIndex := Random(txtPlot.Items.Count);
  txtClimax.ItemIndex := Random(txtClimax.Items.Count);
  txtGeneralSetting.ItemIndex := Random(txtGeneralSetting.Items.Count);
  txtSpecificSetting.ItemIndex := Random(txtSpecificSetting.Items.Count);
  txtMasterVillian.ItemIndex := Random(txtMasterVillian.Items.Count);
  txtLieutenant1.ItemIndex := Random(txtLieutenant1.Items.Count);
  txtLieutenant2.ItemIndex := Random(txtLieutenant2.Items.Count);
  txtAllyNeutral.ItemIndex := Random(txtAllyNeutral.Items.Count);
  txtMonsterEncounter.ItemIndex := Random(txtMonsterEncounter.Items.Count);
  txtCharacterEncounter.ItemIndex := Random(txtCharacterEncounter.Items.Count);
  txtDeathTrap.ItemIndex := Random(txtDeathTrap.Items.Count);
  txtChase.ItemIndex := Random(txtChase.Items.Count);
  txtOmenProphecy.ItemIndex := Random(txtOmenProphecy.Items.Count);
  txtSecretWeakness.ItemIndex := Random(txtSecretWeakness.Items.Count);
  txtSpecialCondition.ItemIndex := Random(txtSpecialCondition.Items.Count);
  txtMoralQuandry.ItemIndex := Random(txtMoralQuandry.Items.Count);
  txtRedHerring.ItemIndex := Random(txtRedHerring.Items.Count);
  txtCruelTrick.ItemIndex := Random(txtCruelTrick.Items.Count);

  FAdventure.SetTrait(txtClass.Name.Replace('txt', ''), txtClass.Text);
  FAdventure.SetTrait(txtGoal.Name.Replace('txt', ''), txtGoal.Text);
  FAdventure.SetTrait(txtStoryHook.Name.Replace('txt', ''), txtStoryHook.Text);
  FAdventure.SetTrait(txtPlot.Name.Replace('txt', ''), txtPlot.Text);
  FAdventure.SetTrait(txtClimax.Name.Replace('txt', ''), txtClimax.Text);
  FAdventure.SetTrait(txtGeneralSetting.Name.Replace('txt', ''), txtGeneralSetting.Text);
  FAdventure.SetTrait(txtSpecificSetting.Name.Replace('txt', ''), txtSpecificSetting.Text);
  FAdventure.SetTrait(txtMasterVillian.Name.Replace('txt', ''), txtMasterVillian.Text);
  FAdventure.SetTrait(txtLieutenant1.Name.Replace('txt', ''), txtLieutenant1.Text);
  FAdventure.SetTrait(txtLieutenant2.Name.Replace('txt', ''), txtLieutenant2.Text);
  FAdventure.SetTrait(txtAllyNeutral.Name.Replace('txt', ''), txtAllyNeutral.Text);
  FAdventure.SetTrait(txtMonsterEncounter.Name.Replace('txt', ''), txtMonsterEncounter.Text);
  FAdventure.SetTrait(txtCharacterEncounter.Name.Replace('txt', ''), txtCharacterEncounter.Text);
  FAdventure.SetTrait(txtDeathTrap.Name.Replace('txt', ''), txtDeathTrap.Text);
  FAdventure.SetTrait(txtChase.Name.Replace('txt', ''), txtChase.Text);
  FAdventure.SetTrait(txtOmenProphecy.Name.Replace('txt', ''), txtOmenProphecy.Text);
  FAdventure.SetTrait(txtSecretWeakness.Name.Replace('txt', ''), txtSecretWeakness.Text);
  FAdventure.SetTrait(txtSpecialCondition.Name.Replace('txt', ''), txtSpecialCondition.Text);
  FAdventure.SetTrait(txtMoralQuandry.Name.Replace('txt', ''), txtMoralQuandry.Text);
  FAdventure.SetTrait(txtRedHerring.Name.Replace('txt', ''), txtRedHerring.Text);
  FAdventure.SetTrait(txtCruelTrick.Name.Replace('txt', ''), txtCruelTrick.Text);
end;

procedure TfrmAdventure.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmAdventure.txtClassExit(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FAdventure.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmAdventure.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  if Key = VK_RETURN then
    FAdventure.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmAdventure.txtClassSelect(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FAdventure.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmAdventure.txtNotesExit(Sender: TObject);
begin
  FAdventure.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmAdventure.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FAdventure.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmAdventure.txtTitleExit(Sender: TObject);
begin
  FAdventure.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmAdventure.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FAdventure.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmAdventure.SetAdventure(AValue: TPMLeaf);
begin
  if FAdventure = AValue then Exit;
  FAdventure := AValue;

  txtClass.Items.AddStrings(TPMAdventureThemes);
  txtGoal.Items.AddStrings(TPMAdventureGoals);
  txtStoryHook.Items.AddStrings(TPMAdventureStoryHooks);
  txtPlot.Items.AddStrings(TPMAdventurePlots);
  txtClimax.Items.AddStrings(TPMAdventureClimaxes);
  txtGeneralSetting.Items.AddStrings(TPMAdventureGeneralSettings);
  txtSpecificSetting.Items.AddStrings(TPMAdventureSpecificSettings);
  txtMasterVillian.Items.AddStrings(TPMAdventureBosses);
  txtLieutenant1.Items.AddStrings(TPMAdventureLieutenants);
  txtLieutenant2.Items.AddStrings(TPMAdventureLieutenants);
  txtAllyNeutral.Items.AddStrings(TPMAdventureAllyNeutral);
  txtMonsterEncounter.Items.AddStrings(TPMAdventureMonsterEncounters);
  txtCharacterEncounter.Items.AddStrings(TPMAdventureCharacterEncounters);
  txtDeathTrap.Items.AddStrings(TPMAdventureDeathTraps);
  txtChase.Items.AddStrings(TPMAdventureChases);
  txtOmenProphecy.Items.AddStrings(TPMAdventureOmenProphecys);
  txtSecretWeakness.Items.AddStrings(TPMAdventureSecretWeaknesses);
  txtSpecialCondition.Items.AddStrings(TPMAdventureSpecialConditions);
  txtMoralQuandry.Items.AddStrings(TPMAdventureMoralQuandrys);
  txtRedHerring.Items.AddStrings(TPMAdventureRedHerrings);
  txtCruelTrick.Items.AddStrings(TPMAdventureCruelTricks);

  txtTitle.Text := FAdventure.GetTrait('Title');
  txtClass.Text := FAdventure.GetTrait('Class');
  txtGoal.Text := FAdventure.GetTrait('Goal');
  txtStoryHook.Text := FAdventure.GetTrait('StoryHook');
  txtPlot.Text := FAdventure.GetTrait('Plot');
  txtClimax.Text := FAdventure.GetTrait('Climax');
  txtGeneralSetting.Text := FAdventure.GetTrait('GeneralSetting');
  txtSpecificSetting.Text := FAdventure.GetTrait('SpecificSetting');
  txtMasterVillian.Text := FAdventure.GetTrait('MasterVillian');
  txtLieutenant1.Text := FAdventure.GetTrait('Lieutenant1');
  txtLieutenant2.Text := FAdventure.GetTrait('Lieutenant2');
  txtAllyNeutral.Text := FAdventure.GetTrait('AllyNeutral');
  txtMonsterEncounter.Text := FAdventure.GetTrait('MonsterEncounter');
  txtCharacterEncounter.Text := FAdventure.GetTrait('CharacterEncounter');
  txtDeathTrap.Text := FAdventure.GetTrait('DeathTrap');
  txtChase.Text := FAdventure.GetTrait('Chase');
  txtOmenProphecy.Text := FAdventure.GetTrait('OmenProphecy');
  txtSecretWeakness.Text := FAdventure.GetTrait('SecretWeakness');
  txtSpecialCondition.Text := FAdventure.GetTrait('SpecialCondition');
  txtMoralQuandry.Text := FAdventure.GetTrait('MoralQuandry');
  txtRedHerring.Text := FAdventure.GetTrait('RedHerring');
  txtCruelTrick.Text := FAdventure.GetTrait('CruelTrick');
  txtNotes.Text := FAdventure.GetTrait('Notes');

  if FAdventure.GetTrait('Locked') = 'True' then
  begin
    btnLocked.Down := true;
    LockForm;
  end;
end;

procedure TfrmAdventure.LockForm;
begin

  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtGoal.Enabled := not btnLocked.Down;
  txtStoryHook.Enabled := not btnLocked.Down;
  txtPlot.Enabled := not btnLocked.Down;
  txtClimax.Enabled := not btnLocked.Down;
  txtGeneralSetting.Enabled := not btnLocked.Down;
  txtSpecificSetting.Enabled := not btnLocked.Down;
  txtMasterVillian.Enabled := not btnLocked.Down;
  txtLieutenant1.Enabled := not btnLocked.Down;
  txtLieutenant2.Enabled := not btnLocked.Down;
  txtAllyNeutral.Enabled := not btnLocked.Down;
  txtMonsterEncounter.Enabled := not btnLocked.Down;
  txtCharacterEncounter.Enabled := not btnLocked.Down;
  txtDeathTrap.Enabled := not btnLocked.Down;
  txtChase.Enabled := not btnLocked.Down;
  txtOmenProphecy.Enabled := not btnLocked.Down;
  txtSecretWeakness.Enabled := not btnLocked.Down;
  txtSpecialCondition.Enabled := not btnLocked.Down;
  txtMoralQuandry.Enabled := not btnLocked.Down;
  txtRedHerring.Enabled := not btnLocked.Down;
  txtCruelTrick.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly:= btnLocked.Down;

  FAdventure.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

