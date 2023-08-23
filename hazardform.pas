unit hazardform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmHazard }

  TfrmHazard = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    FSettlement: TStringList;
    FWilderness: TStringList;
    FDungeon: TStringList;
    FCombat: TStringList;
  public

  end;

var
  frmHazard: TfrmHazard;

implementation

{$R *.lfm}

{ TfrmHazard }

procedure TfrmHazard.FormCreate(Sender: TObject);
begin

  //Spoor = track or trail of an animal or person

  FSettlement := TStringList.Create;
  FSettlement.Add('Encounter (use regional table) or disaster (see below)');
  FSettlement.Add('Shortage (1 medicine, 2-3 drought, 4-5 famine, 6 trust)');
  FSettlement.Add('Clear one or more haven conditions');
  FSettlement.Add('Advance season (or other local change)');
  FSettlement.Add('Foreshadow looming disaster');
  FSettlement.Add('Full recovery');

  FWilderness := TStringList.Create;
  FWilderness.Add('Encounter (use regional table) or road/bridge out');
  FWilderness.Add('Rest and consume rations (1/person) or suffer minor harm (1 HP)');
  FWilderness.Add('Expire transient wilderness condition');
  FWilderness.Add('Shift weather (or other local change)');
  FWilderness.Add('Spoor or clue regarding next encounter');
  FWilderness.Add('Free wilderness turn');

  FDungeon := TStringList.Create;
  FDungeon.Add('Encounter (use zone table)');
  FDungeon.Add('Rest and consume rations (1/party) or suffer minor harm (1 HP)');
  FDungeon.Add('Expire transient dungeon conditions (light, spell, etc)');
  FDungeon.Add('Shift dungeon state (or other local change)');
  FDungeon.Add('Spoor or clue regarding next encounter');
  FDungeon.Add('Free dungeon turn');

  FCombat := TStringList.Create;
  FCombat.Add('Opponents act first or additional encounter (use zone table)');
  FCombat.Add('Suffer minor harm (1 HP) if engaged in melee');
  FCombat.Add('Expire transient combat conditions (light, burning, etc)');
  FCombat.Add('Shift battlefield (or other local change)');
  FCombat.Add('Spoor or clue regarding next encounter');
  FCombat.Add('Free combat turn');

end;

end.

