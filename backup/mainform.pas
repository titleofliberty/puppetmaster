unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  csvdocument, LCLType, ComCtrls, Buttons, Menus, Grids, TreeFilterEdit,
  puppetmasterlib, htmlcolors;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnClue: TButton;
    btnCondition: TButton;
    btnEvent: TButton;
    btnWares: TButton;
    btnLoot: TButton;
    btnMood: TButton;
    btnEncounter: TButton;
    btnOutputClear: TButton;
    btnEightBall: TButton;
    btnRumor: TButton;
    mnuMainInsertWildernessesRoute: TMenuItem;
    mnuMainInsertWildernessesTract: TMenuItem;
    mnuMainInsertWildernessesWilderness: TMenuItem;
    mnuMainInsertSettlementsSettlement: TMenuItem;
    mnuMainInsertSettlementsVenue: TMenuItem;
    mnuMainInsertSettlementsFloor: TMenuItem;
    mnuMainInsertSettlementsRoom: TMenuItem;
    mnuMainInsertDungeonsDungeon: TMenuItem;
    mnuMainInsertDungeonsLevel: TMenuItem;
    mnuMainInsertDungeonsChamber: TMenuItem;
    mnuMainInsertSettlements: TMenuItem;
    mnuMainInsertWildernesses: TMenuItem;
    mnuMainInsertDungeons: TMenuItem;
    Separator8: TMenuItem;
    mnuMainInsertAdventures: TMenuItem;
    mnuMainToolsCondition: TMenuItem;
    mnuMainRandomRemains: TMenuItem;
    mnuMainRandomVehicle: TMenuItem;
    mnuMainRandomJewelry: TMenuItem;
    mnuMainRandomContainer: TMenuItem;
    mnuMainRandomClothing: TMenuItem;
    mnuMainRandomArmor: TMenuItem;
    mnuMainInsertHumanoid: TMenuItem;
    mnuMainInsertFaction: TMenuItem;
    mnuMainToolsEvent: TMenuItem;
    mnuMainToolsEncounter: TMenuItem;
    mnuMainViewExpand: TMenuItem;
    mnuMainViewCollapse: TMenuItem;
    mnuMainView: TMenuItem;
    mnuMainToolsMood: TMenuItem;
    mnuMainToolsRumor: TMenuItem;
    mnuMainToolsWares: TMenuItem;
    mnuMainToolsClue: TMenuItem;
    mnuMainToolsLoot: TMenuItem;
    mnuMainToolsEight: TMenuItem;
    mnuMainTools: TMenuItem;
    mnuMainRandomTool: TMenuItem;
    mnuMainRandomGem: TMenuItem;
    mnuMainRandomTrap: TMenuItem;
    mnuMainRandomWeapon: TMenuItem;
    mnuMainRandomKit: TMenuItem;
    mnuMainRandomInstrument: TMenuItem;
    mnuMainRandom: TMenuItem;
    Separator7: TMenuItem;
    mnuMainInsertBeast: TMenuItem;
    mnuMainInsertMonster: TMenuItem;
    Separator6: TMenuItem;
    mnuMainInsertPuppet: TMenuItem;
    mnuMainInsertPlayer: TMenuItem;
    mnuMainHelpAbout: TMenuItem;
    mnuMainHelp: TMenuItem;
    mnuMainEditDelete: TMenuItem;
    Separator4: TMenuItem;
    mnuMainEditPaste: TMenuItem;
    mnuMainEditCopy: TMenuItem;
    mnuMainEditCut: TMenuItem;
    mnuMainEdit: TMenuItem;
    mnuMainInsertDiceRoll: TMenuItem;
    pnlWorkspaceClient: TScrollBox;
    Separator2: TMenuItem;
    mnuMainCampaignsSaveAs: TMenuItem;
    mnuMainCampaignsExit: TMenuItem;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    pnlOutputFooter: TPanel;
    pnlOutputData: TPanel;
    Separator1: TMenuItem;
    mnuMainCampaignsOpen: TMenuItem;
    mnuMainCampaignsNew: TMenuItem;
    mnuMainInsert: TMenuItem;
    mnuMainCampaigns: TMenuItem;
    mnuMain: TMainMenu;
    pnlWorkspaceBottomTop: TPanel;
    pnlWorkspaceBottom: TPanel;
    pnlBottom: TPanel;
    pnlWorkspace: TPanel;
    pnlClient: TPanel;
    pnlLeft: TPanel;
    pnlTop: TPanel;
    pnlOutput: TScrollBox;
    sprWorkspace: TSplitter;
    sprMain: TSplitter;
    grdData: TStringGrid;
    tvwCampaign: TTreeView;
    txtFilterCampaign: TTreeFilterEdit;
    procedure btnOutputClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuMainCampaignsExitClick(Sender: TObject);
    procedure mnuMainCampaignsNewClick(Sender: TObject);
    procedure mnuMainCampaignsOpenClick(Sender: TObject);
    procedure mnuMainCampaignsSaveAsClick(Sender: TObject);
    procedure mnuMainEditDeleteClick(Sender: TObject);
    procedure mnuMainHelpAboutClick(Sender: TObject);
    procedure mnuMainInsertAdventuresClick(Sender: TObject);
    procedure mnuMainInsertDungeonsChamberClick(Sender: TObject);
    procedure mnuMainInsertClick(Sender: TObject);
    procedure mnuMainInsertDiceRollClick(Sender: TObject);
    procedure mnuMainInsertDungeonsDungeonClick(Sender: TObject);
    procedure mnuMainInsertFactionClick(Sender: TObject);
    procedure mnuMainInsertFloorClick(Sender: TObject);
    procedure mnuMainInsertDungeonsLevelClick(Sender: TObject);
    procedure mnuMainInsertPlayerClick(Sender: TObject);
    procedure mnuMainInsertPuppetClick(Sender: TObject);
    procedure mnuMainInsertRoomClick(Sender: TObject);
    procedure mnuMainInsertWildernessesRouteClick(Sender: TObject);
    procedure mnuMainInsertSettlementClick(Sender: TObject);
    procedure mnuMainInsertWildernessesTractClick(Sender: TObject);
    procedure mnuMainInsertVenueClick(Sender: TObject);
    procedure mnuMainInsertWildernessesWildernessClick(Sender: TObject);
    procedure mnuMainRandomArmorClick(Sender: TObject);
    procedure mnuMainRandomClothingClick(Sender: TObject);
    procedure mnuMainRandomContainerClick(Sender: TObject);
    procedure mnuMainRandomGemClick(Sender: TObject);
    procedure mnuMainRandomInstrumentClick(Sender: TObject);
    procedure mnuMainRandomJewelryClick(Sender: TObject);
    procedure mnuMainRandomKitClick(Sender: TObject);
    procedure mnuMainRandomRemainsClick(Sender: TObject);
    procedure mnuMainRandomToolClick(Sender: TObject);
    procedure mnuMainRandomTrapClick(Sender: TObject);
    procedure mnuMainRandomVehicleClick(Sender: TObject);
    procedure mnuMainRandomWeaponClick(Sender: TObject);
    procedure mnuMainToolsConditionClick(Sender: TObject);
    procedure mnuMainToolsEightClick(Sender: TObject);
    procedure mnuMainToolsMoodClick(Sender: TObject);
    procedure mnuMainViewCollapseClick(Sender: TObject);
    procedure mnuMainViewExpandClick(Sender: TObject);
    procedure tvwCampaignDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvwCampaignDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvwCampaignMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvwCampaignSelectionChanged(Sender: TObject);
    procedure LeafChange(Sender: TObject);
    procedure DiceClick(Sender: TObject);
  private
    FFileName: string;
    procedure CampaignNew;
    procedure RandomResource(ACaption: string; ANode: TTreeNode; AFontColor, ABackColor: TColor);
    procedure PopulateDiceTray;
    procedure PopulateCampaign;
    procedure RollDice(ADice: TPMLeaf);
    procedure PopulateResourceToCbo(ACbo: TComboBox; AResource: TTreeNode);
    procedure ToggleCampaign(AEnabled: boolean = false);
    procedure LoadResourceNodes(AParent: TTreeNode; ACategory: string; AArray: TStringList); overload;
    procedure LoadResourceNodes(AParent: TTreeNode; ACategory: string; AArray: TCSVDocument); overload;
    procedure SaveCampaign;
    procedure LoadCampaign;
  public

  end;

var
  frmMain: TfrmMain;

  nodeArmors : TTreeNode;
  nodeBeasts : TTreeNode;
  nodeCampaign : TTreeNode;
  nodeClothing : TTreeNode;
  nodeConsumables : TTreeNode;
  nodeContainers : TTreeNode;
  nodeDiceTray : TTreeNode;
  nodeDungeons : TTreeNode;
  nodeFauna : TTreeNode;
  nodeFlora : TTreeNode;
  nodeGems : TTreeNode;
  nodeHumanoids : TTreeNode;
  nodeInstruments: TTreeNode;
  nodeJewelry : TTreeNode;
  nodeKits : TTreeNode;
  nodeMonsters : TTreeNode;
  nodeNatural : TTreeNode;
  nodeRemains : TTreeNode;
  nodeResources : TTreeNode;
  nodeSettlements : TTreeNode;
  nodeSpells: TTreeNode;
  nodeTools : TTreeNode;
  nodeTraps : TTreeNode;
  nodeUnnatural : TTreeNode;
  nodeVehicle : TTreeNode;
  nodeWeapons : TTreeNode;
  nodeWildernesses : TTreeNode;
  nodeConditions : TTreeNode;
  nodeAdventures : TTreeNode;


implementation

{$R *.lfm}

uses
  puppetform, diceform, playerform, aboutform, chambertractroomform,
  titleclassnotesform, simpleform, beastmonsterform, adventureform,
  dicerollform;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i : integer;
  msg: TCardMessage;
  tbl: TCardTable;
  lbl: TLabel;
begin
  Randomize;

  TPMBasicDice := TCSVDocument.Create;
  TPMBeasts := TCSVDocument.Create;
  TPMMonsters := TCSVDocument.Create;
  TPMHumanoids := TCSVDocument.Create;
  TPMConsumables := TCSVDocument.Create;
  TPMSpells := TCSVDocument.Create;

  TPMNamesLast := TStringList.Create;
  TPMNamesFirst := TStringList.Create;
  TPMSettlementEvents := TStringList.Create;
  TPMWildernessEvents := TStringList.Create;
  TPMVerbs := TStringList.Create;
  TPMRumor := TStringList.Create;
  TPMKits := TStringList.Create;
  TPMTools := TStringList.Create;
  TPMClothing := TStringList.Create;
  TPMContainers := TStringList.Create;
  TPMWeapons := TStringList.Create;
  TPMVehicle := TStringList.Create;
  TPMJewelry := TStringList.Create;
  TPMRemains := TStringList.Create;
  TPMInstruments := TStringList.Create;
  TPMArmors := TStringList.Create;
  TPMTraps := TStringList.Create;
  TPMMounts := TStringList.Create;
  TPMGems := TStringList.Create;
  TPMNatural := TStringList.Create;
  TPMUnnatural := TStringList.Create;
  TPMFlora := TStringList.Create;
  TPMFauna := TStringList.Create;
  TPMConditions := TStringList.Create;

  TPMChamberClasses := TStringList.Create;
  TPMTractClasses := TStringList.Create;
  TPMRoomClasses := TStringList.Create;
  TPMDungeonClasses := TStringList.Create;
  TPMLevelClasses := TStringList.Create;
  TPMWildernessClasses := TStringList.Create;
  TPMRouteClasses := TStringList.Create;
  TPMSettlementClasses := TStringList.Create;
  TPMVenueClasses := TStringList.Create;
  TPMFloorClasses := TStringList.Create;
  TPMConsumableClasses := TStringList.Create;
  TPMBeastClasses := TStringList.Create;
  TPMMonsterClasses := TStringList.Create;
  TPMHumanoidClasses := TStringList.Create;

  TPMAdventureThemes := TStringList.Create;
  TPMAdventureGoals := TStringList.Create;
  TPMAdventureStoryHooks := TStringList.Create;
  TPMAdventureSettingGenerals := TStringList.Create;
  TPMAdventureSettingSpecifics := TStringList.Create;
  TPMAdventureStartPoints := TStringList.Create;
  TPMAdventureBosses := TStringList.Create;
  TPMAdventureLieutenants := TStringList.Create;
  TPMAdventureAllyNeutral := TStringList.Create;
  TPMAdventurePlots := TStringList.Create;
  TPMAdventureClimaxes := TStringList.Create;
  TPMAdventureMonsterEncounters := TStringList.Create;
  TPMAdventureCharacterEncounters := TStringList.Create;
  TPMAdventureDeathTraps := TStringList.Create;
  TPMAdventureChases := TStringList.Create;
  TPMAdventureOmenProphecys := TStringList.Create;
  TPMAdventureSecretWeaknesses := TStringList.Create;
  TPMAdventureSpecialConditions := TStringList.Create;
  TPMAdventureMoralQuandrys := TStringList.Create;
  TPMAdventureRedHerrings := TStringList.Create;
  TPMAdventureCruelTricks := TStringList.Create;

  TPMBasicDice.LoadFromFile('resources\dice-basic.csv');
  TPMBeasts.LoadFromFile('resources\beasts.csv');
  TPMMonsters.LoadFromFile('resources\monsters.csv');
  TPMHumanoids.LoadFromFile('resources\humanoids.csv');
  TPMConsumables.LoadFromFile('resources\consumables.csv');
  TPMSpells.LoadFromFile('resources\spells.csv');

  TPMNamesLast.LoadFromFile('resources\names-last.txt');
  TPMNamesFirst.LoadFromFile('resources\names-first.txt');
  TPMSettlementEvents.LoadFromFile('resources\events-settlements.txt');
  TPMWildernessEvents.LoadFromFile('resources\events-wildernesses.txt');
  TPMVerbs.LoadFromFile('resources\verbs.txt');
  TPMRumor.LoadFromFile('resources\traits-rumors.txt');
  TPMKits.LoadFromFile('resources\traits-kits.txt');
  TPMTools.LoadFromFile('resources\traits-tools.txt');
  TPMClothing.LoadFromFile('resources\traits-clothings.txt');
  TPMContainers.LoadFromFile('resources\traits-containers.txt');
  TPMWeapons.LoadFromFile('resources\traits-weapons.txt');
  TPMVehicle.LoadFromFile('resources\traits-vehicles.txt');
  TPMJewelry.LoadFromFile('resources\traits-jewelrys.txt');
  TPMRemains.LoadFromFile('resources\traits-remains.txt');
  TPMInstruments.LoadFromFile('resources\traits-instruments.txt');
  TPMArmors.LoadFromFile('resources\traits-armors.txt');
  TPMTraps.LoadFromFile('resources\traits-traps.txt');
  TPMMounts.LoadFromFile('resources\traits-mounts.txt');
  TPMGems.LoadFromFile('resources\traits-gems.txt');
  TPMNatural.LoadFromFile('resources\traits-naturals.txt');
  TPMUnnatural.LoadFromFile('resources\traits-unnaturals.txt');
  TPMFlora.LoadFromFile('resources\traits-floras.txt');
  TPMFauna.LoadFromFile('resources\traits-faunas.txt');
  TPMConditions.LoadFromFile('resources\traits-conditions.txt');

  TPMChamberClasses.LoadFromFile('resources\classes-chambers.txt');
  TPMTractClasses.LoadFromFile('resources\classes-tracts.txt');
  TPMRoomClasses.LoadFromFile('resources\classes-rooms.txt');
  TPMDungeonClasses.LoadFromFile('resources\classes-dungeons.txt');
  TPMLevelClasses.LoadFromFile('resources\classes-levels.txt');
  TPMWildernessClasses.LoadFromFile('resources\classes-wildernesses.txt');
  TPMRouteClasses.LoadFromFile('resources\classes-routes.txt');
  TPMSettlementClasses.LoadFromFile('resources\classes-settlements.txt');
  TPMVenueClasses.LoadFromFile('resources\classes-venues.txt');
  TPMFloorClasses.LoadFromFile('resources\classes-floors.txt');
  TPMConsumableClasses.LoadFromFile('resources\classes-consumables.txt');

  TPMBeastClasses.LoadFromFile('resources\classes-beasts.txt');
  TPMMonsterClasses.LoadFromFile('resources\classes-monsters.txt');
  TPMHumanoidClasses.LoadFromFile('resources\classes-humanoids.txt');

  TPMAdventureThemes.LoadFromFile('resources\adventure-themes.txt');
  TPMAdventureGoals.LoadFromFile('resources\adventure-goals.txt');
  TPMAdventureStoryHooks.LoadFromFile('resources\adventure-story-hooks.txt');
  TPMAdventureSettingGenerals.LoadFromFile('resources\adventure-settings-general.txt');
  TPMAdventureSettingSpecifics.LoadFromFile('resources\adventure-settings-specific.txt');
  TPMAdventureStartPoints.LoadFromFile('resources\adventure-start-points.txt');
  TPMAdventureBosses.LoadFromFile('resources\adventure-bosses.txt');
  TPMAdventureLieutenants.LoadFromFile('resources\adventure-lieutenants.txt');
  TPMAdventureAllyNeutral.LoadFromFile('resources\adventure-allys-neutrals.txt');
  TPMAdventurePlots.LoadFromFile('resources\adventure-plots.txt');
  TPMAdventureClimaxes.LoadFromFile('resources\adventure-climaxes.txt');
  TPMAdventureMonsterEncounters.LoadFromFile('resources\adventure-monster-encounters.txt');
  TPMAdventureCharacterEncounters.LoadFromFile('resources\adventure-character-encounters.txt');
  TPMAdventureDeathTraps.LoadFromFile('resources\adventure-death-traps.txt');
  TPMAdventureChases.LoadFromFile('resources\adventure-chases.txt');
  TPMAdventureOmenProphecys.LoadFromFile('resources\adventure-omen-prophecys.txt');
  TPMAdventureSecretWeaknesses.LoadFromFile('resources\adventure-secret-weaknesses.txt');
  TPMAdventureSpecialConditions.LoadFromFile('resources\adventure-special-conditions.txt');
  TPMAdventureMoralQuandrys.LoadFromFile('resources\adventure-moral-quandrys.txt');
  TPMAdventureRedHerrings.LoadFromFile('resources\adventure-red-herrings.txt');
  TPMAdventureCruelTricks.LoadFromFile('resources\adventure-cruel-tricks.txt');

  CampaignNew;

  msg := TCardMessage.Create(pnlOutputData);
  msg.Parent := pnlOutputData;
  msg.Show;
  msg.Title.Caption := 'Roll Dice';
  msg.Message.Caption := '3d6+3: (4 + 2 + 1) = 7 + 3 = 10';
  msg.Color:= $F1D6AE;
  msg.Font.Color := $724F1B;

  tbl := TCardTable.Create(pnlOutputData);
  tbl.Parent := pnlOutputData;
  tbl.Show;
  tbl.Title.Caption := 'Table Card';
  tbl.Table.ChildSizing.ControlsPerLine := 4;
  tbl.Color:= $EFDAE8;
  tbl.Font.Color := $6F2C5B;
  for i := 0 to 11 do
  begin
    lbl := TLabel.Create(tbl.Table);
    lbl.Parent := tbl.Table;
    lbl.Caption := Format('Lable %d', [i]);
  end;

  FFileName := 'C:\Users\Marion Smith\Desktop\demo.txt';

  //ToggleCampaign(false);
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i : integer;
  frm: TfrmRollDice;
  leaf, leaf2: TPMLeaf;
begin
  if (Key >= VK_F1) and (Key <= VK_F12) then
  begin
    case Key of
      VK_F1: i := 0;
      VK_F2: i := 1;
      VK_F3: i := 2;
      VK_F4: i := 3;
      VK_F5: i := 4;
      VK_F6: i := 5;
      VK_F7: i := 6;
      VK_F8: i := 7;
      VK_F9: i := 8;
      VK_F10: i := 9;
      VK_F11: i := 10;
      VK_F12: i := 11;
    end;

    if i > nodeDiceTray.Count - 1 then exit;

    leaf := TPMLeaf(nodeDiceTray.Items[i].Data);
    if leaf.GetTrait('Count') = '0' then
    begin
      leaf2 := TPMLeaf.Create('Dice');
      frm := TfrmRollDice.Create(Self);
      leaf2.SetTrait('Count', '1');
      leaf2.SetTrait('Die', leaf.GetTrait('Die'));
      leaf2.SetTrait('Modifier', leaf.GetTrait('Modifier'));
      frm.Dice := leaf2;
      if frm.ShowModal = mrOk then
        RollDice(frm.Dice);
    end
    else
      RollDice(leaf);
  end
  else if (Key = 33) then
    pnlOutput.VertScrollBar.Position := pnlOutput.VertScrollBar.Position - 100
  else if (Key = 34) then
    pnlOutput.VertScrollBar.Position := pnlOutput.VertScrollBar.Position + 100;
end;

procedure TfrmMain.btnOutputClearClick(Sender: TObject);
begin
  while pnlOutputData.ComponentCount > 0 do
    pnlOutputData.Components[0].Free;
end;

procedure TfrmMain.mnuMainCampaignsExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.mnuMainCampaignsNewClick(Sender: TObject);
begin
  if dlgSave.Execute then
  begin
    FFileName := dlgSave.FileName;
    SaveCampaign;
    CampaignNew;
    ToggleCampaign(true);
  end;
end;

procedure TfrmMain.mnuMainCampaignsOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    FFileName := dlgOpen.FileName;
    LoadCampaign;
    PopulateCampaign;
    ToggleCampaign(true);
  end;
end;

procedure TfrmMain.mnuMainCampaignsSaveAsClick(Sender: TObject);
begin
  if dlgSave.Execute then
  begin
    FFileName := dlgSave.FileName;
    SaveCampaign;
  end;
end;

procedure TfrmMain.mnuMainEditDeleteClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  node := tvwCampaign.Selected;
  leaf := TPMLeaf(node.Data);
  if node.Level > 1 then
    if MessageDlg('Delete Item', 'Do you want to delete ' + node.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      node.Delete;
      SaveCampaign;
    end;
end;

procedure TfrmMain.mnuMainHelpAboutClick(Sender: TObject);
var
  frm : TfrmAbout;
begin
  frm := TfrmAbout.Create(Self);
  frm.ShowModal;
end;

procedure TfrmMain.mnuMainInsertAdventuresClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Adventure');
  leaf.OnChange := @LeafChange;
  node := tvwCampaign.Items.AddChildObject(nodeAdventures, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertDungeonsChamberClick(Sender: TObject);
var
  i : integer;
  node: TTreeNode;
  leaf, slct: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Chamber');
  leaf.OnChange := @LeafChange;
  slct := TPMLeaf(tvwCampaign.Selected.Data);
  if (slct.Category = 'Level') then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if (slct.Category = 'Chamber') then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertClick(Sender: TObject);
var
  leaf: TPMLeaf;
begin

  if Assigned(tvwCampaign.Selected) then
    leaf := TPMLeaf(tvwCampaign.Selected.Data);

  mnuMainInsertDungeonsLevel.Enabled := (leaf.Category = 'Dungeon') or (leaf.Category = 'Level') or (leaf.Category = 'Chamber') or (leaf.Category = 'Factions') or (leaf.Category = 'Faction');
  mnuMainInsertDungeonsChamber.Enabled := (leaf.Category = 'Level') or (leaf.Category = 'Chamber');

  mnuMainInsertWildernessesRoute.Enabled := (leaf.Category = 'Wilderness') or (leaf.Category = 'Route') or (leaf.Category = 'Tract');
  mnuMainInsertWildernessesTract.Enabled := (leaf.Category = 'Route') or (leaf.Category = 'Tract');

  mnuMainInsertSettlementsVenue.Enabled := (leaf.Category = 'Settlement') or (leaf.Category = 'Venue');
  mnuMainInsertSettlementsFloor.Enabled := (leaf.Category = 'Floor') or (leaf.Category = 'Venue');
  mnuMainInsertSettlementsRoom.Enabled := (leaf.Category = 'Floor') or (leaf.Category = 'Room');

  mnuMainInsertFaction.Enabled := (leaf.Category = 'Dungeon') or (leaf.Category = 'Wilderness') or (leaf.Category = 'Settlement') or (leaf.Category = 'Faction');
  mnuMainInsertMonster.Enabled := (leaf.Category = 'Room') or (leaf.Category = 'Chamber') or (leaf.Category = 'Tract') or (leaf.Category = 'Puppet') or (leaf.Category = 'Player');
  mnuMainInsertBeast.Enabled := (leaf.Category = 'Room') or (leaf.Category = 'Chamber') or (leaf.Category = 'Tract') or (leaf.Category = 'Puppet') or (leaf.Category = 'Player');
  mnuMainInsertPuppet.Enabled := (leaf.Category = 'Room') or (leaf.Category = 'Chamber') or (leaf.Category = 'Tract') or (leaf.Category = 'Puppet') or (leaf.Category = 'Player');
  mnuMainInsertPlayer.Enabled := (leaf.Category = 'Room') or (leaf.Category = 'Chamber') or (leaf.Category = 'Tract') or (leaf.Category = 'Puppet') or (leaf.Category = 'Player');

end;

procedure TfrmMain.mnuMainInsertDiceRollClick(Sender: TObject);
var
  node: TTreeNode;
  leaf : TPMLeaf;
begin
  leaf := TPMLeaf.Create('Dice');
  leaf.OnChange := @LeafChange;
  node := tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.GetTrait('Title'), leaf);
  node.Selected := true;
  PopulateDiceTray;
  //SaveCampaign(FFileName);
end;

procedure TfrmMain.mnuMainInsertDungeonsDungeonClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Dungeon');
  leaf.OnChange := @LeafChange;
  node := tvwCampaign.Items.AddChildObject(nodeDungeons, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertFactionClick(Sender: TObject);
var
  leaf, slct : TPMLeaf;
  node : TTreeNode;
begin
  slct := TPMLeaf(tvwCampaign.Selected.Data);
  leaf := TPMLeaf.Create('Faction');
  leaf.OnChange := @LeafChange;
  if (slct.Category = 'Dungeon') or (slct.Category = 'Tract') or (slct.Category = 'Room') then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertFloorClick(Sender: TObject);
var
  leaf, slct: TPMLeaf;
  node: TTreeNode;
begin
  if not Assigned(tvwCampaign.Selected) then exit;
  slct := TPMLeaf(tvwCampaign.Selected.Data);
  leaf := TPMLeaf.Create('Floor');
  leaf.OnChange := @LeafChange;
  if slct.Category = 'Venue' then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if slct.Category = 'Floor' then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected.Parent, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertDungeonsLevelClick(Sender: TObject);
var
  leaf, slct: TPMLeaf;
  node: TTreeNode;
begin
  if not Assigned(tvwCampaign.Selected) then exit;
  leaf := TPMLeaf.Create('Level');
  slct := TPMLeaf(tvwCampaign.Selected.Data);

  if slct.Category = 'Dungeon' then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if slct.Category = 'Level' then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if slct.Category = 'Chamber' then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected.Parent, leaf.Title, leaf);

  leaf.OnChange := @LeafChange;
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertPlayerClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Player');
  leaf.OnChange := @LeafChange;
  if (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Room') or (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Chamber') or (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Tract') then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Puppet') or (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Player') then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected, leaf.Title, leaf);

  if Assigned(node) then
    node.Selected := true;

  SaveCampaign;
end;

procedure TfrmMain.mnuMainInsertPuppetClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Puppet');
  leaf.OnChange := @LeafChange;
  if (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Chamber') or (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Tract') or (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Room') then
    node := tvwCampaign.items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Puppet') or (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Player') then
    node := tvwCampaign.items.AddObject(tvwCampaign.Selected, leaf.Title, leaf)
  else
    Exit;
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertRoomClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Room');
  leaf.OnChange := @LeafChange;
  if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Floor' then
    node := tvwCampaign.items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Room' then
    node := tvwCampaign.items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else
    Exit;
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertWildernessesRouteClick(Sender: TObject);
var
  leaf, slct: TPMLeaf;
  node : TTreeNode;
begin
  if not Assigned(tvwCampaign.Selected) then exit;
  slct := TPMLeaf(tvwCampaign.Selected.Data);
  leaf := TPMLeaf.Create('Route');
  leaf.OnChange := @LeafChange;
  if (slct.Category = 'Wilderness') then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if (slct.Category = 'Route') then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if (slct.Category = 'Tract') then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected.Parent, leaf.Title, leaf);

  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertSettlementClick(Sender: TObject);
var
  node : TTreeNode;
  leaf : TPMLeaf;
begin
  leaf := TPMLeaf.Create('Settlement');
  leaf.Traits.AddOrSetData('Name', 'Untitled');
  leaf.OnChange := @LeafChange;
  node := tvwCampaign.Items.AddChildObject(nodeSettlements, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertWildernessesTractClick(Sender: TObject);
var
  i: integer;
  node: TTreeNode;
  leaf, selected, tracts: TPMLeaf;
begin
  if not Assigned(tvwCampaign.Selected) then exit;
  leaf := TPMLeaf.Create('Tract');
  leaf.OnChange := @LeafChange;
  selected := TPMLeaf(tvwCampaign.Selected.Data);
  if (selected.Category = 'Route') then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if (selected.Category = 'Tract') then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertVenueClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Venue');
  leaf.OnChange := @LeafChange;
  if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Settlement' then
    node := tvwCampaign.items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Venue' then
    node := tvwCampaign.items.AddObject(tvwCampaign.Selected, leaf.Title, leaf);

  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertWildernessesWildernessClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Wilderness');
  leaf.OnChange := @LeafChange;
  node := tvwCampaign.Items.AddChildObject(nodeWildernesses, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainRandomArmorClick(Sender: TObject);
begin
  RandomResource('Armor', nodeArmors, htmlcolors.clHTMLBlack, $F4F4F2);
end;

procedure TfrmMain.mnuMainRandomClothingClick(Sender: TObject);
begin
  RandomResource('Clothing', nodeClothing, htmlcolors.clHTMLMediumPurple, $EFDAE8);
end;

procedure TfrmMain.mnuMainRandomContainerClick(Sender: TObject);
begin
  RandomResource('Container', nodeContainers, htmlcolors.clHTMLBrown, $E6EEFB);
end;

procedure TfrmMain.mnuMainRandomGemClick(Sender: TObject);
begin
  RandomResource('Gem', nodeGems, $1C247B, $D5D7F2);
end;

procedure TfrmMain.mnuMainRandomInstrumentClick(Sender: TObject);
begin
  RandomResource('Instrument', nodeInstruments, $0C649C, $9FE7F9);
end;

procedure TfrmMain.mnuMainRandomJewelryClick(Sender: TObject);
begin
  RandomResource('Jewelry', nodeJewelry, $0C649C, $9FE7F9);
end;

procedure TfrmMain.mnuMainRandomKitClick(Sender: TObject);
begin
  RandomResource('Kit', nodeKits, $003687, $7AB2F0);
end;

procedure TfrmMain.mnuMainRandomRemainsClick(Sender: TObject);
begin
  RandomResource('Remains', nodeRemains, $2B39C0, $EAEBF9);
end;

procedure TfrmMain.mnuMainRandomToolClick(Sender: TObject);
begin
  RandomResource('Tool', nodeTools, $0054D3, $A7CBF5);
end;

procedure TfrmMain.mnuMainRandomTrapClick(Sender: TObject);
begin
  RandomResource('Trap', nodeTraps, $8A4476, $EFDAE8);
end;

procedure TfrmMain.mnuMainRandomVehicleClick(Sender: TObject);
begin
  RandomResource('Vehicle', nodeVehicle, $5A234A, $DEB4D2);
end;

procedure TfrmMain.mnuMainRandomWeaponClick(Sender: TObject);
begin
  RandomResource('Weapon', nodeWeapons, $503E2C, $BFB6AE);
end;

procedure TfrmMain.mnuMainToolsConditionClick(Sender: TObject);
var
  i: integer;
  msg: TCardMessage;
begin
  i := Random(nodeConditions.Count);

  msg := TCardMessage.Create(pnlOutputData);
  msg.Parent := pnlOutputData;
  msg.Color := $99BBED;
  msg.Font.Color := $002C6E;
  msg.Title.Caption := 'Condtion';
  msg.Message.Caption := nodeConditions.Items[i].Text;

end;

procedure TfrmMain.mnuMainToolsEightClick(Sender: TObject);
var
  i: integer;
  msg: TCardMessage;
begin
  i := Random(4);

  msg := TCardMessage.Create(pnlOutputData);
  msg.Parent := pnlOutputData;
  msg.Title.Caption := 'Eight Ball';
  msg.Align := alTop;
  msg.Color := $DCD8D5;
  msg.Font.Color := $463727;

  if i = 0 then
    msg.Message.Caption := 'No'
  else if i = 1 then
    msg.Message.Caption := 'Maybe'
  else
    msg.Message.Caption := 'Yes';
end;

procedure TfrmMain.mnuMainToolsMoodClick(Sender: TObject);
var
  i : integer;
  moods: TStringList;
  msg : TCardMessage;
begin

  moods := TStringList.Create;
  moods.Sorted := true;
  moods.Add('Angry');
  moods.Add('Anxious');
  moods.Add('Ashamed');
  moods.Add('Bored');
  moods.Add('Content');
  moods.Add('Curious');
  moods.Add('Depressed');
  moods.Add('Determined');
  moods.Add('Disappointed');
  moods.Add('Disgusted');
  moods.Add('Eager');
  moods.Add('Embarrassed');
  moods.Add('Enthusiastic');
  moods.Add('Envious');
  moods.Add('Excited');
  moods.Add('Frustrated');
  moods.Add('Gloomy');
  moods.Add('Guilty');
  moods.Add('Happy');
  moods.Add('Hopeful');
  moods.Add('Hostility');
  moods.Add('Indifferent');
  moods.Add('Interested');
  moods.Add('Jealous');
  moods.Add('Lonely');
  moods.Add('Neutral');
  moods.Add('Optimistic');
  moods.Add('Positive');
  moods.Add('Remorseful');
  moods.Add('Sad');
  moods.Add('Uneasy');
  moods.Add('Uninterested');
  moods.Add('Worried');

  i := Random(moods.Count);
  msg := TCardMessage.Create(pnlOutputData);
  msg.Parent := pnlOutputData;
  msg.Color := $E7ECD0;
  msg.Font.Color := $325A14;
  msg.Title.Caption := 'Mood';
  msg.Message.Caption := moods.Strings[i];

end;

procedure TfrmMain.mnuMainViewCollapseClick(Sender: TObject);
begin
  tvwCampaign.FullCollapse;
end;

procedure TfrmMain.mnuMainViewExpandClick(Sender: TObject);
begin
  tvwCampaign.FullExpand;
end;

procedure TfrmMain.tvwCampaignDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  tree : TTreeView;
  node : TTreeNode;
  leaf1, leaf2: TPMLeaf;
begin
  tree := TTreeView(Sender);
  node := tree.GetNodeAt(x,y);

  if Assigned(tree.Selected) and (node <> tree.Selected) then
  begin
    if node = nil then exit;

    leaf1 := TPMLeaf(node.data);
    leaf2 := TPMLeaf(tree.Selected.data);

    if (leaf2.Category = 'Dungeon') then
    begin
      if (leaf1.Category = 'Dungeons') or (leaf1.Category = 'Dungeon') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Level') then
    begin
      if (leaf1.Category = 'Dungeon') or (leaf1.Category = 'Level') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Chamber') then
    begin
      if (leaf1.Category = 'Chamber') or (leaf1.Category = 'Chambers') or (leaf1.Category = 'Dungeon') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Wilderness') then
    begin
      if (leaf1.Category = 'Wilderness') or (leaf1.Category = 'Wildernesses') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Tract') then
    begin
      if (leaf1.Category = 'Tract') or (leaf1.Category = 'Wilderness') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Settlement') then
    begin
      if (leaf1.Category = 'Settlement') or (leaf1.Category = 'Settlements') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Venue') then
    begin
      if (leaf1.Category = 'Venue') or (leaf1.Category = 'Settlement') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Room') then
    begin
      if (leaf1.Category = 'Room') or (leaf1.Category = 'Venue') then
        tree.Selected.MoveTo(node, naAddChildFirst);
    end
    else if (leaf2.Category = 'Puppet') or (leaf2.Category = 'Player') then
    begin
      if (leaf1.Category = 'Chamber') or (leaf1.Category = 'Tract') or (leaf1.Category = 'Room') then
        tree.Selected.MoveTo(node, naAddChildFirst)
      else if (leaf1.Category = 'Puppet') or (leaf1.Category = 'Player') then
        tree.Selected.MoveTo(node, naInsertBehind);
    end
    else if (leaf2.Category = 'Dice') then
    begin
      if (leaf1.Category = 'Dice') then
        tree.Selected.MoveTo(node, naInsertBehind)
      else if (leaf1.Category = 'DiceTray') then
        tree.Selected.MoveTo(node, naAddChildFirst);
      PopulateDiceTray;
    end;
  end;

  SaveCampaign;
end;

procedure TfrmMain.tvwCampaignDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  tree : TTreeView;
  node : TTreeNode;
  leaf1, leaf2 : TPMLeaf;
begin
  tree  := TTreeView(Sender);
  node  := tree.GetNodeAt(x,y);

  if not Assigned(node) then exit;

  leaf1 := TPMLeaf(node.Data);

  if Assigned(tree.Selected) and (node <> tree.Selected) then
  begin
    leaf2 := TPMLeaf(tree.Selected.Data);
    if (leaf2.Category = 'Dungeon') and ((leaf1.Category = 'Dungeons') or (leaf1.Category = 'Dungeon')) then
      Accept := true
    else if (leaf2.Category = 'Level') and ((leaf1.Category = 'Dungeon') or (leaf1.Category = 'Level')) then
      Accept := true
    else if (leaf2.Category = 'Chamber') and ((leaf1.Category = 'Level') or (leaf1.Category = 'Chambers') or (leaf1.Category = 'Dungeon')) then
      Accept := true
    else if (leaf2.Category = 'Wilderness') and ((leaf1.Category = 'Wilderness') or (leaf1.Category = 'Wildernesses')) then
      Accept := true
    else if (leaf2.Category = 'Tract') and ((leaf1.Category = 'Route') or (leaf1.Category = 'Tract')) then
      Accept := true
    else if (leaf2.Category = 'Settlement') and ((leaf1.Category = 'Settlement') or (leaf1.Category = 'Settlements')) then
      Accept := true
    else if (leaf2.Category = 'Venue') and ((leaf1.Category = 'Settlement') or (leaf1.Category = 'Venue')) then
      Accept := true
    else if (leaf2.Category = 'Room') and ((leaf1.Category = 'Venue') or (leaf1.Category = 'Room')) then
      Accept := true
    else if (leaf2.Category = 'Puppet') or (leaf2.Category = 'Player') then
    begin
      if (leaf1.Category = 'Chamber') or
         (leaf1.Category = 'Tract') or
         (leaf1.Category = 'Room') or
         (leaf1.Category = 'Puppet') or
         (leaf1.Category = 'Player') then
        Accept := true;
    end
    else if (leaf2.Category = 'Beast') and ((leaf1.Category = 'Chamber') or (leaf1.Category = 'Tract') or (leaf1.Category = 'Room')) then
      Accept := true
    else if (leaf2.Category = 'Monster') and ((leaf1.Category = 'Chamber') or (leaf1.Category = 'Tract') or (leaf1.Category = 'Room')) then
      Accept := true
    else if (leaf2.Category = 'Dice') and ((leaf1.Category = 'Dice') or (leaf1.Category = 'DiceTray')) then
      Accept := true
    else
      Accept := false;
  end;
end;

procedure TfrmMain.tvwCampaignMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    tvwCampaign.BeginDrag(true);
end;

procedure TfrmMain.tvwCampaignSelectionChanged(Sender: TObject);
var
  form : TForm;
  leaf : TPMLeaf;
begin

  if not Assigned(tvwCampaign.Selected) then exit;

  leaf := TPMLeaf(tvwCampaign.Selected.Data);

  while pnlWorkspaceClient.ComponentCount > 0 do
    pnlWorkspaceClient.Components[0].Free;

  if (leaf.Category = 'Chamber') or
     (leaf.Category = 'Tract') or
     (leaf.Category = 'Room') then
  begin
    Screen.Cursor := crHourGlass;
    form := TfrmChamberTractRoom.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmChamberTractRoom(form).Leaf := leaf;
    form.Show;
    Screen.Cursor := crDefault;
  end
  else if (leaf.Category = 'Puppet') then
  begin
    form := TfrmPuppet.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmPuppet(form).Puppet := leaf;
    form.Show;
  end
  else if (leaf.Category = 'Player') then
  begin
    form := TfrmPlayer.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmPlayer(form).Player := leaf;
    form.Show;
  end
  else if (leaf.Category = 'Dice') then
  begin
    form := TfrmDice.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmDice(form).Dice := leaf;
    form.Show;
  end
  else if (leaf.Category = 'Adventure') then
  begin
    form := TfrmAdventure.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmAdventure(form).Adventure := leaf;
    form.Show;
  end
  else if (leaf.Category = 'Beast') or
       (leaf.Category = 'Monster') or
       (leaf.Category = 'Humanoid')
  then
  begin
    form := TfrmBeastMonster.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmBeastMonster(form).Leaf := leaf;
    form.Show;
  end
  else if (leaf.Category = 'Dungeon') or
       (leaf.Category = 'Level') or
       (leaf.Category = 'Wilderness') or
       (leaf.Category = 'Route') or
       (leaf.Category = 'Settlement') or
       (leaf.Category = 'Venue') or
       (leaf.Category = 'Floor') or
       (leaf.Category = 'Consumable')
  then
  begin
    form := TfrmTitleClassNotes.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmTitleClassNotes(form).Leaf := leaf;
    form.Show;
  end
  else if
    (leaf.Category = 'Armor') or
    (leaf.Category = 'Clothing') or
    (leaf.Category = 'Condition') or
    (leaf.Category = 'Container') or
    (leaf.Category = 'Fauna') or
    (leaf.Category = 'Flora') or
    (leaf.Category = 'Gem') or
    (leaf.Category = 'Instrument') or
    (leaf.Category = 'Jewelry') or
    (leaf.Category = 'Kit') or
    (leaf.Category = 'Natural') or
    (leaf.Category = 'Remains') or
    (leaf.Category = 'Tool') or
    (leaf.Category = 'Trap') or
    (leaf.Category = 'Unnatural') or
    (leaf.Category = 'Vehicle') or
    (leaf.Category = 'Weapon') or
    (leaf.Category = 'Spell')
  then
  begin
    form := TfrmSimple.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmSimple(form).Leaf := leaf;
    form.Show;
  end;
end;

procedure TfrmMain.LeafChange(Sender: TObject);
begin
  tvwCampaign.Selected.Text := TPMLeaf(Sender).Title;

  if TPMLeaf(Sender).Category = 'Dice' then PopulateDiceTray;

  SaveCampaign;
end;

procedure TfrmMain.DiceClick(Sender: TObject);
var
  btn : TButton;
  leaf: TPMLeaf;
  node: TTreeNode;
begin
  btn := TButton(Sender);
  node := nodeDiceTray.Items[btn.Tag];
  leaf := TPMLeaf(node.Data);

  RollDice(leaf);
end;

procedure TfrmMain.CampaignNew;
var
  i : integer;
  leaf: TPMLeaf;
begin
  tvwCampaign.Items.Clear;

  nodeCampaign := tvwCampaign.Items.AddObject(nil, 'Campaign', TPMLeaf.Create('Campaign'));
  nodeAdventures := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Adventures', TPMLeaf.Create('Adventures'));
  nodeDungeons := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Dungeons', TPMLeaf.Create('Dungeons'));
  nodeWildernesses := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Wildernesses', TPMLeaf.Create('Wildernesses'));
  nodeSettlements := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Settlements', TPMLeaf.Create('Settlements'));
  nodeDiceTray := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Dice Tray', TPMLeaf.Create('DiceTray'));
  nodeResources := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Resources', TPMLeaf.Create('Resources'));
  nodeBeasts := tvwCampaign.Items.AddChildObject(nodeResources, 'Beasts', TPMLeaf.Create('Beasts'));
  nodeMonsters := tvwCampaign.Items.AddChildObject(nodeResources, 'Monsters', TPMLeaf.Create('Monsters'));
  nodeGems := tvwCampaign.Items.AddChildObject(nodeResources, 'Gems', TPMLeaf.Create('Gems'));
  nodeKits := tvwCampaign.Items.AddChildObject(nodeResources, 'Kits', TPMLeaf.Create('Kits'));
  nodeTools := tvwCampaign.Items.AddChildObject(nodeResources, 'Tools', TPMLeaf.Create('Tools'));
  nodeClothing := tvwCampaign.Items.AddChildObject(nodeResources, 'Clothing', TPMLeaf.Create('Clothings'));
  nodeContainers := tvwCampaign.Items.AddChildObject(nodeResources, 'Containers', TPMLeaf.Create('Containers'));
  nodeVehicle := tvwCampaign.Items.AddChildObject(nodeResources, 'Vehicles', TPMLeaf.Create('Vehicles'));
  nodeJewelry := tvwCampaign.Items.AddChildObject(nodeResources, 'Jewelry', TPMLeaf.Create('Jewelrys'));;
  nodeRemains := tvwCampaign.Items.AddChildObject(nodeResources, 'Remains', TPMLeaf.Create('Remainsx'));
  nodeInstruments := tvwCampaign.Items.AddChildObject(nodeResources, 'Instruments', TPMLeaf.Create('Instruments'));;
  nodeArmors := tvwCampaign.Items.AddChildObject(nodeResources, 'Armor', TPMLeaf.Create('Armors'));
  nodeWeapons := tvwCampaign.Items.AddChildObject(nodeResources, 'Weapons', TPMLeaf.Create('Weapons'));
  nodeTraps := tvwCampaign.Items.AddChildObject(nodeResources, 'Traps', TPMLeaf.Create('Traps'));
  nodeHumanoids := tvwCampaign.Items.AddChildObject(nodeResources, 'Humanoids', TPMLeaf.Create('Humanoids'));
  nodeConsumables := tvwCampaign.Items.AddChildObject(nodeResources, 'Consumables', TPMLeaf.Create('Consumables'));
  nodeSpells := tvwCampaign.Items.AddChildObject(nodeResources, 'Spells', TPMLeaf.Create('Spells'));
  nodeNatural := tvwCampaign.Items.AddChildObject(nodeResources, 'Natural', TPMLeaf.Create('Naturals'));
  nodeUnnatural := tvwCampaign.Items.AddChildObject(nodeResources, 'Unnatural', TPMLeaf.Create('Unnaturals'));
  nodeFlora := tvwCampaign.Items.AddChildObject(nodeResources, 'Flora', TPMLeaf.Create('Floras'));
  nodeFauna := tvwCampaign.Items.AddChildObject(nodeResources, 'Fauna', TPMLeaf.Create('Faunas'));
  nodeConditions := tvwCampaign.Items.AddChildObject(nodeResources, 'Conditions', TPMLeaf.Create('Conditions'));

  nodeResources.AlphaSort;

  for i := 0 to TPMBasicDice.RowCount - 1 do
  begin
    leaf := TPMLeaf.Create('Dice');
    leaf.SetTrait(TPMBasicDice[0, i]);
    leaf.SetTrait(TPMBasicDice[1, i]);
    leaf.SetTrait(TPMBasicDice[2, i]);
    leaf.SetTrait(TPMBasicDice[3, i]);
    leaf.OnChange := @LeafChange;
    tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);
  end;

  LoadResourceNodes(nodeKits, 'Kit', TPMKits);
  LoadResourceNodes(nodeTools, 'Tool', TPMTools);
  LoadResourceNodes(nodeClothing, 'Clothing', TPMClothing);
  LoadResourceNodes(nodeContainers, 'Container', TPMContainers);
  LoadResourceNodes(nodeWeapons, 'Weapon', TPMWeapons);
  LoadResourceNodes(nodeVehicle, 'Vehicle', TPMVehicle);
  LoadResourceNodes(nodeJewelry, 'Jewelry', TPMJewelry);
  LoadResourceNodes(nodeRemains, 'Remains', TPMRemains);
  LoadResourceNodes(nodeInstruments, 'Instrument', TPMInstruments);
  LoadResourceNodes(nodeArmors, 'Armor', TPMArmors);
  LoadResourceNodes(nodeTraps, 'Trap', TPMTraps);
  LoadResourceNodes(nodeGems, 'Gem', TPMGems);
  LoadResourceNodes(nodeNatural, 'Natural', TPMNatural);
  LoadResourceNodes(nodeUnnatural, 'Unnatural', TPMUnnatural);
  LoadResourceNodes(nodeFlora, 'Flora', TPMFlora);
  LoadResourceNodes(nodeFauna, 'Fauna', TPMFauna);
  LoadResourceNodes(nodeConditions, 'Condition', TPMConditions);

  LoadResourceNodes(nodeBeasts, 'Beast', TPMBeasts);
  LoadResourceNodes(nodeMonsters, 'Monster', TPMMonsters);
  LoadResourceNodes(nodeHumanoids, 'Humanoid', TPMHumanoids);
  LoadResourceNodes(nodeSpells, 'Spell', TPMSpells);
  LoadResourceNodes(nodeConsumables, 'Consumable', TPMConsumables);

  PopulateDiceTray;

  nodeCampaign.Expand(false);
end;

procedure TfrmMain.RandomResource(ACaption: string; ANode: TTreeNode; AFontColor, ABackColor: TColor);
var
  msg: TCardMessage;
begin
  msg := TCardMessage.Create(pnlOutputData);
  msg.Parent := pnlOutputData;
  msg.Color := ABackColor;
  msg.Font.Color := AFontColor;
  msg.Title.Caption := ACaption;
  msg.Message.Caption := ANode.Items[Random(ANode.Count)].Text;
end;

procedure TfrmMain.PopulateDiceTray;
var
  i : integer;
  btn: TButton;
  node: TTreeNode;
begin

  while pnlBottom.ControlCount > 0 do
    pnlBottom.Controls[0].Free;

  for i := nodeDiceTray.Count - 1 downto 0 do
  begin
    node := nodeDiceTray.Items[i];
    btn := TButton.Create(pnlBottom);
    btn.Parent := pnlBottom;
    btn.Caption := Format('[F%d] %s', [i+1, TPMLeaf(node.Data).Title]);
    btn.Align := alLeft;
    btn.AutoSize := true;
    btn.Tag := i;
    btn.OnClick := @DiceClick;
  end;
end;

procedure TfrmMain.PopulateCampaign;
begin
  //nodeDiceTray.ImageIndex := ;
end;

procedure TfrmMain.RollDice(ADice: TPMLeaf);
var
  msg: TCardMessage;
  leaf: TPMLeaf;
  str, rll : string;
  i, n, t, cnt, die, md  : integer;
begin

  if ADice.Category <> 'Dice' then exit;

  cnt := ADice.GetTrait('Count').ToInteger;
  die := ADice.GetTrait('Die').Replace('d', '').ToInteger;
  md  := ADice.GetTrait('Modifier').ToInteger;

  if cnt < 1 then cnt := 1;

  str := Format('Roll: %dd%d', [cnt, die]);
  if md <> 0 then str := str + ADice.GetTrait('Modifier');
  str := str + ': ';

  t := 0;
  rll := '';
  for i := 0 to cnt - 1 do
  begin
    n := Random(die) + 1;
    t := t + n;
    if rll = '' then
      rll := n.ToString
    else
      rll := rll + ', ' + n.ToString;
  end;
  t := t + md;

  if md = 0 then
    str := str + Format('[%s] = %d', [rll, t])
  else
    str := str + Format('[%s] %s = %d', [rll, ADice.GetTrait('Modifier'), t]);

  msg := TCardMessage.Create(pnlOutputData);
  msg.Parent := pnlOutputData;
  msg.Title.Caption := 'Dice Roll';
  msg.Message.Caption := str;
  msg.Color:= $F1D6AE;
  msg.Font.Color := $724F1B;

end;

procedure TfrmMain.PopulateResourceToCbo(ACbo: TComboBox; AResource: TTreeNode);
var
  i : integer;
begin
  ACbo.Clear;
  for i := 0 to AResource.Count - 1 do
    ACbo.Items.Add(AResource.Items[i].Text);
end;

procedure TfrmMain.ToggleCampaign(AEnabled: boolean);
begin
  mnuMainInsert.Enabled := AEnabled;
  pnlTop.Enabled := AEnabled;
  pnlClient.Enabled := AEnabled;
  pnlBottom.Enabled := AEnabled;
end;

procedure TfrmMain.LoadResourceNodes(AParent: TTreeNode; ACategory: string;
  AArray: TStringList);
var
  i: integer;
  leaf: TPMLeaf;
begin
  if AParent.HasChildren then AParent.DeleteChildren;
  for i := 0 to AArray.Count - 1 do
  begin
    leaf := TPMLeaf.Create(ACategory);
    leaf.SetTrait('Title', AArray[i]);
    leaf.OnChange := @LeafChange;
    tvwCampaign.Items.AddChildObject(AParent, leaf.Title, leaf);
  end;
  AParent.AlphaSort;
end;

procedure TfrmMain.LoadResourceNodes(AParent: TTreeNode; ACategory: string; AArray: TCSVDocument);
var
  i, j: integer;
  leaf: TPMLeaf;
begin
  if AParent.HasChildren then AParent.DeleteChildren;
  for i := 0 to AArray.RowCount-1 do
  begin
    leaf := TPMLeaf.Create(ACategory);
    for j := 0 to AArray.ColCount[i]-1 do
      leaf.SetTrait(AArray[j,i]);
    leaf.OnChange := @LeafChange;
    tvwCampaign.Items.AddChildObject(AParent, leaf.Title, leaf);
  end;
  AParent.AlphaSort;
end;

procedure TfrmMain.SaveCampaign;
var
  r, c: integer;
  leaf: TPMLeaf;
begin
  grdData.Clear;
  grdData.RowCount := tvwCampaign.Items.Count;
  for r := 0 to tvwCampaign.Items.Count - 1 do
  begin
    leaf := TPMLeaf(tvwCampaign.Items[r].Data);

    while grdData.ColCount < (leaf.Traits.Count + 3) do
      grdData.ColCount := grdData.ColCount + 1;

    grdData.Cells[0, r] := leaf.ID;
    grdData.Cells[1, r] := leaf.Category;

    if r = 0 then
      grdData.Cells[2, r] := '-1'
    else
      grdData.Cells[2, r] := tvwCampaign.Items[r].Parent.AbsoluteIndex.ToString;

    for c := 0 to leaf.Traits.Count - 1 do
      grdData.Cells[c + 3, r] := leaf.GetTrait(c);
  end;
  grdData.SaveToCSVFile(FFileName);
end;

procedure TfrmMain.LoadCampaign;
var
  r, c: integer;
  leaf: TPMLeaf;
  node: TTreeNode;
begin
  tvwCampaign.Items.Clear;
  grdData.Clear;
  grdData.LoadFromCSVFile(FFileName);

  for r := 0 to grdData.RowCount -1 do
  begin
    leaf := TPMLeaf.Create(grdData.Cells[0, r]);
    leaf.Parent := grdData.Cells[1, r];
    for c := 2 to grdData.ColCount - 1 do
    begin
      leaf.SetTrait(grdData.Cells[c, r]);
    end;
    leaf.OnChange := @LeafChange;

    if leaf.Parent = '-1' then
      nodeCampaign := tvwCampaign.Items.AddObject(nil, leaf.Title, leaf)
    else if leaf.Category = 'Dungeons' then
      nodeDungeons := tvwCampaign.Items.AddChildObject(nodeCampaign, leaf.Title, leaf)
    else if leaf.Category = 'Wildernesses' then
      nodeWildernesses := tvwCampaign.Items.AddChildObject(nodeCampaign, leaf.Title, leaf)
    else if leaf.Category = 'Settlements' then
      nodeSettlements := tvwCampaign.Items.AddChildObject(nodeCampaign, leaf.Title, leaf)
    else if leaf.Category = 'DiceTray' then
      nodeDiceTray := tvwCampaign.Items.AddChildObject(nodeCampaign, leaf.Title, leaf)
    else
      tvwCampaign.Items.AddChildObject(tvwCampaign.Items[leaf.Parent.ToInteger], leaf.Title, leaf);
  end;

  nodeCampaign.Expand(false);
end;

end.

