unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, Menus, Grids, TreeFilterEdit, puppetmasterlib, htmlcolors;

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
    mnuMainToolsCondition: TMenuItem;
    mnuMainInsertFloor: TMenuItem;
    mnuMainInsertRoute: TMenuItem;
    mnuMainInsertLevel: TMenuItem;
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
    mnuMainInsertTract: TMenuItem;
    mnuMainInsertChamber: TMenuItem;
    Separator6: TMenuItem;
    Separator5: TMenuItem;
    mnuMainInsertWilderness: TMenuItem;
    mnuMainInsertPuppet: TMenuItem;
    mnuMainInsertPlayer: TMenuItem;
    mnuMainInsertRoom: TMenuItem;
    mnuMainHelpAbout: TMenuItem;
    mnuMainHelp: TMenuItem;
    mnuMainEditDelete: TMenuItem;
    Separator4: TMenuItem;
    mnuMainEditPaste: TMenuItem;
    mnuMainEditCopy: TMenuItem;
    mnuMainEditCut: TMenuItem;
    mnuMainEdit: TMenuItem;
    mnuMainInsertDiceRoll: TMenuItem;
    Separator3: TMenuItem;
    mnuMainInsertVenue: TMenuItem;
    pnlWorkspaceClient: TScrollBox;
    Separator2: TMenuItem;
    mnuMainCampaignsSaveAs: TMenuItem;
    mnuMainInsertSettlement: TMenuItem;
    mnuMainInsertDungeon: TMenuItem;
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
    procedure mnuMainCampaignsExitClick(Sender: TObject);
    procedure mnuMainCampaignsNewClick(Sender: TObject);
    procedure mnuMainCampaignsOpenClick(Sender: TObject);
    procedure mnuMainCampaignsSaveAsClick(Sender: TObject);
    procedure mnuMainEditDeleteClick(Sender: TObject);
    procedure mnuMainHelpAboutClick(Sender: TObject);
    procedure mnuMainInsertChamberClick(Sender: TObject);
    procedure mnuMainInsertClick(Sender: TObject);
    procedure mnuMainInsertDiceRollClick(Sender: TObject);
    procedure mnuMainInsertDungeonClick(Sender: TObject);
    procedure mnuMainInsertFactionClick(Sender: TObject);
    procedure mnuMainInsertFloorClick(Sender: TObject);
    procedure mnuMainInsertLevelClick(Sender: TObject);
    procedure mnuMainInsertPlayerClick(Sender: TObject);
    procedure mnuMainInsertPuppetClick(Sender: TObject);
    procedure mnuMainInsertRoomClick(Sender: TObject);
    procedure mnuMainInsertRouteClick(Sender: TObject);
    procedure mnuMainInsertSettlementClick(Sender: TObject);
    procedure mnuMainInsertTractClick(Sender: TObject);
    procedure mnuMainInsertVenueClick(Sender: TObject);
    procedure mnuMainInsertWildernessClick(Sender: TObject);
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
    procedure RandomResource(ACaption: string; ANode: TTreeNode; AColor: TColor);
    procedure PopulateDiceTray;
    procedure PopulateCampaign;
    procedure PopulateResourceToCbo(ACbo: TComboBox; AResource: TTreeNode);
    procedure ToggleCampaign(AEnabled: boolean = false);
    procedure LoadResourceNodes(AParent: TTreeNode; AArray: TStringArray); overload;
    procedure LoadResourceNodes(AParent: TTreeNode; ACategory: string; AArray: TPM2DStringArray); overload;
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



implementation

{$R *.lfm}

uses
  settlementform, venueform, puppetform, diceform, playerform,
  aboutform, dungeonform, wildernessform, chambertractroomform, levelform,
  routeform, floorform;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Randomize;

  CampaignNew;

  FFileName := 'C:\Users\Marion Smith\Desktop\demo.txt';

  //ToggleCampaign(false);
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

procedure TfrmMain.mnuMainInsertChamberClick(Sender: TObject);
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

  mnuMainInsertLevel.Enabled := (leaf.Category = 'Dungeon') or (leaf.Category = 'Level') or (leaf.Category = 'Chamber') or (leaf.Category = 'Factions') or (leaf.Category = 'Faction');
  mnuMainInsertChamber.Enabled := (leaf.Category = 'Level') or (leaf.Category = 'Chamber');

  mnuMainInsertRoute.Enabled := (leaf.Category = 'Wilderness') or (leaf.Category = 'Route') or (leaf.Category = 'Tract');
  mnuMainInsertTract.Enabled := (leaf.Category = 'Route') or (leaf.Category = 'Tract');

  mnuMainInsertVenue.Enabled := (leaf.Category = 'Settlement') or (leaf.Category = 'Venue');
  mnuMainInsertFloor.Enabled := (leaf.Category = 'Floor') or (leaf.Category = 'Venue');
  mnuMainInsertRoom.Enabled := (leaf.Category = 'Floor') or (leaf.Category = 'Room');

  mnuMainInsertFaction.Enabled := (leaf.Category = 'Dungeon') or (leaf.Category <> 'Wilderness') or (leaf.Category <> 'Settlement') and (leaf.Category <> 'Factions') and (leaf.Category <> 'Faction');
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

procedure TfrmMain.mnuMainInsertDungeonClick(Sender: TObject);
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

procedure TfrmMain.mnuMainInsertLevelClick(Sender: TObject);
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

procedure TfrmMain.mnuMainInsertRouteClick(Sender: TObject);
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

procedure TfrmMain.mnuMainInsertTractClick(Sender: TObject);
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

procedure TfrmMain.mnuMainInsertWildernessClick(Sender: TObject);
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
  RandomResource('Armor', nodeArmors, htmlcolors.clHTMLBlack);
end;

procedure TfrmMain.mnuMainRandomClothingClick(Sender: TObject);
begin
  RandomResource('Clothing', nodeClothing, htmlcolors.clHTMLMediumPurple);
end;

procedure TfrmMain.mnuMainRandomContainerClick(Sender: TObject);
begin
  RandomResource('Container', nodeContainers, htmlcolors.clHTMLBrown);
end;

procedure TfrmMain.mnuMainRandomGemClick(Sender: TObject);
begin
  RandomResource('Gem', nodeGems, htmlcolors.clHTMLIndianRed);
end;

procedure TfrmMain.mnuMainRandomInstrumentClick(Sender: TObject);
begin
  RandomResource('Instrument', nodeInstruments, htmlcolors.clHTMLGoldenRod);
end;

procedure TfrmMain.mnuMainRandomJewelryClick(Sender: TObject);
begin
  RandomResource('Jewelry', nodeJewelry, htmlcolors.clHTMLGoldenRod);
end;

procedure TfrmMain.mnuMainRandomKitClick(Sender: TObject);
begin
  RandomResource('Kit', nodeKits, htmlcolors.clHTMLSaddleBrown);
end;

procedure TfrmMain.mnuMainRandomRemainsClick(Sender: TObject);
begin
  RandomResource('Remains', nodeRemains, htmlcolors.clHTMLRed);
end;

procedure TfrmMain.mnuMainRandomToolClick(Sender: TObject);
begin
  RandomResource('Tool', nodeTools, htmlcolors.clHTMLDarkOrange);
end;

procedure TfrmMain.mnuMainRandomTrapClick(Sender: TObject);
begin
  RandomResource('Trap', nodeTraps, htmlcolors.clHTMLDarkMagenta);
end;

procedure TfrmMain.mnuMainRandomVehicleClick(Sender: TObject);
begin
  RandomResource('Vehicle', nodeVehicle, htmlcolors.clHTMLMediumPurple);
end;

procedure TfrmMain.mnuMainRandomWeaponClick(Sender: TObject);
begin
  RandomResource('Weapon', nodeWeapons, htmlcolors.clHTMLDarkSlateGrey);
end;

procedure TfrmMain.mnuMainToolsConditionClick(Sender: TObject);
begin
  RandomResource('Condition', nodeConditions, htmlcolors.clHTMLDarkMagenta);
end;

procedure TfrmMain.mnuMainToolsEightClick(Sender: TObject);
var
  i: integer;
  lbl: TLabel;
begin
  i := Random(4);
  lbl := TLabel.Create(pnlOutputData);
  lbl.Parent := pnlOutputData;
  lbl.Align := alTop;
  lbl.Font.Color := htmlcolors.clHTMLBlueViolet;
  lbl.BorderSpacing.Left := 8;
  lbl.BorderSpacing.Right := 8;
  lbl.BorderSpacing.Bottom := 16;
  if i = 0 then
    lbl.Caption := 'Eight Ball: No'
  else if i = 1 then
    lbl.Caption := 'Eight Ball: Maybe'
  else
    lbl.Caption := 'Eight Ball: Yes';
end;

procedure TfrmMain.mnuMainToolsMoodClick(Sender: TObject);
var
  i : integer;
  moods: TStringList;
  lbl  : TLabel;
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
  lbl := TLabel.Create(pnlOutputData);
  lbl.Parent := pnlOutputData;
  lbl.Align := alTop;
  lbl.Font.Color := htmlcolors.clHTMLForestGreen;
  lbl.BorderSpacing.Left := 8;
  lbl.BorderSpacing.Right := 8;
  lbl.BorderSpacing.Bottom := 16;
  lbl.Caption := 'Mood: ' + moods.Strings[i];

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
  begin
    pnlWorkspaceClient.Components[0].Free;
  end;

  if leaf.Category = 'Settlement' then
  begin
    form := TfrmSettlement.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmSettlement(form).Settlement := leaf;
    form.Show;
  end
  else if leaf.Category = 'Venue' then
  begin
    form := TfrmVenue.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmVenue(form).Venue := leaf;
    form.Show;
  end
  else if (leaf.Category = 'Chamber') or (leaf.Category = 'Tract') or (leaf.Category = 'Room') then
  begin
    form := TfrmChamberTractRoom.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmChamberTractRoom(form).Leaf := leaf;
    form.Show;
  end
  else if leaf.Category = 'Dungeon' then
  begin
    form := TfrmDungeon.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmDungeon(form).Dungeon := leaf;
    form.Show;
  end
  else if leaf.Category = 'Level' then
  begin
    form := TfrmLevel.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmLevel(form).Level := leaf;
    form.Show;
  end
  else if leaf.Category = 'Puppet' then
  begin
    form := TfrmPuppet.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmPuppet(form).Puppet := leaf;
    form.Show;
  end
  else if leaf.Category = 'Player' then
  begin
    form := TfrmPlayer.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmPlayer(form).Player := leaf;
    form.Show;
  end
  else if leaf.Category = 'Dice' then
  begin
    form := TfrmDice.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmDice(form).Dice := leaf;
    form.Show;
  end
  else if leaf.Category = 'Wilderness' then
  begin
    form := TfrmWilderness.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmWilderness(form).Wilderness := leaf;
    form.Show;
  end
  else if leaf.Category = 'Route' then
  begin
    form := TfrmRoute.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmRoute(form).Route := leaf;
    form.Show;
  end
  else if leaf.Category = 'Floor' then
  begin
    form := TfrmFloor.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmFloor(form).Floor := leaf;
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
  lbl : TLabel;
  btn : TButton;
  leaf: TPMLeaf;
  node: TTreeNode;
  str, rll : string;
  i, n, t, cnt, die, md  : integer;
begin
  btn := TButton(Sender);
  node := nodeDiceTray.Items[btn.Tag];
  leaf := TPMLeaf(node.Data);

  cnt := leaf.GetTrait('Count').ToInteger;
  die := leaf.GetTrait('Die').Replace('d', '').ToInteger;
  md  := leaf.GetTrait('Modifier').ToInteger;

  str := Format('Dice Roll %dd%d', [cnt, die]);
  if md <> 0 then str := str + leaf.GetTrait('Modifier');
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
    str := str + Format('[%s] %s = %d', [rll, leaf.GetTrait('Modifier'), t]);

  lbl := TLabel.Create(pnlOutputData);
  lbl.Parent := pnlOutputData;
  lbl.Align := alTop;
  lbl.Caption := str;
  lbl.BorderSpacing.Left := 8;
  lbl.BorderSpacing.Right := 8;
  lbl.BorderSpacing.Bottom := 16;
  lbl.Font.Color := htmlcolors.clHTMLBrown;
  lbl.BorderSpacing.Bottom := 16;
end;

procedure TfrmMain.CampaignNew;
var
  i : integer;
  leaf: TPMLeaf;
begin
  tvwCampaign.Items.Clear;

  nodeCampaign := tvwCampaign.Items.AddObject(nil, 'Campaign', TPMLeaf.Create('Campaign'));
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
  nodeClothing := tvwCampaign.Items.AddChildObject(nodeResources, 'Clothing', TPMLeaf.Create('Clothing'));
  nodeContainers := tvwCampaign.Items.AddChildObject(nodeResources, 'Containers', TPMLeaf.Create('Containers'));
  nodeVehicle := tvwCampaign.Items.AddChildObject(nodeResources, 'Vehicles', TPMLeaf.Create('Vehicles'));
  nodeJewelry := tvwCampaign.Items.AddChildObject(nodeResources, 'Jewelry', TPMLeaf.Create('Jewelry'));;
  nodeRemains := tvwCampaign.Items.AddChildObject(nodeResources, 'Remains', TPMLeaf.Create('Remains'));
  nodeInstruments := tvwCampaign.Items.AddChildObject(nodeResources, 'Instruments', TPMLeaf.Create('Instruments'));;
  nodeArmors := tvwCampaign.Items.AddChildObject(nodeResources, 'Armor', TPMLeaf.Create('Armor'));
  nodeWeapons := tvwCampaign.Items.AddChildObject(nodeResources, 'Weapons', TPMLeaf.Create('Weapons'));
  nodeTraps := tvwCampaign.Items.AddChildObject(nodeResources, 'Traps', TPMLeaf.Create('Traps'));
  nodeHumanoids := tvwCampaign.Items.AddChildObject(nodeResources, 'Humanoids', TPMLeaf.Create('Humanoids'));
  nodeConsumables := tvwCampaign.Items.AddChildObject(nodeResources, 'Consumables', TPMLeaf.Create('Consumables'));
  nodeSpells := tvwCampaign.Items.AddChildObject(nodeResources, 'Spells', TPMLeaf.Create('Spells'));
  nodeNatural := tvwCampaign.Items.AddChildObject(nodeResources, 'Natural', TPMLeaf.Create('Natural'));
  nodeUnnatural := tvwCampaign.Items.AddChildObject(nodeResources, 'Unnatural', TPMLeaf.Create('Unnatural'));
  nodeFlora := tvwCampaign.Items.AddChildObject(nodeResources, 'Flora', TPMLeaf.Create('Flora'));
  nodeFauna := tvwCampaign.Items.AddChildObject(nodeResources, 'Fauna', TPMLeaf.Create('Fauna'));
  nodeConditions := tvwCampaign.Items.AddChildObject(nodeResources, 'Conditions', TPMLeaf.Create('Conditions'));

  nodeResources.AlphaSort;

  for i := 0 to High(TPMBasicDice) do
  begin
    leaf := TPMLeaf.Create('Dice');
    leaf.SetTrait(TPMBasicDice[i, 0]);
    leaf.SetTrait(TPMBasicDice[i, 1]);
    leaf.SetTrait(TPMBasicDice[i, 2]);
    leaf.SetTrait(TPMBasicDice[i, 3]);
    leaf.OnChange := @LeafChange;
    tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);
  end;

  LoadResourceNodes(nodeKits, TPMKits);
  LoadResourceNodes(nodeTools, TPMTools);
  LoadResourceNodes(nodeClothing, TPMClothing);
  LoadResourceNodes(nodeContainers, TPMContainers);
  LoadResourceNodes(nodeWeapons, TPMWeapons);
  LoadResourceNodes(nodeVehicle, TPMVehicle);
  LoadResourceNodes(nodeJewelry, TPMJewelry);
  LoadResourceNodes(nodeRemains, TPMRemains);
  LoadResourceNodes(nodeInstruments, TPMInstruments);
  LoadResourceNodes(nodeArmors, TPMArmors);
  LoadResourceNodes(nodeTraps, TPMTraps);
  LoadResourceNodes(nodeGems, TPMGems);
  LoadResourceNodes(nodeNatural, TPMNatural);
  LoadResourceNodes(nodeUnnatural, TPMUnnatural);
  LoadResourceNodes(nodeFlora, TPMFlora);
  LoadResourceNodes(nodeFauna, TPMFauna);
  LoadResourceNodes(nodeConditions, TPMConditions);

  LoadResourceNodes(nodeBeasts, 'Beast', TPMBeasts);
  LoadResourceNodes(nodeMonsters, 'Monster', TPMMonsters);
  LoadResourceNodes(nodeHumanoids, 'Humanoid', TPMHumanoids);
  LoadResourceNodes(nodeSpells, 'Spell', TPMSpells);
  LoadResourceNodes(nodeConsumables, 'Consumable', TPMConsumables);

  PopulateDiceTray;

  nodeCampaign.Expand(false);
end;

procedure TfrmMain.RandomResource(ACaption: string; ANode: TTreeNode; AColor: TColor);
var
  lbl: TLabel;
begin
  lbl := TLabel.Create(pnlOutputData);
  lbl.Parent := pnlOutputData;
  lbl.Align := alTop;
  lbl.Font.Color := AColor;
  lbl.BorderSpacing.Left := 8;
  lbl.BorderSpacing.Right := 8;
  lbl.BorderSpacing.Bottom := 16;
  lbl.Caption := Format('%s: %s', [ACaption, ANode.Items[Random(ANode.Count)].Text]) ;
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

procedure TfrmMain.LoadResourceNodes(AParent: TTreeNode; AArray: TStringArray);
var
  i: integer;
  leaf: TPMLeaf;
begin
  if AParent.HasChildren then AParent.DeleteChildren;
  for i := 0 to High(AArray) do
  begin
    leaf := TPMLeaf.Create('Simple');
    leaf.SetTrait('Title', AArray[i]);
    leaf.OnChange := @LeafChange;
    tvwCampaign.Items.AddChildObject(AParent, leaf.Title, leaf);
  end;
  AParent.AlphaSort;
end;

procedure TfrmMain.LoadResourceNodes(AParent: TTreeNode; ACategory: string; AArray: TPM2DStringArray);
var
  i, j: integer;
  leaf: TPMLeaf;
begin
  if AParent.HasChildren then AParent.DeleteChildren;
  for i := 0 to High(AArray) do
  begin
    leaf := TPMLeaf.Create(ACategory);
    for j := 0 to High(AArray[i]) do
      leaf.SetTrait(AArray[i, j]);
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

    while grdData.ColCount < (leaf.Traits.Count + 2) do
      grdData.ColCount := grdData.ColCount + 1;

    grdData.Cells[0, r] := leaf.Category;

    if r = 0 then
      grdData.Cells[1, r] := '-1'
    else
      grdData.Cells[1, r] := tvwCampaign.Items[r].Parent.AbsoluteIndex.ToString;

    for c := 0 to leaf.Traits.Count - 1 do
      grdData.Cells[c + 2, r] := leaf.GetTrait(c);
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

