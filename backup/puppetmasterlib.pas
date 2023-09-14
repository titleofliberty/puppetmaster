unit puppetmasterlib;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, fgl, csvdocument, StrUtils,
  StdCtrls, ExtCtrls, htmlcolors;

type

  { TCard }

  TCard = class(TPanel)
  public
    Title: TLabel;
    constructor Create(TheOwner: TControl);
    procedure Paint; override;
  end;

  { TCardMessage }

  TCardMessage = class(TCard)
  public
    Message: TLabel;
    constructor Create(TheOwner: TControl);
  end;

  { TCardTable }

  TCardTable = class(TCard)
  private

  public
    Table: TPanel;
    constructor Create(TheOwner: TControl);
  end;

  TPMTraits = specialize TFPGMap<string, string>;

  { TPMLeaf }

  TPMLeaf = class(TObject)
  private
    FID: string;
    FCategory: string;
    FParent: string;
    FOnChange: TNotifyEvent;
    FTraits: TPMTraits;
    function GetTitle: string;
  public
    constructor Create(ACategory: string); overload;
    constructor Create(AID, ACategory: string); overload;
    property ID: string read FID;
    property Title: string read GetTitle;
    property Parent: string read FParent write FParent;
    property Category: string read FCategory;
    property Traits: TPMTraits read FTraits write FTraits;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    function  GetTrait(AKey: string): string;
    function  GetTrait(AIndex: integer): string;
    procedure SetTrait(AKey, AValue: string); overload;
    procedure SetTrait(AKeyValue: string); overload;
  end;

var

  TPMBasicDice : TCSVDocument;
  TPMBeasts : TCSVDocument;
  TPMMonsters : TCSVDocument;
  TPMHumanoids : TCSVDocument;
  TPMConsumables : TCSVDocument;
  TPMSpells : TCSVDocument;

  TPMNamesLast : TStringList;
  TPMNamesFirst: TStringList;
  TPMSettlementEvents : TStringList;
  TPMWildernessEvents : TStringList;
  TPMVerbs : TStringList;
  TPMRumor : TStringList;
  TPMKits : TStringList;
  TPMTools : TStringList;
  TPMClothing : TStringList;
  TPMContainers : TStringList;
  TPMWeapons : TStringList;
  TPMVehicle : TStringList;
  TPMJewelry : TStringList;
  TPMRemains : TStringList;
  TPMInstruments: TStringList;
  TPMArmors : TStringList;
  TPMTraps : TStringList;
  TPMMounts : TStringList;
  TPMGems : TStringList;
  TPMNatural: TStringList;
  TPMUnnatural: TStringList;
  TPMFlora: TStringList;
  TPMFauna: TStringList;
  TPMConditions: TStringList;

  TPMChamberClasses: TStringList;
  TPMTractClasses: TStringList;
  TPMRoomClasses: TStringList;
  TPMDungeonClasses: TStringList;
  TPMLevelClasses: TStringList;
  TPMWildernessClasses: TStringList;
  TPMRouteClasses: TStringList;
  TPMSettlementClasses: TStringList;
  TPMVenueClasses: TStringList;
  TPMFloorClasses: TStringList;
  TPMConsumableClasses: TStringList;
  TPMBeastClasses: TStringList;
  TPMMonsterClasses: TStringList;
  TPMHumanoidClasses: TStringList;

  TPMAdventureThemes: TStringList;
  TPMAdventureGoals: TStringList;
  TPMAdventureStoryHooks: TStringList;
  TPMAdventureSettingGenerals: TStringList;
  TPMAdventureSettingSpecifics: TStringList;
  TPMAdventureStartPoints: TStringList;
  TPMAdventureBosses: TStringList;
  TPMAdventureLieutenants: TStringList;
  TPMAdventureAllyNeutral: TStringList;
  TPMAdventurePlots: TStringList;
  TPMAdventureClimaxes: TStringList;
  TPMAdventureMonsterEncounters: TStringList;
  TPMAdventureCharacterEncounters: TStringList;
  TPMAdventureDeathTraps: TStringList;
  TPMAdventureChases: TStringList;
  TPMAdventureOmenProphecys: TStringList;
  TPMAdventureSecretWeaknesses: TStringList;
  TPMAdventureSpecialConditions: TStringList;
  TPMAdventureMoralQuandrys: TStringList;
  TPMAdventureRedHerrings: TStringList;
  TPMAdventureCruelTricks: TStringList;

implementation

{ TCardTable }

constructor TCardTable.Create(TheOwner: TControl);
begin
  inherited Create(TheOwner);

  Table := TPanel.Create(Self);
  Table.Parent := Self;
  Table.Show;
  Table.Align := alTop;
  Table.AutoSize := true;
  Table.BorderSpacing.Around := 12;
  Table.BevelOuter := bvNone;
  Table.ChildSizing.ControlsPerLine := 1;
  Table.ChildSizing.Layout := cclLeftToRightThenTopToBottom;
  Table.ChildSizing.EnlargeHorizontal := crsHomogenousChildResize;
  Table.Top := Self.Height;

end;

{ TCardMessage }

constructor TCardMessage.Create(TheOwner: TControl);
begin
  inherited Create(TheOwner);

  Message := TLabel.Create(Self);
  Message.Parent := Self;
  Message.Align := alTop;
  Message.Layout := tlCenter;
  Message.ShowAccelChar := false;
  Message.BorderSpacing.Around := 12;
  Message.Top := Self.Height;
  Message.ParentFont := true;
end;

{ TCard }

constructor TCard.Create(TheOwner: TControl);
begin
  inherited Create(TheOwner);

  AutoSize := true;
  BevelOuter := bvNone;
  BorderSpacing.Around := 12;

  Title := TLabel.Create(Self);
  Title.Parent := Self;
  Title.Align := alTop;
  Title.Layout := tlCenter;
  Title.ShowAccelChar := false;
  Title.BorderSpacing.Around := 12;

end;

procedure TCard.Paint;
begin
  inherited Paint;

  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Color := Font.Color;
  Canvas.Rectangle(0, 0, Width - 1, Height - 1);
end;


{ TPMLeaf }

function TPMLeaf.GetTitle: string;
var
  str: string;
begin

  if FCategory = 'Player' then
  begin
    if GetTrait('Character') <> '' then
      str := GetTrait('Character')
    else
      str := 'Untitled';

    if GetTrait('Player') <> '' then
      str := str + ' [' + GetTrait('Player') + ']'
    else
      str := str + ' [Player Name]';
  end
  else if FCategory = 'Puppet' then
    str := Format('%s %s', [Trim(GetTrait('FirstName')), Trim(GetTrait('LastName'))])
  else
    str := Format('%s', [GetTrait('Title')]);

  result := str;
end;

constructor TPMLeaf.Create(ACategory: string);
var
  guid: TGuid;
begin
  CreateGUID(guid);

  FTraits := TPMTraits.Create;
  FID := guid.ToString(true);
  FCategory := ACategory;
  FTraits.AddOrSetData('Title', ACategory);

  if FCategory = 'Player' then
    FTraits.AddOrSetData('Character', 'Untitled Player')
  else if FCategory = 'Settlement' then
    FTraits.AddOrSetData('Title', 'Untitled Settlement')
  else if FCategory = 'Venue' then
    FTraits.AddOrSetData('Title', 'Untitled Venue')
  else if FCategory = 'Room' then
    FTraits.AddOrSetData('Title', 'Untitled Room')
  else if FCategory = 'Floor' then
    FTraits.AddOrSetData('Title', 'Untitled Floor')
  else if FCategory = 'Puppet' then
  begin
    FTraits.AddOrSetData('FirstName', 'FirstName');
    FTraits.AddOrSetData('LastName', 'LastName');
  end
  else if FCategory = 'Adventure' then
    FTraits.AddOrSetData('Title', 'Untitled Adventure')
  else if FCategory = 'Dungeon' then
    FTraits.AddOrSetData('Title', 'Untitled Dungeon')
  else if FCategory = 'Level' then
    FTraits.AddOrSetData('Title', 'Untitled Level')
  else if FCategory = 'Chamber' then
    FTraits.AddOrSetData('Title', 'Untitled Chamber')
  else if FCategory = 'Wilderness' then
    FTraits.AddOrSetData('Title', 'Untitled Widlerness')
  else if FCategory = 'Route' then
    FTraits.AddOrSetData('Title', 'Untitled Route')
  else if FCategory = 'Tract' then
    FTraits.AddOrSetData('Title', 'Untitled Tract')
  else if FCategory = 'DiceTray' then
    FTraits.AddOrSetData('Title', 'Dice Tray')
  else if FCategory = 'Dice' then
    FTraits.AddOrSetData('Title', 'Untitled Dice')
  else if FCategory = 'Faction' then
    FTraits.AddOrSetData('Title', 'Untitled Faction');
end;

constructor TPMLeaf.Create(AID, ACategory: string);
begin
  Create(ACategory);
  FID := AID;
end;

function TPMLeaf.GetTrait(AKey: string): string;
var
  val: string;
begin
  val := '';
  FTraits.TryGetData(AKey, val);
  result := val;
end;

function TPMLeaf.GetTrait(AIndex: integer): string;
var
  str: string;
begin
  str := Trim(Format('%s:%s', [FTraits.Keys[AIndex], FTraits.Data[AIndex]]));
  if str = ':' then str := '';
  result := str;
end;

procedure TPMLeaf.SetTrait(AKey, AValue: string);
begin
  FTraits.AddOrSetData(AKey, AValue);
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TPMLeaf.SetTrait(AKeyValue: string);
var
  sa: TStringArray;
  key, val: string;
begin
  sa := AKeyValue.Split(':');
  key := sa[0];
  val := sa[1];
  SetTrait(key, val);
end;

initialization


end.

