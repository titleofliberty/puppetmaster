unit puppetform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, LCLType, Buttons, puppetmasterlib;

type

  { TfrmPuppet }

  TfrmPuppet = class(TForm)
    btnLocked: TSpeedButton;
    btnRollDetails: TButton;
    btnRollName: TButton;
    btnRollPersonality: TButton;
    btnRollStats: TButton;
    Label1: TLabel;
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
    Label2: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlHeader: TPanel;
    txtAbilityRollMethod: TComboBox;
    txtActivity: TComboBox;
    txtAlignment: TComboBox;
    txtArmorClass: TComboBox;
    txtCharisma: TComboBox;
    txtClass: TComboBox;
    txtClothingCondition: TComboBox;
    txtClothingType: TComboBox;
    txtConstitution: TComboBox;
    txtCorruption: TComboBox;
    txtDesire: TComboBox;
    txtDexterity: TComboBox;
    txtDislike: TComboBox;
    txtEconomics: TComboBox;
    txtExpression: TComboBox;
    txtFear: TComboBox;
    txtFirstName: TComboBox;
    txtHPCurrent: TComboBox;
    txtHPMax: TComboBox;
    txtIntelligence: TComboBox;
    txtLastName: TComboBox;
    txtLike: TComboBox;
    txtDistraction: TComboBox;
    txtPersonality: TComboBox;
    txtProfession: TComboBox;
    txtQuirk: TComboBox;
    txtRace: TComboBox;
    txtRelation: TEdit;
    txtSex: TComboBox;
    txtSocialStanding: TComboBox;
    txtStrength: TComboBox;
    txtWisdom: TComboBox;
    procedure btnRollPersonalityClick(Sender: TObject);
    procedure btnRollStatsClick(Sender: TObject);
    procedure btnRollDetailsClick(Sender: TObject);
    procedure btnRollNameClick(Sender: TObject);
    procedure FieldExit(Sender: TObject);
    procedure FieldSelect(Sender: TObject);
    procedure FieldKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FPuppet: TPMLeaf;
    procedure SetPuppet(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Puppet: TPMLeaf read FPuppet write SetPuppet;
  end;

var
  frmPuppet: TfrmPuppet;

implementation

{$R *.lfm}

{ TfrmPuppet }

procedure TfrmPuppet.btnRollNameClick(Sender: TObject);
begin
  txtFirstName.ItemIndex := Random(txtFirstName.Items.Count);
  txtLastName.ItemIndex := Random(txtLastName.Items.Count);
  FPuppet.SetTrait('FirstName', txtFirstName.Text);
  FPuppet.SetTrait('LastName', txtLastName.Text);
end;

procedure TfrmPuppet.FieldExit(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FPuppet.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmPuppet.FieldSelect(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FPuppet.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmPuppet.FieldKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo: TComboBox;
begin
  if Key = VK_RETURN then
  begin
    cbo := TComboBox(Sender);
    FPuppet.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
  end;
end;

procedure TfrmPuppet.SetPuppet(AValue: TPMLeaf);
begin
  if FPuppet = AValue then Exit;
  FPuppet := AValue;
  txtFirstName.Text := FPuppet.GetTrait('FirstName');
  txtLastName.Text := FPuppet.GetTrait('LastName');

  txtSex.Text := FPuppet.GetTrait('Sex');
  txtRace.Text := FPuppet.GetTrait('Race');
  txtClass.Text := FPuppet.GetTrait('Class');
  txtAlignment.Text := FPuppet.GetTrait('Alignment');
  txtCorruption.Text := FPuppet.GetTrait('Corruption');
  txtProfession.Text := FPuppet.GetTrait('Profession');
  txtPersonality.Text := FPuppet.GetTrait('Personality');
  txtEconomics.Text := FPuppet.GetTrait('Economics');
  txtClothingType.Text := FPuppet.GetTrait('ClothingType');
  txtClothingCondition.Text := FPuppet.GetTrait('ClothingCondition');

  txtStrength.Text := FPuppet.GetTrait('Strength');
  txtDexterity.Text := FPuppet.GetTrait('Dexterity');
  txtConstitution.Text := FPuppet.GetTrait('Constitution');
  txtIntelligence.Text := FPuppet.GetTrait('Intelligence');
  txtWisdom.Text := FPuppet.GetTrait('Wisdom');
  txtCharisma.Text := FPuppet.GetTrait('Charisma');
  txtArmorClass.Text := FPuppet.GetTrait('ArmorClass');
  txtHPMax.Text := FPuppet.GetTrait('HPMax');
  txtHPCurrent.Text := FPuppet.GetTrait('HPCurrent');

  txtDesire.Text := FPuppet.GetTrait('Desire');
  txtFear.Text := FPuppet.GetTrait('Fear');
  txtExpression.Text := FPuppet.GetTrait('Expression');
  txtLike.Text := FPuppet.GetTrait('Like');
  txtDislike.Text := FPuppet.GetTrait('Dislike');
  txtQuirk.Text := FPuppet.GetTrait('Quirk');
  txtSocialStanding.Text := FPuppet.GetTrait('SocialStanding');
  txtActivity.Text := FPuppet.GetTrait('Activity');
  txtDistraction.Text := FPuppet.GetTrait('Distraction');
  txtRelation.Text := FPuppet.GetTrait('Relation');

  btnLocked.Down := FPuppet.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmPuppet.LockForm;
begin
  txtFirstName.Enabled := not btnLocked.Down;
  txtLastName.Enabled := not btnLocked.Down;
  txtSex.Enabled := not btnLocked.Down;
  txtRace.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtPersonality.Enabled := not btnLocked.Down;
  txtClothingType.Enabled := not btnLocked.Down;
  txtAlignment.Enabled := not btnLocked.Down;
  txtCorruption.Enabled := not btnLocked.Down;
  txtProfession.Enabled := not btnLocked.Down;
  txtEconomics.Enabled := not btnLocked.Down;
  txtClothingCondition.Enabled := not btnLocked.Down;
  txtStrength.Enabled := not btnLocked.Down;
  txtDexterity.Enabled := not btnLocked.Down;
  txtConstitution.Enabled := not btnLocked.Down;
  txtIntelligence.Enabled := not btnLocked.Down;
  txtWisdom.Enabled := not btnLocked.Down;
  txtCharisma.Enabled := not btnLocked.Down;
  txtArmorClass.Enabled := not btnLocked.Down;
  txtHPMax.Enabled := not btnLocked.Down;
  txtHPCurrent.Enabled := not btnLocked.Down;
  txtDesire.Enabled := not btnLocked.Down;
  txtFear.Enabled := not btnLocked.Down;
  txtExpression.Enabled := not btnLocked.Down;
  txtLike.Enabled := not btnLocked.Down;
  txtDislike.Enabled := not btnLocked.Down;
  txtQuirk.Enabled := not btnLocked.Down;
  txtSocialStanding.Enabled := not btnLocked.Down;
  txtActivity.Enabled := not btnLocked.Down;
  txtDistraction.Enabled := not btnLocked.Down;
  txtRelation.Enabled := not btnLocked.Down;
  txtAbilityRollMethod.Enabled := not btnLocked.Down;

  btnRollName.Enabled := not btnLocked.Down;
  btnRollDetails.Enabled := not btnLocked.Down;
  btnRollStats.Enabled := not btnLocked.Down;
  btnRollPersonality.Enabled := not btnLocked.Down;

  FPuppet.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

procedure TfrmPuppet.btnRollDetailsClick(Sender: TObject);
begin
  txtSex.ItemIndex := Random(txtSex.Items.Count);
  txtRace.ItemIndex := Random(txtRace.Items.Count);
  txtClass.ItemIndex := Random(txtClass.Items.Count);
  txtAlignment.ItemIndex := Random(txtAlignment.Items.Count);
  txtCorruption.ItemIndex := Random(txtCorruption.Items.Count);
  txtProfession.ItemIndex := Random(txtProfession.Items.Count);
  txtPersonality.ItemIndex := Random(txtPersonality.Items.Count);
  txtEconomics.ItemIndex := Random(txtEconomics.Items.Count);
  txtClothingType.ItemIndex := Random(txtClothingType.Items.Count);
  txtClothingCondition.ItemIndex := Random(txtClothingCondition.Items.Count);

  FPuppet.SetTrait('Sex', txtSex.Text);
  FPuppet.SetTrait('Race', txtRace.Text);
  FPuppet.SetTrait('Class', txtClass.Text);
  FPuppet.SetTrait('Alignment', txtAlignment.Text);
  FPuppet.SetTrait('Corruption', txtCorruption.Text);
  FPuppet.SetTrait('Profession', txtProfession.Text);
  FPuppet.SetTrait('Personality', txtPersonality.Text);
  FPuppet.SetTrait('Economics', txtEconomics.Text);
  FPuppet.SetTrait('ClothingType', txtClothingType.Text);
  FPuppet.SetTrait('ClothingCondition', txtClothingCondition.Text);
end;

procedure TfrmPuppet.btnRollStatsClick(Sender: TObject);
var
  i, j : integer;
  standard : TStringList;
  level: TStringList;
  hilo: TStringList;
begin
  if txtAbilityRollMethod.Text = 'Random Roll' then
  begin
    txtStrength.ItemIndex := Random(txtStrength.Items.Count);
    txtDexterity.ItemIndex := Random(txtDexterity.Items.Count);
    txtConstitution.ItemIndex := Random(txtConstitution.Items.Count);
    txtIntelligence.ItemIndex := Random(txtIntelligence.Items.Count);
    txtWisdom.ItemIndex := Random(txtWisdom.Items.Count);
    txtCharisma.ItemIndex := Random(txtCharisma.Items.Count);
  end
  else if txtAbilityRollMethod.Text = 'Standard Array' then
  begin
    standard := TStringList.Create;
    standard.DelimitedText := '+2,+2,+1,+1,0,-1';
    for i := 0 to 5 do
    begin
      j := Random(standard.Count);
      if i = 0 then txtStrength.Text := standard[j];
      if i = 1 then txtDexterity.Text := standard[j];
      if i = 2 then txtConstitution.Text := standard[j];
      if i = 3 then txtIntelligence.Text := standard[j];
      if i = 4 then txtWisdom.Text := standard[j];
      if i = 5 then txtCharisma.Text := standard[j];
      standard.Delete(j);
    end;
  end
  else if txtAbilityRollMethod.Text = 'Level Array' then
  begin
    level := TStringList.Create;
    level.DelimitedText := '+1,+1,+1,+1,+1,+1';
    for i := 0 to 5 do
    begin
      j := Random(level.Count);
      if i = 0 then txtStrength.Text := level[j];
      if i = 1 then txtDexterity.Text := level[j];
      if i = 2 then txtConstitution.Text := level[j];
      if i = 3 then txtIntelligence.Text := level[j];
      if i = 4 then txtWisdom.Text := level[j];
      if i = 5 then txtCharisma.Text := level[j];
      level.Delete(j);
    end;
  end
  else if txtAbilityRollMethod.Text = 'High-Low Array' then
  begin
    hilo := TStringList.Create;
    hilo.DelimitedText := '+2,+2,+2,-1,-1,-1';
    for i := 0 to 5 do
    begin
      j := Random(hilo.Count);
      if i = 0 then txtStrength.Text := hilo[j];
      if i = 1 then txtDexterity.Text := hilo[j];
      if i = 2 then txtConstitution.Text := hilo[j];
      if i = 3 then txtIntelligence.Text := hilo[j];
      if i = 4 then txtWisdom.Text := hilo[j];
      if i = 5 then txtCharisma.Text := hilo[j];
      hilo.Delete(j);
    end;
  end;

  txtArmorClass.ItemIndex := Random(txtArmorClass.Items.Count);
  txtHPMax.ItemIndex := Random(txtHPMax.Items.Count);
  txtHPCurrent.ItemIndex := Random(txtHPCurrent.Items.Count);

  FPuppet.SetTrait('Strength', txtStrength.Text);
  FPuppet.SetTrait('Dexterity', txtDexterity.Text);
  FPuppet.SetTrait('Constitution', txtConstitution.Text);
  FPuppet.SetTrait('Intelligence', txtIntelligence.Text);
  FPuppet.SetTrait('Wisdom', txtWisdom.Text);
  FPuppet.SetTrait('Charisma', txtCharisma.Text);
  FPuppet.SetTrait('ArmorClass', txtArmorClass.Text);
  FPuppet.SetTrait('HPMax', txtHPMax.Text);
  FPuppet.SetTrait('HPCurrent', txtHPCurrent.Text);
end;

procedure TfrmPuppet.btnRollPersonalityClick(Sender: TObject);
begin
  txtDesire.ItemIndex := Random(txtDesire.Items.Count);
  txtFear.ItemIndex := Random(txtFear.Items.Count);
  txtExpression.ItemIndex := Random(txtExpression.Items.Count);
  txtLike.ItemIndex := Random(txtLike.Items.Count);
  txtDislike.ItemIndex := Random(txtDislike.Items.Count);
  txtQuirk.ItemIndex := Random(txtQuirk.Items.Count);
  txtSocialStanding.ItemIndex := Random(txtSocialStanding.Items.Count);
  txtActivity.ItemIndex := Random(txtActivity.Items.Count);
  txtDistraction.ItemIndex := Random(txtDistraction.Items.Count);

  FPuppet.SetTrait('Desire', txtDesire.Text);
  FPuppet.SetTrait('Fear', txtFear.Text);
  FPuppet.SetTrait('Expression', txtExpression.Text);
  FPuppet.SetTrait('Like', txtLike.Text);
  FPuppet.SetTrait('Dislike', txtDislike.Text);
  FPuppet.SetTrait('Quirk', txtQuirk.Text);
  FPuppet.SetTrait('SocialStanding', txtSocialStanding.Text);
  FPuppet.SetTrait('Activity', txtActivity.Text);
  FPuppet.SetTrait('Distraction', txtDistraction.Text);

end;

end.

