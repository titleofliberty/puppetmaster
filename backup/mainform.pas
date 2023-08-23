unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, Menus, Grids, TreeFilterEdit, puppetmasterlib, htmlcolors;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnOutputClear: TButton;
    lblMood: TLabel;
    lblWares: TLabel;
    lblEightBall: TLabel;
    lblHazard: TLabel;
    lblLoot: TLabel;
    lblClue: TLabel;
    lblRumor: TLabel;
    mnuMainViewExpand: TMenuItem;
    mnuMainViewCollapse: TMenuItem;
    mnuMainView: TMenuItem;
    mnuMainToolsMood: TMenuItem;
    mnuMainToolsRumor: TMenuItem;
    mnuMainToolsWares: TMenuItem;
    mnuMainToolsClue: TMenuItem;
    mnuMainToolsLoot: TMenuItem;
    mnuMainToolsHazard: TMenuItem;
    mnuMainToolsEight: TMenuItem;
    mnuMainTools: TMenuItem;
    mnuMainRandomTool: TMenuItem;
    mnuMainRandomGem: TMenuItem;
    mnuMainRandomTrap: TMenuItem;
    mnuMainRandomPotion: TMenuItem;
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
    procedure mnuMainInsertPlayerClick(Sender: TObject);
    procedure mnuMainInsertPuppetClick(Sender: TObject);
    procedure mnuMainInsertRoomClick(Sender: TObject);
    procedure mnuMainInsertSettlementClick(Sender: TObject);
    procedure mnuMainInsertTractClick(Sender: TObject);
    procedure mnuMainInsertVenueClick(Sender: TObject);
    procedure mnuMainInsertWildernessClick(Sender: TObject);
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
    procedure PopulateDiceTray;
    procedure PopulateCampaign;
    procedure ToggleCampaign(AEnabled: boolean = false);
    procedure SaveCampaign;
    procedure LoadCampaign;
  public

  end;

var
  frmMain: TfrmMain;
  nodeCampaign     : TTreeNode;
  nodeSettlements  : TTreeNode;
  nodeDungeons     : TTreeNode;
  nodeDiceTray     : TTreeNode;
  nodeWildernesses : TTreeNode;

implementation

{$R *.lfm}

uses
  settlementform, venueform, puppetform, diceform, playerform, roomform,
  aboutform, dungeonform, wildernessform, tractform, chamberform, dicetrayform;

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
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Chamber');
  leaf.OnChange := @LeafChange;
  node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertClick(Sender: TObject);
var
  leaf: TPMLeaf;
begin
  mnuMainInsertDungeon.Enabled := true;
  mnuMainInsertChamber.Enabled := false;

  mnuMainInsertWilderness.Enabled := true;
  mnuMainInsertTract.Enabled := false;

  mnuMainInsertSettlement.Enabled := true;
  mnuMainInsertVenue.Enabled := false;
  mnuMainInsertRoom.Enabled := false;

  mnuMainInsertMonster.Enabled := false;
  mnuMainInsertBeast.Enabled := false;
  mnuMainInsertPuppet.Enabled := false;
  mnuMainInsertPlayer.Enabled := false;
  mnuMainInsertDiceRoll.Enabled := true;;

  if Assigned(tvwCampaign.Selected) then
    leaf := TPMLeaf(tvwCampaign.Selected.Data);

  mnuMainInsertChamber.Enabled := (leaf.Category = 'Dungeon') or (leaf.Category = 'Chamber');
  mnuMainInsertTract.Enabled := (leaf.Category = 'Wilderness') or (leaf.Category = 'Tract');
  mnuMainInsertVenue.Enabled := (leaf.Category = 'Settlement') or (leaf.Category = 'Venue');
  mnuMainInsertRoom.Enabled := (leaf.Category = 'Venue') or (leaf.Category = 'Room');

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
  if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Venue' then
    node := tvwCampaign.items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Room' then
    node := tvwCampaign.items.AddObject(tvwCampaign.Selected, leaf.Title, leaf)
  else
    Exit;
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
  node := tvwCampaign.Items.AddChildObject(nodeSettlements, leaf.GetTrait('Title'), leaf);
  node.Selected := true;
  //SaveCampaign(FFileName);
end;

procedure TfrmMain.mnuMainInsertTractClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Tract');
  leaf.OnChange := @LeafChange;
  if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Wilderness' then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Tract' then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected, leaf.Title, leaf);
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
    node := tvwCampaign.items.AddObject(tvwCampaign.Selected, leaf.Title, leaf)
  else
    Exit;
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
    else if (leaf2.Category = 'Chamber') then
    begin
      if (leaf1.Category = 'Chamber') or (leaf1.Category = 'Dungeon') then
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
    else if (leaf2.Category = 'Chamber') and ((leaf1.Category = 'Chamber') or (leaf1.Category = 'Dungeon')) then
      Accept := true
    else if (leaf2.Category = 'Wilderness') and ((leaf1.Category = 'Wilderness') or (leaf1.Category = 'Wildernesses')) then
      Accept := true
    else if (leaf2.Category = 'Tract') and ((leaf1.Category = 'Wilderness') or (leaf1.Category = 'Tract')) then
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

  mnuMainInsertVenue.Enabled := false;

  while pnlWorkspaceClient.ComponentCount > 0 do
  begin
    pnlWorkspaceClient.Components[0].Free;
  end;

  if not Assigned(tvwCampaign.Selected) then exit;

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
  else if leaf.Category = 'Room' then
  begin
    form := TfrmRoom.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmRoom(form).Room := leaf;
    form.Show;
  end
  else if leaf.Category = 'Dungeon' then
  begin
    form := TfrmDungeon.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmDungeon(form).Dungeon := leaf;
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
  else if leaf.Category = 'Tract' then
  begin
    form := TfrmTract.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmTract(form).Tract := leaf;
    form.Show;
  end
  else if leaf.Category = 'Chamber' then
  begin
    form := TfrmChamber.Create(pnlWorkspaceClient);
    form.Parent := pnlWorkspaceClient;
    TfrmChamber(form).Chamber := leaf;
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
  leaf: TPMLeaf;
begin
  tvwCampaign.Items.Clear;

  nodeCampaign := tvwCampaign.Items.AddObject(nil, 'Campaign', TPMLeaf.Create('Campaign'));
  nodeDungeons := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Dungeons', TPMLeaf.Create('Dungeons'));
  nodeWildernesses := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Wildernesses', TPMLeaf.Create('Wildernesses'));
  nodeSettlements := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Settlements', TPMLeaf.Create('Settlements'));
  nodeDiceTray := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Dice Tray', TPMLeaf.Create('DiceTray'));

  leaf := TPMLeaf.Create('Dice');
  leaf.SetTrait('Title', '1d4');
  leaf.SetTrait('Count', '1');
  leaf.SetTrait('Die', 'd4');
  leaf.SetTrait('Modifier', '0');
  leaf.OnChange := @LeafChange;
  tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);

  leaf := TPMLeaf.Create('Dice');
  leaf.SetTrait('Title', '1d6');
  leaf.SetTrait('Count', '1');
  leaf.SetTrait('Die', 'd6');
  leaf.SetTrait('Modifier', '0');
  leaf.OnChange := @LeafChange;
  tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);

  leaf := TPMLeaf.Create('Dice');
  leaf.SetTrait('Title', '1d8');
  leaf.SetTrait('Count', '1');
  leaf.SetTrait('Die', 'd8');
  leaf.SetTrait('Modifier', '0');
  leaf.OnChange := @LeafChange;
  tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);

  leaf := TPMLeaf.Create('Dice');
  leaf.SetTrait('Title', '1d10');
  leaf.SetTrait('Count', '1');
  leaf.SetTrait('Die', 'd10');
  leaf.SetTrait('Modifier', '0');
  leaf.OnChange := @LeafChange;
  tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);

  leaf := TPMLeaf.Create('Dice');
  leaf.SetTrait('Title', '1d12');
  leaf.SetTrait('Count', '1');
  leaf.SetTrait('Die', 'd12');
  leaf.SetTrait('Modifier', '0');
  leaf.OnChange := @LeafChange;
  tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);

  leaf := TPMLeaf.Create('Dice');
  leaf.SetTrait('Title', '1d20');
  leaf.SetTrait('Count', '1');
  leaf.SetTrait('Die', 'd20');
  leaf.SetTrait('Modifier', '0');
  leaf.OnChange := @LeafChange;
  tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);

  leaf := TPMLeaf.Create('Dice');
  leaf.SetTrait('Title', '1d100');
  leaf.SetTrait('Count', '1');
  leaf.SetTrait('Die', 'd100');
  leaf.SetTrait('Modifier', '0');
  leaf.OnChange := @LeafChange;
  tvwCampaign.Items.AddChildObject(nodeDiceTray, leaf.Title, leaf);

  PopulateDiceTray;

  nodeCampaign.Expand(false);
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

procedure TfrmMain.ToggleCampaign(AEnabled: boolean);
begin
  mnuMainInsert.Enabled := AEnabled;
  pnlTop.Enabled := AEnabled;
  pnlClient.Enabled := AEnabled;
  pnlBottom.Enabled := AEnabled;
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
      grdData.Cells[c + 2, r] := Format('%s:%s', [leaf.Traits.Keys[c], leaf.Traits.Data[c]]);
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

