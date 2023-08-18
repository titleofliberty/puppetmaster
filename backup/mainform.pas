unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, Menus, TreeFilterEdit, csvdocument, puppetmasterlib;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnMood: TButton;
    btnWares: TButton;
    btnDiceTen: TButton;
    btnDiceSix: TButton;
    btnDiceEight: TButton;
    btnDiceTwelve: TButton;
    btnDiceTwenty: TButton;
    btnDiceHundred: TButton;
    btnDiceFour: TButton;
    btnHazard: TButton;
    btnLoot: TButton;
    btnClue: TButton;
    btnOutputClear: TButton;
    btnEightBall: TButton;
    btnRumor: TButton;
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
    tvwCampaign: TTreeView;
    txtFilterCampaign: TTreeFilterEdit;
    procedure btnEightBallClick(Sender: TObject);
    procedure btnOutputClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuMainCampaignsExitClick(Sender: TObject);
    procedure mnuMainCampaignsNewClick(Sender: TObject);
    procedure mnuMainCampaignsOpenClick(Sender: TObject);
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
    procedure tvwCampaignDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvwCampaignDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvwCampaignMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvwCampaignSelectionChanged(Sender: TObject);
    procedure LeafChange(Sender: TObject);
  private
    FFileName: string;
    procedure PopulateCampaign;
    procedure ToggleCampaign(AEnabled: boolean = false);
    procedure SaveCampaign(AFileName: string);
    procedure LoadCampaign(AFileName: string);
  public

  end;

var
  frmMain: TfrmMain;
  nodeCampaign   : TTreeNode;
  nodeSettlement : TTreeNode;
  nodeDungeon    : TTreeNode;
  nodeDiceTray   : TTreeNode;
  nodeWilderness : TTreeNode;

implementation

{$R *.lfm}

uses
  settlementform, venueform, puppetform, diceform, playerform, roomform,
  aboutform, dungeonform, wildernessform, tractform, traitframe, chamberform;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Randomize;

  PopulateCampaign;

  //ToggleCampaign(false);
end;

procedure TfrmMain.btnOutputClearClick(Sender: TObject);
begin
  while pnlOutputData.ComponentCount > 0 do
    pnlOutputData.Components[0].Free;
end;

procedure TfrmMain.btnEightBallClick(Sender: TObject);
var
  i: integer;
  lbl: TLabel;
begin
  i := Random(4);
  lbl := TLabel.Create(pnlOutputData);
  lbl.Parent := pnlOutputData;
  lbl.Align := alTop;
  lbl.Font.Color := RGBToColor(31, 97, 141);
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

procedure TfrmMain.mnuMainCampaignsExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.mnuMainCampaignsNewClick(Sender: TObject);
begin
  if dlgSave.Execute then
  begin
    FFileName := dlgSave.FileName;
    SaveCampaign(FFileName);
    PopulateCampaign;
    ToggleCampaign(true);
  end;
end;

procedure TfrmMain.mnuMainCampaignsOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    FFileName := dlgOpen.FileName;
    LoadCampaign(FFileName);
    PopulateCampaign;
    ToggleCampaign(true);
  end;
end;

procedure TfrmMain.mnuMainEditDeleteClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  node := tvwCampaign.Selected;
  leaf := TPMLeaf(node.Data);
  if leaf.Category = 'Settlement' then node.Delete;
  if leaf.Category = 'Venue' then node.Delete;
  if leaf.Category = 'Room' then node.Delete;
  if leaf.Category = 'Puppet' then node.Delete;
  if leaf.Category = 'Player' then node.Delete;
  if leaf.Category = 'Dice' then node.Delete;
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
  //SaveCampaign(FFileName);
end;

procedure TfrmMain.mnuMainInsertDungeonClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Dungeon');
  leaf.OnChange := @LeafChange;
  node := tvwCampaign.Items.AddChildObject(nodeDungeon, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.mnuMainInsertPlayerClick(Sender: TObject);
var
  node: TTreeNode;
  leaf: TPMLeaf;
begin
  leaf := TPMLeaf.Create('Player');
  leaf.OnChange := @LeafChange;
  if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Room' then
    node := tvwCampaign.Items.AddChildObject(tvwCampaign.Selected, leaf.Title, leaf)
  else if (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Puppet') or (TPMLeaf(tvwCampaign.Selected.Data).Category = 'Player') then
    node := tvwCampaign.Items.AddObject(tvwCampaign.Selected, leaf.Title, leaf);
  node.Selected := true;
  //SaveCampaign(FFileName);
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
  else if TPMLeaf(tvwCampaign.Selected.Data).Category = 'Puppet' then
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
  node := tvwCampaign.Items.AddChildObject(nodeSettlement, leaf.GetTrait('Title'), leaf);
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
  node := tvwCampaign.Items.AddChildObject(nodeWilderness, leaf.Title, leaf);
  node.Selected := true;
end;

procedure TfrmMain.tvwCampaignDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  tree : TTreeView;
  node : TTreeNode;
begin
  tree := TTreeView(Sender);
  node := tree.GetNodeAt(x,y);

  if Assigned(tree.Selected) and (node <> tree.Selected) then
  begin
    if node = nil then exit;

    if tree.Selected.Text.StartsWith('Dice') then
    begin
      if (node.Text = 'Dice Tray') then
        tree.Selected.MoveTo(node, naAddChildFirst)
      else if node.Text.StartsWith('Dice') then
        tree.Selected.MoveTo(node, TNodeAttachMode.naInsertBehind);
    end
    else if tree.Selected.Text.StartsWith('Dungeon') then
    begin
      if (node.Text = 'Dungeons') then
        tree.Selected.MoveTo(node, naAddChildFirst)
      else if node.Text.StartsWith('Dungeon') then
        tree.Selected.MoveTo(node, naInsertBehind);
    end;
  end;
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
    leaf2 := TPMLeaf(tree.Selected);
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
    else if (leaf2.Category = 'Puppet') and ((leaf1.Category = 'Chamber') or (leaf1.Category = 'Tract') or (leaf1.Category = 'Room')) then
      Accept := true
    else if (leaf2.Category = 'Player') and ((leaf1.Category = 'Chamber') or (leaf1.Category = 'Tract') or (leaf1.Category = 'Room')) then
      Accept := true
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
  //SaveCampaign(FFileName);
end;

procedure TfrmMain.PopulateCampaign;
begin
  tvwCampaign.Items.Clear;

  nodeCampaign   := tvwCampaign.Items.AddObject(nil, 'Campaign', TPMLeaf.Create('Campaign'));
  nodeSettlement := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Settlements', TPMLeaf.Create('Settlements'));
  nodeDungeon    := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Dungeons', TPMLeaf.Create('Dungeons'));
  nodeWilderness := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Wildernesses', TPMLeaf.Create('Wildernesses'));
  nodeDiceTray   := tvwCampaign.Items.AddChildObject(nodeCampaign, 'Dice Tray', TPMLeaf.Create('DiceTray'));
end;

procedure TfrmMain.ToggleCampaign(AEnabled: boolean);
begin
  mnuMainInsert.Enabled := AEnabled;
  pnlTop.Enabled := AEnabled;
  pnlClient.Enabled := AEnabled;
  pnlBottom.Enabled := AEnabled;
end;

procedure TfrmMain.SaveCampaign(AFileName: string);
var
  i: integer;
  fn: string;
begin

end;

procedure TfrmMain.LoadCampaign(AFileName: string);
var
  i: integer;
  fn: string;
begin
  fn := ChangeFileExt(ExtractFileName(AFileName), '');
  //if FCampaign.Name <> fn then FCampaign.Name := fn;
  tvwCampaign.Items.Clear;
end;

end.

