unit puppetmasterlib;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, fgl, csvdocument, StrUtils,
  StdCtrls, ExtCtrls, htmlcolors, Buttons;

type

  { TTrait }

  TTrait = class(TPanel)
  private
    FDelete: TSpeedButton;
    FLabel: TLabel;
    procedure Delete(Sender: TObject);
  public
    constructor Create(TheOwner: TComponent); override;
    property Caption: TLabel read FLabel write FLabel;
  end;

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

  TTraits = specialize TFPGMap<string, string>;

  { TLeaf }

  TLeaf = class(TObject)
  private
    FID: string;
    FCategory: string;
    FParent: string;
    FOnChange: TNotifyEvent;
    FTraits: TTraits;
  public
    constructor Create(ACategory: string); overload;
    constructor Create(AID, ACategory: string); overload;
    property ID: string read FID;
    property Parent: string read FParent write FParent;
    property Category: string read FCategory;
    property Traits: TTraits read FTraits write FTraits;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    procedure SetTrait(AKey, AValue: string); overload;
    procedure SetTrait(AKeyValue: string); overload;
    function GetTrait(AKey: string): string; overload;
    function GetTrait(AIndex: integer): string; overload;
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

{ TTrait }

procedure TTrait.Delete(Sender: TObject);
begin
  TSpeedButton(Sender).Parent.Free;
end;

constructor TTrait.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);

  Self.AutoSize := true;
  Self.BevelOuter := bvNone;
  Self.BorderStyle := bsSingle;
  Self.BorderSpacing.Around := 8;
  Self.Constraints.MaxHeight := 48;

  FDelete := TSpeedButton.Create(Self);
  FDelete.Parent := Self;
  FDelete.Align := alRight;
  FDelete.Width := 32;
  FDelete.Caption := 'X';
  FDelete.BorderSpacing.Around := 8;
  FDelete.OnClick := @Delete;

  FLabel := TLabel.Create(Self);
  FLabel.Parent := Self;
  FLabel.Align := alClient;
  FLabel.Layout := tlCenter;
  FLabel.AutoSize := true;
  FLabel.WordWrap := false;
  FLabel.BorderSpacing.Around := 8;

end;

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
  Align := alTop;

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


{ TLeaf }

constructor TLeaf.Create(ACategory: string);
var
  guid: TGuid;
begin
  CreateGUID(guid);

  FTraits := TTraits.Create;
  FID := guid.ToString(true);
  FCategory := ACategory;
  FTraits.AddOrSetData('Title', Format('Untitled %s', [ACategory]));
end;

constructor TLeaf.Create(AID, ACategory: string);
begin
  Create(ACategory);
  FID := AID;
end;

procedure TLeaf.SetTrait(AKey, AValue: string);
begin
  FTraits.AddOrSetData(AKey, AValue);
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TLeaf.SetTrait(AKeyValue: string);
var
  ary: TStringArray;
begin
  ary := AKeyValue.Split(':');
  SetTrait(ary[0], ary[1]);
end;

function TLeaf.GetTrait(AKey: string): string;
var
  val: string;
begin
  val := '';
  FTraits.TryGetData(AKey, val);
  result := val;
end;

function TLeaf.GetTrait(AIndex: integer): string;
var
  keyval: string;
begin
  keyval := '';
  if (AIndex >= 0) and (AIndex < FTraits.Count) then
    keyval := Format('%s:%s', [FTraits.Keys[AIndex], FTraits.Data[AIndex]]);
  result := keyval;
end;

initialization


end.

