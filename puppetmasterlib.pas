unit puppetmasterlib;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl, csvdocument, StrUtils;

type

  TPMTraits = specialize TFPGMap<string, string>;

  { TPMLeaf }

  TPMLeaf = class(TObject)
  private
    FCategory: string;
    FParent: string;
    FOnChange: TNotifyEvent;
    FTraits: TPMTraits;
    function GetTitle: string;
  public
    constructor Create(ACategory: string);
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
  TPMSettlementEvents: TStringList;
  TPMWildernessEvents: TStringList;
  TPMSituationVerbs: TStringList;

  TPMNamesLast: TStringList;
  TPMNamesFirst: TStringList;

  TPMRumor: TStringList;

  TPMBasicDice : array of array of string;


implementation

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
  begin
    str := Trim(GetTrait('FirstName') + ' ' + GetTrait('LastName'));
  end
  else
    str := GetTrait('Title');

  result := str;
end;

constructor TPMLeaf.Create(ACategory: string);
begin
  FTraits := TPMTraits.Create;
  FCategory := ACategory;

  if FCategory = 'Player' then
    FTraits.AddOrSetData('Character', 'Untitled Player')
  else if FCategory = 'Settlement' then
    FTraits.AddOrSetData('Title', 'Untitled Settlement')
  else if FCategory = 'Venue' then
    FTraits.AddOrSetData('Title', 'Untitled Venue')
  else if FCategory = 'Room' then
    FTraits.AddOrSetData('Title', 'Untitled Room')
  else if FCategory = 'Puppet' then
  begin
    FTraits.AddOrSetData('FirstName', 'FirstName');
    FTraits.AddOrSetData('LastName', 'LastName');
  end
  else if FCategory = 'Dice' then
    FTraits.AddOrSetData('Title', 'Untitled Dice')
  else if FCategory = 'Dungeon' then
    FTraits.AddOrSetData('Title', 'Untitled Dungeon')
  else if FCategory = 'Wilderness' then
    FTraits.AddOrSetData('Title', 'Untitled Widlerness')
  else if FCategory = 'Tract' then
    FTraits.AddOrSetData('Title', 'Untitled Tract')
  else if FCategory = 'Chamber' then
    FTraits.AddOrSetData('Title', 'Untitled Chamber')
  else if FCategory = 'Campaign' then
    FTraits.AddOrSetData('Title', 'Campaign')
  else if FCategory = 'Dungeons' then
    FTraits.AddOrSetData('Title', 'Dungeons')
  else if FCategory = 'Chambers' then
    FTraits.AddOrSetData('Title', 'Chambers')
  else if FCategory = 'Factions' then
    FTraits.AddOrSetData('Title', 'Factions')
  else if FCategory = 'Wildernesses' then
    FTraits.AddOrSetData('Title', 'Wildernesses')
  else if FCategory = 'Tracts' then
    FTraits.AddOrSetData('Title', 'Tracts')
  else if FCategory = 'Venues' then
    FTraits.AddOrSetData('Title', 'Venues')
  else if FCategory = 'Settlements' then
    FTraits.AddOrSetData('Title', 'Settlements')
  else if FCategory = 'DiceTray' then
    FTraits.AddOrSetData('Title', 'Dice Tray');
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

TPMSettlementEvents := TStringList.Create;
TPMSettlementEvents.Sorted := true;
TPMSettlementEvents.Add('alefest');
TPMSettlementEvents.Add('amnesty');
TPMSettlementEvents.Add('assassination');
TPMSettlementEvents.Add('busker performance');
TPMSettlementEvents.Add('hero’s return');
TPMSettlementEvents.Add('co-ordinated attack');
TPMSettlementEvents.Add('wizard conference');
TPMSettlementEvents.Add('dimensional disruption');
TPMSettlementEvents.Add('earthquake');
TPMSettlementEvents.Add('election / civic leader change');
TPMSettlementEvents.Add('festival');
TPMSettlementEvents.Add('building fire');
TPMSettlementEvents.Add('flood');
TPMSettlementEvents.Add('freakish weather');
TPMSettlementEvents.Add('graduation ceremony');
TPMSettlementEvents.Add('gridlocked traffic');
TPMSettlementEvents.Add('harvest festival');
TPMSettlementEvents.Add('invading force');
TPMSettlementEvents.Add('large army passing through town');
TPMSettlementEvents.Add('large scale fire');
TPMSettlementEvents.Add('local army returning after recent skirmish');
TPMSettlementEvents.Add('market day');
TPMSettlementEvents.Add('martial law enacted');
TPMSettlementEvents.Add('military conscription');
TPMSettlementEvents.Add('monster invasion');
TPMSettlementEvents.Add('museum exhibition');
TPMSettlementEvents.Add('musical concert');
TPMSettlementEvents.Add('name-giving day celebrations');
TPMSettlementEvents.Add('new building being opened');
TPMSettlementEvents.Add('notable local figure assassinated');
TPMSettlementEvents.Add('official proclamation');
TPMSettlementEvents.Add('orator / storyteller ');
TPMSettlementEvents.Add('play performance');
TPMSettlementEvents.Add('plague');
TPMSettlementEvents.Add('procession');
TPMSettlementEvents.Add('procession, royal');
TPMSettlementEvents.Add('protest');
TPMSettlementEvents.Add('public duel');
TPMSettlementEvents.Add('public execution');
TPMSettlementEvents.Add('public holiday');
TPMSettlementEvents.Add('religious rally');
TPMSettlementEvents.Add('revolution');
TPMSettlementEvents.Add('sinkhole');
TPMSettlementEvents.Add('storm');
TPMSettlementEvents.Add('winds');
TPMSettlementEvents.Add('traffic accident');
TPMSettlementEvents.Add('warrior exhibition');
TPMSettlementEvents.Add('wedding');
TPMSettlementEvents.Add('wild magic eruption');
TPMSettlementEvents.Add('Nothing');

TPMWildernessEvents := TStringList.Create;
TPMWildernessEvents.Sorted := true;
TPMWildernessEvents.Add('animal stampede');
TPMWildernessEvents.Add('tyrant');
TPMWildernessEvents.Add('army encamped');
TPMWildernessEvents.Add('avalanche');
TPMWildernessEvents.Add('battle');
TPMWildernessEvents.Add('beast carcass');
TPMWildernessEvents.Add('besieged settlement');
TPMWildernessEvents.Add('boulder falls');
TPMWildernessEvents.Add('cart passing');
TPMWildernessEvents.Add('structure');
TPMWildernessEvents.Add('distressed npc');
TPMWildernessEvents.Add('druid gathering');
TPMWildernessEvents.Add('earthquake');
TPMWildernessEvents.Add('farmers harvesting crops');
TPMWildernessEvents.Add('flash flood');
TPMWildernessEvents.Add('forest fire');
TPMWildernessEvents.Add('gale winds');
TPMWildernessEvents.Add('hail storm');
TPMWildernessEvents.Add('hunting party');
TPMWildernessEvents.Add('hurricane');
TPMWildernessEvents.Add('interdimensional rift');
TPMWildernessEvents.Add('landslide');
TPMWildernessEvents.Add('lightning strikes');
TPMWildernessEvents.Add('local humanoids having a festival');
TPMWildernessEvents.Add('marauding monster attacking village');
TPMWildernessEvents.Add('market');
TPMWildernessEvents.Add('massed animals');
TPMWildernessEvents.Add('monster carcass');
TPMWildernessEvents.Add('overturned cart');
TPMWildernessEvents.Add('plague (insect / vermin)');
TPMWildernessEvents.Add('refugees');
TPMWildernessEvents.Add('religious pilgrimage');
TPMWildernessEvents.Add('savage raiding party');
TPMWildernessEvents.Add('sinkhole appears');
TPMWildernessEvents.Add('solar eclipse');
TPMWildernessEvents.Add('storm');
TPMWildernessEvents.Add('sudden storm');
TPMWildernessEvents.Add('toll demanded');
TPMWildernessEvents.Add('tree falls');
TPMWildernessEvents.Add('tribal encounter');
TPMWildernessEvents.Add('undead awakening');
TPMWildernessEvents.Add('unmarked settlement');
TPMWildernessEvents.Add('unseasonable weather');
TPMWildernessEvents.Add('volcanic eruption');

TPMSituationVerbs := TStringList.Create;
TPMSituationVerbs.Sorted := true;
TPMSituationVerbs.Add('abandon');
TPMSituationVerbs.Add('abolish');
TPMSituationVerbs.Add('abuse');
TPMSituationVerbs.Add('accuse');
TPMSituationVerbs.Add('address');
TPMSituationVerbs.Add('aggravate');
TPMSituationVerbs.Add('agitate');
TPMSituationVerbs.Add('aid');
TPMSituationVerbs.Add('aim');
TPMSituationVerbs.Add('alarm');
TPMSituationVerbs.Add('alert');
TPMSituationVerbs.Add('alter');
TPMSituationVerbs.Add('amaze');
TPMSituationVerbs.Add('ambush');
TPMSituationVerbs.Add('amuse');
TPMSituationVerbs.Add('annihilate');
TPMSituationVerbs.Add('annoy');
TPMSituationVerbs.Add('antagonize');
TPMSituationVerbs.Add('appeal');
TPMSituationVerbs.Add('applaud');
TPMSituationVerbs.Add('apprehend');
TPMSituationVerbs.Add('approach');
TPMSituationVerbs.Add('argue');
TPMSituationVerbs.Add('arise');
TPMSituationVerbs.Add('arouse');
TPMSituationVerbs.Add('arrange');
TPMSituationVerbs.Add('arrest');
TPMSituationVerbs.Add('ask');
TPMSituationVerbs.Add('assassinate');
TPMSituationVerbs.Add('assault');
TPMSituationVerbs.Add('assemble');
TPMSituationVerbs.Add('astonish');
TPMSituationVerbs.Add('attack');
TPMSituationVerbs.Add('attempt');
TPMSituationVerbs.Add('attend');
TPMSituationVerbs.Add('auction');
TPMSituationVerbs.Add('audition');
TPMSituationVerbs.Add('avenge');
TPMSituationVerbs.Add('avert');
TPMSituationVerbs.Add('babble');
TPMSituationVerbs.Add('badmouth');
TPMSituationVerbs.Add('bait');
TPMSituationVerbs.Add('ban');
TPMSituationVerbs.Add('banish');
TPMSituationVerbs.Add('baptize');
TPMSituationVerbs.Add('bargain');
TPMSituationVerbs.Add('bark');
TPMSituationVerbs.Add('barricade');
TPMSituationVerbs.Add('barter');
TPMSituationVerbs.Add('bash');
TPMSituationVerbs.Add('bawl');
TPMSituationVerbs.Add('beautify');
TPMSituationVerbs.Add('beckon');
TPMSituationVerbs.Add('befriend');
TPMSituationVerbs.Add('beg');
TPMSituationVerbs.Add('beguile');
TPMSituationVerbs.Add('belch');
TPMSituationVerbs.Add('belittle');
TPMSituationVerbs.Add('bellow');
TPMSituationVerbs.Add('bemoan');
TPMSituationVerbs.Add('bequeath');
TPMSituationVerbs.Add('berate');
TPMSituationVerbs.Add('besiege');
TPMSituationVerbs.Add('bestow');
TPMSituationVerbs.Add('bet');
TPMSituationVerbs.Add('betray');
TPMSituationVerbs.Add('bewilder');
TPMSituationVerbs.Add('bewitch');
TPMSituationVerbs.Add('bid');
TPMSituationVerbs.Add('bite');
TPMSituationVerbs.Add('blab');
TPMSituationVerbs.Add('blame');
TPMSituationVerbs.Add('blast');
TPMSituationVerbs.Add('bleed');
TPMSituationVerbs.Add('bless');
TPMSituationVerbs.Add('blunder');
TPMSituationVerbs.Add('blurt');
TPMSituationVerbs.Add('boast');
TPMSituationVerbs.Add('bother');
TPMSituationVerbs.Add('bow');
TPMSituationVerbs.Add('brag');
TPMSituationVerbs.Add('break');
TPMSituationVerbs.Add('bribe');
TPMSituationVerbs.Add('broadcast');
TPMSituationVerbs.Add('build');
TPMSituationVerbs.Add('capture');
TPMSituationVerbs.Add('careen');
TPMSituationVerbs.Add('caress');
TPMSituationVerbs.Add('carry');
TPMSituationVerbs.Add('carve');
TPMSituationVerbs.Add('catch');
TPMSituationVerbs.Add('celebrate');
TPMSituationVerbs.Add('challenge');
TPMSituationVerbs.Add('charm');
TPMSituationVerbs.Add('chase');
TPMSituationVerbs.Add('cheat');
TPMSituationVerbs.Add('choke');
TPMSituationVerbs.Add('claim');
TPMSituationVerbs.Add('climb');
TPMSituationVerbs.Add('collaborate');
TPMSituationVerbs.Add('collapse');
TPMSituationVerbs.Add('collide');
TPMSituationVerbs.Add('command');
TPMSituationVerbs.Add('complain');
TPMSituationVerbs.Add('compliment');
TPMSituationVerbs.Add('conceal');
TPMSituationVerbs.Add('concoct');
TPMSituationVerbs.Add('condemn');
TPMSituationVerbs.Add('confiscate');
TPMSituationVerbs.Add('conflict');
TPMSituationVerbs.Add('confront');
TPMSituationVerbs.Add('confuse');
TPMSituationVerbs.Add('congratulate');
TPMSituationVerbs.Add('congregate');
TPMSituationVerbs.Add('conjure');
TPMSituationVerbs.Add('consecrate');
TPMSituationVerbs.Add('consider');
TPMSituationVerbs.Add('construct');
TPMSituationVerbs.Add('contact');
TPMSituationVerbs.Add('contaminate');
TPMSituationVerbs.Add('contest');
TPMSituationVerbs.Add('cook');
TPMSituationVerbs.Add('corner');
TPMSituationVerbs.Add('corrupt');
TPMSituationVerbs.Add('cremate');
TPMSituationVerbs.Add('crowd');
TPMSituationVerbs.Add('crown');
TPMSituationVerbs.Add('customize');
TPMSituationVerbs.Add('damage');
TPMSituationVerbs.Add('dance');
TPMSituationVerbs.Add('dare');
TPMSituationVerbs.Add('dash');
TPMSituationVerbs.Add('dazzle');
TPMSituationVerbs.Add('deal');
TPMSituationVerbs.Add('debate');
TPMSituationVerbs.Add('decay');
TPMSituationVerbs.Add('deceive');
TPMSituationVerbs.Add('declare');
TPMSituationVerbs.Add('decline');
TPMSituationVerbs.Add('decompose');
TPMSituationVerbs.Add('decorate');
TPMSituationVerbs.Add('decree');
TPMSituationVerbs.Add('dedicate');
TPMSituationVerbs.Add('deduce');
TPMSituationVerbs.Add('deface');
TPMSituationVerbs.Add('defeat');
TPMSituationVerbs.Add('defend');
TPMSituationVerbs.Add('defuse');
TPMSituationVerbs.Add('deliver');
TPMSituationVerbs.Add('demand');
TPMSituationVerbs.Add('demolish');
TPMSituationVerbs.Add('denounce');
TPMSituationVerbs.Add('deride');
TPMSituationVerbs.Add('despair');
TPMSituationVerbs.Add('destroy');
TPMSituationVerbs.Add('devour');
TPMSituationVerbs.Add('dig');
TPMSituationVerbs.Add('disappear');
TPMSituationVerbs.Add('disarm');
TPMSituationVerbs.Add('discipline');
TPMSituationVerbs.Add('discover');
TPMSituationVerbs.Add('discriminate');
TPMSituationVerbs.Add('discuss');
TPMSituationVerbs.Add('disgrace');
TPMSituationVerbs.Add('disguise');
TPMSituationVerbs.Add('disgust');
TPMSituationVerbs.Add('dishonor');
TPMSituationVerbs.Add('dismount');
TPMSituationVerbs.Add('dispel');
TPMSituationVerbs.Add('disperse');
TPMSituationVerbs.Add('display');
TPMSituationVerbs.Add('displease');
TPMSituationVerbs.Add('dispute');
TPMSituationVerbs.Add('disrespect');
TPMSituationVerbs.Add('disrupt');
TPMSituationVerbs.Add('distill');
TPMSituationVerbs.Add('distress');
TPMSituationVerbs.Add('disturb');
TPMSituationVerbs.Add('divert');
TPMSituationVerbs.Add('dodge');
TPMSituationVerbs.Add('drag');
TPMSituationVerbs.Add('dress');
TPMSituationVerbs.Add('drink');
TPMSituationVerbs.Add('drop');
TPMSituationVerbs.Add('drown');
TPMSituationVerbs.Add('drum');
TPMSituationVerbs.Add('dump');
TPMSituationVerbs.Add('dupe');
TPMSituationVerbs.Add('duplicate');
TPMSituationVerbs.Add('earn');
TPMSituationVerbs.Add('eat');
TPMSituationVerbs.Add('elude');
TPMSituationVerbs.Add('employ');
TPMSituationVerbs.Add('enchant');
TPMSituationVerbs.Add('end');
TPMSituationVerbs.Add('endanger');
TPMSituationVerbs.Add('endear');
TPMSituationVerbs.Add('endorse');
TPMSituationVerbs.Add('enforce');
TPMSituationVerbs.Add('engage');
TPMSituationVerbs.Add('engineer');
TPMSituationVerbs.Add('enjoy');
TPMSituationVerbs.Add('enlarge');
TPMSituationVerbs.Add('enlighten');
TPMSituationVerbs.Add('enlist');
TPMSituationVerbs.Add('enquire');
TPMSituationVerbs.Add('enrage');
TPMSituationVerbs.Add('enrich');
TPMSituationVerbs.Add('enroll');
TPMSituationVerbs.Add('enshrine');
TPMSituationVerbs.Add('ensnare');
TPMSituationVerbs.Add('entangle');
TPMSituationVerbs.Add('enter');
TPMSituationVerbs.Add('entertain');
TPMSituationVerbs.Add('entice');
TPMSituationVerbs.Add('erect');
TPMSituationVerbs.Add('escape');
TPMSituationVerbs.Add('escort');
TPMSituationVerbs.Add('evacuate');
TPMSituationVerbs.Add('evade');
TPMSituationVerbs.Add('evict');
TPMSituationVerbs.Add('exaggerate');
TPMSituationVerbs.Add('examine');
TPMSituationVerbs.Add('excavate');
TPMSituationVerbs.Add('exchange');
TPMSituationVerbs.Add('exclaim');
TPMSituationVerbs.Add('exclude');
TPMSituationVerbs.Add('execute');
TPMSituationVerbs.Add('exhibit');
TPMSituationVerbs.Add('experiment');
TPMSituationVerbs.Add('explode');
TPMSituationVerbs.Add('expose');
TPMSituationVerbs.Add('faint');
TPMSituationVerbs.Add('fake');
TPMSituationVerbs.Add('fall');
TPMSituationVerbs.Add('falsify');
TPMSituationVerbs.Add('fashion');
TPMSituationVerbs.Add('flaunt');
TPMSituationVerbs.Add('flee');
TPMSituationVerbs.Add('fling');
TPMSituationVerbs.Add('flirt');
TPMSituationVerbs.Add('follow');
TPMSituationVerbs.Add('force');
TPMSituationVerbs.Add('foresee');
TPMSituationVerbs.Add('foretell');
TPMSituationVerbs.Add('forge');
TPMSituationVerbs.Add('forgive');
TPMSituationVerbs.Add('fracture');
TPMSituationVerbs.Add('frame');
TPMSituationVerbs.Add('free');
TPMSituationVerbs.Add('freeze');
TPMSituationVerbs.Add('fret');
TPMSituationVerbs.Add('frighten');
TPMSituationVerbs.Add('frustrate');
TPMSituationVerbs.Add('fumble');
TPMSituationVerbs.Add('fund');
TPMSituationVerbs.Add('fuss');
TPMSituationVerbs.Add('gallop');
TPMSituationVerbs.Add('gamble');
TPMSituationVerbs.Add('gather');
TPMSituationVerbs.Add('gaze');
TPMSituationVerbs.Add('gesture');
TPMSituationVerbs.Add('gift');
TPMSituationVerbs.Add('giggle');
TPMSituationVerbs.Add('give');
TPMSituationVerbs.Add('glare');
TPMSituationVerbs.Add('gleam');
TPMSituationVerbs.Add('glimpse');
TPMSituationVerbs.Add('goad');
TPMSituationVerbs.Add('gob');
TPMSituationVerbs.Add('goggle');
TPMSituationVerbs.Add('gossip');
TPMSituationVerbs.Add('grab');
TPMSituationVerbs.Add('grapple');
TPMSituationVerbs.Add('grieve');
TPMSituationVerbs.Add('guard');
TPMSituationVerbs.Add('hamper');
TPMSituationVerbs.Add('harass');
TPMSituationVerbs.Add('harm');
TPMSituationVerbs.Add('help');
TPMSituationVerbs.Add('hide');
TPMSituationVerbs.Add('hit');
TPMSituationVerbs.Add('hold');
TPMSituationVerbs.Add('humiliate');
TPMSituationVerbs.Add('hurry');
TPMSituationVerbs.Add('hurtle');
TPMSituationVerbs.Add('ignite');
TPMSituationVerbs.Add('impede');
TPMSituationVerbs.Add('implore');
TPMSituationVerbs.Add('imprison');
TPMSituationVerbs.Add('infect');
TPMSituationVerbs.Add('infest');
TPMSituationVerbs.Add('inflame');
TPMSituationVerbs.Add('inflict');
TPMSituationVerbs.Add('inform');
TPMSituationVerbs.Add('infringe');
TPMSituationVerbs.Add('infuriate');
TPMSituationVerbs.Add('injure');
TPMSituationVerbs.Add('inspect');
TPMSituationVerbs.Add('inspire');
TPMSituationVerbs.Add('instigate');
TPMSituationVerbs.Add('insult');
TPMSituationVerbs.Add('interfere');
TPMSituationVerbs.Add('interrogate');
TPMSituationVerbs.Add('intimidate');
TPMSituationVerbs.Add('intoxicate');
TPMSituationVerbs.Add('investigate');
TPMSituationVerbs.Add('invite');
TPMSituationVerbs.Add('involve');
TPMSituationVerbs.Add('irritate');
TPMSituationVerbs.Add('jaywalk');
TPMSituationVerbs.Add('jeer');
TPMSituationVerbs.Add('joke');
TPMSituationVerbs.Add('jostle');
TPMSituationVerbs.Add('kick');
TPMSituationVerbs.Add('kill');
TPMSituationVerbs.Add('kiss');
TPMSituationVerbs.Add('lament');
TPMSituationVerbs.Add('laugh');
TPMSituationVerbs.Add('leap');
TPMSituationVerbs.Add('lecture');
TPMSituationVerbs.Add('leer');
TPMSituationVerbs.Add('look');
TPMSituationVerbs.Add('loot');
TPMSituationVerbs.Add('lose');
TPMSituationVerbs.Add('love');
TPMSituationVerbs.Add('lunge');
TPMSituationVerbs.Add('lurk');
TPMSituationVerbs.Add('maim');
TPMSituationVerbs.Add('manhandle');
TPMSituationVerbs.Add('march');
TPMSituationVerbs.Add('market');
TPMSituationVerbs.Add('massacre');
TPMSituationVerbs.Add('meddle');
TPMSituationVerbs.Add('mesmerize');
TPMSituationVerbs.Add('mimic');
TPMSituationVerbs.Add('misspell');
TPMSituationVerbs.Add('mob');
TPMSituationVerbs.Add('mock');
TPMSituationVerbs.Add('murder');
TPMSituationVerbs.Add('mutate');
TPMSituationVerbs.Add('mutilate');
TPMSituationVerbs.Add('nag');
TPMSituationVerbs.Add('narrate');
TPMSituationVerbs.Add('near');
TPMSituationVerbs.Add('notify');
TPMSituationVerbs.Add('obscure');
TPMSituationVerbs.Add('observe');
TPMSituationVerbs.Add('obstruct');
TPMSituationVerbs.Add('offend');
TPMSituationVerbs.Add('oppress');
TPMSituationVerbs.Add('order');
TPMSituationVerbs.Add('overhear');
TPMSituationVerbs.Add('overpower');
TPMSituationVerbs.Add('overturn');
TPMSituationVerbs.Add('parade');
TPMSituationVerbs.Add('parley');
TPMSituationVerbs.Add('patrol');
TPMSituationVerbs.Add('pelt');
TPMSituationVerbs.Add('penalize');
TPMSituationVerbs.Add('perform');
TPMSituationVerbs.Add('persecute');
TPMSituationVerbs.Add('persuade');
TPMSituationVerbs.Add('petition');
TPMSituationVerbs.Add('play');
TPMSituationVerbs.Add('plead');
TPMSituationVerbs.Add('plunder');
TPMSituationVerbs.Add('pollute');
TPMSituationVerbs.Add('pounce');
TPMSituationVerbs.Add('practice');
TPMSituationVerbs.Add('praise');
TPMSituationVerbs.Add('preach');
TPMSituationVerbs.Add('proclaim');
TPMSituationVerbs.Add('prohibit');
TPMSituationVerbs.Add('promote');
TPMSituationVerbs.Add('pronounce');
TPMSituationVerbs.Add('prophesize');
TPMSituationVerbs.Add('prosecute');
TPMSituationVerbs.Add('protect');
TPMSituationVerbs.Add('protest');
TPMSituationVerbs.Add('provide');
TPMSituationVerbs.Add('provoke');
TPMSituationVerbs.Add('prowl');
TPMSituationVerbs.Add('pry');
TPMSituationVerbs.Add('punch');
TPMSituationVerbs.Add('punish');
TPMSituationVerbs.Add('purchase');
TPMSituationVerbs.Add('pursue');
TPMSituationVerbs.Add('push');
TPMSituationVerbs.Add('quarrel');
TPMSituationVerbs.Add('query');
TPMSituationVerbs.Add('queue');
TPMSituationVerbs.Add('rage');
TPMSituationVerbs.Add('raid');
TPMSituationVerbs.Add('ransack');
TPMSituationVerbs.Add('rebel');
TPMSituationVerbs.Add('recite');
TPMSituationVerbs.Add('recount');
TPMSituationVerbs.Add('recruit');
TPMSituationVerbs.Add('rejoice');
TPMSituationVerbs.Add('remark');
TPMSituationVerbs.Add('renege');
TPMSituationVerbs.Add('repair');
TPMSituationVerbs.Add('research');
TPMSituationVerbs.Add('rescue');
TPMSituationVerbs.Add('resist');
TPMSituationVerbs.Add('restrain');
TPMSituationVerbs.Add('resurrect');
TPMSituationVerbs.Add('reveal');
TPMSituationVerbs.Add('revolt');
TPMSituationVerbs.Add('reward');
TPMSituationVerbs.Add('ridicule');
TPMSituationVerbs.Add('riot');
TPMSituationVerbs.Add('rob');
TPMSituationVerbs.Add('run');
TPMSituationVerbs.Add('rush');
TPMSituationVerbs.Add('salute');
TPMSituationVerbs.Add('scamper');
TPMSituationVerbs.Add('scare');
TPMSituationVerbs.Add('scavenge');
TPMSituationVerbs.Add('scream');
TPMSituationVerbs.Add('scrounge');
TPMSituationVerbs.Add('search');
TPMSituationVerbs.Add('secure');
TPMSituationVerbs.Add('seduce');
TPMSituationVerbs.Add('segregate');
TPMSituationVerbs.Add('seize');
TPMSituationVerbs.Add('sell');
TPMSituationVerbs.Add('ship');
TPMSituationVerbs.Add('shout');
TPMSituationVerbs.Add('shove');
TPMSituationVerbs.Add('show');
TPMSituationVerbs.Add('silence');
TPMSituationVerbs.Add('sing');
TPMSituationVerbs.Add('slaughter');
TPMSituationVerbs.Add('sleep');
TPMSituationVerbs.Add('smash');
TPMSituationVerbs.Add('sob');
TPMSituationVerbs.Add('solicit');
TPMSituationVerbs.Add('speak');
TPMSituationVerbs.Add('spill');
TPMSituationVerbs.Add('spit');
TPMSituationVerbs.Add('spy');
TPMSituationVerbs.Add('stab');
TPMSituationVerbs.Add('stage');
TPMSituationVerbs.Add('startle');
TPMSituationVerbs.Add('steal');
TPMSituationVerbs.Add('stop');
TPMSituationVerbs.Add('strangle');
TPMSituationVerbs.Add('strike');
TPMSituationVerbs.Add('subdue');
TPMSituationVerbs.Add('suffer');
TPMSituationVerbs.Add('summon');
TPMSituationVerbs.Add('surround');
TPMSituationVerbs.Add('suspect');
TPMSituationVerbs.Add('take');
TPMSituationVerbs.Add('taunt');
TPMSituationVerbs.Add('tease');
TPMSituationVerbs.Add('tempt');
TPMSituationVerbs.Add('terrify');
TPMSituationVerbs.Add('terrorize');
TPMSituationVerbs.Add('thank');
TPMSituationVerbs.Add('threaten');
TPMSituationVerbs.Add('throw');
TPMSituationVerbs.Add('torment');
TPMSituationVerbs.Add('torture');
TPMSituationVerbs.Add('trade');
TPMSituationVerbs.Add('transform');
TPMSituationVerbs.Add('translate');
TPMSituationVerbs.Add('transport');
TPMSituationVerbs.Add('trap');
TPMSituationVerbs.Add('travel');
TPMSituationVerbs.Add('tug');
TPMSituationVerbs.Add('unite');
TPMSituationVerbs.Add('unleash');
TPMSituationVerbs.Add('unload');
TPMSituationVerbs.Add('unveil');
TPMSituationVerbs.Add('vandalize');
TPMSituationVerbs.Add('vanish');
TPMSituationVerbs.Add('victimize');
TPMSituationVerbs.Add('violate');
TPMSituationVerbs.Add('volunteer');
TPMSituationVerbs.Add('wait');
TPMSituationVerbs.Add('warn');
TPMSituationVerbs.Add('wave');
TPMSituationVerbs.Add('weep');
TPMSituationVerbs.Add('welcome');
TPMSituationVerbs.Add('whittle');
TPMSituationVerbs.Add('wield');
TPMSituationVerbs.Add('win');
TPMSituationVerbs.Add('wink');
TPMSituationVerbs.Add('witness');
TPMSituationVerbs.Add('worship');
TPMSituationVerbs.Add('wound');
TPMSituationVerbs.Add('wreck');
TPMSituationVerbs.Add('wrestle');
TPMSituationVerbs.Add('write');
TPMSituationVerbs.Add('yell');
TPMSituationVerbs.Add('yield');

TPMRumor := TStringList.Create;
TPMRumor.Sorted := true;
TPMRumor.Duplicates := dupIgnore;
TPMRumor.Add('<npc> seeking help to retrieve <goal>');
TPMRumor.Add('<faction> looking for help with <mission>');
TPMRumor.Add('<faction> coming to <goal>');
TPMRumor.Add('<npc> arrived from <settlment>');
TPMRumor.Add('<faction> settling in <location>');
TPMRumor.Add('<faction> has left <location>');
TPMRumor.Add('<npc> hiring to <goal>');
TPMRumor.Add('Overhear <faction> discussing <event>');
TPMRumor.Add('<npc> complains about <faction>');
TPMRumor.Add('<npc> complains about <trend>');
TPMRumor.Add('<npc> questions why <event>');
TPMRumor.Add('<npcs> talk about <event>');
TPMRumor.Add('<npc> planning <event>');
TPMRumor.Add('<npc> arrived to <goal>');
TPMRumor.Add('<npc-noble> decrees <goal>');
TPMRumor.Add('<npc-noble> decrees <event>');
TPMRumor.Add('<npc-noble> plotting to <goal>');
TPMRumor.Add('<npc-noble> plotting to <event>');
TPMRumor.Add('<npc> shares <secret> about <npc>');
TPMRumor.Add('<wilderness> infested with <monster>');
TPMRumor.Add('<npc> warns of <npc>');
TPMRumor.Add('<npc> warns of <event>');
TPMRumor.Add('<npc> warns of <faction>');
TPMRumor.Add('<npc> shares <event>');
TPMRumor.Add('<npc> shares rummor about <location>');
TPMRumor.Add('<npc> share about <crime>');
TPMRumor.Add('<npc> gone missing');
TPMRumor.Add('<faction> gone missing');
TPMRumor.Add('<npc> seeking revenge on <npc>');
TPMRumor.Add('<faction> ploting against <faction>');
TPMRumor.Add('<faction> advising people to <goal>');
TPMRumor.Add('<npc> operating in the area');
TPMRumor.Add('Passerby mumbles about <event>');
TPMRumor.Add('Passerby mumbles about <goal>');
TPMRumor.Add('Passerby mumbles about <crime>');
TPMRumor.Add('Passerby mumbles about <faction>');

TPMBasicDice := [
['1d4','1','d4','0'],
['1d6','1','d6','0'],
['1d8','1','d8','0'],
['1d10','1','d10','0'],
['1d12','1','d12','0'],
['1d20','1','d20','0'],
['1d100','1','d100','0']
];


end.

